int stack [238];
int sp = 0;
void setup() {
  Serial.begin(9600);
  stack[sp++] = 17;
  stack[sp++] = 17;
  if (stack[sp - 2] == stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 17;
  stack[sp++] = 16;
  if (stack[sp - 2] == stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 16;
  stack[sp++] = 17;
  if (stack[sp - 2] == stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 892;
  stack[sp++] = 891;
  if (stack[sp - 2] < stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 891;
  stack[sp++] = 892;
  if (stack[sp - 2] < stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 891;
  stack[sp++] = 891;
  if (stack[sp - 2] < stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 32767;
  stack[sp++] = 32766;
  if (stack[sp - 2] > stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 32766;
  stack[sp++] = 32767;
  if (stack[sp - 2] > stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 32766;
  stack[sp++] = 32766;
  if (stack[sp - 2] > stack[sp - 1]) {
    stack[sp - 2] = -1;
    sp--;
  }
  else {
    stack[sp - 2] = 0;
    sp--;
  }
  stack[sp++] = 57;
  stack[sp++] = 31;
  stack[sp++] = 53;
  stack[sp - 2] = stack[sp - 2] + stack[sp - 1];
  sp--;
  stack[sp++] = 112;
  stack[sp - 2] = stack[sp - 2] - stack[sp - 1];
  sp--;
  stack[sp - 1] = -stack[sp - 1];
  stack[sp - 2] = stack[sp - 2] & stack[sp - 1];
  sp--;
  stack[sp++] = 82;
  stack[sp - 2] = stack[sp - 2] | stack[sp - 1];
  sp--;
  stack[sp - 1] = ~stack[sp - 1];
  Serial.print("RAM[0] = ");
  Serial.print(sp + 256);
  Serial.print(" | ");
  Serial.println(sp);
  for (int i = 0; i < sp; i++) {
    Serial.print("RAM[");
    Serial.print(256 + i);
    Serial.print("] = ");
    Serial.println(stack[i]);
  }
}
void loop() {}
