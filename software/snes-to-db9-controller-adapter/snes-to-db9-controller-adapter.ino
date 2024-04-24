// Atari joystick pinout - seen from the front
// \1 2 3 4 5/
//  \6 7 8 9/
//
// 1 - up, 2 - down, 3 - left, 4 - right, 5 - NC 6 - fire
// 7 - 5V (HIGH), 8 - GND (LOW), 9 - NC

#define MODE_JUMPER 16

#define OUT_UP 8
#define OUT_DOWN 9
#define OUT_LEFT 10
#define OUT_RIGHT 11
#define OUT_FIRE 12
#define OUT_SECOND_FIRE 13
#define OUT_THIRD_FIRE 15

#define SNES_PAD_CLOCK 14
#define SNES_PAD_LATCH 15
#define SNES_PAD_DATA 16

#define SNES_BUTTON_B 1
#define SNES_BUTTON_Y 2
#define SNES_BUTTON_SELECT 4
#define SNES_BUTTON_START 8
#define SNES_BUTTON_UP 16
#define SNES_BUTTON_DOWN 32
#define SNES_BUTTON_LEFT 64
#define SNES_BUTTON_RIGHT 128
#define SNES_BUTTON_A 256
#define SNES_BUTTON_X 512
#define SNES_BUTTON_L 1024
#define SNES_BUTTON_R 2048

void setup()
{
    pinMode(MODE_JUMPER, INPUT_PULLUP);

    pinMode(OUT_UP, OUTPUT);
    pinMode(OUT_DOWN, OUTPUT);
    pinMode(OUT_LEFT, OUTPUT);
    pinMode(OUT_RIGHT, OUTPUT);
    pinMode(OUT_FIRE, OUTPUT);
    pinMode(OUT_SECOND_FIRE, OUTPUT);
    pinMode(OUT_THIRD_FIRE, OUTPUT);

    pinMode(SNES_PAD_CLOCK, OUTPUT);
    pinMode(SNES_PAD_LATCH, OUTPUT);
    pinMode(SNES_PAD_DATA, INPUT);
}

void loop()
{
    int mode = digitalRead(MODE_JUMPER);
    int state = getButtonsState();

    if (mode == HIGH)
    {
      digitalWrite(OUT_FIRE, state & SNES_BUTTON_Y ? LOW : HIGH);
      digitalWrite(OUT_UP, state & (SNES_BUTTON_UP | SNES_BUTTON_X) ? LOW : HIGH);
      digitalWrite(OUT_DOWN, state & (SNES_BUTTON_DOWN | SNES_BUTTON_B) ? LOW : HIGH);
      digitalWrite(OUT_LEFT, state & (SNES_BUTTON_UP | SNES_BUTTON_DOWN) ? LOW : HIGH);
      digitalWrite(OUT_RIGHT, state & (SNES_BUTTON_X | SNES_BUTTON_B) ? LOW : HIGH);
    } 
    else {
      digitalWrite(OUT_FIRE, state & SNES_BUTTON_Y ? LOW : HIGH);
      digitalWrite(OUT_UP, state & (SNES_BUTTON_UP | SNES_BUTTON_B) ? LOW : HIGH);
      digitalWrite(OUT_DOWN, state & SNES_BUTTON_DOWN ? LOW : HIGH);
      digitalWrite(OUT_LEFT, state & SNES_BUTTON_LEFT ? LOW : HIGH);
      digitalWrite(OUT_RIGHT, state & SNES_BUTTON_RIGHT ? LOW : HIGH);
    }

    delay(1);
}

int getButtonsState()
{
    int res = 0;

    digitalWrite(SNES_PAD_LATCH, HIGH);
    delayMicroseconds(12);
    digitalWrite(SNES_PAD_LATCH, LOW);

    for (int i = 0; i < 16; ++i)
    {
        int s = digitalRead(SNES_PAD_DATA);

        delayMicroseconds(12);
        digitalWrite(SNES_PAD_CLOCK, HIGH);
        delayMicroseconds(12);
        digitalWrite(SNES_PAD_CLOCK, LOW);

        res |= (!s << i);
    }

    return res;
}
