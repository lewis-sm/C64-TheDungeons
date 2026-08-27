"""
tokenizer.py - C64 BASIC V2 tokenizer (inverse of basic_tokens.detokenize)

Takes a plain-text listing (one line per BASIC line, "LINENO TEXT..."
same format basic_tokens.detokenize produces) and a base address, and
produces the tokenized byte stream C64 BASIC actually stores in memory:

    [link_lo][link_hi][lineno_lo][lineno_hi][tokens...][0x00]
    ... repeated per line ...
    [0x00][0x00]   <- end of program (null link)

Token matching uses longest-match-first so that e.g. "GO" doesn't
steal the first two letters of "GOSUB"/"GOTO" (both of which are
themselves single tokens, so this matters), and so multi-char tokens
never get shadowed by shorter ones.
"""

from basic_tokens import TOKENS

# Reverse map: text -> token byte. Sort by length descending for
# longest-match-first scanning.
TEXT_TO_TOKEN = {text: byte for byte, text in TOKENS.items()}
TOKEN_TEXTS_BY_LEN = sorted(TEXT_TO_TOKEN.keys(), key=len, reverse=True)


def tokenize_line_body(text):
    """
    Convert one line's text (post line-number, pre-terminator) into
    tokenized bytes. Handles {$XX} escapes (produced by our own
    detokenizer for non-printable/control bytes) and quoted strings
    (no tokenizing inside quotes, matching real BASIC behaviour).

    Matches real C64 BASIC tokenizer behaviour: once a REM token is
    emitted, the rest of the line is stored as raw bytes with no
    further token matching (real BASIC doesn't parse past REM).
    """
    out = bytearray()
    i = 0
    n = len(text)
    in_quotes = False
    after_rem = False

    def decode_escape_or_char(i):
        """Decode one {$XX} escape or literal char at position i. Returns (byte, new_i)."""
        ch = text[i]
        if ch == '{' and i + 1 < n and text[i+1] == '$':
            end = text.find('}', i)
            if end != -1:
                hexpart = text[i+2:end]
                try:
                    return int(hexpart, 16), end + 1
                except ValueError:
                    pass
        b = ord(ch)
        if b > 255:
            raise ValueError('Non-byte character %r at position %d: %r' % (ch, i, text))
        return b, i + 1

    while i < n:
        if after_rem:
            b, i = decode_escape_or_char(i)
            out.append(b)
            continue

        ch = text[i]

        # {$XX} escape for a raw control/non-ASCII byte
        if ch == '{' and i + 1 < n and text[i+1] == '$':
            end = text.find('}', i)
            if end != -1:
                hexpart = text[i+2:end]
                try:
                    out.append(int(hexpart, 16))
                    i = end + 1
                    continue
                except ValueError:
                    pass  # fall through, treat literally

        if ch == '"':
            in_quotes = not in_quotes
            out.append(ord('"'))
            i += 1
            continue

        if in_quotes:
            out.append(ord(ch))
            i += 1
            continue

        # Try longest-match token text at this position (only outside quotes)
        matched = None
        for tok_text in TOKEN_TEXTS_BY_LEN:
            if text.startswith(tok_text, i):
                matched = tok_text
                break
        if matched:
            tok_byte = TEXT_TO_TOKEN[matched]
            out.append(tok_byte)
            i += len(matched)
            if tok_byte == 0x8F or tok_byte == 0x83:  # REM or DATA
                after_rem = True
            continue

        # Plain character
        b = ord(ch)
        if b > 255:
            raise ValueError('Non-byte character %r at position %d: %r' % (ch, i, text))
        out.append(b)
        i += 1

    return bytes(out)


def parse_listing(text):
    """Parse 'LINENO text...' formatted listing into (lineno, text) pairs."""
    lines = []
    for raw in text.split('\n'):
        if raw == '':
            continue
        parts = raw.split(None, 1)
        lineno = int(parts[0])
        body = parts[1] if len(parts) > 1 else ''
        lines.append((lineno, body))
    return lines


def tokenize(text, base_addr):
    """
    Full tokenize: text -> bytes, ready to write starting at base_addr.
    Returns the byte stream (NOT including a 2-byte PRG load-address
    header - caller prepends that if writing a .prg).
    """
    lines = parse_listing(text)
    out = bytearray()
    addr = base_addr

    # First pass: tokenize each line body, compute lengths, so we can
    # compute link pointers (which need to know the NEXT line's address).
    tokenized_bodies = [tokenize_line_body(body) for _, body in lines]

    # Each line's total size = 2 (link) + 2 (lineno) + len(body) + 1 (terminator 0x00)
    sizes = [2 + 2 + len(b) + 1 for b in tokenized_bodies]

    addrs = []
    a = base_addr
    for sz in sizes:
        addrs.append(a)
        a += sz
    end_addr = a  # address of the final null-link terminator

    for idx, (lineno, body) in enumerate(lines):
        this_addr = addrs[idx]
        next_addr = addrs[idx + 1] if idx + 1 < len(lines) else end_addr
        out += bytes([next_addr & 0xFF, (next_addr >> 8) & 0xFF])
        out += bytes([lineno & 0xFF, (lineno >> 8) & 0xFF])
        out += tokenized_bodies[idx]
        out += bytes([0x00])

    out += bytes([0x00, 0x00])  # end of program
    return bytes(out)


if __name__ == '__main__':
    import sys

    if len(sys.argv) == 4 and sys.argv[1] == 'build':
        # Usage: python3 tokenizer.py build <input.txt> <output.bin> [--base 0x2001]
        in_path, out_path = sys.argv[2], sys.argv[3]
        base = 0x2001
        text = open(in_path).read()
        result = tokenize(text, base)
        with open(out_path, 'wb') as f:
            f.write(result)
        print('Wrote %d bytes to %s (base $%04X)' % (len(result), out_path, base))
        sys.exit(0)

    if len(sys.argv) >= 2 and sys.argv[1] == 'build':
        print('Usage: python3 tokenizer.py build <input.txt> <output.bin>')
        sys.exit(1)

    # Default: run the round-trip self-test against the known-good image.
    from basic_tokens import detokenize

    mem = open('/home/claude/disasm/mem_snapshot.bin', 'rb').read()
    base = 0x2001
    original_lines = detokenize(mem, base)
    original_bytes = mem[base:0x6271]  # true end boundary (see README)

    # Build the same text format our tokenizer expects, from the
    # known-good detokenization (round-trip test).
    text = '\n'.join('%d %s' % (lineno, t) for _, lineno, t in original_lines)

    result = tokenize(text, base)

    print('Original bytes: %d' % len(original_bytes))
    print('Tokenized bytes: %d' % len(result))
    if result == original_bytes:
        print('ROUND-TRIP OK: byte-for-byte identical')
    else:
        print('MISMATCH')
        n = min(len(result), len(original_bytes))
        for i in range(n):
            if result[i] != original_bytes[i]:
                print('First diff at offset %d (addr $%04X): got %02X expected %02X' %
                      (i, base + i, result[i], original_bytes[i]))
                print('context got:      ', result[max(0,i-8):i+16].hex())
                print('context expected: ', original_bytes[max(0,i-8):i+16].hex())
                break
        if len(result) != len(original_bytes):
            print('Length mismatch: got %d, expected %d' % (len(result), len(original_bytes)))
