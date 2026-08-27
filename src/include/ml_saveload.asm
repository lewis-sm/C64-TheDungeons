; ============================================================
; ml_saveload.asm
; Tape SAVE/LOAD routine for the "quit and save data" feature.
; Source: decompressed image $1220-$125F
; Called from BASIC via:
;   SYS4640  ($1220)  -> save game state to tape as "DATA1"
;   SYS4676  ($1244)  -> load game state from tape "DATA1"
; Confirmed via KERNAL vector calls (SETLFS/SETNAM/SAVE/LOAD).
; ============================================================

!source "/src/include/constants.asm"

        * = $1220

; --- SYS4640: SAVE game state to tape ---
ml_save:
        lda #$01              ; logical file number 1
        ldy #$FF              ; secondary address (unused by SAVE)
        ldx #$01              ; device 1 = tape
        jsr KERNAL_SETLFS

        lda #$05               ; filename length = 5 ("DATA1")
        ldx #$00               ; filename pointer low byte
        ldy #$1C               ; filename pointer high byte -> $1C00 (NAME_BUFFER)
        jsr KERNAL_SETNAM

        lda #$1C               ; zp $FC = start address high byte ($1C)
        sta $FC
        lda #$00               ; zp $FB = start address low byte ($00)
        sta $FB                ; $FB/$FC now hold start address $1C00 (SAVESTATE_LO)
        ldy #$20               ; end address high byte ($20)
        ldx #$00               ; end address low byte  -> end = $2000 (SAVESTATE_HI)
        lda #$FB               ; A = zero-page pointer to start address
        jsr KERNAL_SAVE
        rts

; --- SYS4676: LOAD game state from tape ---
ml_load:
        lda #$01               ; logical file number 1
        ldy #$01               ; secondary address 1
        ldx #$01               ; device 1 = tape
        jsr KERNAL_SETLFS

        lda #$05               ; filename length = 5 ("DATA1")
        ldx #$00               ; filename pointer low byte
        ldy #$1C               ; filename pointer high byte -> $1C00 (NAME_BUFFER)
        jsr KERNAL_SETNAM

        lda #$00               ; 0 = load to address stored in the file itself
        ldy #$FF               ; (X/Y ignored since A=0)
        ldx #$FF
        jsr KERNAL_LOAD
        rts
