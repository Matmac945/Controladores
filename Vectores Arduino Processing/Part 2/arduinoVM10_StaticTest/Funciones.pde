void subs() {
  outputFile.println("memory[sp-2] = memory[sp-2] - memory[sp-1];");
  outputFile.println("sp--;");
}
void adds() {
  outputFile.println("memory[sp-2] = memory[sp-2] + memory[sp-1];");
  outputFile.println("sp--;");
}
void eq() {
  outputFile.println("if(memory[sp-2] == memory[sp-1]){");
  outputFile.println("memory[sp-2] = -1;");
  outputFile.println("sp--;");
  outputFile.println("}");
  outputFile.println("else {");
  outputFile.println("memory[sp-2] = 0;");
  outputFile.println("sp--;");
  outputFile.println("}");
}
void lt() {
  outputFile.println("if(memory[sp-2] < memory[sp-1]){");
  outputFile.println("memory[sp-2] = -1;");
  outputFile.println("sp--;");
  outputFile.println("}");
  outputFile.println("else {");
  outputFile.println("memory[sp-2] = 0;");
  outputFile.println("sp--;");
  outputFile.println("}");
}
void gt() {
  outputFile.println("if(memory[sp-2] > memory[sp-1]){");
  outputFile.println("memory[sp-2] = -1;");
  outputFile.println("sp--;");
  outputFile.println("}");
  outputFile.println("else {");
  outputFile.println("memory[sp-2] = 0;");
  outputFile.println("sp--;");
  outputFile.println("}");
}
void not() {
  outputFile.println("memory[sp-1] = ~memory[sp-1];");
}
void neg() {
  outputFile.println("memory[sp-1] = -memory[sp-1];");
}
void or() {
  outputFile.println("memory[sp-2] = memory[sp-2] | memory[sp-1];");
  outputFile.println("sp--;");
}
void and() {
  outputFile.println("memory[sp-2] = memory[sp-2] & memory[sp-1];");
  outputFile.println("sp--;");
}

void printResult() {
  outputFile.println("memory[0] = sp;");
  outputFile.println("memory[1] = lcl;");
  outputFile.println("memory[2] = _arg;");
  outputFile.println("memory[3] = _this;");
  outputFile.println("memory[4] = _that;");

  outputFile.println("for(int i = 0; i < 16000; i++){");
  outputFile.println("if(memory[i] != 0){");
  outputFile.println("Serial.print(\"RAM[\");");
  outputFile.println("Serial.print(i);");
  outputFile.println("Serial.print(\"] = \");");
  outputFile.println("Serial.println(memory[i]);");
  outputFile.println("}");
  outputFile.println("}");
}

void _return() {
  outputFile.println("endFrame = lcl;");
  outputFile.println("retAdd = memory[endFrame - 5];");
  outputFile.println("memory[_arg] = memory[sp-1];");
  outputFile.println("sp = _arg + 1;");
  outputFile.println("_that = memory[endFrame - 1];");
  outputFile.println("_this = memory[endFrame - 2];");
  outputFile.println("_arg = memory[endFrame - 3];");
  outputFile.println("lcl = memory[endFrame - 4];");
  for (int i = 0; i < var; i++ )
  {  
    outputFile.println("if(retAdd == " + i + " ){");
    outputFile.println("goto RETURN_" + i + ";");
    outputFile.println("}");
  }
}
void printFunctions() {
}
