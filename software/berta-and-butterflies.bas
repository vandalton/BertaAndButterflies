    set kernel_options pfcolors no_blank_lines
    rem set tv pal
    const font=retroputer

    /* pal colors */
    const _blue=$B8
    const _red=$64
    const _white=$1E
    const _yellow=$28
    const _brown=$22

    /* ntsc colors */
    /* const _blue=$98
    const _red=$34
    const _white=$0E
    const _yellow=$18
    const _brown=$12 */

    const pfscore=1
    pfscore1 = 21
    pfscorecolor=_white
    scorecolor=_white

    player0x=60
    player0y=80

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

    dim _berta_position = a /* {0} left right, {1} bottom top */
    dim _top_left_bf = b
    dim _top_right_bf = c
    dim _bottom_left_bf = d
    dim _bottom_right_bf = e

    dim _frame = f

    _top_left_bf = 1
main

    COLUBK=_blue
    COLUP0=_white
    COLUP1=_brown

    NUSIZ0=$07
    NUSIZ1=$05

    /* top */
    if _berta_position{1} then playfield:
    ................................
    ................................
    ...........XX....XX.............
    ..........XX......XX............
    ................................
    ..............XX................
    .............XXXX...............
    ............XXXXXX..............
    .............XXXX...............
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
    /* bottom */
    if !_berta_position{1} then playfield:
    ................................
    ................................
    ................................
    ...........XX....XX.............
    ..........XX......XX............
    ................................
    .............XXXX...............
    ............XXXXXX..............
    .............XXXX...............
    ................................
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

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
    _brown
    _yellow
end

    /* top */
    if _berta_position{1} then player0:
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

    /* bottom */
    if !_berta_position{1} then player0:
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

    REFP0=0
    REFP1=0
    player1x=92

    if _berta_position{0} then goto __leftrightset

    REFP0=8
    REFP1=8
    player1x=44

__leftrightset

    player1y=46

    if _berta_position{1} then goto __topdownset

    player1y=60

__topdownset

    if joy0right then _berta_position{0}=1
    if joy0left then _berta_position{0}=0
    if joy0up then _berta_position{1}=1
    if joy0down then _berta_position{1}=0

    if _top_left_bf{0} then pfpixel 1 2 on
    if _top_left_bf{1} then pfpixel 2 3 on : pfpixel 3 2 on 
    if _top_left_bf{2} then pfpixel 4 3 on
    if _top_left_bf{3} then pfpixel 5 4 on : pfpixel 6 3 on
    if _top_left_bf{4} then pfpixel 8 4 on

    rem score=score+1

    drawscreen

    _frame = _frame + 1
    if _frame = 25 then _top_left_bf = _top_left_bf * 2
    if _frame > 50 then _frame = 0

    if _top_left_bf = 32 then _top_left_bf = 1

    goto main
