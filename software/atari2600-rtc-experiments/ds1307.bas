  include bb-ds1307.asm

  set romsize 4k

  dim sc1=score
  dim sc2=score+1
  dim sc3=score+2

  playfield:
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  X..............................X
  X..............................X
  X..............................X
  X..............................X
  X..............................X
  X..............................X
  X..............................X
  X..............................X
  X..............................X
  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end


  COLUBK = $98
  COLUPF = $64
  COLUP1 = $0E
  scorecolor = $0E
  a = 30

main
  a = a - 1
  if a > 0 then goto __a_handled

  a = 30
  b = ReadSecond()

  sc3 = temp2
  sc2 = temp3

  temp4 = temp4 & %00011111
  sc1 = temp4

__a_handled

  if joy0fire then COLUBK = $98 : sc3 = 0 : sc2 = 0 : sc1 = 0
  drawscreen

  goto main
