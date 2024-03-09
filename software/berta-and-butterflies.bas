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
main
    playfield:
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

    COLUBK=_blue
    COLUP0=_white
    COLUP1=_brown

    NUSIZ0=$07
    rem NUSIZ1=$07

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
    %00000000
    %00000000
    %00000000
    %00000000
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
    %00010000
    %00010000
    %00010000
    %00010000
end

    player1:
    %00000010
    %00000010
    %00000010
    %00000010
    %00000010
    %11111110
    %10101010
    %11111110
    %10101010
    %11111110
    %10101010
    %11111110
end

    player0x=60
    player0y=80

    player1x=90
    player1y=52

    if joy0right then a{0}=1
    if joy0left then a{0}=0
    if joy0up then a{1}=1
    if joy0down then a{1}=0

    if a{0} && a{1} then pfpixel 26 3 on
    if a{0} && !a{1} then pfpixel 26 6 on
    if !a{0} && a{1} then pfpixel 4 3 on
    if !a{0} && !a{1} then pfpixel 4 6 on

    rem score=score+1

    drawscreen
    goto main
