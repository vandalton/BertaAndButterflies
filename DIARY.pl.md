[![en](https://img.shields.io/badge/lang-en-red.svg)](./DIARY.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./DIARY.pl.md)

# 2024-03-01 - Dzień #001

Kolega z pracy namówił mnie na udział w konkursie [100 Commitów](https://100commitow.pl/). Od kilku miesięcy chodzi za mną pomysł zaprogramowania czegoś na Atari 2600. Pomyślałem, że konkurs to dobra okazja do zabawy i spróbowania czegoś zupełnie nowego. Postanowiłem napisać grę na Atari w ramach konkursu. Mam już pomysł, ale jeszcze go nie zdradzę.

Przygotowania rozpocząłem kilka tygodni temu. Poznaję narzędzia, instaluję środowisko pracy. Zacząłem także czytać książki:

1. Nick Montfort, Ian Bogost - [Racing the Beam](https://mitpress.mit.edu/9780262539760/racing-the-beam/) - zawiera analizę platformy Atari 2600 oraz kodu kilku słynnych gier z punktu widzenia programistycznego.
2. Jan Ruszczyc - [Asembler 6502](https://retronics.eu/?a=item&id=20&l=pl) - opis assemblera procesora 6502. Atari 2600 zawiera co prawda procesor 6507, ale jest to okrojona wersja 6502, więc zdobyta wiedza nie zmarnuje się.

Prawie zlamiłem pierwszego dnia! Zasady konkursu wymagają co najmniej jednego commita dziennie od autora repozytorium. W konfiguracji gita miałem podany błędny adres e-mail i moje wcześniejsze commity zaliczyły się na konto innego użytkownika Githuba! Na szczęście zauważyłem to w porę.

# 2024-03-02 - Dzień #002

Spędziłem noc czytając dokumentację języka Batari Basic, opisy "kerneli" stąd: [https://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html](https://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html)

Wygląda na to, że ograniczenia są dosłownie na każdym kroku. Zastanawiam się, jak je obejść, aby np. zrobić "dużego ludzika" w grze.

Kilka przykładów ograniczeń:

1. Atari 2600 ma 128 bajtów RAMu, ale tylko 26 jest dostępnych. Pozostałe są domyślnie użyte dla różnych celów.
2. Możesz narysować pięć poruszających się obiektów: 2 sprite'y graczy, 2 pociski (muszą być kwadratowe) i jedną piłkę.
3. Jeśli sprite ma używać więcej niż jednego koloru, nie użyjesz pocisku.
4. Nie ma prostej metody wyświetlenia tekstu (nie zacznę standardowym programem "hello world!").
5. Wersja binarna programu powinna mieć maksymalnie 4KB. Jeśli potrzeba więcej, można wykorzystać technikę przełączania banków pamięci, ale Atari w danym momencie ma dostęp tylko do jednego, 4-kilobajtowego banku.

Zacząłem pracować nad płytką kartridża. Dlaczego, skoro jeszcze nie mam ani jednej linijki gry? Chcę zamówić płytki jak najszybciej. Mogą dotrzeć nawet po 30 dniach. Jeśli popełniłem błąd, chciałbym mieć czas na jego poprawę.

Jednak wcześniej robiłem bardziej skomplikowane kartridże - na przykład [128-in-1 cartridge clone](https://youtu.be/PjKU597y_PI). Jestem przekonany, że mój projekt prostego kartridża 4KB także zadziała. Możecie znaleźć podobne projekty tu i ówdzie, na przykład: [https://grandideastudio.com/portfolio/gaming/pixels-past/](https://grandideastudio.com/portfolio/gaming/pixels-past/).

Projekt jest prosty, elegancki i sprawdzony w boju, ale chcę go jeszcze uprościć. Obecnie używam inwertera 74S04 i to tylko jednej z jego sześciu bramek. Nie potrzebuję układu scalonego, aby odwrócić jeden bit. Zamierzam użyć inwertera z tranzystora i dwóch rezystorów.

# 2024-03-03 - Dzień #003

Dziś pobawiłem się trochę edytorami sprite'ów i stworzyłem - na razie wstępną - wersję sprite'a postaci. Przywitajcie Bertę!

![Berta](./static/berta.png)

Nie jestem pewien, czy będę mógł go użyć w takiej formie ze względu na użyte kolory.

Sprawdziłem też, czy inwerter z tranzystora i dwóch rezystorów zadziała zgodnie z planem. Zadziałał!

![Inverter](./static/inverter.jpeg)

# 2024-03-04 - Dzień #004

Dobra, wymieniłem układ scalony inwertera na inwerter bazujący na tranzystorze i zamówiłem płytki drukowane.

# 2024-03-05 - Dzień #005

Dziś eksperymentowałem ze sprite'ami. I wyjawiłem pomysł na grę :)
Wyświetliłem kilka sprite'ów. Gra jest dość statyczna, więc nie muszę ich animować. Chciałbym, aby gra była bardzo kolorowa (takie gry przemawiają do mnie bardziej, niż te z czarnym tłem), więc spróbowałem połączyć sprite'a z "polem gry", aby wyświetlić dużą Bertę:

![Playfield and Sprite combined](./static/pf_sprite_combined.png)

Efekt jest jeszcze daleki od ideału, ale jestem właściwie przekonany, że zdołam wyświetlić to, co chcę.

# 2024-03-06 - Dzień #006

Postanowiłem, że wykorzystam bardziej tradycyjne metody projektowania. Rysuję sprite'y i "pole gry" ręcznie, ołówkiem. No dobra, używam tabletu reMarkable, a nie prawdziwego papieru. Powiedzmy, że wykorzystuję pół-tradycyjne metody ;)

Wiem już, że muszę połączyć "pole gry" ze spritem, aby wyświetlić wielokolorową, dużą postać. Główna trudność polega na tym, że "piksele" pola gry są prostokątne, a "piksele" sprite'a są kwadratowe i czasami jest trudno osiągnąć pożądany efekt. Tutaj szyja Berty jest zbyt długa, ale nie mogę jej skrócić, bo nie mogę podzielić "piksela" pola gry:

![Berta drawing](./static/berta_drawing.png)

Gdy widzę inną grę na Atari 2600, automatycznie myślę o tym, jak była zrobiona. Przykładowo, [Combat](https://youtu.be/3m86ftny1uY) to przykład bezpośredniego wykorzystania możliwości konsoli: wyświetlenia dwóch sprite'ów i dwóch pocisków na polu gry.  [Breakout](https://youtu.be/tT70Tv6D41o) najwyraźniej wykorzystuje sprite'a na paletkę, do tego piłkę i klocki z "pikseli" pola gry.

# 2024-03-07 - Dzień #007

Kontynuowałem ręczne projektowanie. Zakodowałem też sprite i "pole gry", aby po raz pierwszy wyświetlić Bertę we właściwej postaci!

![Berta for the first time](./static//berta_displayed_for_the_first_time.png)
