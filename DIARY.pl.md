[![en](https://img.shields.io/badge/lang-en-red.svg)](./DIARY.md)
[![pl](https://img.shields.io/badge/lang-pl-green.svg)](./DIARY.pl.md)

# 2024-03-01 - Dzień #001

Kolega z pracy namówił mnie na udział w konkursie [100 Commitów](https://100commitow.pl/). Od kilku miesięcy chodzi za mną pomysł zaprogramowania czegoś na Atari 2600. Pomyślałem, że konkurs to dobra okazja do zabawy i spróbowania czegoś zupełnie nowego. Postanowiłem napisać grę na Atari w ramach konkursu. Mam już pomysł, ale jeszcze go nie zdradzę.

Przygotowania rozpocząłem kilka tygodni temu. Poznaję narzędzia, instaluję środowisko pracy. Zacząłem także czytać książki:

1. Nick Montfort, Ian Bogost - [Racing the Beam](https://mitpress.mit.edu/9780262539760/racing-the-beam/) - zawiera analizę platformy Atari 2600 oraz kodu kilku słynnych gier z punktu widzenia programistycznego.
1. Jan Ruszczyc - [Asembler 6502](https://retronics.eu/?a=item&id=20&l=pl) - opis assemblera procesora 6502. Atari 2600 zawiera co prawda procesor 6507, ale jest to okrojona wersja 6502, więc zdobyta wiedza nie zmarnuje się.

Prawie zlamiłem pierwszego dnia! Zasady konkursu wymagają co najmniej jednego commita dziennie od autora repozytorium. W konfiguracji gita miałem podany błędny adres e-mail i moje wcześniejsze commity zaliczyły się na konto innego użytkownika Githuba! Na szczęście zauważyłem to w porę.

# 2024-03-02 - Dzień #002

Spędziłem noc czytając dokumentację języka Batari Basic, opisy "kerneli" stąd: [https://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html](https://www.randomterrain.com/atari-2600-memories-batari-basic-commands.html)

Wygląda na to, że ograniczenia są dosłownie na każdym kroku. Zastanawiam się, jak je obejść, aby np. zrobić "dużego ludzika" w grze.

Kilka przykładów ograniczeń:

1. Atari 2600 ma 128 bajtów RAMu, ale tylko 26 jest dostępnych. Pozostałe są domyślnie użyte dla różnych celów.
1. Możesz narysować pięć poruszających się obiektów: 2 sprite'y graczy, 2 pociski (muszą być kwadratowe) i jedną piłkę.
1. Jeśli sprite ma używać więcej niż jednego koloru, nie użyjesz pocisku.
1. Nie ma prostej metody wyświetlenia tekstu (nie zacznę standardowym programem "hello world!").
1. Wersja binarna programu powinna mieć maksymalnie 4KB. Jeśli potrzeba więcej, można wykorzystać technikę przełączania banków pamięci, ale Atari w danym momencie ma dostęp tylko do jednego, 4-kilobajtowego banku.

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

Gdy widzę inną grę na Atari 2600, automatycznie myślę o tym, jak była zrobiona. Przykładowo, [Combat](https://youtu.be/3m86ftny1uY) to prezentacja bezpośredniego wykorzystania możliwości konsoli: wyświetlenia dwóch sprite'ów i dwóch pocisków na polu gry.  [Breakout](https://youtu.be/tT70Tv6D41o) najwyraźniej wykorzystuje sprite'a na paletkę, do tego piłkę i klocki z "pikseli" pola gry.

# 2024-03-07 - Dzień #007

Kontynuowałem ręczne projektowanie. Zakodowałem też sprite i "pole gry", aby po raz pierwszy wyświetlić Bertę we właściwej postaci!

![Berta for the first time](./static//berta_displayed_for_the_first_time.png)

# 2024-03-08 - Dzień #008

Dziś przerwa :)
Mogę wrzucić widok płytki PCB, która się aktualnie produkuje:

![PCB](./static//pcb.png)

No dobra, poeksperymentowałem troszkę z obsługą joysticka.

# 2024-03-09 - Dzień #009

Dodałem drugi sprite - na siatkę na motyle. To ostatni sprite jaki mogę użyć :)

Zacząłem myśleć o sterowaniu joystickiem. Na oryginalnej grze G&W potrzeba tylko jednego wciśnięcia przycisku, aby poruszyć postać w zadanym kierunku (góra-lewo, góra-prawo, dół-lewo, dół-prawo). Na Atari czasami będą potrzebne dwa ruchy joysticka. Na przykład, aby poruszyć Bertę z kierunku dół-lewo do góra-prawo, potrzeba poruszyć joystick w prawo i w górę. Inny kontroler, na przykład z Playstation czy Xboxa, byłby lepszy. Mógłbym wykorzystać strzałkę w górę, strzałkę w dół, trójkąt oraz krzyżyk. Być może zrobię specjalny adapter dla tej gry (albo nawet specjalny kontroler).

# 2024-03-10 - Dzień #010

Zmieniłem sprite z siatką na motyle na bardziej "realistyczny" :) Po pierwszych eksperymentach z obsługą joysticka teraz sprawiłem, że to Berta nieco się porusza. Wykorzystałem też rejestry REFP0 i REFP1, aby uzyskać lustrzane odbicie sprite'ów w zależności od tego, czy Berta jest obrócona w lewo, czy w prawo. Dzięki temu nie muszę zużywać pamięci ROMu na przechowywanie dwóch wariantów sprite'ów.

| Berta w pozycji góra-lewo| Berta w pozycji dół-prawo |
|----------------|---------------|
|![Berta up](./static/berta_up.png)|![Berta down](./static/berta_down.png)|

# 2024-03-11 - Dzień #011

Poszerzyłem sprite siatki - jest dwa razy szerszy niż był. Zacząłem eksperymenty z dźwiękiem, ale jeszcze nie mam nic do commitnięcia...

Dodałem także eksperymentalną wersję "animacji" motylka. Motyle są zrobione z "pikseli pola gry", a ich modyfikacja jest kosztowna jeśli chodzi o cykle procesora. Prawdopodobnie nie wystarczy mi cykli, gdy będę chciał wyświetlić 4 czy 5 motyli jednocześnie.

# 2024-03-12 - Dzień #012

Nadszedł czas, aby zacząć myśleć o algorytmie rozgrywki. Chcę, aby doświadczenie gry było podobne jak w oryginale, ale nie identyczne. Przykładowo - nie zrobię zegarka ani budzika. Pamiętam też, że w oryginalnej grze czasami pojawiał się kogut i traciło się tylko połowę życia, gdy był widoczny. Nie mam miejsca na ekranie na "koguta", dlatego jego też odpuszczę.

Oryginalna konsola G&W używała mikroprocesora Sharp SM-5A, a rosyjskie konsole wykorzystywały jego klon - КБ1013ВК1-2. Milan Galcik stworzył disassembler tego procesora i wykonał inżynierię wsteczną gry w jajeczka:  [Sharp SM-5A Disassembler](https://www.septimus.sk/KB1013dbg/index.html). Jestem pełen podziwu dla jego pracy. Co prawda nie chcę stworzyć odpowiednika 1:1 gry, ale jego materiały na pewno będą pomocne.

# 2024-03-13 - Dzień #013

Dziś dodałem dźwięk do "animacji" motyla i brzmi on całkiem dobrze jak na moje uszy. Nie wspomniałem o tym wcześniej, ale możliwości dźwiękowe Atari 2600 są także bardzo ograniczone. (Jednak prawdziwy artysta może z nim zdziałać cuda - zobaczcie ten występ cTrixa: [https://youtu.be/S8e7g8kJIlo](https://youtu.be/S8e7g8kJIlo)).

Chcę zanurzyć się w oryginalnej grze, aby poznać ją najlepiej, jak to możliwe. Niestety, żadna z moich zabytkowych konsolek nie działa, ale od czego są emulatory?

![Consoles](./static/consoles.jpg)

# 2024-03-14 - Dzień #014

Dodałem brakujące motyle. Są one zrobione z "pikseli pola gry". Ich wyświetlanie jest kosztowne jeśli chodzi o cykle procesora. Na razie animują się poprawnie, ale będzie ich jeszcze więcej - nawet 12 w jednym momencie! Obstawiam, że to będzie za dużo. Prawdopodobnie kiedyś zmienię metodę "zapalania" "pikseli pola gry" na bardziej bezpośrednią, assemblero-podobną.

Dodałem też krzaki i chmurki :)

![Cztery motyle](./static//four_butterflies.png)

# 2024-03-15 - Dzień #015

Zmieniłem sposób, w jaki przechowywana jest pozycja Berty. Tak będzie ją łatwiej obsłużyć i porównywać pozycję ze "źródłami" motylków.

# 2024-03-16 - Dzień #016

Zaimplementowałem roboczą wersję algorytmu wypuszczania motylków. Działa całkiem dobrze, jednak kilka zmiennych jest w tej chwili zabitych na sztywno:

1. Maksymalna liczba motylków latających w jednym momencie - 3. W oryginalnej grze liczba ta zależy od aktualnego wyniku. 
1. Numer "źródła", które pauzuje i nie wypuszcza motylków. W oryginalnej grze zależy to od liczby żyć gracza.

# 2024-03-17 - Dzień #017

Dziś nic spektakularnego - odpoczywam :) Dostosowałem kolory wersji NTSC i ustawiłem ją jako domyślną, gdyż emulator domyślnie traktuje ROMy jako wersje NTSC. Oczywiście wersja PAL pozostaje dla mnie ważniejsza, bo chcę ją uruchomić na prawdziwej konsoli, a tę mam w wersji PAL.

# 2024-03-18 - Dzień #018

Próbowałem narysować Bertę na potrzeby przyszłej okładki kartridża i pudełka. Problem w tym, że nie umiem rysować. Na razie to mój najlepszy rezultat:

![Berta - drawing for cover](./static/berta_cover_drawing.png)

Inne rysunki są jeszcze gorsze. Jeden z nich pasowałby jako plakat do horroru Williama Wylera - [Kolekcjoner](https://www.imdb.com/title/tt0059043/).

Prawdopodobnie poprosze żonę o rysunek :)

# 2024-03-19 - Dzień #019

Bardzo chciałem zobaczyć, jak program zadziała na prawdziwym sprzęcie. Co prawda zamówione płytki jeszcze nie dotarły i jeszcze nie da się grać, ale mimo to poświęciłem kość EPROM i użyłem jednej z wcześniejszych płytek prototypowych, aby uruchomić Bertę!

![Berta na prawdziwym sprzęcie](./static/berta_first_time_on_real_hardware.jpeg)

Poruszałem trochę Bertą używając joysticka. Nie było aż tak źle, ale i tak zacząłem przymierzać się do skonstruowania adaptera pada, aby sterowanie było wygodniejsze. Zdecydowałem się na pady od Super Nintendo - ich zamienniki są tanie, mają odpowiednią liczbę przycisków do obsługi gry. Z padem od Playstation 4 byłoby więcej roboty, wymagałoby też użycia potężniejszego (droższego) mikrokontrolera. Zamówiłem gniazda pada od SNESa i zacząłem projektować płytkę adaptera.

# 2024-03-20 - Dzień #020

Wrzuciłem projekt płytki drukowanej adaptera kontrolera. Będzie wykorzystywał mikroprocesor Atmega8/48/88, który nie jest tak tani, jak kiedyś był, ale jest bardziej przyjazny hobbistom niż procesory w wersji SMD. Muszę go jeszcze zaprogramować, ale to nie powinno być problemem. Robiłem wcześniej podobne adaptery dla padów od NESa, które są podobne i różnią się tylko liczbą przycisków i wtyczką.

# 2024-03-21 - Dzień #021

Dziś urodziny żony i miałem zrobić sobie przerwę, ale dokonałem kilku drobnych poprawek w projekcie płytki adaptera pada:

![Controller adapter](./static/adapter_pcb.png)

# 2024-03-22 - Dzień #022

Berta od teraz może złapać motylka! Co prawda nie można jeszcze stracić życia, ale po raz pierwszy można zdobyć punkt :)

# 2024-03-23 - Dzień #023

Wrzuciłem pierwszą "grywalną" wersję na największe forum o Atari - [Atari Age](https://forums.atariage.com/topic/362557-berta-and-butterflies-in-development/?do=findComment&comment=5434927)

Liczę na jak najwcześniejsze opinie!

Zaimplementowałem też zależność maksymalnej liczby jednocześnie wypuszczonych motylków od aktualnego wyniku.

# 2024-03-24 - Dzień #024

Dziś wprowadziłem drobną poprawkę w algorytmie uwalniania motylków. Gdy nie ma żadnych motyli w powietrzu, wypuszczanie nie jest zależne od wyniku losowania. Wcześniej zdarzały się przerwy, kiedy nie wylatywały żadne motyle.

# 2024-03-25 - Dzień #025

Dotarły płytki kartridży! Niestety, nie znalazłem chwili, aby polutować pierwszy egzemplarz na próbę.

![Płytki kartridży](./static/pcbs.jpeg)

# 2024-03-26 - Dzień #026

Polutowałem pierwszy kartridż. Niestety, nie działa. Jedyna nowość w jego projekcie to inwerter oparty o tranzystor.
Spytałem [x_angela](http://ataripcb.pl/), który jest moim elektronicznym guru, jaki może być powód. Wygląda na to, że stan "niski" w Atari jest za wysoki (0.6V) i nie jest odwracany na 5V, a na 0V. Muszę go obniżyć przy użyciu dzielnika napięcia.

![Pierwszy kartridż](./static/first_cartridge.jpeg)

Poeksperymentowałem z wartościami rezystorów, ale bez efektu. Kartridż wciąż nie działa. Na ten moment sam nie wiem, co o tym myśleć, ale się nie poddam :)
 
# 2024-03-27 - Dzień #027

Wciąż bez sukcesu z inwerterem. W najgorszym razie użyję małego inwertera 74V1T14 z jedną bramką i umieszczę go jakoś na płytce. Ale najpierw poeksperymentuję dalej z rezystorami. Muszę sprawdzić, jakie są dokładne poziomy napięć w Atari przy użyciu oscyloskopu.

# 2024-03-28 - Dzień #028

Muszę zrobić przerwę od inwertera. Zamiast tego zacząłem pracę nad oprogramowaniem dla adaptera pada SNES. Przygotowałem prototypowy kabelek do eksperymentów:

![Kabelek SNES](./static/snes_connector.jpeg)

# 2024-03-29 - Dzień #029

Postanowiłem sprawdzić, czy może na płytce kartridża są jakieś inne błędy. W tym celu podłączyłem "standardowy" inverter - 74S04. Z nim kartridż działa prawidłowo:

![Kartridż z inwerterem](./static/cart_standard_inverter.jpeg)


# 2024-03-30 - Dzień #030

Zbliża się Wielkanoc. Dziś nic wielkiego - dodałem wstępną obsługę straty życia.

# 2024-03-31 do 2024-04-01 - Dzień #031 i #032

![Happy Easter](./static/happy_easter.png)

# 2024-04-02 - Dzień #033

Wysłałem paczkę z płytką drukowaną i EPROMem do [x_angela](http://ataripcb.pl/), który pomoże mi w sprawieniu, aby inwerter zadziałał.

# 2024-04-03 - Dzień #034

Dziś pracowałem nad oprogramowaniem dla adaptera padów od SNESa. Tym razem robię prototyp przed zamówieniem płytek :)

![Prototyp adaptera](./static/adapter_prototype.jpg)

# 2024-04-04 - Dzień #035

Dzięki [x_angelowi](http://ataripcb.pl/) kartridż z prostym inwerterem zadziałał! Dwie pierwsze fotki są z jego pola bitwy:

![Działający inwerter - x_angel](./static/inverter_fixed_x_angel.jpg)

![Działający inwerter - x_angel](./static/inverter_fixed_x_angel_2.jpg)

Rozwiązanie okazało się bardzo proste. Należy dodać kondensator 1nF równolegle do rezystora R1. [X_angel](http://ataripcb.pl/) mówi, że inwerter działa zbyt wolno, a kondensator go "przyspiesza".

Uwzględnię dodatkowy kondensator w projekcie, a na już zamówionych płytkach dolutuję go w następujący sposób:

![Działający inwerter - góra](./static/inverter_fixed_top.jpg)

![Działający inwerter - dół](./static/inverter_fixed_bottom.jpg)

# 2024-04-05 - Dzień #036

Zaprogramowałem adapter pada od SNESa. Te pady są łatwe do obsłużenia. W środku znajduje się rejestr przesuwny, który szeregowo przesyła dane o tym, które przyciski są wciśnięte.

Atmega8 wydaje się dobrym procesorem do adaptera, gdyż gniazdo joysticka w Atari 2600 nie ma zbyt dobrej wydajności prądowej i inne procesory (SAMD21, Pico, ESP32) mogłyby wcale nie zadziałać...

# 2024-04-06 - Dzień #037

Zaktualizowałem projekt płytki drukowanej kartridża, dodając kondensator, dzięki któremu działa inwerter.

Zmiana jest kosmetyczna. Kondensator lutuje się od drugiej strony płytki:

![Poprawiona płytka](./static/pcb_fixed.png)

# 2024-04-07 - Dzień #038

Dziś chciałem kontynuować pracę nad głównym programem gry. Jednak zamiast tego 3 razy sprawdziłem, czy z projektem adaptera wszystko w porządku i zamówiłem płytki :)

# 2024-04-08 - Dzień #039

Wróciłem do głównego programu, czyli gry. Dodałem wstępną wersję "animiacji" straconego motylka.

Nie wspominałem o tym wcześniej, ale zamierzam użyć obudów od [Sikor Soft](http://sikorsoft.waw.pl/hardware/obudowy-na-cartridge-2600-7800/) do kartridży. Są bardzo dobrej jakości, zrobione na wtryskarce, a nie za pomocą druku 3D. Sprawdziłem, czy płytki pasują:

![Obudowa kartridża](./static/cartridge_case.jpeg)

Pasują idealnie!

![Obudowa kartridża](./static/cartridge_case_2.jpeg)

Obudowy istnieją w dwóch kolorach - czarnym i białym. Białe bardziej pasują mi do Berty.

# 2024-04-09 - Dzień #040

Dodałem animację utraconego motylka. Nie jestem z niej w pełni zadowolony i prawdopodobnie później ją trochę dostroję.

Dodałem też funkcję "końca gry". Kiedy stracisz życia, nowe motylki się nie pojawią.

To dobre wiadomości. Zła wiadomość jest taka, że zostało mi tylko 855 bajtów! Chciałbym dodać co najmniej ekran tytułowy z muzyką i dwa poziomy trudności... Mam nadzieję, że te 855 bajtów mi wystarczy.

# 2024-04-10 - Dzień #041

Od teraz motylki są uwalniane z rosnącą prędkością, gra stała się trudniejsza.

"Pauzujące" źródło motyli zmienia się po każdej utracie życia.

# 2024-04-11 - Dzień #042

Udostępniłem obecną wersję współpracownikom z mojego zespołu. Grali w online'owym emulatorze [Javatari](https://javatari.org/). Oto aktualny, najwyższy wynik:

![High score](./static/berta_top_score.png)

# 2024-04-12 - Dzień #043

Dodałem drugi poziom trudności, dostroiłem trochę prędkość, dodałem opcję wyłączenia dźwięku.

Mimo, że zastosowałem kilka optymalizacji, zostało mi już jedynie 778 bajtów.

# 2024-04-13 - Dzień #044

Dziś dodałem ekran tytułowy. Na razie w wersji polskiej. Jak się podoba?

![Ekran tytułowy](./static/title_screen.png)

# 2024-04-14 - Dzień #045

Dodałem muzykę tytułową. Aczkolwiek, na moje ucho jest trochę za szybka.

# 2024-04-15 - Dzień #046

Zdołałem spowolnić muzyczkę tytułową i sprawić, że brzmi tak, jak chciałem.

# 2024-04-16 - Dzień #047

Kiedy gra się zakończy, można teraz wrócić do ekranu tytułowego i zacząć ponownie.

# 2024-04-17 - Dzień #048

Dziś dodałem ekran tytułowy w wersji "międzynarodowej":

![Międzynarodowy ekran tytułowy](./static/title_screen_international.png)

# 2024-04-18 - Dzień #049

Dodałem sposób na rozróżnienie, który poziom trudności jest ustawiony. W poziomie "łatwym" siatka jest żółta. W "trudnym" jest czerwona.

Dodatkowo, jeśli na ekranie tytułowym chmurka jest nad literą "B", oznacza to, że jest ustawiony poziom "łatwy" (z ang. "beginner"). Kiedy jest nad literą "A", mamy poziom "trudny" ("advanced").

# 2024-04-19 - Dzień #050

Dziś 50-ty dzień konkursu [100 Commitów](https://100commitow.pl/). Pomyślałem, że to dobra okazja, aby wydać pierwszą wersję beta gry - obecnie jest już całkiem grywalna. Udostępniłem ROM tu i ówdzie i czekam na feedback.

Wykonałem też kolejny kartridż, aby pograć na prawdziwej konsoli:

![50-ty dzień - kartridż](./static/50_day_cartridge.jpeg)

# 2024-04-20 - Dzień #051

Wrażenia pierwszych grających są pozytywne. Z uwag - brakuje napisu "game over" na koniec. Nie wiem, czy go dorobię, czy wystarczy mi miejsca w ROMie i czy w ogóle chcę to robić - w oryginale na koniec był tylko sygnał dźwiękowy.

Zebrałem kilka raportów z wyników i rekordziści zebrali powyżej 400 motyli!

Sam znalazłem jednego buga związanego z kolorowaniem siatki. Nie był to na szczęście błąd krytyczny, no i już go poprawiłem.

# 2024-04-21 - Dzień #052

Dziś nic spektakularnego - testy, testy i jeszcze raz testy. Mój osobisty rekord to 640.

# 2024-04-22 - Dzień #053

Właśnie dostałem przesyłkę z płytkami do adaptera kontrolera od SNESa! Czuję się, jakby była gwiazdka!

Zbudowałem pierwszy adapter (zgadnijcie, czemu jest czerwony?):

![SNES pad adapter](./static/snes_adapter.jpg)

Pomysł polega na wykorzystaniu strzałki w górę, w dół oraz przycisków "X" i "B", aby łatwo poruszyć Bertę w pożądanym kierunku.

Adapter działa! Nie zadziałał za pierwszym razem, ale musiałem poprawić jedynie numery pinów w kodzie źródłowym i zrekompilować go.

# 2024-04-23 - Dzień #054

Próbuję zrobic jakąś grafikę na okładkę. Na razie mam taką wersję roboczą:

![Robocza okładka](./static/cover_draft.png)

# 2024-04-24 - Dzień #055

Rozwinąłem oprogramowanie dla adaptera pada. Jeśli założy się zworkę, kontroler zadziała jako "normalny" joystick - kierunki i "Y" jako "fire".

# 2024-04-25 - Dzień #056

Zacząłem zamieniać wywołania `pfpixel` na bezpośrednie manipulacje zmiennymi pola gry. Dzięki temu oszczędzę trochę miejsca w ROMie.

# 2024-04-26 - Dzień #057

Berta pojawiła się w programie [ZeroPage Homebrew](https://www.twitch.tv/zeropagehomebrew)! Możecie zobaczyć ostatni odcinek tutaj: [https://youtu.be/SA3xd5n5TF4?t=3413](https://youtu.be/SA3xd5n5TF4?t=3413)

# 2024-04-27 - Dzień #058

Próbowałem odsyzkać trochę miejsca w ROMie, ale bez sukcesu. Mam jednak pomysł jak to zrobić.

# 2024-04-28 - Dzień #059

Zaimplementowałem zapamiętywanie najwyższych wyników dla trybu "łatwego" i "trudnego". Musiałem w tym celu zwolnić dwie zmienne, bo użyłem już wszystkich możliwych.

Zapamiętywanie wyników nie jest permanentne. Mogłoby być, gdybym zaimplementował obsługę zewnętrznego urządzenia SaveKey, ale na to nie starczy mi miejsca w ROMie. Mimo optymalizacji, zostało mi tylko 26 bajtów...

# 2024-04-29 - Dzień #060

Wgrałem aktualną wersję gry na kartridż i testowałem na prawdziwej konsoli. Po niedawnej poprawce dotyczącej limitu motyli, gra stała się za trudna. Dostrajam poziom trudności.

# 2024-04-30 - Dzień #061

Dalej dostrajam poziom trudności...

# 2024-05-01 - Dzień #062

Pobawiłem się trochę Leonardo AI. Wypróbowałem funkcję generowania obrazu na podstawie innego obrazu, aby przerobić mój rysunek Berty. Oto kilka wyników. Dobra, jeden z nich nie był na podstawie innego obrazu :) A pierwszy to ten oryginalny.

|||
|----------------|---------------|
|![Original drawing](./design/leonardo_ai/original.png)|![Berta from Leonardo AI 1](./design/leonardo_ai/berta_leonardo_ai.jpg)|
|![Berta from Leonardo AI 2](./design/leonardo_ai/berta_leonardo_ai_2.jpg)|![Berta from Leonardo AI 3](./design/leonardo_ai/berta_leonardo_ai_3.jpg)|
|![Berta from Leonardo AI 4](./design/leonardo_ai/berta_leonardo_ai_4.jpg)|![Berta from Leonardo AI 5](./design/leonardo_ai/berta_leonardo_ai_5.jpg)|

# 2024-05-02 - Dzień #063

Próbowałem zmienić "animację" straconego motylka, ale na koniec wycofałem wszystkie zmiany :) Jestem zbyt przyzwyczajony do oryginalnej.

# 2024-05-03 - Dzień #064

Dziś w Polsce mamy święto, także robię sobie dzień wolny.

# 2024-05-04 - Dzień #065

Zaimplementowałem sygnał dźwiękowy na koniec gry. Miejsca w ROMie starczyło mi na cztery dźwięki - na pięć już nie.

# 2024-05-05 - Dzień #066

Zrobiłem Bercie sesję fotograficzną. Zdjęcia mają być bazą do rysunku na okładkę kartridża.

|||
|-|-|
|![Photo session 1](./static/berta_photo_session_1.jpg)|![Photo session 2](./static/berta_photo_session_2.jpg)|

# 2024-05-06 - Dzień #067

Postanowiłem zrobić właściwą wersję PAL gry. Do tej pory pracowałem z wersją NTSC, co jest wygodniejsze. Dla przykładu, NTSC jest domyślna w emulatorach.

Problem polega na tym, że w NTSC mamy 30 klatek na sekundę, a w PAL 25. Należy dostosować czasy różnych wydarzeń, aby wersja PAL działała z taką samą prędkością, jak NTSC. Należy też zmienić kolory, bo palety kolorów są zupełnie inne w PAL i NTSC.

# 2024-05-07 - Dzień #068

Wciąż dostosowuję timingi wersji PAL...

# 2024-05-08 - Dzień #069

Wersja PAL ukończona! Poza samym tempem muzyczki tytułowej, wylatywania motyli itp. musiałem dostosować także poziom trudności.

# 2024-05-09 - Dzień #070

Berta trafiła na AtariOnline! [Dalton robi grę na A2600](https://atarionline.pl/v01/index.php?subaction=showfull&id=1715228764&archive=&start_from=0&ucat=1&ct=nowinki)

Zrobiłem też nowy release [v0.80.rc1](https://github.com/vandalton/BertaAndButterflies/releases/tag/v0.80.rc1). Gra jest właściwie skończona i nawet, gdybym chciał, nic już więcej nie zmieszczę - zostało 14 bajtów ROMu :)

# 2024-05-10 - Dzień #071

Wczorajszy artykuł na AtariOnline zainspirował użytkownika Santyago do stworzenia za pomocą AI takich ładnych obrazków:

||||
|-|-|-|
|![Santyago 1](./static/santyago_berta1.png)|![Santyago 2](./static/santyago_berta2.png)|![Santyago 3](./static/santyago_berta3.png)|

# 2024-05-11 - Dzień #072

Wciąż próbuję wykonać rysunek Berty. Oto jeden, bazujący na zdjęciu:

![Berta bazowana na zdjęciu](./static/berta_based_on_photo.png)

# 2024-05-12 - Dzień #073

Wyeliminowałem użycie zworki w adapterze kontrolera od SNESa. Tryb działania zmienia się teraz wciskając jednocześnie Start i Select. Wybrany tryb jest przechowywany w EPROMie Atmegi.

# 2024-05-13 - Dzień #074

Wciąż próbuję zrobić rysunek Berty, który byłby na tyle dobry, abym go użył na okładkę kartridża. Eksperymentuję z Leonardo AI, aby wykonać obrazek na bazie mojego obrazka. Oto kilka rezultatów.

|||
|-|-|
|![Leonardo 1](./static/berta_ai_redone_1.jpg)|![Leonardo 2](./static/berta_ai_redone_2.jpg)|
|![Leonardo 1](./static/berta_ai_redone_3.jpg)|![Leonardo 2](./static/berta_ai_redone_4.jpg)|
|![Leonardo 1](./static/berta_ai_redone_5.jpg)|![Leonardo 2](./static/berta_ai_redone_6.jpg)|

# 2024-05-14 - Dzień #075

Poprosiłem kolegę Xeda, który ma konto premium w Leonardo AI, aby poeksperymentował z obrazkiem Berty używając innych narzędzi (na przykład "Content Reference"). Oto kilka jego wyników:

|||
|-|-|
|![Xed 1](./static/berta_xed_1.jpg)|![Xed 2](./static/berta_xed_2.jpeg)|
|![Xed 1](./static/berta_xed_3.jpeg)|![Xed 2](./static/berta_xed_4.jpeg)|

# 2024-05-15 - Dzień #076

Sporo ludzi grało w Bertę! Wśród nich był Milan Galcik i X_angel, który przysłał mi to zdjęcie:

![X_angel score](./static/xangel_tests.jpg)

Na razie nikt nie miał problemów, nie dostałem żadnego zgłoszenia buga. Myślę, że wkrótce wydam wersję finalną!

# 2024-05-16 - Dzień #077

Istnieje urządzenie o nazwie [SaveKey](https://atariage.com/store/index.php?l=product_detail&p=1194) dla Atari 2600. Podłącza się je do portu joysticka gracza drugiego i niektóre gry (około 40) są w stanie zapisać na tym najlepsze wyniki.

Co prawda nie mam już wolnego miejsca w ROMie, chciałem się pobawić SaveKeyem. Jest to bardzo proste urządzenie i można znaleźć jego schemat w Internecie. Zaprojektowałem własną płytkę drukowaną jakiś miesiąc temu i dziś dotarła!

![SaveKey](./static/savekey.jpg)

# 2024-05-17 - Dzień #078

Zbudowałem SaveKeya:

![SaveKey zbudowany](./static/savekey_soldered.jpeg)

i przetestowałem go na grze ["Fall Down"](https://atariage.com/store/index.php?l=product_detail&p=308). Zadziałał poprawnie!

# 2024-05-18 - Dzień #079

Dziś z żoną wybraliśmy się na jubileuszowe spotkanie toruńskiego [Java User Group](https://day.torun.jug.pl/). Spotkałem kilku znajomych ze studiów i niektórzy pytali o Bertę! Było to bardzo miłe :)

# 2024-05-19 - Dzień #080

Poeksperymentowałem z SaveKeyem. Nie ma problemu z implementacją wsparcia dla niego, ale wyszedłbym poza 4KB... Nie widzę możliwości optymalizacji mojego kodu, a zapisywanie najwyższych wyników nie jest dla mnie niezbędne, więc ostatecznie zdecydowałem, że nie będę wspierał SaveKeya.

Jednakże, mam kolejny pomysł. EPROM w SaveKeyu używa protokołu I2C. Tego samego protokołu używają układy RTC. Mógłbym wyświetlać aktualną godzinę na planszy tytułowej - nazwa "Game & Watch" zobowiązuje ;) Do implementacji tego pomysłu potrzebowałbym zaprojektować kolejną płytkę drukowaną, no i oczywiście to także wymagałoby więcej niż 4KB ROMu. Poeksperymentuję z tym pomysłem, jednak to też nie jest niezbędna funkcjonalność. Może kiedyś wydam 8-kilobajtową wersję deluxe ;)

# 2024-05-20 - Dzień #081

Zacząłem pracę nad właściwą etykietą na kartridż. Dokładniej mówiąc, stworzyłem SVG z warstwami - jedną widzialną, a drugą z wykrojem dla maszyny tnącej.

# 2024-05-21 - Dzień #082

Kontynuuję pracę nad etykietą. Oto wynik:

![Label](./design/cover.pl.png)

# 2024-05-22 - Dzień #083

Jestem zadowolony z okładki. Problem z okładką jest taki, że drukarnie oczekują warstwowych plików PDF, a nie SVG. Z kolei Inkscape, w którym tworzyłem okładkę, nie potrafi wyeksportować warstwowego pliku PDF... Walczyłem trochę próbując, ale bez rezultatu...

# 2024-05-23 - Dzień #084

Poprosiłem znajomego, Bartasa, aby przekonwertował mi pliki SVG na PDF. Robił to dla mnie już wcześniej, gdy wydawałem grę ["Invaders from Andromeda"](https://github.com/Cisano/Invaders-From-Andromeda) autorstwa Cisano. Wówczas użył wersji trial programu Adobe Illustrator. Trial jednak wygasł i szuka innych opcji :)

# 2024-05-24 - Dzień #085

Bartas na razie nie znalazł innej możliwości przekonwertowania SVG na PDF, niż Illustrator. Ale jeszcze powalczy. Ja też jeszcze powalczę.

# 2024-05-25 - Dzień #086

Zacząłem projektować zegar dla Atari 2600. Eagle mnie trochę zawiódł, bo w jego bibliotece komponentów brakowało układu DS1307, który chciałem wykorzystać...

# 2024-05-26 - Dzień #087

Zamiast układu DS1307 użyłem generycznej podstawki DIL8. Brakuje mi jednak gniazda na baterię, ale powinienem je znaleźć w jakiejś bibliotece komponentów. Chociaż zegara DS1307 nie znalazłem...

# 2024-05-27 - Dzień #088

Wciąż usiłuję zrobić pliki PDF z okładką, gdyż chciałbym lada chwila zamówić ich wydruk. Słyszałem, że Scribus potrafi zrobić warstwowe pliki PDF. Okazało się, że nie jest w stanie prawidłowo otworzyć moich SVG...

# 2024-05-28 - Dzień #089

Bartas odkopał oryginalną, pudełkową wersję pakietu Adobe Creative Suite 3 z wieczystą licencją i mi pożyczył. Mimo, że to wersja z 2007 roku, bez problemu utworzyłem w niej właściwe pliki PDF. Jutro zamówię wydruki.

# 2024-05-29 - Dzień #090

Wydruki zamówione!

Wykonałem też prototyp zegara dla Atari 2600, z kwarcem przylutowanym bezpośrednio do nóżek układu scalonego:

![RTC proto](./static/rtc_proto.jpeg)

# 2024-05-30 - Dzień #091

Dziś mamy święto, więc też zrobiłem sobie wolne. Nie mogę się doczekać wykruków!

# 2024-05-31 - Dzień #092

Analizowałem protokół I2C i myślałem, w jaki sposób zmodyfikować metody do komunikacji z SaveKeyem, aby komunikowały się z układem zegara. Problem w tym, że jeśli coś zaimplementuję, muszę to wgrać na EPROM i uruchomić na prawdziwej konsoli. Jeśli nie zadziała właściwie, muszę ponowić cały proces, a jest to bardzo czasochłonne. Dlatego przygotowuję się solidnie, aby takich iteracji nie było zbyt wiele.

# 2024-06-01 - Dzień #093

Próbowałem pobrać sekundy z DS1307 i wyświetlić je jako wynik, ale bez rezultatu. Na razie użyłem 3 EPROMy :)

# 2024-06-02 - Dzień #094

Czytałem o układzie DS1307. Myślałem, że bateria jest mu potrzebna tylko jako backup, aby godzina odliczała się, gdy nie ma włączonego głównego zasilania. Okazało się, że jest niezbędna! Być może komunikacja z zegarem jest zaprogramowana właściwie. Niedługo podlutuję baterię i sprawdzę to.

# 2024-06-03 - Dzień #095

Zdołałem naprawić dwie z moich sowieckich konsolek! Wymieniłem gumki przewodzące, przeniosłem ekrany pomiędzy konsolkami, a oto rezultat:

![Konsolki Elektronika](./static/elektronika_fixed.jpg)

# 2024-06-04 - Dzień #096

To prawda - bateria jest niezbędna, aby DS1307 działał. Przylutowałem ją:

![RTC z baterią](./static/rtc_with_battery.jpg)

i napisałem prosty program komunikujący się z DS1307 przy użyciu protokołu I2C i wyświetlający godzinę, minuty i sekundy jako liczbę punktów: [https://youtube.com/shorts/fulqg-NeGTo?feature=share](https://youtube.com/shorts/fulqg-NeGTo?feature=share)

Zacząłem od wykonania kolejnego kartridża dla szybkiego prototypowania. Programowanie EPROMów ciągle od nowa i kasowanie ich przez pół godziny jest zbyt czasochłonne. Wykorzystałem jedną ze starszych płytek drukowanych, która przeznaczona jest na 128 4-kilobajtowych gier na EPROMie 27C4001. Ten EPROM jest prawie pin w pin zgodny z pamięcią flash 39SF040, która nie wymaga kasowania, dzięki czemu mogę pracować efektywniej. Musiałem tylko dokonać kilku małych modyfikacji:

![Kartridż 128 dostosowany do pamięci flash](./static/128_adjusted.jpeg)

# 2024-06-05 - Dzień #097

Wczoraj odebrałem naklejki na kartridże!

![Naklejki](./static/labels_roll.jpeg)

A teraz zrobiłem pierwszy kartridż w docelowej formie:

![Docelowy kartridż](./static/cart_with_label.jpeg)

# 2024-06-06 - Dzień #098

Obecnie uzupełniam dokumentację. Zaprojektowałem też przód i tył pudełka. Planuję użyć takiego pudełka:  [https://www.dpcraft.pl/pl/produkt/pudelko-tekturowe-18x14x4-cm.html](https://www.dpcraft.pl/pl/produkt/pudelko-tekturowe-18x14x4-cm.html). Oto projekty - na ten moment wyłącznie po polsku:

|Przód|Tył|
|-|-|
|![Box front](./static/box.front.pl.paths.png)|![Box back](./static/box.back.pl.paths.png)|

# 2024-06-07 - Dzień #099

Wykonałem pierwszy prototyp pudełka:

![Box](./static/box.jpg)

Jednak nie jestem zadowolny z wyniku. Tylna układka jest trochę za duża, a kolory części przedniej na wydruku wyglądają inaczej niż te same kolory na części tylniej.

# 2024-06-08 - Dzień #100

Dziś ostatni dzień konkursu! Uzupełniam dokumentację, promuję projekt w portalach społecznościowych itp. Na szczęście moja gra jest ukończona. Jak powiedział Steve Jobs, "it's not done until it ships" (*Ciężko to przetłumaczyć, ale spróbuję: "Nie jest ukończone, dopóki nie będzie dostarczane*"). Oznacza to, że dowiozłem projekt w 100 dni, gdyż zamierzam rozsyłać kartridże od poniedziałku ;)

# 2024-06-10

Dodałem angielską wersję projektów pudełka.

# 2024-06-20

Etap głosowania w konkursie zakończył się wczoraj, a oto wyniki!

![Wyniki głosowania](./static/voting_results.png)

Jednak nie znaczy to, że wygrałem. Teraz Jury wybierze zwycięzcę spośród tych 10 projektów. Ale miło było zobaczyć Bertę na pierwszym miejscu. Oznacza to, że inni zawodnicy docenili mój projekt. Dziękuję!

# 2024-06-21

Dziś imieniny mojej żony. Zrobiłem dla niej pierwszy właściwy egzemplarz pudełkowej wersji gry "Berta i motyle":

![Berta boxed 1](./static/berta_boxed1.jpg)

![Berta boxed 2](./static/berta_boxed2.jpg)

# 2024-06-25

Zdołałem ustawić zegar z poziomu programu na Atari! Na ten moment napisałem osobny program do eksperymentów z zegarem, ale będę mógł powstałe metody użyć także w rozszerzonej wersji gry.

# 2024-06-29

Projekt "Berta i motyle" zajął pierwsze miejsce w konkursie "100 commitów"!

Bardzo się cieszę! Do Torunia wróciłem z Macbookiem Pro, ale nie o nagrodę w tym wszystkim chodziło. Dużo cenniejsza jest wiedza, jaką nabyłem przez te 100 dni konkursu, a także nowe znajomości.

Wciąż trochę nie dowierzam, że w konkursie programistycznym XXI wieku wygrała gra na konsolę z 1977 roku!

Przyznam, że początkowo w ogóle nie chciałem brać w tym wszystkim udziału. Pomyślałem, że dowolność wyboru tematu projektu oznaczać będzie, że wybór zwycięzców stanie się zbyt subiektywny. Ale szybko się opamiętałem i właśnie dowolność tematu zacząłem odbierać jako największą zaletę konkursu. Od roku chodził za mną pomysł napisania czegoś na Atari 2600, a skoro temat może być dowolny, to dlaczego nie spróbować w ramach konkursu? Konieczność commitowania każdego dnia wykorzystałem jako czynnik dyscyplinujący.

Gratuluję wszystkim, którzy przetrwali 100 dni. O poziomie konkursu niech świadczy fakt, że w finałowym głosowaniu jurorów głosy zebrało aż 7 różnych projektów z finałowej dziesiątki! Mimo, że "jechałem z pole position", do ostatniej chwili wcale nie byłem pewien, że wygram też w ostatnim etapie.

![Winner](./static/winner.jpg)

![Diploma](./static/diploma.jpg)

# 2024-07-05

Dziś zamówiłem płytki do układu zegara.

# 2024-07-06

Wyprodukowałem kolejne kartridże z Bertą. Wyślę je niebawem, także zagranicę!

![Kartridże](./static/cartridges.jpg)

# 2024-07-18

Dotarły płytki do budowy układu zegara!

![Płytki zegara](./static/rtc_pcbs.jpg)

Od razu polutowałem pierwszą. Działa tak samo, jak działał prototyp, czyli jest dobrze :)

![Polutowana płytka zegara](./static/rtc_soldered.jpg)

# 2024-08-11

Rozesłałem kilka egzemplarzy gry do ludzi, którzy pomogli mi przy projekcie. Milan Galcik, który pojawił się już wcześniej w dzienniczku, podesłał zdjęcia z - prawdopodobnie pierwszego na świecie - tematycznego spotkania spędzonego na grze w Bertę!

W spotkaniu brało udział 6 osób, a gra była uruchamiana na oryginalnej konsoli oraz na Atari 2600+.

![Spotkanie 1](./static/party1.jpg)

![Spotkanie 2](./static/party2.jpg)

![Spotkanie 3](./static/party3.jpg)

Dziękuję!

# 2024-10-30

Dziś opowiadałem o moich doświadczeniach związanych z programowaniem na Atari 2600 na spotkaniu toruńskiej Java User Group: [https://www.meetup.com/torun-jug/events/304099844/](https://www.meetup.com/torun-jug/events/304099844/). Podobno było dobrze :) Wystąpienie było nagrywane, ale film nie został jeszcze opublikowany.

![JUG2](./static/jug2.jpg)

![JUG3](./static/jug3.jpg)

![JUG1](./static/jug1.jpg)

Około tydzień przed wydarzeniem wystawiłem specjalny egzemplarz Berty na cele charytatywne. Zysk przeznaczony był dla Stowarzyszenia [Kierunek Zdrowie](https://kierunekzdrowie.org/en/). Okazało się, że aukcję wygrał.... Łukasz, organizator JUGa! Co więcej, wystawił ją ponownie, zrobił wokół aukcji trochę szumu i zeszła za 615 złotych! Wciąż przecieram oczy ze zdumienia!

![Charytatywna wersja](./static/berta_charity.jpg)

![Aukcja](./static/charity_auction.png)

