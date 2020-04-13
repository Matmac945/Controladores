int memory [16000];
int lcl = 300;
int _static = 16;
int temp = 5;
int _arg = 400;
int _this = 0;
int _that = 0;
int sp = 256;
void setup() {
  memory [400] = 3;
  Serial.begin(9600);
  memory[sp++] = 0;
  memory[lcl + 0] = memory[sp - 1];
  sp--;
LOOP_START:
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = memory[lcl + 0];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  memory[lcl + 0	] = memory[sp - 1];
  sp--;
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = 1;
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[_arg + 0] = memory[sp - 1];
  sp--;
  memory[sp++] = memory[_arg + 0];
  sp--;
  if (memory[sp]) {
    goto LOOP_START;
  }
  memory[sp++] = memory[lcl + 0];
  memory[0] = sp;
  memory[1] = lcl;
  memory[2] = _arg;
  memory[3] = _this;
  memory[4] = _that;
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
