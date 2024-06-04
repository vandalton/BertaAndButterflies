[![en](https://img.shields.io/badge/lang-en-red.svg)](./README.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./README.pl.md)

![Cartridge board](../../static/cart_top_bottom.png)

# 4KB cartridge for Atari 2600

In this folder you can find a design of a cartridge for Atari 2600. It can store 4 kilobytes of data and was designed for "Berta and Butterflies" game, which is a 4KB game, but any game of this size will work.

Project files can be opened using Eagle. Gerber files, for ordering printed circut boards, are available here: [gerbers](https://github.com/vandalton/BertaAndButterflies/releases).

## The Idea

There is a lot of designs of cartridge PCBs for Atari 2600. Probably the most popular are these: [https://grandideastudio.com/portfolio/gaming/pixels-past/](https://grandideastudio.com/portfolio/gaming/pixels-past/). They are very good, reliable and battle tested. They need 74LS04 integrated circuit to work. It's an inverter. This particular IC has 6 gates and only one of these gates is used.

In my project I replaced IC with a inverter made of NPN transistor, two resistors and one capacitor. Total cost of these elements is half the price of 74LS04 IC. If you make one cartridge for your own needs, it doesn't make a difference, but if you make 50 of them, the difference is significant...

## Parts list

- **IC2** - 2732 EPROM
- **T1** - BC337 - NPN transistor (I also tested BC548B - it works)
- **R1** - 3,3 kOhm
- **R2** - 1 kOhm
- **C1** - 100nF
- **C2** - 1nF

## Support the project

This design is open-source and you can download gerber files and order profesionally made PCBs from any manufacturer. However, you can order them from PCBWay: [https://www.pcbway.com/project/shareproject/4KB_cartridge_for_Atari_2600_4b0ce5e2.html](https://www.pcbway.com/project/shareproject/4KB_cartridge_for_Atari_2600_4b0ce5e2.html) - in this case I'll receive a few pennies, which will support this project or my other projects. Thanks!
