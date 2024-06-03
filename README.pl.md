# Berta i motyle

[![en](https://img.shields.io/badge/lang-en-red.svg)](./README.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./README.pl.md)

![Ekran tytułowy](./static/title_polish.png)

**Berta i motyle** to gra na konsolę Atari 2600.

Pomysł polega na przeniesieniu gry z konsoli LCD z oryginalnej serii ["Game & Watch"](https://nintendo.fandom.com/wiki/Egg) z lat 80'. W Polsce oryginalne konsole Nintendo były właściwie nieznane, ale bardzo popularne były sowieckie klony produkcji firmy [Elektronika](https://en.wikipedia.org/wiki/Elektronika):

![Elektronika game](./static/elektronika_working.jpg)

Chciałem stworzyć grę na Atari 2600. Wiem, że ta konsola ma wybitnie ograniczone możliwości. Z kolei ta gra jest bardzo prosta, ale mimo to jest wciągająca i daje dużo frajdy. Wydała mi się dobrym kandydatem na przeportowanie na Atari.

Postać w grze zamieniłem na ulubioną maskotkę z dzieciństwa mojej żony, Alicji - małą słonicę o imieniu Berta.

| Prawdziwa Berta | Cyfrowa Berta |
|----------------|---------------|
|![Oryginalna Berta](./static/berta_orig.jpg)|![Cyfrowa Berta](./static/logo.png)|

Oprócz gry, w repozytorium znajdują się dwa podprojekty:

1. Projekt płytki drukowanej umożliwiającej stworzenie najprostszego kartridża z grą 4KB dla Atari 2600 (**Berta i motyle** zajmuje właśnie 4KB) - [szczegóły](./hardware/atari2600-simplest-cart/README.pl.md).
2. Adapter padów od Super Nintendo, aby sterować Bertą w inny sposób, niż przy użyciu standardowego joysticka.

Co prawda gra jest w trakcie rozwoju, ale jest już grywalna.

## Jak grać?

Polecam grać w grę na prawdziwej konsoli. Zadziała pod dowolną wersją, obojętnie, czy to "Woody" z 1977, "Junior" z lat 80', czy najnowsza wersja 2600+ z 2023.

![Gra na prawdziwej konsoli](./static/cart_on_real_machine.jpeg)

Jeśli posiadasz podstawowe umiejętności lutowania, możesz zamówić płytkę drukowaną i zrobić prawdziwy kartridż. W niedalekiej przyszłości planuję też wydać limitowaną serię kartridży z grą. Jeśli posiadasz "uniwersalny" kartridż typu Harmony albo UnoCart, możesz skopiować ROM na niego i załadować grę (chociaż z tego co wiem, te "uniwersalne" kartridże nie działają z wersją 2600+ konsoli).

Jeśli nie posiadasz konsoli Atari, możesz użyć emulatora. Jest ich wiele do wyboru:

1. [Javatari](https://javatari.org/) - emulator działający w przeglądarce.
2. [Stella](https://stella-emu.github.io/) - prawdopodobnie najbardziej znany emulator Atari 2600. Istnieją jego wersje pod Windowsa, MacOSa i Linuksa.
3. [Gopher2600](https://github.com/JetSetIlly/Gopher2600) - emulator napisany w Go.

Wystarczy, że ściągniesz najświeższą wersję ROMu ze strony [releases](https://github.com/vandalton/BertaAndButterflies/releases) i załadujesz go w emulatorze.

Możesz także użyć urządzenia typu konsolka Anbernic z wbudowanym emulatorem Atari 2600 (wewnętrznie używa emulatora Stella):

![Anbernic handheld](./static/anbernic.jpg)

## Historia

Rozpocząłem ten projekt, aby wziąć udział w konkursie [100 Commitów](https://100commitow.pl/).

Niedawno zafascynowałem się konsolą Atari 2600 i chciałem coś na nią zaprogramować, co jest rzekomo bardzo trudne. Maszyna ta posiada 128 bajtów RAMu (to nie pomyłka!) i nie posiada wcale pamięci graficznej. Nie istnieje nawet taki termin jak 'piksel'.

Chcę się przekonać, jak trudne to faktycznie jest. Nie mam wcześniejszego doświadczenia z assemblerem 6502/6507, Batari Basicem itp. Konkurs motywuje mnie, aby się ich nauczyć :)

Więcej w [dzienniku](./DIARY.pl.md).

