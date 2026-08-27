; ============================================================
; charset.asm
; Standard C64 character ROM (uppercase/graphics set) copied
; into RAM so the game can display text and PETSCII graphics
; characters while BASIC/KERNAL ROM is banked out.
; Source: decompressed image $1400-$1C00 (2048 bytes = 256 chars).
; Confirmed by rendering (see reference/charset_1400_2000.png).
; ============================================================

        * = $1400

charset_copy:
        !binary "/src/include/charset_1400.bin"

charset_copy_end:
