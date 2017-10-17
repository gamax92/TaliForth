; -----------------------------------------------------------------------------
; KERNEL 
; for the Thistle Computer
; James Coonradt <gamax92@aol.com>
; -----------------------------------------------------------------------------
; Provides input and output routines for the Forth system to run on. 

; -----------------------------------------------------------------------------
; Used with the Ophis assembler and the Thistle computer
; -----------------------------------------------------------------------------

; -----------------------------------------------------------------------------
; CHIP ADDRESSES 
; -----------------------------------------------------------------------------
; Change these for target system

; Thistle GenericIO
.alias GIObase $E000                        ; GenericIO base address
.alias GIOis   GIObase+0                    ; GenericIO input counter
.alias GIOrx   GIObase+1                    ; GenericIO input buffer
.alias GIOtx   GIObase+3                    ; GenericIO terminal output

; =============================================================================
; KERNEL FUNCTIONS AND SUBROUTINES
; =============================================================================
; These start with k_

; -----------------------------------------------------------------------------
; Get a character from the input buffer
k_getchr:
.scope
*       lda GIOis
        beq -
        lda GIOrx
        bne +
        lda GIOrx
        bra -
*       rts
.scend
; -----------------------------------------------------------------------------
; Write a character to the terminal driver. Assumes character is in A. Because
; this is "write" command, there is no line feed at the end
k_wrtchr:
.scope
        sta GIOtx
        rts
.scend

; =============================================================================
; END
