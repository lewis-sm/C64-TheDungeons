; ============================================================
; sprites.asm
; Sprite data pool - 36 blocks (VIC sprite pointers #33-68),
; 64 bytes each (63 bytes of pixel data + 1 unused byte).
; Source: decompressed image $0840-$1140.
; Confirmed by rendering (see reference/sprite_sheet.png):
; monster and player sprites matching the M$/MN DATA tables
; in the BASIC source (spider, centipede, worm, dragon, etc).
; Blocks 33-63 are pointed to directly via POKE 2040..2047.
; Blocks 64-68 are unused "template" frames copied into the
; active 60-63 slots at runtime for animation.
; ============================================================

        * = $0840

sprite_pool:
        !binary "/src/include/sprites_0840.bin"

; Individual block labels (block N = sprite_pool + (N-33)*64)
sprite_33 = sprite_pool + 0*64
sprite_34 = sprite_pool + 1*64
sprite_35 = sprite_pool + 2*64
sprite_36 = sprite_pool + 3*64
sprite_37 = sprite_pool + 4*64
sprite_38 = sprite_pool + 5*64
sprite_39 = sprite_pool + 6*64
sprite_40 = sprite_pool + 7*64
sprite_41 = sprite_pool + 8*64
sprite_42 = sprite_pool + 9*64
sprite_43 = sprite_pool + 10*64
sprite_44 = sprite_pool + 11*64
sprite_45 = sprite_pool + 12*64
sprite_46 = sprite_pool + 13*64
sprite_47 = sprite_pool + 14*64
sprite_48 = sprite_pool + 15*64
sprite_49 = sprite_pool + 16*64
sprite_50 = sprite_pool + 17*64
sprite_51 = sprite_pool + 18*64
sprite_52 = sprite_pool + 19*64
sprite_53 = sprite_pool + 20*64
sprite_54 = sprite_pool + 21*64
sprite_55 = sprite_pool + 22*64
sprite_56 = sprite_pool + 23*64
sprite_57 = sprite_pool + 24*64
sprite_58 = sprite_pool + 25*64
sprite_59 = sprite_pool + 26*64
sprite_60 = sprite_pool + 27*64   ; active animation slot
sprite_61 = sprite_pool + 28*64   ; active animation slot
sprite_62 = sprite_pool + 29*64   ; active animation slot
sprite_63 = sprite_pool + 30*64   ; active animation slot
sprite_64 = sprite_pool + 31*64   ; animation template
sprite_65 = sprite_pool + 32*64   ; animation template
sprite_66 = sprite_pool + 33*64   ; animation template
sprite_67 = sprite_pool + 34*64   ; animation template
sprite_68 = sprite_pool + 35*64   ; animation template

sprite_pool_end:
