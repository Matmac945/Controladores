int memory [16000];
int lcl = 317;
int _static = 16;
int temp = 5;
int _arg = 310;
int _this = 3000;
int _that = 4000;
int sp = 317;
void setup() {
  memory [310] = 1234;
  memory [311] = 37;
  memory [312] = 1000;
  memory [313] = 305;
  memory [314] = 300;
  memory [315] = 3010;
  memory [316] = 4010;
  Serial.begin(9600);
  goto SimpleFunction;
SimpleFunction:
  for (int i = 0; i < 2; i ++) {
    memory[sp++] = 0;
  }
  memory[sp++] = memory[lcl + 0];
  memory[sp++] = memory[lcl + 1];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  memory[sp - 1] = ~memory[sp - 1];
  memory[sp++] = memory[_arg + 0];
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  memory[sp++] = memory[_arg + 1];
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  int endFrame = lcl;
  memory[_arg] = memory[sp - 1];
  sp = _arg + 1;
  _that = memory[endFrame - 1];
  _this = memory[endFrame - 2];
  _arg = memory[endFrame - 3];
  lcl = memory[endFrame - 4];
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
