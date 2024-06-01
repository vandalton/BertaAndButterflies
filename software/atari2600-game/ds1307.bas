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


  COLUBK = $B8
  COLUPF = $64
  COLUP1 = $0E
  scorecolor = $0E
  a = 200

main
  a = a - 1
  if a > 0 then goto __a_handled

  a = 200
  b = ReadSecond()
  b = b & %00001111
  sc3 = b

__a_handled
  drawscreen

  goto main
