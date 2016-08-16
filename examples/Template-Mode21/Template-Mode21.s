.include "libSFX.i"

Main:
        ;Set color 0
        CGRAM_setColorRGB 0, 7,31,31

        ;Turn on screen
        ;The vblank interrupt handler will copy the value in SFX_inidisp to INIDISP ($2100)
        lda     #inidisp(ON, DISP_BRIGHTNESS_MAX)
        sta     SFX_inidisp

        ;Turn on vblank interrupt
        VBL_on

:       wai
        bra :-
