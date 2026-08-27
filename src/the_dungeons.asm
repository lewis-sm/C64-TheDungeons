; ============================================================
; the_dungeons.asm
; Top-level build - assembles the reconstructed decompressed
; image directly (no depacker needed; this IS the runtime data).
;
; NOTE: each include file assembles at its own * = address, with
; two small unavoidable gaps between them that your build/linker
; step needs to zero-pad when producing the final flat PRG:
;   $083F-$0840  dead space before the sprite pool (sprite VIC
;                block numbers are hardcoded in basic_program, so
;                the pool can't move - see Tier 3 scope doc)
;   $1201-$1220  8 unidentified filler bytes before ml_saveload
; Everything else is back-to-back with no gaps, including
; game_state.asm -> basic_program.asm -> leftover_items.asm ->
; ml_entry.asm (the C7 padding that used to precede ml_entry at
; $6500 was trimmed - it now sits at $646C, see include/README.md).
; ============================================================

!source "/src/include/constants.asm"

        * = $0801
autorun_stub:
        ; "10 SYS25708"  (was SYS25856 - trimmed 147 bytes of $C7
        ; padding by relocating ml_entry from $6500 to $646C)
        !byte $0C, $08          ; link -> $080C
        !byte $0A, $00          ; line 10
        !byte $9E               ; SYS token
        !text "25708"
        !byte $00               ; end of statement
        !byte $00, $00          ; end of program (null link)

; Change to the sprite_defs works but are they out of sequence???
;!source "/src/include/sprite_defs.asm"
!source "/src/include/sprites.asm"
!source "/src/include/wall_tiles.asm"
!source "/src/include/ml_saveload.asm"
!source "/src/include/lookup_table.asm"
!source "/src/include/charset.asm"
!source "/src/include/game_state.asm"         ; FIX: was missing - contains the
                                          ; dungeon exit matrix (see file
                                          ; header for the bug this caused)
!source "/src/include/basic_program.asm"
!source "/src/include/leftover_items.asm"     ; kept for reference, see README
!source "/src/include/ml_entry.asm"           ; now immediately follows,
                                          ; no $C7 padding gap
