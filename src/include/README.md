| File | Address range | Contents | Status |
|---|---|---|---|
| `constants.asm` | — | Zero-page, KERNAL, and hardware labels used by the other files | Confirmed |
| `sprites.asm` + `sprites_0840.bin` | `$0840`-`$1140` | 36 sprite blocks - monsters & player | Confirmed |
| `wall_tiles.asm` + `wall_tiles_1140.bin` | `$1140`-`$1201` | Wall/gate tile bitmaps | Structural, semantics open |
| `ml_saveload.asm` | `$1220`-`$125F` | Tape SAVE/LOAD routine (real 6502 source, not binary) | Confirmed |
| `lookup_table.asm` + `lookup_table_1260.bin` | `$1260`-`$1400` | Unresolved lookup table | Structural only - flagged |
| `charset.asm` + `charset_1400.bin` | `$1400`-`$1C00` | Standard character set copy | Confirmed |
| `game_state.asm` + `game_state_1C00.bin` | `$1C00`-`$2000` | Game working-storage block, **including the dungeon exit matrix (`D_ARRAY` at `$1E00`)**. | Confirmed - critical |
| `basic_program.asm` + `basic_program_2001.bin` | `$2001`-`$6271` | The whole game (tokenized BASIC) | Confirmed |
| `leftover_items.asm` + `leftover_items_6271.bin` | `$6271`-`$646C` | Unused item data (DAGGER, HELMET, MAGIC AXE...) - not referenced by any live code path | Kept for reference/future use |
| `ml_entry.asm` | `$646C`-`$648C` | Hands off build -> BASIC RUN (real 6502 source) | Confirmed |

## Mystery solved: the `$1201` mini-BASIC fragment

Back when first mapping `$1140`-`$2000`, we found an odd embedded
fragment at `$1201`: `10 POKE8192,0:POKE44,32:RUN`, not wired into the
main program's line-link chain, and couldn't fully explain it. The
literal audit for the Tier 3 relocation attempt found the missing
piece: BASIC line 778 does `POKE44,18:END` - deliberately pointing
BASIC's TXTTAB at `$1200` before ending. Typing `RUN` afterward
executes that fragment, which points TXTTAB back at `$2001` and runs
the real game again. It's a "press RUN to restart" mechanic, not dead
code or a leftover - both pieces are load-bearing and must stay in
sync if either address ever moves.

## Human-readable source

`../reference/the_dungeons.bas.txt` is the fully detokenized, verified-
correct BASIC listing (476 lines) - this is what you actually edit to
change game logic. `basic_program_2001.bin` is the tokenized binary
form that actually gets assembled into the PRG. Regenerate it after
editing the `.txt` with:
```
python3 ../../tools/tokenizer.py build the_dungeons.bas.txt ../include/basic_program_2001.bin
```
(run from `src/reference/`; see `../../tools/README.md` for details).
