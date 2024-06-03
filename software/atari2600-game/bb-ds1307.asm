ReadSecond
 jsr i2c_startwrite
 bcs Ds1307Error
 jsr i2c_txbyte
 jsr i2c_stopwrite
 jsr i2c_startread
 jsr i2c_rxbyte
 sta temp2
 jsr i2c_rxbyte
 sta temp3
 jsr i2c_rxbyte
 sta temp4
 jsr i2c_stopread
 lda #0
 lda temp3
 rts

Ds1307Error
 lda #$ff
 sta temp1
 rts

 include "i2c.inc"
 I2C_SUBS temp5 
