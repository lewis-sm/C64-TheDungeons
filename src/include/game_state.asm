; ============================================================
; game_state.asm
; Game state working-storage block, INCLUDING the dungeon exit
; matrix. This was previously omitted from the build entirely -
; that's the "no exit doors at Gloomy Entrance" bug: room
; movement checks PEEK(D+R%*4+F%) (BASIC line 161/163), and the
; D array ($1E00 onward) is never written by the BASIC program
; itself, so it MUST be present as static data from load time.
; Leaving this region out meant every direction read as 0 (no
; exit) for every room.
;
; Source: decompressed image $1C00-$2000 (1025 bytes incl. the
; single byte at $2000, which pads right up to basic_program).
;
; Sub-regions within this block (see constants.asm for the
; computed BASIC pointer values):
;   NAME ($1C00, 5 bytes)      - tape filename buffer ("DATA1")
;                                overwritten at runtime by BASIC
;                                lines 176/263 - included here
;                                mainly for completeness/save-
;                                state round-tripping.
;   SR   ($1CA5, ~30 bytes)    - save/restore state pointer block,
;                                written by BASIC line 167/266.
;   MS   ($1CC3, ~100 bytes)   - monster status per room, written
;                                at runtime.
;   T    ($1D27, ~100 bytes)   - trap flags per room, written at
;                                runtime.
;   TR   ($1D8B, 18 bytes)     - target-room scratch array,
;                                zeroed at game start (line ~191).
;   R    ($1D9D, 99 bytes)     - room-connection data, POKEd fresh
;                                from DATA statements every game
;                                start (BASIC line 1064).
;   D    ($1E00, ~512 bytes)   - THE EXIT MATRIX. Never written by
;                                the BASIC program - must be
;                                preserved as static data. This is
;                                the piece that was missing.
;
; Only D strictly needs to be byte-exact from the original image;
; the others are re-initialized by the game itself at startup, but
; are included here unchanged for a faithful, low-risk reconstruction.
; ============================================================

        * = SAVESTATE_LO   ; $1C00

game_state:
        !binary "/src/include/game_state_1C00.bin"

game_state_end:
