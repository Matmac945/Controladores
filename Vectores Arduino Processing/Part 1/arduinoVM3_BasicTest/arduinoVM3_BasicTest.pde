import java.util.Map;
PrintWriter outputFile;

void setup() {
  //create .ino file
  outputFile = createWriter("BasicTest/BasicTest.ino");

  //save ".vm" file in arrays
  String[] lines = loadStrings("BasicTest.vm");
  String[] currentLineParts;
  String currentLine;
  int etiqueta;

  // Memory map
  //statics RAM[16] - RAM[88]
  //stack RAM[89] - RAM[629]
  //heap RAM[630] - RAM[1600]

  outputFile.println("int memory [16000];" );
  outputFile.println("int LCL = 300;" );
  outputFile.println("int _static = 16;");
  outputFile.println("int temp = 5;" );
  outputFile.println("int ARG = 400;" );
  outputFile.println("int _this = 3000;" );
  outputFile.println("int _that = 3010;" );
  outputFile.println("int sp = 256;");

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
        outputFile.println("memory[sp++] = " + currentLineParts[2] + ";");
      }
      if (currentLineParts[1].equals("argument")) {
        outputFile.println("memory[sp++] = memory[ARG + " + currentLineParts[2] + "];");
      }
      if (currentLineParts[1].equals("local")) {
        outputFile.println("memory[sp++] = memory[LCL + " + currentLineParts[2] + "];");
      }
      if (currentLineParts[1].equals("this")) {
        outputFile.println("memory[sp++] = memory[_this + " + currentLineParts[2] + "];");
      }
      if (currentLineParts[1].equals("that")) {
        outputFile.println("memory[sp++] = memory[_that + " + currentLineParts[2] + "];");
      }
      if (currentLineParts[1].equals("temp")) {
        outputFile.println("memory[sp++] = memory[temp + " + currentLineParts[2] + "];");
      }
    } 
    // if pop
    if (currentLineParts[0].equals("pop")) {     
      if (currentLineParts[1].equals("local")) {
        outputFile.println("memory[LCL + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
      if (currentLineParts[1].equals("argument")) {
        outputFile.println("memory[ARG + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
      if (currentLineParts[1].equals("this")) {
        outputFile.println("memory[_this + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
      if (currentLineParts[1].equals("that")) {
        outputFile.println("memory[_that + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
      if (currentLineParts[1].equals("temp")) {
        outputFile.println("memory[temp + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
    } 
    // if add
    if (currentLineParts[0].equals("add")) { 
      adds();
    }
    // if equal
    if (currentLineParts[0].equals("eq")) {
      eq();
    }
    // if less than
    if (currentLineParts[0].equals("lt")) {
      lt();
    }
    //if greater than
    if (currentLineParts[0].equals("gt")) {
      gt();
    }
    // if substraction
    if (currentLineParts[0].equals("sub")) {
      subs();
    }
    //if negation
    if (currentLineParts[0].equals("neg")) {
      neg();
    }
    //if and bitwise
    if (currentLineParts[0].equals("and")) {
      and();
    }
    //if or bitwise
    if (currentLineParts[0].equals("or")) {
      or();
    }
    //if not bitwise
    if (currentLineParts[0].equals("not")) {
      not();
    }
  }

  printResult();


  outputFile.flush();
  outputFile.close();
}
