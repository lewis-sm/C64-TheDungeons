; ============================================================
; Commodore 64 Full Constants Library for ACME Assembler
; Based on C64 Programmer's Reference Guide
; Usage:   !source "constants.asm"
; ============================================================

; ------------------------------
; Zero Page & System Variables
; ------------------------------
ZP_PTR1         = $FB    ; Pointer 1 low byte
ZP_PTR2         = $FD    ; Pointer 2 low byte
ZP_TEMP1        = $02
ZP_TEMP2        = $03

; ------------------------------
; VIC-II Registers ($D000-$D02E)
; ------------------------------
VIC_BASE        = $D000
VIC_SPRITE0_X   = VIC_BASE + $00
VIC_SPRITE0_Y   = VIC_BASE + $01
VIC_SPRITE1_X   = VIC_BASE + $02
VIC_SPRITE1_Y   = VIC_BASE + $03
VIC_SPRITE2_X   = VIC_BASE + $04
VIC_SPRITE2_Y   = VIC_BASE + $05
VIC_SPRITE3_X   = VIC_BASE + $06
VIC_SPRITE3_Y   = VIC_BASE + $07
VIC_SPRITE4_X   = VIC_BASE + $08
VIC_SPRITE4_Y   = VIC_BASE + $09
VIC_SPRITE5_X   = VIC_BASE + $0A
VIC_SPRITE5_Y   = VIC_BASE + $0B
VIC_SPRITE6_X   = VIC_BASE + $0C
VIC_SPRITE6_Y   = VIC_BASE + $0D
VIC_SPRITE7_X   = VIC_BASE + $0E
VIC_SPRITE7_Y   = VIC_BASE + $0F

VIC_SPRITE_XMSB = VIC_BASE + $10
VIC_CTRL1       = VIC_BASE + $11
VIC_RASTER      = VIC_BASE + $12
VIC_LIGHTPEN_X  = VIC_BASE + $13
VIC_LIGHTPEN_Y  = VIC_BASE + $14
VIC_SPRITE_EN   = VIC_BASE + $15
VIC_CTRL2       = VIC_BASE + $16
VIC_SPRITE_EXP_Y= VIC_BASE + $17
VIC_MEMPTR      = VIC_BASE + $18
VIC_IRQ_ENABLE  = VIC_BASE + $1A
VIC_IRQ_FLAGS   = VIC_BASE + $19
VIC_SPRITE_PRIO = VIC_BASE + $1B
VIC_SPRITE_MCOL = VIC_BASE + $1C
VIC_SPRITE_EXP_X= VIC_BASE + $1D
VIC_SPRITE_COL  = VIC_BASE + $1E

VIC_BORDER_COL  = VIC_BASE + $20
VIC_BG_COL0     = VIC_BASE + $21
VIC_BG_COL1     = VIC_BASE + $22
VIC_BG_COL2     = VIC_BASE + $23
VIC_BG_COL3     = VIC_BASE + $24
VIC_SPRITE_MCOL0= VIC_BASE + $25
VIC_SPRITE_MCOL1= VIC_BASE + $26
VIC_SPRITE0_COL = VIC_BASE + $27
VIC_SPRITE1_COL = VIC_BASE + $28
VIC_SPRITE2_COL = VIC_BASE + $29
VIC_SPRITE3_COL = VIC_BASE + $2A
VIC_SPRITE4_COL = VIC_BASE + $2B
VIC_SPRITE5_COL = VIC_BASE + $2C
VIC_SPRITE6_COL = VIC_BASE + $2D
VIC_SPRITE7_COL = VIC_BASE + $2E

; ------------------------------
; SID Registers ($D400-$D418)
; ------------------------------
SID_BASE        = $D400
; Voice 1
SID_V1_FREQ_LO  = SID_BASE + $00
SID_V1_FREQ_HI  = SID_BASE + $01
SID_V1_PW_LO    = SID_BASE + $02
SID_V1_PW_HI    = SID_BASE + $03
SID_V1_CTRL     = SID_BASE + $04
SID_V1_AD       = SID_BASE + $05
SID_V1_SR       = SID_BASE + $06
; Voice 2
SID_V2_FREQ_LO  = SID_BASE + $07
SID_V2_FREQ_HI  = SID_BASE + $08
SID_V2_PW_LO    = SID_BASE + $09
SID_V2_PW_HI    = SID_BASE + $0A
SID_V2_CTRL     = SID_BASE + $0B
SID_V2_AD       = SID_BASE + $0C
SID_V2_SR       = SID_BASE + $0D
; Voice 3
SID_V3_FREQ_LO  = SID_BASE + $0E
SID_V3_FREQ_HI  = SID_BASE + $0F
SID_V3_PW_LO    = SID_BASE + $10
SID_V3_PW_HI    = SID_BASE + $11
SID_V3_CTRL     = SID_BASE + $12
SID_V3_AD       = SID_BASE + $13
SID_V3_SR       = SID_BASE + $14
; Filters & Volume
SID_FILTER_CUTOFF_LO = SID_BASE + $15
SID_FILTER_CUTOFF_HI = SID_BASE + $16
SID_FILTER_CTRL      = SID_BASE + $17
SID_VOLUME_FILT      = SID_BASE + $18

; ------------------------------
; CIA 1 ($DC00) - Keyboard, Joystick, Timer
; ------------------------------
CIA1_BASE       = $DC00
CIA1_PRA        = CIA1_BASE + $00
CIA1_PRB        = CIA1_BASE + $01
CIA1_DDRA       = CIA1_BASE + $02
CIA1_DDRB       = CIA1_BASE + $03
CIA1_TA_LO      = CIA1_BASE + $04
CIA1_TA_HI      = CIA1_BASE + $05
CIA1_TB_LO      = CIA1_BASE + $06
CIA1_TB_HI      = CIA1_BASE + $07
CIA1_TOD_TENTHS = CIA1_BASE + $08
CIA1_TOD_SEC    = CIA1_BASE + $09
CIA1_TOD_MIN    = CIA1_BASE + $0A
CIA1_TOD_HR     = CIA1_BASE + $0B
CIA1_SDR        = CIA1_BASE + $0C
CIA1_ICR        = CIA1_BASE + $0D
CIA1_CRA        = CIA1_BASE + $0E
CIA1_CRB        = CIA1_BASE + $0F

; ------------------------------
; CIA 2 ($DD00) - Serial, User Port, Timer
; ------------------------------
CIA2_BASE       = $DD00
CIA2_PRA        = CIA2_BASE + $00
CIA2_PRB        = CIA2_BASE + $01
CIA2_DDRA       = CIA2_BASE + $02
CIA2_DDRB       = CIA2_BASE + $03
CIA2_TA_LO      = CIA2_BASE + $04
CIA2_TA_HI      = CIA2_BASE + $05
CIA2_TB_LO      = CIA2_BASE + $06
CIA2_TB_HI      = CIA2_BASE + $07
CIA2_TOD_TENTHS = CIA2_BASE + $08
CIA2_TOD_SEC    = CIA2_BASE + $09
CIA2_TOD_MIN    = CIA2_BASE + $0A
CIA2_TOD_HR     = CIA2_BASE + $0B
CIA2_SDR        = CIA2_BASE + $0C
CIA2_ICR        = CIA2_BASE + $0D
CIA2_CRA        = CIA2_BASE + $0E
CIA2_CRB        = CIA2_BASE + $0F
