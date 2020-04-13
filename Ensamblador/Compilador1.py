import collections
C_PUSH
C_POP
class Parser():
    def __init__(self, fileName):
        pass
    def hasMoreComands(self, parameter_list):
        pass
    def comandType(self):
        C_ARITHMETIC 
        C_PUSH 
        C_POP 
        C_LABEL 
        C_GOTO 
        C_IF 
        C_FUNCTION
        C_RETURN
        C_CALL
        pass
    def Advance(self, parameter_list):
        pass
    def arg1():
        pass
    def arg2():
        pass

class CodeWriter():
    def __init__(self, code):
        pass
    def pushConstant1(self):
        self.write('@1')
        self.write('D=A')
        self.write('@SP')
        self.write('A=M')
        self.write('M=D')
        self.write('@SP')
        self.write('M=M+1');
        pass