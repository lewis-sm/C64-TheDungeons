TOKENS = {
0x80:"END",0x81:"FOR",0x82:"NEXT",0x83:"DATA",0x84:"INPUT#",0x85:"INPUT",
0x86:"DIM",0x87:"READ",0x88:"LET",0x89:"GOTO",0x8A:"RUN",0x8B:"IF",
0x8C:"RESTORE",0x8D:"GOSUB",0x8E:"RETURN",0x8F:"REM",0x90:"STOP",
0x91:"ON",0x92:"WAIT",0x93:"LOAD",0x94:"SAVE",0x95:"VERIFY",0x96:"DEF",
0x97:"POKE",0x98:"PRINT#",0x99:"PRINT",0x9A:"CONT",0x9B:"LIST",0x9C:"CLR",
0x9D:"CMD",0x9E:"SYS",0x9F:"OPEN",0xA0:"CLOSE",0xA1:"GET",0xA2:"NEW",
0xA3:"TAB(",0xA4:"TO",0xA5:"FN",0xA6:"SPC(",0xA7:"THEN",0xA8:"NOT",
0xA9:"STEP",0xAA:"+",0xAB:"-",0xAC:"*",0xAD:"/",0xAE:"^",0xAF:"AND",
0xB0:"OR",0xB1:">",0xB2:"=",0xB3:"<",0xB4:"SGN",0xB5:"INT",0xB6:"ABS",
0xB7:"USR",0xB8:"FRE",0xB9:"POS",0xBA:"SQR",0xBB:"RND",0xBC:"LOG",
0xBD:"EXP",0xBE:"COS",0xBF:"SIN",0xC0:"TAN",0xC1:"ATN",0xC2:"PEEK",
0xC3:"LEN",0xC4:"STR$",0xC5:"VAL",0xC6:"ASC",0xC7:"CHR$",0xC8:"LEFT$",
0xC9:"RIGHT$",0xCA:"MID$",0xCB:"GO",
}

def detokenize(mem, start, max_lines=2000):
    lines = []
    addr = start
    for _ in range(max_lines):
        link = mem[addr] | (mem[addr+1]<<8)
        if link == 0:
            break
        lineno = mem[addr+2] | (mem[addr+3]<<8)
        p = addr + 4
        text = ''
        in_quotes = False
        after_rem = False
        while True:
            b = mem[p]
            if b == 0:
                p += 1
                break
            if after_rem or in_quotes:
                # No tokenizing inside quotes or after REM - real BASIC
                # stores/lists these bytes raw (PETSCII control/graphic
                # codes), not as keyword tokens.
                text += chr(b) if 32 <= b < 127 else '{$%02X}' % b
                if b == 0x22 and in_quotes:
                    in_quotes = False
            elif b == 0x22:
                in_quotes = True
                text += '"'
            elif b >= 0x80:
                tok = TOKENS.get(b, '{$%02X}' % b)
                text += tok
                if b == 0x8F or b == 0x83:  # REM or DATA
                    after_rem = True
            else:
                text += chr(b) if 32 <= b < 127 else '{$%02X}' % b
            p += 1
        lines.append((addr, lineno, text))
        if link <= addr:
            break
        addr = link
    return lines

if __name__ == '__main__':
    mem = open('/home/claude/disasm/mem_snapshot.bin','rb').read()
    lines = detokenize(mem, 0x2001)
    for addr, lineno, text in lines:
        print('$%04X %5d %s' % (addr, lineno, text))
    print()
    print('Total lines:', len(lines))
    if lines:
        last_addr = lines[-1][0]
        print('Program text ends around $%04X (next link was 0)' % last_addr)
