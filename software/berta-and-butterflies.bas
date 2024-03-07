    set kernel_options pfcolors no_blank_lines

    rem pal
    const _blue=$B8
    const _red=$64
    const _white=$1E

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
end

main
    COLUBK=_blue
    COLUP0=_white

    NUSIZ0=$07

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
    _red
end

    player0x=60
    player0y=80

    pfpixel 27 5 on
    pfpixel 28 6 on

    drawscreen
    goto main
