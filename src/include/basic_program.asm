; ============================================================
; basic_program.asm
; The full game - 476 lines of tokenized BASIC V2.
; Source: decompressed image $2001-$6271 (corrected boundary -
; the true end-of-program null terminator sits at $626F/$6270,
; not $6269 as originally extracted; see include/README.md).
; Human-readable, corrected detokenized listing:
;   reference/the_dungeons.bas.txt
; Regenerate this binary from that listing with:
;   python3 tools/tokenizer.py  (see tools/README.md)
;
; This is included as a raw binary blob (tokenized form) since
; it's BASIC, not 6502 machine code - ACME just needs to place
; these bytes at the right address for the ML entry stub to
; hand off into.
; ============================================================

        * = $2001

basic_program:
        !binary "/src/include/basic_program_2001.bin"

basic_program_end:
