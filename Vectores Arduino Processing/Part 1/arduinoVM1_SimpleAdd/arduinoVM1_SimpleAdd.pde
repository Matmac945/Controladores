import java.util.Map;
PrintWriter outputFile;

void setup() {
  //create .ino file
  outputFile = createWriter("SimpleAdd/SimpleAdd.ino");

  //save ".vm" file in arrays
  String[] lines = loadStrings("SimpleAdd.vm");
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
    else if (currentLineParts[0].equals("add")) { 
      outputFile.println("stack[sp-2] = stack[sp-2] + stack[sp-1];");
      outputFile.println("sp--;");
    }
  }

  outputFile.println("Serial.print(\"RAM[0] = \");");
  outputFile.println("Serial.println(sp + 256);");
  outputFile.println("Serial.print(\"RAM[\");");
  outputFile.println("Serial.print(sp-1+256);");
  outputFile.println("Serial.print(\"] = \");");
  outputFile.println("Serial.print(stack[sp-1]);");

  println("}");
  outputFile.println("}");
  outputFile.println("void loop(){}");
  outputFile.flush();
  outputFile.close();
}
