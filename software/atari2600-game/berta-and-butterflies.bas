    set kernel_options pfcolors no_blank_lines
    rem set tv pal
    const font=retroputer

    /* pal colors */
    /* const _blue=$B8
    const _red=$64
    const _white=$0E
    const _yellow=$28
    const _brown=$22
    const _green=$58
    const _gray=$08 */

    /* ntsc colors */
    const _blue=$98
    const _red=$44
    const _white=$0E
    const _yellow=$18
    const _brown=$12
    const _green=$C8
    const _gray=$08

    const pfscore=1
    pfscore1 = 21
    pfscorecolor=_white
    scorecolor=_white

    player0x=60
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

    dim _butterfly_source = i
    dim _inactive_sources_count = j

    dim _current_butterflies = k

    dim _random = l

    dim _sound_duration = m

    dim _after_scored_duration = n

    dim _max_butterflies = o

    dim _sc1 = score
    dim _sc2 = score + 1
    dim _sc3 = score + 2

    _max_butterflies = 1
    _prev_berta_position = 5

    AUDC0 = 12

    COLUBK=_blue
    COLUP0=_white

main
    if _sound_duration = 0 then AUDV0 = 0 : goto __sound_muted

    AUDV0 = 5
    _sound_duration = _sound_duration - 1

__sound_muted

    COLUP1=_brown

    if _after_scored_duration > 0 then _after_scored_duration = _after_scored_duration - 1 : COLUP1 = _red

    NUSIZ0=$07
    NUSIZ1=$05

    /* bottom */
    if _berta_position < 2 then playfield:
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

    /* top */
    if _berta_position > 1 then playfield:
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

    if _prev_berta_position = _berta_position then goto __sprites_set
    
    _prev_berta_position = _berta_position

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
    if _butterfly_source = 0 then _current_butterflies = _bottom_left_butterfly : AUDF0 = 9
    if _butterfly_source = 1 then _current_butterflies = _bottom_right_butterfly : AUDF0 = 11
    if _butterfly_source = 2 then _current_butterflies = _top_left_butterfly : AUDF0 = 13
    if _butterfly_source = 3 then _current_butterflies = _top_right_butterfly : AUDF0 = 15

    if _current_butterflies = 0 then goto __butterflies_moved

    _current_butterflies = _current_butterflies * 2
    if (_current_butterflies & 32) then _current_butterflies{6} = 0 : _butterfly_count = _butterfly_count - 1

__butterflies_moved

    _random = (rand & 3)
    
    /* we don't want to skip releasing if there are no butterflies flying around */
    if _butterfly_count = 0 then _random = 0
    if _random <> 0 || _butterfly_source = 2 then goto __butterfly_released

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

    if _slowdown = 0 then _slowdown = 25
    _slowdown = _slowdown - 1

    goto main

__score_point
    score = score + 1
    
    _max_butterflies = _sc2 + (_sc3 & $F0)

    if _max_butterflies >= 17 then _max_butterflies = 12 : goto __max_butterflies_set
    if _max_butterflies >= 14 then _max_butterflies = 9 : goto __max_butterflies_set
    if _max_butterflies >= 11 then _max_butterflies = 7 : goto __max_butterflies_set
    if _max_butterflies >= 9 then _max_butterflies = 5 : goto __max_butterflies_set
    if _max_butterflies >= 5 then _max_butterflies = 4 : goto __max_butterflies_set
    if _max_butterflies >= 1 then _max_butterflies = 3 : goto __max_butterflies_set
    if _sc3 >= $5 && _sc3 < $10 then _max_butterflies = 2 : goto __max_butterflies_set
    _max_butterflies = 1

__max_butterflies_set

    _butterfly_count = _butterfly_count - 1 
    _after_scored_duration = 20
    _sound_duration = 5
    AUDF0 = 7
    return
