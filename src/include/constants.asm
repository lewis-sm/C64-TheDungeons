; ============================================================
; constants.asm
; The Dungeons (Brian & Marian Clark, 1983) - reconstruction
; Confirmed labels/addresses from decompressed-image analysis
; ============================================================

; --- BASIC zero page (used by the ML entry stub at $6500) ---
TXTTAB_LO   = $2B      ; start-of-BASIC-program pointer, low byte
TXTTAB_HI   = $2C      ; start-of-BASIC-program pointer, high byte
VARTAB_LO   = $2D      ; start-of-variables pointer, low byte
VARTAB_HI   = $2E      ; start-of-variables pointer, high byte
ARYTAB_LO   = $2F      ; start-of-arrays pointer, low byte
ARYTAB_HI   = $30      ; start-of-arrays pointer, high byte
STREND_LO   = $31      ; end-of-arrays/string-storage pointer, low byte
STREND_HI   = $32      ; end-of-arrays/string-storage pointer, high byte

; --- BASIC ROM entry points used by the ML entry stub ---
; (Standard C64 BASIC V2 ROM addresses - real ROM required to run)
BASIC_LINKPRG = $A660  ; relink BASIC program line pointers
BASIC_CLR     = $A68E  ; clear variables / reset stack (CLR-equivalent)
BASIC_MAIN    = $A7AE  ; main statement-execution dispatcher (GONE/warm start)

; --- KERNAL vectors used by the save/load routine ($1218-$125F) ---
KERNAL_SETLFS = $FFBA
KERNAL_SETNAM = $FFBD
KERNAL_LOAD   = $FFD5
KERNAL_SAVE   = $FFD8

; --- Save-state block used by SYS4640 (save) / SYS4676 (load) ---
; Filename buffer + save-state block, built by BASIC lines 710-712 / 1140-1142
NAME_BUFFER   = $1C00  ; "DATA1" filename text lives here (5 bytes)
SAVESTATE_LO  = $1C00  ; save/load range low byte
SAVESTATE_HI  = $2000  ; save/load range high byte (exclusive)

; --- Game-state sub-arrays within the save-state block ---
; Computed at runtime by BASIC line 243: D=30*256:R=D-99:TR=R-18:Q=18:T=TR-100:MS=T-100
; SR computed by line 167/266: SR=MS-30
SR_PTR        = $1CA5  ; save/restore pointer block (~30 bytes)
MS_ARRAY      = $1CC3  ; monster status per room (~100 bytes)
T_ARRAY       = $1D27  ; trap flags per room (~100 bytes)
TR_ARRAY      = $1D8B  ; target-room scratch (18 bytes), zeroed at game start
R_ARRAY       = $1D9D  ; room-connection data (99 bytes), re-read from DATA
                        ; statements every game start (BASIC line 1064) -
                        ; does NOT need to be byte-exact in the image.
D_ARRAY       = $1E00  ; THE DUNGEON EXIT MATRIX. Indexed as
                        ; PEEK(D+room*4+direction) - BASIC lines 161/163.
                        ; Never written by the BASIC program itself, so
                        ; MUST be present as static data at load time.

; --- Game entry / layout (decompressed image addresses) ---
SPRITE_POOL_START   = $0840   ; 36 sprite blocks (#33-68), 64 bytes each
SPRITE_POOL_END     = $1140
WALL_TILES_START    = $1140   ; custom wall/gate tile bitmaps
ML_SAVELOAD_START   = $1218   ; tape SAVE/LOAD subroutines
LOOKUP_TABLE_START  = $1260   ; unresolved lookup/translation table
CHARSET_COPY_START  = $1400   ; standard C64 charset copied to RAM
BASIC_PROGRAM_START = $2001   ; main game program (476 lines)
BASIC_PROGRAM_END   = $6271   ; corrected - was $6269 (8 bytes short of the
                               ; true end-of-program null terminator; see
                               ; include/README.md "Tokenizer fixes")
LEFTOVER_ITEMS_START = $6271  ; unused item data (DAGGER, HELMET, etc.)
LEFTOVER_ITEMS_END   = $646C  ; kept for historical/future reference
ML_ENTRY_STUB_START = $646C   ; hands off build -> BASIC RUN
                               ; (trimmed: originally $6500 in the source
                               ;  image with 147 bytes of $C7 padding
                               ;  before it; nothing hardcodes $6500, so
                               ;  the stub now sits right after the
                               ;  leftover item data with no gap)

; --- VIC-II / hardware bases referenced by the BASIC program ---
VIC_BASE      = $D000  ; "VS" in BASIC source
SPRITE_PTRS   = $07F8  ; sprite pointer table (2040-2047 decimal)
SCREEN_BASE   = $0400  ; "SC" in BASIC source
COLOR_RAM     = $D800  ; "C" in BASIC source
