[![en](https://img.shields.io/badge/lang-en-red.svg)](./DIARY.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./DIARY.pl.md)

# 2024-03-01 - Day #001

A friend convinced me to take part in the [100 Commits](https://100commitow.pl/) competition. Since few months I wanted to write something for Atari 2600. I thought that the competition could be good occassion to have some fun and learn something completely new. So I decided to write a game for the Atari as a part of the competition. I have an idea for the game, but I won't reveal it yet.

I started preparations few weeks ago. I install tools and configure the environment. I started reading books:

1. Nick Montfort, Ian Bogost - [Racing the Beam](https://mitpress.mit.edu/9780262539760/racing-the-beam/) - it contains Atari 2600 platform analysis and also analysis of some famous games, from the developer's point of view.
1. Jan Ruszczyc - [Asembler 6502](https://retronics.eu/?a=item&id=20&l=pl) - how to use 6502 assembler. Although Atari 2600 contains 6507 processor, but it is stripped down version of 6502, so the knowledge won't be wasted.

I almost failed on the first day. Contest's rules says at least one commit by the repo author is needed. I had a wrong email address in my git configuration, so my previous commits were accounted to the different Github users! Fortunately, I noticed it.

# 2024-03-02 - Day #002

I spent night reading Batari Basic documentation and "kernels" descriptions here: [https://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html](https://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html)

It looks like that limitations are everywhere. I started to think how to workaround them, for example, how to make a bigger player sprite.

Few examples of limitations:

1. Atari 2600 has 128 bytes of RAM, but only 26 of them are available. Other are already used for different purposes.
1. You can draw only a few moveable objects: 2 player sprites, 2 missiles (which are always square) and one ball.
1. If you want your sprite to have more than one color, you cannot use missile.
1. There is no simple way to print text (so I can't even start with "hello world!" program).
1. Binary program should be 4KB at most. If you want more, you can use bankswitching, but Atari has access to only one 4KB bank at one moment.

I started working on the cartridge PCB. Why, if I have no single line of the game so far? It's because I want to order the boards as soon as possible. They will arrive within 30 days or so. If I made a mistake, I want to have time to fix it.

However, I did more complicated cartridges before - for example [128-in-1 cartridge clone](https://youtu.be/PjKU597y_PI). I'm pretty convinced that my design of the simple 4KB cart will work too. You can find similiar designs here and there, for example: [https://grandideastudio.com/portfolio/gaming/pixels-past/](https://grandideastudio.com/portfolio/gaming/pixels-past/).

While it's simple, elegant and battle-tested, I want to simplify it even more. Currently I'm using a 74S04 inverter and I'm using only one of its 6 gates. I don't need a integrated circuit to invert one bit and I'm going to replace it with inverter made from transistor and two resistors.

# 2024-03-03 - Day #003

Today I played a little bit with sprite editor and created preliminary version of player sprite. Please, welcome Berta!

![Berta](./static/berta.png)

I'm not sure if I would be able to use it because of the used colors.

I also checked if the inverter made from transistor and two resistor works as it should. Yes, it works!

![Inverter](./static/inverter.jpeg)

# 2024-03-04 - Day #004

OK, so I replaced the inverter IC with transistor based inverter on the board design and I ordered PCBs.

# 2024-03-05 - Day #005

Today I experimented with sprites. And I revealed the idea for the game :)
I displayed some sprites. Because the game is quite static, I don't need to animate the sprites. I want the game to be colorful (such games appeal to me more than these with black background), so I tried to combine sprite with playground to display big Berta:

![Playfield and Sprite combined](./static/pf_sprite_combined.png)

It's far from perfect, but I'm pretty convinced that I'll be able to display what I want.

# 2024-03-06 - Day #006

I deceided to use more traditional way when comes to the game visual design. I'm drawing sprites and playfield by hand, using pencil. Ok, I'm using reMarkable tablet, not a real paper, so let's say it's a semi-traditional way ;)

I already know that I need to combine playfield with sprite, to create a multi-color, big character. The main difficulty is that "playfield pixels" are rectangular, while "sprite pixels" are square and sometimes it is hard to achieve desired effect. Here Berta's neck is too long, but I cannot make it smaller, because I cannot split "playfield pixel":

![Berta drawing](./static/berta_drawing.png)

Now when I see other game for the Atari 2600, I'm automatically thinking how it was done. For example, [Combat](https://youtu.be/3m86ftny1uY) game is a presentation of how to use console's abilities in the most direct way: display two sprites and two missiles, and a playfield. [Breakout](https://youtu.be/tT70Tv6D41o) apparently has one sprite for paddle, the ball and bricks made out of the "playfield pixels".

# 2024-03-07 - Day #007

I carried on with manual designing. I also coded the sprite and the playfield to display Berta in appropriate form for the first time!

![Berta for the first time](./static//berta_displayed_for_the_first_time.png)

# 2024-03-08 - Day #008

Today I take a break :)
I can show you a render of PCB, which is in production already:

![PCB](./static//pcb.png)

Ok, I did some experiments with joystick handling.

# 2024-03-09 - Day #009

I added second sprite - for butterfly net. It's the last sprite I can use :)

I started thinking about joystick control. On the original G&W console only one button press is needed to move the character to the given position (top-left, top-right, bottom-left, bottom right). On Atari you'll need two joystick moves sometimes - for example, to move Berta from bottom left to the top right, you need to move joystick to the right and to the top. A different gamepad, like from Playstation or Xbox would be better. I could use top and bottom arrows and triangle and cross keys. Maybe I'll make a special adapter for this game (or even the special controller).

# 2024-03-10 - Day #010

I changed the butterfly net sprite for more "realistic" :) After the first experiments with joystick now Berta moves with it. I used REFP0 and REFP1 registers, to display mirrored sprites depending on Berta's position - if she is moved left or right. Thanks to that I saved some memory in ROM, because I don't need to keep two variants of each sprite.

| Berta in top-left position| Berta in bottom-down position|
|----------------|---------------|
|![Berta up](./static/berta_up.png)|![Berta down](./static/berta_down.png)|

# 2024-03-11 - Day #011

I made butterfly net sprite twice as wide as it was. I started experiments with sounds, but I have nothing to commit yet...

I also added an experimental version of butterfly "animation". Butterflies are made of "playfield pixels" and their modification is quite expensive when comes to the processor cycles. I will probably run out of cycles when I display four or five butterflies at the same time.

# 2024-03-12 - Day #012

It's time to start thinking about the gameplay algorithm. I want to create a similiar experience to the original, but not identical. For example - I won't make the clock, neither the alarm. I also remember that a rooster appeared sometimes in the original game and you could lose only half of live while it's visible. I don't have a place on the screen for "rooster", so I'm going to give up on it.

The original G&W console used Sharp SM-5A microprocessor, while the russian consoles used its clone - КБ1013ВК1-2. Milan Galcik created a disassembler for this processor and did a reverse-engineer of the "Egg" game algorithm: [Sharp SM-5A Disassembler](https://www.septimus.sk/KB1013dbg/index.html). I really admire his work. Although I don't want to implement 1:1 game equivalent, his description will be helpful.

# 2024-03-13 - Day #013

Today I added a sound to the butterfly "animation", which is quite ok for my ears. I didn't mentioned it yet, but Atari 2600's sound capabilities are also very limited. (However, the real artist can do miracles with it - check this cTrix performance: [https://youtu.be/S8e7g8kJIlo](https://youtu.be/S8e7g8kJIlo)).

I want to immerse in the original game, to know it as much as possible. Unfortunetely, neither of my vintage consoles work, but what are emulators for?

![Consoles](./static//consoles.jpg)

# 2024-03-14 - Day #014

I added all missing butterflies. Butterflies are made of "playground pixels". Their higlighting is expensive when comes to the processor cycles. So far they are animated correctly, but there will be even more butterflies flying - up to 12 at the same time! I quess it will be too much. So I'll probably change the method of higlighting playground pixels to more direct, assembler-like way.

I also added some bushes and clouds :)

![Four butterflies](./static//four_butterflies.png)

# 2024-03-15 - Day #015

I refactored the way Berta's position is stored. It'll be easier that way to handle it and comare with butterflies "sources".

# 2024-03-16 - Day #016

I implemented a draft version of the butterflies releasing algorithm. It works quite ok, however, few variables are hardcoded at the moment:

1. Maximal number of butterflies flying - 3. In the original game this number depends on the current score.
1. Number of a "source" that is paused and doesn't release any new butterflies. In the original game it depends on the number of lives.

# 2024-03-17 - Day #017

Nothing spectacular today - I'm resting :) I adjusted NTSC version colors and made NTSC version default, because the emulator by default treats ROMs as NTSC. Of course, PAL version is still more important for me, because I want to run the game on the real console and I have PAL versions only.

# 2024-03-18 - Day #018

I tried to draw Berta for the future cartridge cover and box. The problem is I cannot draw. This is my best result so far:

![Berta - drawing for cover](./static/berta_cover_drawing.png)

Other drawings are even worse. One of them will work better as a poster for William Wyler's [Collector](https://www.imdb.com/title/tt0059043/) horror movie.

I'll probably ask my wife for a drawing :)

# 2024-03-19 - Day #019

I really wanted to see how the program will work on a real hardware. Although cartridge PCBs didn't arrive yet and you can't really play the game at this point, I sacrificed EPROM chip and used a board in older version, to run Berta!

![Berta on a real hardware](./static/berta_first_time_on_real_hardware.jpeg)

I moved Berta few times using joystick. It was not that bad, but still I'm going to make a special adapter, to make control more convinient. I decided to use Super Nintendo controllers - their replacements are cheap, they have sufficient number of buttons. Use of Playstation 4 controller would be harder, it would also need more powerful (and more expensive) microcontroller. I orderd SNES controller sockets and started designing the adapter board.

# 2024-03-20 - Day #020

I uploaded the controller adapter PCB design. It will use Atmega8/48/88 microprocessor, which is not as cheap as it used to be, but it's more DIY friendly than SMD processors. I need to program it, but it should not be a problem. I did similiar adapters before, for NES controllers, which are similiar and differ only in a number of buttons and plug type.

# 2024-03-21 - Day #021

Today is my wife's birthday and I planned to take a break. However, I did a few tiny amendments in controller adapter PCB:

![Controller adapter](./static/adapter_pcb.png)

# 2024-03-22 - Day #022

Berta can catch a butterfly from now on! Although you cannot lose life yet, but you can score for the first time :)

# 2024-03-23 - Day #023

I uploaded the first "playable" version to the biggest Atari forum - [Atari Age](https://forums.atariage.com/topic/362557-berta-and-butterflies-in-development/?do=findComment&comment=5434927)

I'm looking forward for early feedback!

I also implemented dependency between maximum number of butterflies on current score.

# 2024-03-24 - Day #024

Today I did a small fix in the butterfly releasing altorightm. When there are no butterflies in the air, their releasing doesn't depend on random function. Before that fix there were long breaks without butterflies released.

# 2024-03-25 - Day #025

Cartridge PCBs arrived! Unfortunetely, I didn't have time to solder even the first of them.

![Cartridge PCBs](./static/pcbs.jpeg)

# 2024-03-26 - Day #026

I soldered the first cartridge. Unfortunetely, it doesn't work. The only new thing in its design is a transistor based inverter. 
I asked [x_angel](http://ataripcb.pl/), who is my guru when comes to the electronics, what could be the reason. It looks like the "low" voltage in Atari is too high (0.6V) and it's not inverted to 5V, but to 0V. I need to lower it with a voltage divider.

![First cartridge](./static/first_cartridge.jpeg)

I experimented with resistors values, to no avail. Cartridge still doesn't work. I don't know what to think, but I won't give up :)

# 2024-03-27 - Day #027

Still no success with the inverter. In the worst case I'll use a small 74V1T14 inverter with one gate only and place it somehow on the board. But  first I'll experiment even more with the resistors. I need to check how the voltages in Atari really are using oscilloscope.

# 2024-03-28 - Day #028

I need to take a break from the inverter. I started working on the program for the SNES pad adapter instead.
