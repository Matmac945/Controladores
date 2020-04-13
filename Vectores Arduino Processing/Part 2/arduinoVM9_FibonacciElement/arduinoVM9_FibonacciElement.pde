import java.util.Map;
PrintWriter outputFile;
int var = 0;
int call_var = 0;

void setup() {
  //create .ino file
  outputFile = createWriter("Fibonacci_Element/Fibonacci_Element.ino");

  //save ".vm" file in arrays
  String[][] lines = new String[][]{
    loadStrings("FibonacciElement/Sys.vm"), 
    loadStrings("FibonacciElement/Main.vm") 
  };
  println(lines.length);
  String[] currentLineParts;
  String[] func;
  String currentLine;

  outputFile.println("int memory [16000];" );
  outputFile.println("int lcl = 0;" );
  outputFile.println("int _static = 0;");
  outputFile.println("int temp = 5;" );
  outputFile.println("int _arg = 0;" );
  outputFile.println("int _this = 0;" );
  outputFile.println("int _that = 0;" );
  outputFile.println("int retAdd = 0;" );
  outputFile.println("int sp = 256;");
  outputFile.println("int endFrame = 0;");
  
  outputFile.println("");
  outputFile.println("void setup(){");
  outputFile.println("Serial.begin(9600);");
  
  outputFile.println("");
  outputFile.println("memory[sp++] = 0 ;");
  outputFile.println("memory[sp++] = lcl;");
  outputFile.println("memory[sp++] =  _arg;");
  outputFile.println("memory[sp++] = _this;");
  outputFile.println("memory[sp++] = _that;");
  outputFile.println("_arg = sp - 5;");
  outputFile.println("lcl = sp;");
  outputFile.println("goto Sys_init;");
  outputFile.println("");

  for (int i = 0; i < lines.length; i++ ) {
    for (int j = 0; j<lines[i].length; j++) {
      String currentLines=lines[i][j];
      String[] currentLinePart = split(currentLines, ' ');
      if (currentLinePart[0].equals ("call")) {
        var++;
      }
    }
  }
  println(var);
  //for (int j = 0; j<lines.length; j++) {
  //  String currentLines=lines[j];
  //  String[] currentLinePart = split(currentLines, ' ');
  //  if (currentLinePart[0].equals ("call")) {
  //    var++;
  //  }
  //}


  for (int i = 0; i < lines.length; i++ ) {
    for (int j = 0; j<lines[i].length; j++) {
      currentLine=lines[i][j];

      currentLineParts = split(currentLine, ' ');

      // if function
      if (currentLineParts[0].equals("function")) {
        func = split(currentLineParts[1], '.');
        //outputFile.println("goto " + func[0] + ";");
        outputFile.println(func[0]+"_"+func[1]+":");
        if (!currentLineParts[2].equals ("0")) {
          outputFile.println("for(int i = 0; i < " + currentLineParts[2] + "; i ++){");
          outputFile.println("memory[sp++] = 0;");
          outputFile.println("}");
        }
      }
      // if Call
      if (currentLineParts[0].equals("call")) {
        func = split(currentLineParts[1], '.');
        //outputFile.println("goto " + func[0] + ";");
        outputFile.println("memory[sp++] = " + call_var + ";");
        outputFile.println("memory[sp++] = lcl;");
        outputFile.println("memory[sp++] =  _arg;");
        outputFile.println("memory[sp++] = _this;");
        outputFile.println("memory[sp++] = _that;");
        outputFile.println("_arg = sp - 5 -" + currentLineParts[2]+";");
        outputFile.println("lcl = sp;");
        outputFile.println("goto " + func[0]+"_"+func[1]+";");
        outputFile.println("RETURN_"+call_var+":");
        call_var++;
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
        if (currentLineParts[1].equals("WHILE")) {
          outputFile.println(currentLineParts[1] +":"); 
          printResult();
          outputFile.println("return;");
        } else {
          outputFile.println(currentLineParts[1] +":");
        }
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
      if (currentLineParts[0].equals("return")) {
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
  }

  outputFile.println("}");
  outputFile.println("void loop(){}");

  printFunctions();

  outputFile.flush();
  outputFile.close();
}
