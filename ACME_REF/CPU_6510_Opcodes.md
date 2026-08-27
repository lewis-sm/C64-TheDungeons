| Opcode | Value | Addressing       | Example           | Cycles | Comment |
|:------:|:-----:|------------------|-------------------|:------:|---------|
| ADC | $61 | (Indirect,X) | ADC ($12,X) | 6 | |
| ADC | $65 | Zeropage | ADC $12 | 3 | |
| ADC | $69 | Immediate | ADC #$12 | 2 | |
| ADC | $6D | Absolute | ADC $1234 | 4 | |
| ADC | $71 | (Indirect),Y | ADC ($12),Y | 5* | |
| ADC | $75 | Zeropage,X | ADC $12,X | 4 | |
| ADC | $79 | Absolute,Y | ADC $1234,Y | 4* | |
| ADC | $7D | Absolute,X | ADC $1234,X | 4* | |
| AND | $21 | (Indirect,X) | AND ($12,X) | 6 | |
| AND | $25 | Zeropage | AND $12 | 3 | |
| AND | $29 | Immediate | AND #$12 | 2 | |
| AND | $2D | Absolute | AND $1234 | 4 | |
| AND | $31 | (Indirect),Y | AND ($12),Y | 5* | |
| AND | $35 | Zeropage,X | AND $12,X | 4 | |
| AND | $39 | Absolute,Y | AND $1234,Y | 4* | |
| AND | $3D | Absolute,X | AND $1234,X | 4* | |
| ANE | $8B | Immediate | ANE #$12 | 2 | Illegal |
| ANC | $0B | Immediate | ANC #$12 | 2 | Illegal |
| ANC | $2B | Immediate | ANC #$12 | 2 | Illegal |
| ARR | $6B | Immediate | ARR #$12 | 2 | Illegal |
| ASL | $06 | Zeropage | ASL $12 | 5 | |
| ASL | $0A | Implied | ASL A | 2 | |
| ASL | $0E | Absolute | ASL $1234 | 6 | |
| ASL | $1E | Absolute,X | ASL $1234,X | 7 | |
| ASR | $4B | Immediate | ASR #$12 | 2 | Illegal |
| BCC | $90 | Relative | BCC $1234 | 2* | |
| BCS | $B0 | Relative | BCS $1234 | 2* | |
| BEQ | $F0 | Relative | BEQ $1234 | 2* | |
| BIT | $24 | Zeropage | BIT $12 | 3 | |
| BIT | $2C | Absolute | BIT $1234 | 4 | |
| BMI | $30 | Relative | BMI $1234 | 2* | |
| BNE | $D0 | Relative | BNE $1234 | 2* | |
| BPL | $10 | Relative | BPL $1234 | 2* | |
| BRK | $00 | Immediate | BRK | 7 | |
| BVC | $50 | Relative | BVC $1234 | 2* | |
| BVS | $70 | Relative | BVS $1234 | 2* | |
| CLC | $18 | Implied | CLC | 2 | |
| CLD | $D8 | Implied | CLD | 2 | |
| CLI | $58 | Implied | CLI | 2 | |
| CLV | $B8 | Implied | CLV | 2 | |
| CMP | $C1 | (Indirect,X) | CMP ($12,X) | 6 | |
| CMP | $C5 | Zeropage | CMP $12 | 3 | |
| CMP | $C9 | Immediate | CMP #$12 | 2 | |
| CMP | $CD | Absolute | CMP $1234 | 4 | |
| CMP | $D1 | (Indirect),Y | CMP ($12),Y | 5* | |
| CMP | $D5 | Zeropage,X | CMP $12,X | 4 | |
| CMP | $D9 | Absolute,Y | CMP $1234,Y | 4* | |
| CMP | $DD | Absolute,X | CMP $1234,X | 4* | |
| CPX | $E0 | Immediate | CPX #$12 | 2 | |
| CPX | $E4 | Zeropage | CPX $12 | 3 | |
| CPX | $EC | Absolute | CPX $1234 | 4 | |
| CPY | $C0 | Immediate | CPY #$12 | 2 | |
| CPY | $C4 | Zeropage | CPY $12 | 3 | |
| CPY | $CC | Absolute | CPY $1234 | 4 | |
| DEC | $C6 | Zeropage | DEC $12 | 5 | |
| DEC | $CE | Absolute | DEC $1234 | 6 | |
| DEC | $D6 | Zeropage,X | DEC $12,X | 6 | |
| DEC | $DE | Absolute,X | DEC $1234,X | 7 | |
| DEX | $CA | Implied | DEX | 2 | |
| DEY | $88 | Implied | DEY | 2 | |
| DCP | $C3 | (Indirect,X) | DCP ($12,X) | 8 | Illegal |
| DCP | $C7 | Zeropage | DCP $12 | 5 | Illegal |
| DCP | $CF | Absolute | DCP $1234 | 6 | Illegal |
| DCP | $D3 | (Indirect),Y | DCP ($12),Y | 8 | Illegal |
| DCP | $D7 | Zeropage,X | DCP $12,X | 6 | Illegal |
| DCP | $DB | Absolute,Y | DCP $1234,Y | 7 | Illegal |
| DCP | $DF | Absolute,X | DCP $1234,X | 7 | Illegal |
| EOR | $41 | (Indirect,X) | EOR ($12,X) | 6 | |
| EOR | $45 | Zeropage | EOR $12 | 3 | |
| EOR | $49 | Immediate | EOR #$12 | 2 | |
| EOR | $4D | Absolute | EOR $1234 | 4 | |
| EOR | $51 | (Indirect),Y | EOR ($12),Y | 5* | |
| EOR | $55 | Zeropage,X | EOR $12,X | 4 | |
| EOR | $59 | Absolute,Y | EOR $1234,Y | 4* | |
| EOR | $5D | Absolute,X | EOR $1234,X | 4* | |
| INC | $E6 | Zeropage | INC $12 | 5 | |
| INC | $EE | Absolute | INC $1234 | 6 | |
| INC | $F6 | Zeropage,X | INC $12,X | 6 | |
| INC | $FE | Absolute,X | INC $1234,X | 7 | |
| INX | $E8 | Implied | INX | 2 | |
| INY | $C8 | Implied | INY | 2 | |
| ISB | $E3 | (Indirect,X) | ISB ($12,X) | 8 | Illegal |
| ISB | $E7 | Zeropage | ISB $12 | 5 | Illegal |
| ISB | $EF | Absolute | ISB $1234 | 6 | Illegal |
| ISB | $F3 | (Indirect),Y | ISB ($12),Y | 8 | Illegal |
| ISB | $F7 | Zeropage,X | ISB $12,X | 6 | Illegal |
| ISB | $FB | Absolute,Y | ISB $1234,Y | 7 | Illegal |
| ISB | $FF | Absolute,X | ISB $1234,X | 7 | Illegal |
| JAM | $02 | Implied | JAM | 1 | Illegal |
| JAM | $12 | Implied | JAM | 1 | Illegal |
| JAM | $22 | Implied | JAM | 1 | Illegal |
| JAM | $32 | Implied | JAM | 1 | Illegal |
| JAM | $42 | Implied | JAM | 1 | Illegal |
| JAM | $52 | Implied | JAM | 1 | Illegal |
| JAM | $62 | Implied | JAM | 1 | Illegal |
| JAM | $72 | Implied | JAM | 1 | Illegal |
| JAM | $92 | Implied | JAM | 1 | Illegal |
| JAM | $B2 | Implied | JAM | 1 | Illegal |
| JAM | $D2 | Implied | JAM | 1 | Illegal |
| JAM | $F2 | Implied | JAM | 1 | Illegal |
| JMP | $4C | Absolute | JMP $1234 | 3 | |
| JMP | $6C | (Abs. Indirect) | JMP ($1234) | 5 | |
| JSR | $20 | Absolute | JSR $1234 | 6 | |
| LAX | $A3 | (Indirect,X) | LAX ($12,X) | 6 | Illegal |
| LAX | $A7 | Zeropage | LAX $12 | 3 | Illegal |
| LAX | $AF | Absolute | LAX $1234 | 4 | Illegal |
| LAX | $B3 | (Indirect),Y | LAX ($12),Y | 5* | Illegal |
| LAX | $B7 | Zeropage,Y | LAX $12,Y | 4 | Illegal |
| LAX | $BF | Absolute,Y | LAX $1234,Y | 4* | Illegal |
| LDA | $A1 | (Indirect,X) | LDA ($12,X) | 6 | |
| LDA | $A5 | Zeropage | LDA $12 | 3 | |
| LDA | $A9 | Immediate | LDA #$12 | 2 | |
| LDA | $AD | Absolute | LDA $1234 | 4 | |
| LDA | $B1 | (Indirect),Y | LDA ($12),Y | 5* | |
| LDA | $B5 | Zeropage,X | LDA $12,X | 4 | |
| LDA | $B9 | Absolute,Y | LDA $1234,Y | 4* | |
| LDA | $BD | Absolute,X | LDA $1234,X | 4* | |
| LDX | $A2 | Immediate | LDX #$12 | 2 | |
| LDX | $A6 | Zeropage | LDX $12 | 3 | |
| LDX | $AE | Absolute | LDX $1234 | 4 | |
| LDX | $B6 | Zeropage,Y | LDX $12,Y | 4 | |
| LDX | $BE | Absolute,Y | LDX $1234,Y | 4* | |
| LDY | $A0 | Immediate | LDY #$12 | 2 | |
| LDY | $A4 | Zeropage | LDY $12 | 3 | |
| LDY | $AC | Absolute | LDY $1234 | 4 | |
| LDY | $B4 | Zeropage,X | LDY $12,X | 4 | |
| LDY | $BC | Absolute,X | LDY $1234,X | 4* | |
| LSR | $46 | Zeropage | LSR $12 | 5 | |
| LSR | $4A | Implied | LSR A | 2 | |
| LSR | $4E | Absolute | LSR $1234 | 6 | |
| LSR | $5E | Absolute,X | LSR $1234,X | 7 | |
| NOP | $04 | Zeropage | NOP $12 | 3 | Illegal |
| NOP | $0C | Absolute | NOP $1234 | 4 | Illegal |
| NOP | $14 | Zeropage,X | NOP $12,X | 4 | Illegal |
| NOP | $1A | Implied | NOP | 2 | Illegal |
| NOP | $1C | Absolute,X | NOP $1234,X | 4* | Illegal |
| NOP | $34 | Zeropage,X | NOP $12,X | 4 | Illegal |
| NOP | $3A | Implied | NOP | 2 | Illegal |
| NOP | $3C | Absolute,X | NOP $1234,X | 4* | Illegal |
| NOP | $44 | Zeropage | NOP $12 | 3 | Illegal |
| NOP | $54 | Zeropage,X | NOP $12,X | 4 | Illegal |
| NOP | $5A | Implied | NOP | 2 | Illegal |
| NOP | $5C | Absolute,X | NOP $1234,X | 4* | Illegal |
| NOP | $64 | Zeropage | NOP $12 | 3 | Illegal |
| NOP | $74 | Zeropage,X | NOP $12,X | 4 | Illegal |
| NOP | $7A | Implied | NOP | 2 | Illegal |
| NOP | $7C | Absolute,X | NOP $1234,X | 4* | Illegal |
| NOP | $80 | Immediate | NOP #$12 | 2 | Illegal |
| NOP | $82 | Immediate | NOP #$12 | 2 | Illegal |
| NOP | $89 | Immediate | NOP #$12 | 2 | Illegal |
| NOP | $C2 | Immediate | NOP #$12 | 2 | Illegal |
| NOP | $D4 | Zeropage,X | NOP $12,X | 4 | Illegal |
| NOP | $DA | Implied | NOP | 2 | Illegal |
| NOP | $DC | Absolute,X | NOP $1234,X | 4* | Illegal |
| NOP | $E2 | Immediate | NOP #$12 | 2 | Illegal |
| NOP | $F4 | Zeropage,X | NOP $12,X | 4 | Illegal |
| NOP | $FA | Implied | NOP | 2 | Illegal |
| NOP | $FC | Absolute,X | NOP $1234,X | 4* | Illegal |
| ORA | $01 | (Indirect,X) | ORA ($FF,X) | 6 | |
| ORA | $05 | Zeropage | ORA $12 | 3 | |
| ORA | $09 | Immediate | ORA #$12 | 2 | |
| ORA | $0D | Absolute | ORA $1234 | 4 | |
| ORA | $11 | (Indirect),Y | ORA ($12),Y | 5* | |
| ORA | $15 | Zeropage,X | ORA $12,X | 4 | |
| ORA | $19 | Absolute,Y | ORA $1234,Y | 4* | |
| ORA | $1D | Absolute,X | ORA $1234,X | 4* | |
| PHA | $48 | Implied | PHA | 3 | |
| PHP | $08 | Implied | PHP | 3 | |
| PLA | $68 | Implied | PLA | 4 | |
| PLP | $28 | Implied | PLP | 4 | |
| RLA | $23 | (Indirect,X) | RLA ($12,X) | 8 | Illegal |
| RLA | $27 | Zeropage | RLA $12 | 5 | Illegal |
| RLA | $2F | Absolute | RLA $1234 | 6 | Illegal |
| RLA | $33 | (Indirect),Y | RLA ($12),Y | 8 | Illegal |
| RLA | $37 | Zeropage,X | RLA $12,X | 6 | Illegal |
| RLA | $3B | Absolute,Y | RLA $1234,Y | 7 | Illegal |
| RLA | $3F | Absolute,X | RLA $1234,X | 7 | Illegal |
| ROL | $26 | Zeropage | ROL $12 | 5 | |
| ROL | $2A | Implied | ROL A | 2 | |
| ROL | $2E | Absolute | ROL $1234 | 6 | |
| ROL | $36 | Zeropage,X | ROL $12,X | 6 | |
| ROL | $3E | Absolute,X | ROL $1234,X | 7 | |
| ROR | $66 | Zeropage | ROR $12 | 5 | |
| ROR | $6A | Implied | ROR A | 2 | |
| ROR | $6E | Absolute | ROR $1234 | 6 | |
| ROR | $76 | Zeropage,X | ROR $12,X | 6 | |
| ROR | $7E | Absolute,X | ROR $1234,X | 7 | |
| RRA | $63 | (Indirect,X) | RRA ($12,X) | 8 | Illegal |
| RRA | $67 | Zeropage | RRA $12 | 5 | Illegal |
| RRA | $6F | Absolute | RRA $1234 | 6 | Illegal |
| RRA | $73 | (Indirect),Y | RRA ($12),Y | 8 | Illegal |
| RRA | $77 | Zeropage,X | RRA $12,X | 6 | Illegal |
| RRA | $7B | Absolute,Y | RRA $1234,Y | 7 | Illegal |
| RRA | $7F | Absolute,X | RRA $1234,X | 7 | Illegal |
| RTI | $40 | Implied | RTI | 6 | |
| RTS | $60 | Implied | RTS | 6 | |
| SAX | $83 | (Indirect,X) | SAX ($12,X) | 6 | Illegal |
| SAX | $87 | Zeropage | SAX $12 | 3 | Illegal |
| SAX | $8F | Absolute | SAX $1234 | 4 | Illegal |
| SAX | $97 | Zeropage,Y | SAX $12,Y | 4 | Illegal |
| SBC | $E1 | (Indirect,X) | SBC ($12,X) | 6 | |
| SBC | $E5 | Zeropage | SBC $12 | 3 | |
| SBC | $E9 | Immediate | SBC #$12 | 2 | |
| SBC | $ED | Absolute | SBC $1234 | 4 | |
| SBC | $F1 | (Indirect),Y | SBC ($12),Y | 5* | |
| SBC | $F5 | Zeropage,X | SBC $12,X | 4 | |
| SBC | $F9 | Absolute,Y | SBC $1234,Y | 4* | |
| SBC | $FD | Absolute,X | SBC $1234,X | 4* | |
| SBC | $EB | Immediate | SBC #$12 | 2 | Illegal |
| SBX | $CB | Immediate | SBX #$12 | 2 | Illegal |
| SED | $F8 | Implied | SED | 2 | |
| SEI | $78 | Implied | SEI | 2 | |
| SHA | $93 | Absolute,X | SHA $1234,X | 5 | Illegal |
| SHA | $9F | Absolute,Y | SHA $1234,Y | 5 | Illegal |
| SHS | $9B | Absolute,Y | SHS $1234,Y | 5 | Illegal |
| SHX | $9E | Absolute,Y | SHX $1234,Y | 5 | Illegal |
| SHY | $9C | Absolute,X | SHY $1234,X | 5 | Illegal |
| SLO | $03 | (Indirect,X) | SLO ($12,X) | 8 | Illegal |
| SLO | $07 | Zeropage | SLO $12 | 5 | Illegal |
| SLO | $0F | Absolute | SLO $1234 | 6 | Illegal |
| SLO | $13 | (Indirect),Y | SLO ($12),Y | 8 | Illegal |
| SLO | $17 | Zeropage,X | SLO $12,X | 6 | Illegal |
| SLO | $1B | Absolute,Y | SLO $1234,Y | 7 | Illegal |
| SLO | $1F | Absolute,X | SLO $1234,X | 7 | Illegal |
| SRE | $43 | (Indirect,X) | SRE ($12,X) | 8 | Illegal |
| SRE | $47 | Zeropage | SRE $12 | 5 | Illegal |
| SRE | $4F | Absolute | SRE $1234 | 6 | Illegal |
| SRE | $53 | (Indirect),Y | SRE ($12),Y | 8 | Illegal |
| SRE | $57 | Zeropage,X | SRE $12,X | 6 | Illegal |
| SRE | $5B | Absolute,Y | SRE $1234,Y | 7 | Illegal |
| SRE | $5F | Absolute,X | SRE $1234,X | 7 | Illegal |
| STA | $81 | (Indirect,X) | STA ($12,X) | 6 | |
| STA | $85 | Zeropage | STA $12 | 3 | |
| STA | $8D | Absolute | STA $1234 | 4 | |
| STA | $91 | (Indirect),Y | STA ($12),Y | 6 | |
| STA | $95 | Zeropage,X | STA $12,X | 4 | |
| STA | $99 | Absolute,Y | STA $1234,Y | 5 | |
| STA | $9D | Absolute,X | STA $1234,X | 5 | |
| STX | $86 | Zeropage | STX $12 | 3 | |
| STX | $8E | Absolute | STX $1234 | 4 | |
| STX | $96 | Zeropage,Y | STX $12,Y | 4 | |
| STY | $84 | Zeropage | STY $12 | 3 | |
| STY | $8C | Absolute | STY $1234 | 4 | |
| STY | $94 | Zeropage,X | STY $12,X | 4 | |
| TAX | $AA | Implied | TAX | 2 | |
| TAY | $A8 | Implied | TAY | 2 | |
| TSX | $BA | Implied | TSX | 2 | |
| TXA | $8A | Implied | TXA | 2 | |
| TXS | $9A | Implied | TXS | 2 | |
| TYA | $98 | Implied | TYA | 2 | |
