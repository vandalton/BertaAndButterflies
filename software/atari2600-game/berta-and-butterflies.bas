    rem include bbavox-eeprom-static.asm

    set kernel_options pfcolors no_blank_lines
    rem set tv pal
    const font=retroputer

    /* pal colors */
    /* const _blue=$B8
    const _blue_gray=$DC
    const _red=$64
    const _white=$0E
    const _yellow=$28
    const _brown=$22
    const _green=$58
    const _gray=$08 */

    /* ntsc colors */
    const _blue=$98
    const _blue_gray=$8C
    const _red=$44
    const _white=$0E
    const _yellow=$18
    const _brown=$12
    const _green=$C8
    const _gray=$08

    const pfscore=1

    pfscorecolor=_white
    scorecolor=_white

    player0y=80

    /* 
    0: bottom left 
    1: bottom right 
    2: top left 
    3: top right 
    */
    dim _berta_position = a 
    dim _prev_berta_position = b

    dim _top_left_butterfly = c
    dim _top_right_butterfly = d
    dim _bottom_left_butterfly = e
    dim _bottom_right_butterfly = f

    dim _butterfly_count = g

    dim _slowdown = h
    dim _slowdown_limit = i

    dim _butterfly_source = j
    dim _inactive_sources_count = k

    dim _current_butterflies = l

    dim _sound_duration = m

    dim _after_scored_duration = n

    dim _max_butterflies = o

    dim _fail_left = p
    dim _fail_right = q

    dim _pausing_source = r

    /*
    0: title screen
    1: game a
    2: game b
    */
    dim _game_mode = s

    dim _temp = t

    dim _title_screen_counter = u
    dim _title_screen_note = v

    dim _return_to_the_title_screen = w

    dim _sc1 = score
    dim _sc2 = score + 1
    dim _sc3 = score + 2

    _game_mode = 0
    _prev_berta_position = 5

    AUDC0 = 12

    COLUP0=_white
    
main
    if _sound_duration = 0 || switchbw then AUDV0 = 0 : goto __sound_muted

    AUDV0 = 5
    _sound_duration = _sound_duration - 1

__sound_muted

    player0x=60

    COLUBK=_blue
    COLUP1=_brown

    NUSIZ0=$07
    NUSIZ1=$05

    /* bottom */
    if _berta_position < 2 && _game_mode > 0 then playfield:
    .....XXXXX..........XXXXX.......
    ................................
    ................................
    ...........XX....XX.............
    ..........XX......XX............
    ................................
    .............XXXX...............
    ............XXXXXX..............
    .............XXXX...............
    XXXXX......................XXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
    if _berta_position < 2 && _game_mode = 0 then playfield:
    ................................
    ................................
    XX..XXX.XX.XXX.XX...............
    X.X.X...X.X.X..X.X.....XX....XX.
    XXX.XX..XX..X..XXX....XX......XX
    X.X.X...X.X.X..X.X..............
    XXX.XXX.X.X.X..X.X.......XXXX...
    .........X..............XXXXXX..
    ....X...X......X.........XXXX...
    XXXXX...........................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

    /* top */
    if _berta_position > 1 && _game_mode > 0 then playfield:
    .....XXXXX..........XXXXX.......
    ................................
    ...........XX....XX.............
    ..........XX......XX............
    ................................
    ..............XX................
    .............XXXX...............
    ............XXXXXX..............
    .............XXXX...............
    XXXXX......................XXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

    /* top */
    if _berta_position > 1 && _game_mode = 0 then playfield:
    ...............................
    ...............................
    XX..XXX.XX.XXX.XX......XX....XX.
    X.X.X...X.X.X..X.X....XX......XX
    XXX.XX..XX..X..XXX..............
    X.X.X...X.X.X..X.X........XX....
    XXX.XXX.X.X.X..X.X.......XXXX...
    ...X..........X.........XXXXXX..
    ..X.......X..X...........XXXX...
    XXXXX...........................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

    pfcolors:
    _white
    _white
    _red
    _red
    _red
    _red
    _red
    _red
    _red
    _red
    _green
    _yellow
end

    if _prev_berta_position = _berta_position then goto __sprites_set
    
    _prev_berta_position = _berta_position

    /* top */
    if _berta_position < 2 then goto __berta_top_set
    
    player0:
    %00000110
    %00000110
    %00000110
    %00000110
    %11100110
    %11100110
    %11100110
    %11100110
    %11000010
    %11000010
    %11000010
    %11000010
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %10000000
    %10000000
    %10000000
    %10000000
    %11000010
    %11000010
    %11000010
    %11000010
    %01000011
    %01000011
    %01000011
    %01000011
    %00000001
    %00000001
    %00000001
    %00000001
    %00000000
    %00000000
    %00000000
    %00000000
    %00111100
    %00111100
    %00111100
    %00111100
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01011010
    %01011010
    %01011010
    %01011010
    %00111100
    %00111100
    %00111100
    %00111100
    %00001000
    %00001000
    %00001000
    %00001000
end

    player1:
    %10000000
    %11000000
    %01100000
    %00110000
    %00011000
    %00111100
    %01000110
    %10101011
    %10010001
    %10101010
    %01000100
    %00111000
end

    player1y=50

__berta_top_set

    /* bottom */
    if _berta_position > 1 then goto __berta_bottom_set

    player0:
    %01100110
    %01100110
    %01100110
    %01100110
    %01100110
    %01100110
    %01100110
    %01100110
    %01000010
    %01000010
    %01000010
    %01000010
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %00000000
    %10000001
    %10000001
    %10000001
    %10000001
    %11000011
    %11000011
    %11000011
    %11000011
    %01000010
    %01000010
    %01000010
    %01000010
    %00011000
    %00011000
    %00111100
    %00111100
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01111110
    %01011010
    %01011010
    %01011010
    %01011010
    %00111100
    %00111100
    %00111100
    %00111100
    %00001000
    %00001000
    %00001000
    %00001000
end

    player1:
    %00111000
    %01000100
    %10101010
    %10010001
    %10101011   
    %01000110
    %00111100
    %00011000
    %00110000
    %01100000
    %11000000
    %10000000
end

    player1y=70

__berta_bottom_set
__sprites_set

    /* left */
    if _berta_position = 0 || _berta_position = 2 then goto __berta_left_set

    REFP0=0
    REFP1=0
    player1x=92

__berta_left_set

    /* right */
    if _berta_position = 1 || _berta_position = 3 then goto __berta_right_set

    REFP0=8
    REFP1=8
    player1x=44

__berta_right_set

    if _game_mode > 0 then goto __title_screen_handled

    COLUP1=_white
    NUSIZ1=0
    REFP1=0
    player0x=108

    player1x=92

    /* international title screen */
    player1y=72

    player1:
    %11111110
    %00000001
    %01111110
    %10000000
    %01111110
    %00000000
    %11111111
    %10000000
    %11110000
    %10000000
    %11111111
    %00000000
    %00011000
    %00011000
    %00011000
    %00000000
    %11111111
    %10000000
    %10000000
    %00000000
    %10000000
    %11110000
    %10000000
    %11111111
    %00000000
    %10001111
    %11111000
    %10000111
    %11111000
    %00000000
    %11111111
    %10000000
    %11110000
    %10000000
    %11111111
    %00000000
    %00011000
    %00011000
    %11111111
    %00000000
    %00011000
    %00011000
    %11111111
    %00000000
    %11111111
    %10000001
    %10000001
    %00000000
    %11111111
    %10000001
    %11111111
    %10000010
    %11111110
    %00000000
    %00000000
    %00000000
    %00111010
    %00100100
    %00011000
    %00100100
    %00011000
end
    /* polish title screen */
    /* player1y=55

    player1:
    %11111111
    %10000000
    %11110000
    %10000000
    %11111111
    %00000000
    %11111111
    %11000000
    %11000000
    %00000000
    %00011000
    %00111100
    %11000011
    %00000000
    %00011000
    %00011000
    %11111111
    %00000000
    %00111100
    %11000011
    %00111100
    %00000000
    %10000001
    %10011001
    %11100111
    %00000000
    %00000000
    %00000000
    %00011000
    %00011000
    %00011000
end */
    if _title_screen_counter <> 20 && _title_screen_counter <> 0 then goto __title_screen_music_handled
    if _sound_duration <> 0 then goto __title_screen_music_handled

    AUDF0 = __title_music_notes[_title_screen_note]
    _sound_duration = __title_music_lengths[_title_screen_note]

    _title_screen_note = _title_screen_note + 1
    if _title_screen_note > 19 then _title_screen_note = 0

__title_screen_music_handled

    if _title_screen_counter > 0 then goto __title_screen_counter_handled

    _title_screen_counter = 40

    if _berta_position = 0 then _berta_position = 3 : goto __title_screen_counter_handled
    if _berta_position = 3 then _berta_position = 1 : goto __title_screen_counter_handled
    if _berta_position = 1 then _berta_position = 2 : goto __title_screen_counter_handled
    if _berta_position = 2 then _berta_position = 0 : goto __title_screen_counter_handled

__title_screen_counter_handled
    _title_screen_counter = _title_screen_counter - 1

    if !joy0fire && !switchreset then goto __inner_loop_end

    _slowdown = 0
    pfscore1 = 21
    score = 0
    _max_butterflies = 1
    _prev_berta_position = 5
    
    if switchleftb then _game_mode = 1 : _slowdown_limit = 26 : _pausing_source = (rand & 3)
    if !switchleftb then _game_mode = 2 :  _slowdown_limit = 23 : _pausing_source = 5

    goto __inner_loop_end

__title_screen_handled

    if _after_scored_duration > 0 then _after_scored_duration = _after_scored_duration - 1 : COLUP1 = _red

    if _fail_left = 0 && _fail_right = 0 then goto __fail_handled

    COLUBK=_blue_gray

    pfcolors:
    _red
    _red
    _red
    _red
    _red
    _red
    _red
    _red
    _red
    _red
    _green
    _yellow
end

    if _fail_left = 0 then goto __fail_left_handled

    if _fail_left = 90 || _fail_left = 60 then _sound_duration = 3 : AUDF0 = 30

    if _fail_left <= 60 then pfpixel 4 0 on
    if _fail_left > 60 && _fail_left <= 90 then pfpixel 6 1 on
    if _fail_left > 90 && _fail_left <= 120 then pfpixel 7 2 on : pfpixel 8 1 on

    _fail_left = _fail_left - 1

__fail_left_handled

    if _fail_right = 0 then goto __fail_right_handled

    if _fail_right = 90 || _fail_right = 60 then _sound_duration = 3 : AUDF0 = 30

    if _fail_right <= 60 then pfpixel 25 0 on
    if _fail_right > 60 && _fail_right <= 90 then pfpixel 23 1 on
    if _fail_right > 90 && _fail_right <= 120 then pfpixel 22 2 on : pfpixel 21 1 on

    _fail_right = _fail_right - 1

__fail_right_handled

__fail_handled

    if _fail_left > 0 || _fail_right > 0 then goto __inner_loop_end

    if pfscore1 > 0 then goto __return_to_the_title_screen_handled

    if joy0fire || switchreset then _return_to_the_title_screen = 1

    if _return_to_the_title_screen = 0 then goto __return_to_the_title_screen_handled

    if !joy0fire && !switchreset then _return_to_the_title_screen = 0 : _title_screen_note = 0 : _game_mode = 0

__return_to_the_title_screen_handled

    if joy0right && _berta_position = 0 then _berta_position = 1
    if joy0right && _berta_position = 2 then _berta_position = 3
    if joy0left && _berta_position = 1 then _berta_position = 0
    if joy0left && _berta_position = 3 then _berta_position = 2
    if joy0up && _berta_position = 0 then _berta_position = 2
    if joy0up && _berta_position = 1 then _berta_position = 3
    if joy0down && _berta_position = 2 then _berta_position = 0
    if joy0down && _berta_position = 3 then _berta_position = 1

    if _top_left_butterfly{0} then pfpixel 1 2 on
    if _top_left_butterfly{1} then pfpixel 2 3 on : pfpixel 3 2 on 
    if _top_left_butterfly{2} then pfpixel 4 3 on
    if _top_left_butterfly{3} then pfpixel 5 4 on : pfpixel 6 3 on
    if _top_left_butterfly{4} then pfpixel 6 4 on

    if _top_right_butterfly{0} then pfpixel 28 2 on
    if _top_right_butterfly{1} then pfpixel 27 3 on : pfpixel 26 2 on 
    if _top_right_butterfly{2} then pfpixel 25 3 on
    if _top_right_butterfly{3} then pfpixel 24 4 on : pfpixel 23 3 on
    if _top_right_butterfly{4} then pfpixel 23 4 on

    if _bottom_left_butterfly{0} then pfpixel 1 6 on
    if _bottom_left_butterfly{1} then pfpixel 2 7 on : pfpixel 3 6 on 
    if _bottom_left_butterfly{2} then pfpixel 4 6 on
    if _bottom_left_butterfly{3} then pfpixel 5 7 on : pfpixel 6 6 on
    if _bottom_left_butterfly{4} then pfpixel 6 7 on

    if _bottom_right_butterfly{0} then pfpixel 28 6 on
    if _bottom_right_butterfly{1} then pfpixel 27 7 on : pfpixel 26 6 on 
    if _bottom_right_butterfly{2} then pfpixel 25 6 on
    if _bottom_right_butterfly{3} then pfpixel 24 7 on : pfpixel 23 6 on
    if _bottom_right_butterfly{4} then pfpixel 23 7 on

__check_if_catch
    if _berta_position = 0 then _current_butterflies = _bottom_left_butterfly
    if _berta_position = 1 then _current_butterflies = _bottom_right_butterfly
    if _berta_position = 2 then _current_butterflies = _top_left_butterfly
    if _berta_position = 3 then _current_butterflies = _top_right_butterfly

    if (_current_butterflies & 16) then _current_butterflies{4} = 0 : gosub __score_point

    if _berta_position = 0 then _bottom_left_butterfly = _current_butterflies
    if _berta_position = 1 then _bottom_right_butterfly = _current_butterflies
    if _berta_position = 2 then _top_left_butterfly = _current_butterflies
    if _berta_position = 3 then _top_right_butterfly = _current_butterflies

    if _slowdown > 0 then goto __inner_loop_end

    _inactive_sources_count = 0

__release_butterflies

    AUDF0 = __sources_audio_frequencies[_butterfly_source]
    if _butterfly_source = 0 then _current_butterflies = _bottom_left_butterfly
    if _butterfly_source = 1 then _current_butterflies = _bottom_right_butterfly
    if _butterfly_source = 2 then _current_butterflies = _top_left_butterfly
    if _butterfly_source = 3 then _current_butterflies = _top_right_butterfly

    if _current_butterflies = 0 then goto __butterflies_moved

    _current_butterflies = _current_butterflies * 2
    if (_current_butterflies & 32 = 0) then goto __butterflies_moved

    /* here is what happens when you fail */
    _butterfly_count = 0
    _current_butterflies = 0
    _bottom_left_butterfly = 0
    _bottom_right_butterfly = 0
    _top_left_butterfly = 0
    _top_right_butterfly = 0

    if _game_mode = 1 then _pausing_source = (rand & 3)

    if _butterfly_source = 0 || _butterfly_source = 2 then _fail_left = 120
    if _butterfly_source = 1 || _butterfly_source = 3 then _fail_right = 120

    if pfscore1 = 1 then pfscore1 = 0 /* game over */
    if pfscore1 = 5 then pfscore1 = 1
    if pfscore1 = 21 then pfscore1 = 5

    _sound_duration = 3
    AUDF0 = 30
    goto __inner_loop_end

__butterflies_moved

    if pfscore1 = 0 then goto __inner_loop_end

    _temp = (rand & 3)
    
    /* we don't want to skip releasing if there are no butterflies flying around */
    if _butterfly_count = 0 then _temp = 0
    if _temp <> 0 || _butterfly_source = _pausing_source then goto __butterfly_released

    if !_current_butterflies{1} && _butterfly_count < _max_butterflies then _current_butterflies{0} = 1 : _butterfly_count = _butterfly_count + 1

__butterfly_released

    if _current_butterflies > 0 then _sound_duration = 5 : _inactive_sources_count = 0 else _inactive_sources_count = _inactive_sources_count + 1

    if _butterfly_source = 0 then _bottom_left_butterfly = _current_butterflies
    if _butterfly_source = 1 then _bottom_right_butterfly = _current_butterflies
    if _butterfly_source = 2 then _top_left_butterfly = _current_butterflies
    if _butterfly_source = 3 then _top_right_butterfly = _current_butterflies

    _butterfly_source = _butterfly_source + 1
    if _butterfly_source = 4 then _butterfly_source = 0

    if _inactive_sources_count > 0 && _inactive_sources_count <= 2 then goto __release_butterflies
    
__inner_loop_end

    drawscreen

    if _slowdown = 0 then _slowdown = _slowdown_limit
    _slowdown = _slowdown - 1

    goto main

__score_point
    score = score + 1
    
    if !(_sc3 & $0F) then _slowdown_limit = _slowdown_limit - 1 : if !(_sc3 & $F0) then _slowdown_limit = _slowdown_limit + 5

    if _slowdown_limit < 12 then _slowdown_limit = 12

    _max_butterflies = _sc2 + (_sc3 & $F0)

    for _temp = 0 to 5
    if _max_butterflies >= __max_butterflies_numbers[_temp] then _max_butterflies = __max_butterflies_limits[_temp] : goto __max_butterflies_set
    next

    if _sc3 >= $5 && _sc3 < $10 then _max_butterflies = 2 : goto __max_butterflies_set
    _max_butterflies = 1

__max_butterflies_set

    _butterfly_count = _butterfly_count - 1 
    _after_scored_duration = 20
    _sound_duration = 5
    AUDF0 = 7
    return

    data __max_butterflies_numbers
    1, 5, 9, 11, 14, 17
end

    data __max_butterflies_limits
    3, 4, 5, 7, 9, 12
end

    data __sources_audio_frequencies
    9, 11, 13, 15
end

    data __title_music_notes
    15, 15, 15, 15, 16, 15, 16, 15, 20, 20, 23, 23, 23, 23, 24, 23, 24, 23, 31, 31
end

    data __title_music_lengths
    21, 21, 21, 21, 10, 10, 10, 10, 21, 21, 21, 21, 21, 21, 10, 10, 10, 10, 21, 21
end
