
// Atari joystick pinout - seen from the front
// \1 2 3 4 5/
//  \6 7 8 9/
//
// 1 - up, 2 - down, 3 - left, 4 - right, 5 - NC 6 - fire
// 7 - 5V (HIGH), 8 - GND (LOW), 9 - NC

#define MODE_JUMPER 12

#define OUT_UP 14
#define OUT_DOWN 15
#define OUT_LEFT 26
#define OUT_RIGHT 17
#define OUT_FIRE 18
#define OUT_SECOND_FIRE 19
#define OUT_THIRD_FIRE 11

#define CLOCK 23
#define LATCH 24
#define DATA 25

void setup() {
  pinMode(MODE_JUMPER, INPUT_PULLUP);
  
  pinMode(OUT_UP, OUTPUT);
  pinMode(OUT_DOWN, OUTPUT);
  pinMode(OUT_LEFT, OUTPUT);
  pinMode(OUT_RIGHT, OUTPUT);
  pinMode(OUT_SECOND_FIRE, OUTPUT);
  pinMode(OUT_THIRD_FIRE, OUTPUT);  

  pinMode(CLOCK,  OUTPUT);
  pinMode(LATCH, OUTPUT);
  pinMode(DATA, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

}
