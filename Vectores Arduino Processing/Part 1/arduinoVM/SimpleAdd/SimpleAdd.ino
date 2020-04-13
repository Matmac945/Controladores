int stack [238];
int sp = 0;
void setup(){
Serial.begin(9600);
stack[sp++] = 7;
stack[sp++] = 8;
stack[sp-2] = stack[sp-2] + stack[sp-1];
sp--;
Serial.print("RAM[0] = ");
Serial.println(sp + 256);
Serial.print("RAM[");
Serial.print(sp-1+256);
Serial.print("] = ");
Serial.print(stack[sp-1]);
}
void loop(){}
