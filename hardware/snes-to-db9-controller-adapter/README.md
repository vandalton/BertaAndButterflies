# SNES controller adapter for Atari 2600

[![en](https://img.shields.io/badge/lang-en-red.svg)](./README.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./README.pl.md)

![Adapter board](../../static/adapter_top.png)

In this folder you can find a design of an adapter that allows to connect SNES compatible controller to Atari 2600.

Project files can be opened using Eagle. Gerber files, for ordering printed circut boards, are available here: [gerbers](https://github.com/vandalton/BertaAndButterflies/releases).

## The Idea

I designed this adapter primarily for my game - **Berta and Butterflies**. I wanted to make controlling experience more similiar to the "Game & Watch" consoles and be able to move the character to any corner using only one button:

![SNES controlling](../../static/snes_controlling.jpg)

However, the adapter has also a different mode. You can switch the mode by pressing Start+Select at the same time. In this mode it will work as a normal adapter. It means that the arrow keys will work as joystick directions and "Y" button as fire.

## Microprocessor

You need a programmed microprocessor for this project. You can use Atmega8, Atmega48 or Atmega88. Sources for microprocessor's program are available here: [snes-to-db9-controller-adapter](../../software/snes-to-db9-controller-adapter/), while the precompiled binaries are here: [releases](https://github.com/vandalton/BertaAndButterflies/releases).

You don't need to set any fuse bits - the default ones are ok (1MHz clock).

## Parts list

- **IC1** - Atmega8, Atmega48 or Atmega88 microprocessor
- **R1** - 10kOhm
- **C1** - 100nF
- **X1** - female DB9 connector
- **U1** - SNES controller socket

<!-- ## Support the project

This design is open-source and you can download gerber files and order profesionally made PCBs from any manufacturer. However, you can order them from PCBWay: [https://www.pcbway.com/project/shareproject/4KB_cartridge_for_Atari_2600_4b0ce5e2.html](https://www.pcbway.com/project/shareproject/4KB_cartridge_for_Atari_2600_4b0ce5e2.html) - in this case I'll receive a few pennies, which will support this project or my other projects. Thanks! -->
