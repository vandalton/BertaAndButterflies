  include bb-ds1307.asm

  set romsize 4k

  dim sc1=score
  dim sc2=score+1
  dim sc3=score+2

  dim _time_read_debounce = a
  dim _time_write_debounce = b
  dim _change_debounce = c

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
  _time_read_debounce = 30
  _time_write_debounce = 0

main
  if _change_debounce > 0 then _change_debounce = _change_debounce - 1
  
  _time_read_debounce = _time_read_debounce - 1
  if _time_write_debounce > 0 then _time_write_debounce = _time_write_debounce - 1

  if _time_write_debounce <> 1 then goto __write_handled

  temp2 = sc3
  temp3 = sc2
  temp4 = sc1 & %00011111

  temp1 = WriteTime()

__write_handled

  if _time_read_debounce > 0  then goto __read_handled

  _time_read_debounce = 30

  if _time_write_debounce > 0 then goto __read_handled

  temp1 = ReadTime()

  sc3 = temp2
  sc2 = temp3

  temp4 = temp4 & %00011111
  sc1 = temp4

__read_handled

  if _change_debounce > 0 then goto __joystick_handled

  if joy0fire then COLUBK = $98 : sc3 = 0 : sc2 = 0 : sc1 = 0 : : _change_debounce = 10
  if joy0right then sc1 = sc1 + 1 : sc3 = 0 : _time_write_debounce = 60 : _change_debounce = 10
  if joy0left then sc1 = sc1 - 1 : sc3 = 0 : _time_write_debounce = 60 : _change_debounce = 10
  if joy0up then sc2 = sc2 + 1 : sc3 = 0 : _time_write_debounce = 60: _change_debounce = 10
  if joy0down then sc2 = sc2 - 1 : sc3 = 0 : _time_write_debounce = 60: _change_debounce = 10

__joystick_handled

  drawscreen

  goto main
