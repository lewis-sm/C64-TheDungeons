; ============================================================
; leftover_items.asm
; Leftover/unused item data - DAGGER, MAGIC AXE, HELMET, and
; other item names + numeric records that do NOT appear
; anywhere in the live 476-line BASIC program. Not reachable
; by any current code path - likely cut content from an
; earlier build of the game.
;
; Kept intentionally (not required for a working build) as
; historical reference and as a possible base for a future
; "restore the cut items" enhancement.
;
; Source: decompressed image $6271-$646C (corrected boundary -
; was $6269, which incorrectly included the last 8 bytes of the
; real BASIC program; harmless in practice since both files were
; extracted from the same source image with no gap between them,
; but now labeled correctly - see include/README.md).
; ============================================================

        * = LEFTOVER_ITEMS_START   ; $6271

leftover_items:
        !binary "/src/include/leftover_items_6271.bin"

leftover_items_end:
