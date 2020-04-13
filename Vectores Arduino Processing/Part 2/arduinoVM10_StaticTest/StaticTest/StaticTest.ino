int memory [16000];
int lcl = 0;
int _static = 16;
int temp = 5;
int _arg = 0;
int _this = 0;
int _that = 0;
int retAdd = 0;
int sp = 256;
int endFrame = 0;

void setup(){
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
memory[sp++] = 6;
memory[sp++] = 8;
memory[sp++] = 0;
memory[sp++] = lcl;
memory[sp++] =  _arg;
memory[sp++] = _this;
memory[sp++] = _that;
_arg = sp - 5 -2;
lcl = sp;
goto Class1_set;
RETURN_0:
memory[temp + 0] = memory[sp-1];
sp--;
memory[sp++] = 23;
memory[sp++] = 15;
memory[sp++] = 1;
memory[sp++] = lcl;
memory[sp++] =  _arg;
memory[sp++] = _this;
memory[sp++] = _that;
_arg = sp - 5 -2;
lcl = sp;
goto Class2_set;
RETURN_1:
memory[temp + 0] = memory[sp-1];
sp--;
memory[sp++] = 2;
memory[sp++] = lcl;
memory[sp++] =  _arg;
memory[sp++] = _this;
memory[sp++] = _that;
_arg = sp - 5 -0;
lcl = sp;
goto Class1_get;
RETURN_2:
memory[sp++] = 3;
memory[sp++] = lcl;
memory[sp++] =  _arg;
memory[sp++] = _this;
memory[sp++] = _that;
_arg = sp - 5 -0;
lcl = sp;
goto Class2_get;
RETURN_3:
WHILE:
memory[0] = sp;
memory[1] = lcl;
memory[2] = _arg;
memory[3] = _this;
memory[4] = _that;
for(int i = 0; i < 16000; i++){
if(memory[i] != 0){
Serial.print("RAM[");
Serial.print(i);
Serial.print("] = ");
Serial.println(memory[i]);
}
}
return;
goto WHILE;
Class1_set:
memory[sp++] = memory[_arg + 0];
memory[_static + 00] = memory[sp-1];
sp--;
memory[sp++] = memory[_arg + 1];
memory[_static + 10] = memory[sp-1];
sp--;
memory[sp++] = 0;
endFrame = lcl;
retAdd = memory[endFrame - 5];
memory[_arg] = memory[sp-1];
sp = _arg + 1;
_that = memory[endFrame - 1];
_this = memory[endFrame - 2];
_arg = memory[endFrame - 3];
lcl = memory[endFrame - 4];
if(retAdd == 0 ){
goto RETURN_0;
}
if(retAdd == 1 ){
goto RETURN_1;
}
if(retAdd == 2 ){
goto RETURN_2;
}
if(retAdd == 3 ){
goto RETURN_3;
}
Class1_get:
memory[sp++] = memory[_static + 00];
memory[sp++] = memory[_static + 10];
memory[sp-2] = memory[sp-2] - memory[sp-1];
sp--;
endFrame = lcl;
retAdd = memory[endFrame - 5];
memory[_arg] = memory[sp-1];
sp = _arg + 1;
_that = memory[endFrame - 1];
_this = memory[endFrame - 2];
_arg = memory[endFrame - 3];
lcl = memory[endFrame - 4];
if(retAdd == 0 ){
goto RETURN_0;
}
if(retAdd == 1 ){
goto RETURN_1;
}
if(retAdd == 2 ){
goto RETURN_2;
}
if(retAdd == 3 ){
goto RETURN_3;
}
Class2_set:
memory[sp++] = memory[_arg + 0];
memory[_static + 02] = memory[sp-1];
sp--;
memory[sp++] = memory[_arg + 1];
memory[_static + 12] = memory[sp-1];
sp--;
memory[sp++] = 0;
endFrame = lcl;
retAdd = memory[endFrame - 5];
memory[_arg] = memory[sp-1];
sp = _arg + 1;
_that = memory[endFrame - 1];
_this = memory[endFrame - 2];
_arg = memory[endFrame - 3];
lcl = memory[endFrame - 4];
if(retAdd == 0 ){
goto RETURN_0;
}
if(retAdd == 1 ){
goto RETURN_1;
}
if(retAdd == 2 ){
goto RETURN_2;
}
if(retAdd == 3 ){
goto RETURN_3;
}
Class2_get:
memory[sp++] = memory[_static + 02];
memory[sp++] = memory[_static + 12];
memory[sp-2] = memory[sp-2] - memory[sp-1];
sp--;
endFrame = lcl;
retAdd = memory[endFrame - 5];
memory[_arg] = memory[sp-1];
sp = _arg + 1;
_that = memory[endFrame - 1];
_this = memory[endFrame - 2];
_arg = memory[endFrame - 3];
lcl = memory[endFrame - 4];
if(retAdd == 0 ){
goto RETURN_0;
}
if(retAdd == 1 ){
goto RETURN_1;
}
if(retAdd == 2 ){
goto RETURN_2;
}
if(retAdd == 3 ){
goto RETURN_3;
}
}
void loop(){}
