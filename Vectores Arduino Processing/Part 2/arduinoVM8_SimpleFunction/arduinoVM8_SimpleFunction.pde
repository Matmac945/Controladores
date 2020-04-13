import java.util.Map;
PrintWriter outputFile;

void setup() {
  //create .ino file
  outputFile = createWriter("SimpleFunction/SimpleFunction.ino");

  //save ".vm" file in arrays
  String[] lines = loadStrings("SimpleFunction.vm");
  String[] currentLineParts;
  String currentLine;
  String[] func;

  outputFile.println("int memory [16000];" );
  outputFile.println("int lcl = 317;" );
  outputFile.println("int _static = 16;");
  outputFile.println("int temp = 5;" );
  outputFile.println("int _arg = 310;" );
  outputFile.println("int _this = 3000;" );
  outputFile.println("int _that = 4000;" );
  outputFile.println("int sp = 317;");

  outputFile.println("void setup(){");
  outputFile.println("memory [310] = 1234;" );
  outputFile.println("memory [311] = 37;" );
  outputFile.println("memory [312] = 1000;" );
  outputFile.println("memory [313] = 305;" );
  outputFile.println("memory [314] = 300;" );
  outputFile.println("memory [315] = 3010;" );
  outputFile.println("memory [316] = 4010;" );
  outputFile.println("Serial.begin(9600);");
  for (int i = 0; i<lines.length; i++) {
    currentLine=lines[i];

    currentLineParts = split(currentLine, ' ');

    // if function
    if (currentLineParts[0].equals("function")) {
      func = split(currentLineParts[1], '.');
      outputFile.println("goto " + func[0] + ";");
      outputFile.println(func[0]+":");
      outputFile.println("for(int i = 0; i < " + currentLineParts[2] + "; i ++){");
      outputFile.println("memory[sp++] = 0;");
      outputFile.println("}");
    }
    // if push
    if (currentLineParts[0].equals("push")) {
      //if constant
      if (currentLineParts[1].equals("constant")) {
        outputFile.println("memory[sp++] = " + currentLineParts[2] + ";");
      }
      if (currentLineParts[1].equals("static")) {
        outputFile.println("memory[sp++] = memory[_static + " + currentLineParts[2] + "];");
      }
      if (currentLineParts[1].equals("argument")) {
        outputFile.println("memory[sp++] = memory[_arg + " + currentLineParts[2] + "];");
      }
      if (currentLineParts[1].equals("local")) {
        outputFile.println("memory[sp++] = memory[lcl + " + currentLineParts[2] + "];");
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
      if (currentLineParts[1].equals("pointer")) {
        if (currentLineParts[2].equals("0")) {
          outputFile.println("memory[sp++] = _this;");
        }
        if (currentLineParts[2].equals("1")) {
          outputFile.println("memory[sp++] = _that;");
        }
      }
    }
    // if pop
    if (currentLineParts[0].equals("pop")) {     
      if (currentLineParts[1].equals("local")) {
        outputFile.println("memory[lcl + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
      if (currentLineParts[1].equals("argument")) {
        outputFile.println("memory[_arg + " + currentLineParts[2] + "] = memory[sp-1];");
        outputFile.println("sp--;");
      }
      if (currentLineParts[1].equals("static")) {
        outputFile.println("memory[_static + " + currentLineParts[2] + "] = memory[sp-1];");
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
      if (currentLineParts[1].equals("pointer")) {
        if (currentLineParts[2].equals("0")) {
          outputFile.println("_this = memory[sp-1];");
          outputFile.println("sp--;");
        }
        if (currentLineParts[2].equals("1")) {
          outputFile.println("_that = memory[sp-1];");
          outputFile.println("sp--;");
        }
      }
    }
    // if label
    if (currentLineParts[0].equals("label")) {
      outputFile.println(currentLineParts[1] + ":");
    }
    // if goto
    if (currentLineParts[0].equals("goto")) {
      outputFile.println("goto " + currentLineParts[1] + ";");
    }
    // if "if-goto"
    if (currentLineParts[0].equals("if-goto")) { 
      outputFile.println("sp--;");
      outputFile.println("if(memory[sp]){");
      outputFile.println("goto " + currentLineParts[1] + ";");
      outputFile.println("}");
    }
    // if return
    if(currentLineParts[0].equals("return")){
     _return();
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

  outputFile.println("}");
  outputFile.println("void loop(){}");

  printFunctions();

  outputFile.flush();
  outputFile.close();
}
