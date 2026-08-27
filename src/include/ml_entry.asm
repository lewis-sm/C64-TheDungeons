; ============================================================
; ml_entry.asm
; Final step of the build: points BASIC's TXTTAB at the game
; program ($2001) and hands off into BASIC's own relink/CLR/RUN
; logic. This is the true "game start" moment.
;
; TRIMMED (Tier 2): originally sat at $6500 in the source image,
; with 147 bytes of $C7 padding between it and the end of the
; leftover-item data at $646C. Nothing in the BASIC program
; hardcodes $6500 - only this project's own autorun stub points
; at it - so the stub is relocated to $646C with no gap. If you
; add the padding/leftover-item region back in for a byte-exact
; rebuild, this still works unchanged; it just leaves the old
; $C7 filler unused rather than depending on it.
;
; Requires real BASIC ROM to run (JSR/JMP targets are ROM).
; ============================================================

!source "/src/include/constants.asm"

        * = ML_ENTRY_STUB_START   ; $646C (see constants.asm)

; ml_entry is 33 bytes ($646C-$648C); VARSTART just needs to sit
; at or after $648D. $6490 leaves a little headroom.
VARSTART = $6490

ml_entry:
        ldx #$01
        stx TXTTAB_LO           ; TXTTAB = $2001 (start of BASIC program)
        ldx #$20
        stx TXTTAB_HI

        ldx #$00
        stx VARTAB_LO
        stx ARYTAB_LO
        stx STREND_LO

        ldx #>VARSTART
        stx VARTAB_HI            ; VARTAB = ARYTAB = STREND = VARSTART
        stx ARYTAB_HI            ; (variables/arrays start right after
        stx STREND_HI            ;  this stub)

        jsr BASIC_LINKPRG        ; relink BASIC program line pointers
        jsr BASIC_CLR            ; clear variables / reset BASIC stack
        jmp BASIC_MAIN           ; enter BASIC's main statement dispatcher
                                  ; -> starts executing the game at $2001
ml_entry_end:
