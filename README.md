# Berta And Butterflies

[![en](https://img.shields.io/badge/lang-en-red.svg)](./README.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./README.pl.md)

![Title screen](./static/title_international.png)

**Berta And Butterflies** is a game for Atari 2600 console.

It's a remake of the LCD game from the original ["Game & Watch"](https://nintendo.fandom.com/wiki/Egg) series from the '80. In Poland original Nintendo games were virtually unknown, but soviet clones made by [Elektronika](https://en.wikipedia.org/wiki/Elektronika) were very popular:

![Elektronika game](./static/elektronika_working.jpg)

I wanted to write a game for Atari 2600. I know this console is extremely limited. On the other hand, this game is very simple, but still very enjoyable and fun. It looked like a good candidate to port it to Atari.

I replaced the character with my wife's Alice favorite stuffed toy from childhood - a small elephant called Berta.

| Original Berta | Digital Berta |
|----------------|---------------|
|![Original Berta](./static/berta_orig.jpg)|![Digital Berta](./static/logo.png)|

As for 2024-Jun-06 the game is completed and I won't add any new features to it. Even if I wanted to, I have no spare place in the ROM - I can't even add one note more to the title music :)

Besides the game, there are also three sub-projects within this repository:

1. A printed circut board design to create the simplest cartridge for any 4KB Atari 2600 game (**Berta And Butterflies** is also 4KB game) - [more details](./hardware/atari2600-simplest-cart/README.md).
1. Super Nintendo controller adapter, to control Berta in a different way than with a standard joystick - [more details](./hardware/snes-to-db9-controller-adapter/README.md).
1. Real Time Clock circuit design for Atari 2600, attachable to the second player's joystick port (it is at experimental stage).

## How to play?

I recommend to play this game on a real console. It will work with any version, whether it is "Woody" from 1977, "Junior" from 80' or the most recent 2600+ from 2023.

![Game on a real console](./static/cart_on_real_machine.jpeg)

If you have basic soldering skills, you can etch cartridge PCBs and make a real cartridge. There will be also a limited run of physical cartridges released at some point in the near future. If you have a "universal" cartridge like Harmony or UnoCart, you can put the ROM there and load the game from it (however, these "universal" carts don't work with 2600+, as far as I know).

If you don't have Atari console, you can use emulator. There is plenty of Atari 2600 emulators to choose from:

1. [Javatari](https://javatari.org/) - an emulator that works in browser.
2. [Stella](https://stella-emu.github.io/) - probably the most well-known Atari 2600 emulator. There are versions for Windows, MacOS and Linux.
3. [Gopher2600](https://github.com/JetSetIlly/Gopher2600) - an emulator written in Go.

Just download the most recent ROM from [releases](https://github.com/vandalton/BertaAndButterflies/releases) page and load it in the emulator.

You can also use a device like Anbernic handheld with built-in Atari 2600 emulator (it uses Stella emulator internally):

![Anbernic handheld](./static/anbernic.jpg)

## History

I started this project to take part in [100 Commits](https://100commitow.pl/) competition.

Recently I was fascinated by Atari 2600 console and I wanted to write a program for it, which is allegedly very hard. This machine has only 128 bytes of RAM (it's not a mistake!) and has no graphics memory at all. There is even no such term as 'pixel'.

I want to check how hard it really is. I have no prior experience with 6502/6507 assembler, [batari Basic](https://github.com/batari-Basic/batari-Basic) etc. The competition motivates me to learn it :)

More details in [diary](./DIARY.md).
