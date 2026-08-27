; ============================================================
; wall_tiles.asm
; Custom character tile bitmaps (wall/gate/bars decoration).
; Source: decompressed image $1140-$1201.
; Structurally confirmed (alternating bit patterns consistent
; with 8x8 character bitmaps); exact in-game usage/semantics
; not yet fully traced back to specific BASIC POKE calls.
; ============================================================

        * = $1140

wall_tiles:
        !binary "/src/include/wall_tiles_1140.bin"

wall_tiles_end:
