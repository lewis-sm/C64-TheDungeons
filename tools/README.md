# tools/

## tokenizer.py / basic_tokens.py

A verified C64 BASIC V2 tokenizer/detokenizer pair, round-trip tested
byte-for-byte against the real game data.

**To edit the game's BASIC logic:**

1. Edit `../src/reference/the_dungeons.bas.txt` (one line per BASIC
   line, `LINENO text...` format - this is exactly what you'd see from
   a C64 `LIST`, plus `{$XX}` escapes for non-printable/control bytes
   such as cursor movement and color codes).
2. Regenerate the tokenized binary:
   ```
   python3 tokenizer.py build ../src/reference/the_dungeons.bas.txt ../src/include/basic_program_2001.bin
   ```
3. Rebuild with ACME as normal.

**To verify the tokenizer itself is still correct** (e.g. after
modifying `tokenizer.py`), run it with no arguments:
```
python3 tokenizer.py
```
This re-tokenizes the known-good game text and diffs the result
byte-for-byte against the original decompressed image
(`/home/claude/disasm/mem_snapshot.bin` in the analysis sandbox this
was built in - point `mem` at your own copy of the decompressed image
if running this outside that environment). It should print `ROUND-TRIP
OK: byte-for-byte identical`.

## Known BASIC tokenizer quirks this implementation handles

Both real and worth knowing if you extend this tool:

- **REM and DATA suppress tokenizing for the rest of the line.**
  Real C64 BASIC does not tokenize keywords appearing after a `REM` or
  `DATA` token - the remaining text is stored as literal bytes. This
  is *why* words like `KNIFE` and `SWORD` can appear in this game's
  item `DATA` statements without being corrupted by the embedded-
  keyword tokenizing quirk (`KN`**`IF`**`E`, `SW`**`OR`**`D`) that
  famously corrupts variable names like `SCORE` in ordinary code lines.
- **Quoted strings are never tokenized.** Bytes inside quotes,
  including ones in the token range (`$80`-`$FF`), are stored/read
  literally - they're PETSCII control/graphic codes, not keywords.
  Getting this wrong was a real bug in this project's first-pass
  detokenizer: it rendered control codes like `$91` (cursor up) as
  if they were the `ON` keyword when they appeared inside `PRINT`
  strings, corrupting 45 of the 476 lines in the human-readable
  reference listing (fixed - see `../src/include/README.md`).
