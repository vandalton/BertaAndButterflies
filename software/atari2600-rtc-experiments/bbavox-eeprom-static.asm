; AtariVox bB wrapper
;
; It reads/writes only a byte at a time, so we can get away with running
; in overscan or vblank

; this is called as a bB function in the form...
; a=AVoxReadByte(addrhi,addrlo)

AVoxReadByte
 ifnconst AVoxSafetyOff
   ; safety mode is on. force the write to go to $3XXX
   and #$0F
   ora #$30
 endif
 sta temp2
 sty temp3

 jsr i2c_startwrite
 bcs AVEEPROMS_Error
 lda #0
 sta temp1
 lda temp2
 jsr i2c_txbyte
 lda temp3
 jsr i2c_txbyte
 jsr i2c_stopwrite
 jsr i2c_startread
 jsr i2c_rxbyte
 sta temp2 ; save the retrieved byte
 jsr i2c_stopread
 lda #0
 sta temp1
 lda temp2 ; return the retrieved byte on the accumulator
 rts

; this is called as a bB function in the form...
; a=AVoxWriteByte(addrhi,addrlo,value)
AVoxWriteByte
 ifnconst AVoxSafetyOff
   ; safety mode is on. force the write to go to $3XXX
   and #$0F
   ora #$30
 endif
 sta temp1
 sty temp2

 jsr i2c_startwrite
 bcs AVEEPROMS_Error

 lda temp1
 jsr i2c_txbyte
 lda temp2
 jsr i2c_txbyte
 lda temp3
 jsr i2c_txbyte
 jsr i2c_stopwrite
 lda #0
 sta temp1
 rts

AVEEPROMS_Error
 lda #$ff
 sta temp1
 rts

 include "i2c.inc"
 I2C_SUBS temp5 
