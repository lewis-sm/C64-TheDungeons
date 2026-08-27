# ACME Assembler - General Syntax

A line of assembly in general uses one opcode. You can place several opcodes in one line, separated by colons.

Labels can be placed in front of an opcode, or stand alone on a single line.

Pseudo operators start with an exclamation mark.

Mnemonics are written as expected. For opcodes with literal values prefix # to the expression. Expressions are resolved in as many passes as required. If possible (e.g. the address is < 256) C64Studio tries to call the zero page variant of an opcode. If at the time of assembling the current line the value of address cannot be deduced, C64Studio will always play safe and use the 3 byte variant. You can force addressing behaviour by postfixing "+1" or "+2" to the opcode.


        ;load the literal value $20 into the accumulator
        lda #$20

        ;uses the two or three byte opcode depending on the value of address
        lda ADDRESS

        ;force the zero page variant
        lda+1 ADDRESS

        ;force the three page variant
        lda+2 ADDRESS
       
## Labels
ACME supports four types of labels:
1 - global labels
2 - local labels
3 - cheap labels
4 - immediate labels

The differences are mostly in regard to scopes or zones.

### Global Labels

Global labels start with letters. Their scope is global, e.g. they can be accessed by name from everywhere.

  !zone Zone1
  GlobalLabel
        lda #15

        jmp GlobalLabel

  !zone Zone2
        jmp GlobalLabel     

### Local Labels

Local labels start with a dot. Their scope is local, e.g. they are valid inside their encompassing zone. If you want to refer to a local label from a differenz zone, prefix the zone name.

  !zone Zone1
  .LocalLabel
        lda #15

        ;directly reference local label in same zone
        jmp .LocalLabel

  !zone Zone2
        ;allow the same label name in different zone
  .LocalLabel

        ;prefix parent zone name from other zone
        jmp Zone1.LocalLabel
          
### Cheap Labels

Cheap labels start with a @. Their scope is global, and their name needs not to be unique. A new placement overrides any previously (upwards) existing definition.

  !zone Zone1
  @CheapLabel
        lda #15

        ;directly reference cheap label
        jmp @CheapLabel

  !zone Zone2
        ;allow the same label name, overriding the existing label
  @CheapLabel

        ;you cannot reference @CheapLabel from Zone1 anymore
        jmp @CheapLabel

### Immediate Labels

Immediate labels are consisting of + or - exclusively. A - means the assembler looks upwards for the first match, a + looking downwards. A new placement of the same label overrides any previously (upwards) existing definition.

  !zone Zone1
  -
        lda #15
        bne ++

        ;directly reference cheap label
        jmp -
  ++
        rts

  !zone Zone2
        ;allow the same label name, overriding the existing label
  -

        ;jumps to the - just above
        jmp -
          
(!loop- means backward reference, !loop+ means forward reference.)

## Literals
Literal values are either text or integer. Integer variables are either specified as decimal (default), hexadecimal (prefix $ or 0x), or binary (prefix %)

      INTEGER
        !byte 17

      INTEGER2
        !byte $18

      INTEGER3
        !byte 0x18

      INTEGER4
        !byte %01001100

      TEXT
        !text "I am a text",0
      
## Constants
Hex:        $1F
Binary:     %10101010
Decimal:    42
Character:  'A'