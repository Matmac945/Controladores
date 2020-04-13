int memory [16000];
int lcl = 0;
int _static = 0;
int temp = 5;
int _arg = 0;
int _this = 0;
int _that = 0;
int retAdd = 0;
int sp = 256;
int endFrame = 0;

void setup() {
  Serial.begin(9600);

  memory[sp++] = 0 ;
  memory[sp++] = lcl;
  memory[sp++] =  _arg;
  memory[sp++] = _this;
  memory[sp++] = _that;
  _arg = sp - 5;
  lcl = sp;
  goto Sys_init;

Sys_init:
  memory[sp++] = 7;
  memory[sp++] = 0;
  memory[sp++] = lcl;
  memory[sp++] =  _arg;
  memory[sp++] = _this;
  memory[sp++] = _that;
  _arg = sp - 5 - 1;
  lcl = sp;
  goto Main_fibonacci;
RETURN_0:
WHILE:
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
  return;
  goto WHILE;
Main_fibonacci:
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = 2;
  if (memory[sp - 2] < memory[sp - 1]) {
    memory[sp - 2] = -1;
    sp--;
  }
  else {
    memory[sp - 2] = 0;
    sp--;
  }
  sp--;
  if (memory[sp]) {
    goto IF_TRUE;
  }
  goto IF_FALSE;
IF_TRUE:
  memory[sp++] = memory[_arg + 0];
  endFrame = lcl;
  retAdd = memory[endFrame - 5];
  memory[_arg] = memory[sp - 1];
  sp = _arg + 1;
  _that = memory[endFrame - 1];
  _this = memory[endFrame - 2];
  _arg = memory[endFrame - 3];
  lcl = memory[endFrame - 4];
  if (retAdd == 0 ) {
    goto RETURN_0;
  }
  if (retAdd == 1 ) {
    goto RETURN_1;
  }
  if (retAdd == 2 ) {
    goto RETURN_2;
  }
IF_FALSE:
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = 2;
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[sp++] = 1;
  memory[sp++] = lcl;
  memory[sp++] =  _arg;
  memory[sp++] = _this;
  memory[sp++] = _that;
  _arg = sp - 5 - 1;
  lcl = sp;
  goto Main_fibonacci;
RETURN_1:
  memory[sp++] = memory[_arg + 0];
  memory[sp++] = 1;
  memory[sp - 2] = memory[sp - 2] - memory[sp - 1];
  sp--;
  memory[sp++] = 2;
  memory[sp++] = lcl;
  memory[sp++] =  _arg;
  memory[sp++] = _this;
  memory[sp++] = _that;
  _arg = sp - 5 - 1;
  lcl = sp;
  goto Main_fibonacci;
RETURN_2:
  memory[sp - 2] = memory[sp - 2] + memory[sp - 1];
  sp--;
  endFrame = lcl;
  retAdd = memory[endFrame - 5];
  memory[_arg] = memory[sp - 1];
  sp = _arg + 1;
  _that = memory[endFrame - 1];
  _this = memory[endFrame - 2];
  _arg = memory[endFrame - 3];
  lcl = memory[endFrame - 4];
  if (retAdd == 0 ) {
    goto RETURN_0;
  }
  if (retAdd == 1 ) {
    goto RETURN_1;
  }
  if (retAdd == 2 ) {
    goto RETURN_2;
  }
}
void loop() {}
