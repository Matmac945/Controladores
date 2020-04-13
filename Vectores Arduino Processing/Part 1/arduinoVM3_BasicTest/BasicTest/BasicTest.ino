int memory [16000];
int LCL = 300;
int _static = 16;
int temp = 5;
int ARG = 400;
int _this = 3000;
int _that = 3010;
int sp = 256;
void setup() {
  Serial.begin(9600);
  memory[sp++] = 10;
  memory[LCL + 0] = memory[sp - 1];
  sp--;
  memory[sp++] = 21;
  memory[sp++] = 22;
  memory[ARG + 2] = memory[sp - 1];
  sp--;
  memory[ARG + 1] = memory[sp - 1];
  sp--;
  memory[sp++] = 36;
  memory[_this + 6] = memory[sp - 1];
  sp--;
  memory[sp++] = 42;
  memory[sp++] = 45;
  memory[_that + 5] = memory[sp - 1];
  sp--;
  memory[_that + 2] = memory[sp - 1];
  sp--;
  memory[sp++] = 510;
  memory[temp + 6] = memory[sp - 1];
  sp--;
  memory[sp++] = memory[LCL + 0];
  memory[sp++] = memory[_that + 5];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  memory[sp++] = memory[ARG + 1];
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[sp++] = memory[_this + 6];
  memory[sp++] = memory[_this + 6];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[sp++] = memory[temp + 6];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  for (int i = 0; i < 16000; i++) {
    if (memory[i] != 0) {
      Serial.print("RAM[");
      Serial.print(i);
      Serial.print("] = ");
      Serial.println(memory[i]);
    }
  }
}
void loop() {}
