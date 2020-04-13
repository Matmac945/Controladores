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
  // print in Arduino's serial console for comparation
  //outputFile.println("Serial.print(\"RAM[0] = \");");
  //outputFile.println("Serial.print(sp + (256 - 89));");
  //outputFile.println("Serial.print(\" | \");");
  //outputFile.println("Serial.println(sp);");
  outputFile.println("for(int i = 0; i < 16000; i++){");
  outputFile.println("if(memory[i] != 0){");
  outputFile.println("Serial.print(\"RAM[\");");
  outputFile.println("Serial.print(i);");
  outputFile.println("Serial.print(\"] = \");");
  outputFile.println("Serial.println(memory[i]);");
  outputFile.println("}");
  outputFile.println("}");
  
  println("}");
  outputFile.println("}");
  outputFile.println("void loop(){}");
}
