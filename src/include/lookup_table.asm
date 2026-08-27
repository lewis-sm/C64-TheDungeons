; ============================================================
; lookup_table.asm
; Unresolved lookup/translation table - ascending byte runs
; separated by padding, structurally table-like but semantic
; purpose not yet decoded (possibly screen-code / sprite-
; pointer / message-index mapping used by the BASIC program).
; Source: decompressed image $1260-$1400.
; NOT YET semantically verified - flagged for further work.
; ============================================================

        * = $1260

lookup_table:
        !binary "/src/include/lookup_table_1260.bin"

lookup_table_end:
