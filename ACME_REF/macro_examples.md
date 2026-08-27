# ACME macro tutorial

## Basics

### define a Macro
!macro MacroName [Variable1 [,Variable2 [,Variable3 ]]] {
   ;some lines that make up your macro
}

### call a Macro
+MacroName [Variable1 [,Variable2 [,Variable3]]]

## simple Examples
I personally like Macros a lot, as they make Code much more readable. So I extended my <std/6502.a> by a few Macros like:

!macro inc16 .t {
inc .t
bne .j; "*" syntax not used here because size of ".t" is unknown
inc .t + 1
.j
}

; far branch

!macro bcc .t {
bcs * + 5
jmp .t
}

!macro mv16im .wort, .mem {
lda #<(.wort)
sta .mem
lda #>(.wort)
sta .mem+1
}

!macro mv16ab .wort, .mem {
lda .wort
sta .mem
lda .wort+1
sta .mem+1
}

With those you will be able to increment a 16bit value like this

.my16bitValue !word 31336

by simply doing

+inc16 .my16bitValue

That would make .my16bitValue eleet ;-)

Initialising the IRQ-vector could be done like this:

            +mv16im .irqroutine,$fffe
...
.irqroutine asl $d019
            ...
            rti

Or if compiling the code reveals, that some branch is out of range, just prepend it with a “+” - as simple as that. I guess now you also start liking macros ;)

## a little bit advanced Example

I like to code stuff that can be loaded and run directly. But I don't like BASIC-lines like

0 sys2063

When someone loads my crap and types “list” I'd like him or her to see a line like

2011 - the year when Neoplasia came back to life

To have this neat little line in front of my code I wrote another library-routine which I use to !src instead of setting “* = 0801”:

**ACME_lib/C64/basicstart_template.a**
;==============================================================================
;	ACME - Basicstart-Template ;-)  by St0fF/Neoplasia
;==============================================================================
	!src <6502/std.a>
	!src <C64/std.a>
 
	* = $0801
	!byte <.basend,>.basend,<year,>year,$9e
	!byte (.run/1000)+48,((.run/100)%10)+48,((.run/10)%10)+48,.run%10+48
	!byte ":",$8f	;REM
	!fill 11,20
	+der_text
	!byte 0
.basend !byte 0,0
.run
 
;YEAR SYS.run:REM~~~~~~~~~~~der_text

So now you can start you code like this:

;my Routine, that starts with a nice BASIC line

!macro der_text {
  !pet "the year when neoplasia came back to life"
}

year = 2011

!src <C64/basicstart_template.a>

You can clearly see that the “advancement” lays in this template using a very simple macro and a label defined before !src'ing it.

## even more advanced examples

Codebase is great. I put some math code from here into a macro. The advancement is: the macro itself does not create any code, its sole purpose is precalculating a value I can use later on. Here we go with the “calculate square root at compile time” example:

wurzel.ha
!macro wurzel Q,W {
	!set .M = Q
	!set .R = 0
	!set .D = 128
	!do while .D >= 1 {
		!set .T = .D * (2 * .R + .D)
		!if (.T <= .M) {
			!set .M = .M - .T
			!set .R = .R + .D
		}
		!set .D = .D / 2
	}
	!set W = .R
}

Thanks a lot to Graham for the algorithm posting! Beware! Here we find some caveats in ACME's macro processing: each call of a macro seems to open up a subzone. So to use the “wurzel” macro, the “W” parameter needs to be a global label in the calling source. See this example of calculating lightsource data:

;Lightsource-Tabellen:
;LS/2 Tabellen über je eine Page, die die Lightsource-Farbe darstellen sollen
;==============================================================================
	!src "wurzel.ha"
;==============================================================================
!for .y,LS/2 {
	!for .x,256 {
		!set .quadrat = (16-.y)^2 + (.x - 75 - LS/2)^2
		+wurzel .quadrat,W
		!set .w = LS/2 - W -1
		!if .w < 0 {
			!set .w = 0
		}
		!by 15-.w
	}
}

## Use reference as macro params

When putting code into a macro that shall be manipulated from code outside (e.g. speedcode that is set up before being called) it is nice to have references as parameters for the macro-call. Just see the following example that does some nonsense as result:

!macro my_code ~.pattern {
.pattern  lda #$00
          sta $1000,x
          sta $1008,x
          sta $1010,x
}

          lda #$55
          sta pattern1+1
          sta pattern2+1
          eor #$ff
          sta pattern3+1
          sta pattern4+1
        
          ldx #$00
          +my_code ~pattern1
          inx
          +my_code ~pattern2
          inx
          +my_code ~pattern3
          inx
          +my_code ~pattern4
          inx
          ...

Examples from base/acme-macro-tut.txt · Last modified: 2025-06-17 10:06 by 127.0.0.1