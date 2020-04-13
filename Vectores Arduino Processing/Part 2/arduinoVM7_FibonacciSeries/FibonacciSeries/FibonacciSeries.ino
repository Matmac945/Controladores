int memory [16000];
int lcl = 300;
int _static = 16;
int temp = 5;
int _arg = 400;
int _this = 0;
int _that = 0;
int sp = 256;
void setup() {
  memory [400] = 10;
  memory [401] = 4000;
  Serial.begin(9600);
  memory[sp++] = memory[_arg + 1];
  _that = memory[sp - 1];
  sp--;
  memory[sp++] = 0;
  memory[_that + 0] = memory[sp - 1];
  sp--;
  memory[sp++] = 1;
  memory[_that + 1] = memory[sp - 1];
  sp--;
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = 2;
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[_arg + 0] = memory[sp - 1];
  sp--;
MAIN_LOOP_START:
  memory[sp++] = memory[_arg + 0];
  sp--;
  if (memory[sp]) {
    goto COMPUTE_ELEMENT;
  }
  goto END_PROGRAM;
COMPUTE_ELEMENT:
  memory[sp++] = memory[_that + 0];
  memory[sp++] = memory[_that + 1];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  memory[_that + 2] = memory[sp - 1];
  sp--;
  memory[sp++] = _that;
  memory[sp++] = 1;
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  _that = memory[sp - 1];
  sp--;
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = 1;
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[_arg + 0] = memory[sp - 1];
  sp--;
  goto MAIN_LOOP_START;
END_PROGRAM:
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
