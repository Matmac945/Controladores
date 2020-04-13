import java.util.Map;
PrintWriter outputFile;

void setup() {
  //create .ino file
  outputFile = createWriter("StackTest/StackTest.ino");

  //save ".vm" file in arrays
  String[] lines = loadStrings("StackTest.vm");
  String[] currentLineParts;
  String currentLine;
  int etiqueta;

  outputFile.println("int stack [238];" );
  outputFile.println("int sp = 0;");

  print("void setup(){");
  outputFile.println("void setup(){");
  outputFile.println("Serial.begin(9600);");
  for (int i = 0; i<lines.length; i++) {
    currentLine=lines[i];

    currentLineParts = split(currentLine, ' ');

    // if push
    if (currentLineParts[0].equals("push")) {
      //if constant
      if (currentLineParts[1].equals("constant")) {
        outputFile.println("stack[sp++] = " + currentLineParts[2] + ";");
      }
    } 
    // if add
    if (currentLineParts[0].equals("add")) { 
      outputFile.println("stack[sp-2] = stack[sp-2] + stack[sp-1];");
      outputFile.println("sp--;");
    }
    if (currentLineParts[0].equals("eq")) {
      outputFile.println("if(stack[sp-2] == stack[sp-1]){");
      outputFile.println("stack[sp-2] = -1;");
      outputFile.println("sp--;");
      outputFile.println("}");
      outputFile.println("else {");
      outputFile.println("stack[sp-2] = 0;");
      outputFile.println("sp--;");
      outputFile.println("}");
    }
    if (currentLineParts[0].equals("lt")) {
      outputFile.println("if(stack[sp-2] < stack[sp-1]){");
      outputFile.println("stack[sp-2] = -1;");
      outputFile.println("sp--;");
      outputFile.println("}");
      outputFile.println("else {");
      outputFile.println("stack[sp-2] = 0;");
      outputFile.println("sp--;");
      outputFile.println("}");
    }
    if (currentLineParts[0].equals("gt")) {
      outputFile.println("if(stack[sp-2] > stack[sp-1]){");
      outputFile.println("stack[sp-2] = -1;");
      outputFile.println("sp--;");
      outputFile.println("}");
      outputFile.println("else {");
      outputFile.println("stack[sp-2] = 0;");
      outputFile.println("sp--;");
      outputFile.println("}");
    }
    if (currentLineParts[0].equals("sub")) {
      outputFile.println("stack[sp-2] = stack[sp-2] - stack[sp-1];");
      outputFile.println("sp--;");
    }
    if (currentLineParts[0].equals("neg")) {
      outputFile.println("stack[sp-1] = -stack[sp-1];");
    }
    if (currentLineParts[0].equals("and")) {
      outputFile.println("stack[sp-2] = stack[sp-2] & stack[sp-1];");
      outputFile.println("sp--;");
    }
    if (currentLineParts[0].equals("or")) {
      outputFile.println("stack[sp-2] = stack[sp-2] | stack[sp-1];");
      outputFile.println("sp--;");
    }
    if (currentLineParts[0].equals("not")) {
      outputFile.println("stack[sp-1] = ~stack[sp-1];");
    }
  }

  printResult();

  println("}");
  outputFile.println("}");
  outputFile.println("void loop(){}");
  outputFile.flush();
  outputFile.close();
}

void printResult() {
  outputFile.println("Serial.print(\"RAM[0] = \");");
  outputFile.println("Serial.print(sp + 256);");
  outputFile.println("Serial.print(\" | \");");
  outputFile.println("Serial.println(sp);");
  outputFile.println("for(int i = 0; i < sp; i++){");
  outputFile.println("Serial.print(\"RAM[\");");
  outputFile.println("Serial.print(256 + i);");
  outputFile.println("Serial.print(\"] = \");");
  outputFile.println("Serial.println(stack[i]);");
  outputFile.println("}");
}
