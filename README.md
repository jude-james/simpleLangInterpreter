***Interpreter with ANTLR parser generator***

Language syntax is given by the context free grammer:

PROG →	DEC+<br/>
DEC →	TYPE IDFR "(" VARDEC ")" BODY<br/>
VARDEC →	(TYPE IDFR ("," TYPE IDFR)*)?<br/>
BODY →	"{" (TYPE IDFR ":=" EXP ";")* ENE "}"<br/>
BLOCK →	"{" ENE "}"<br/>
ENE →	EXP (";" EXP)*<br/>
EXP →	IDFR<br/>
|	INTLIT<br/>
|	BOOLLIT<br/>
|	IDFR ":=" EXP<br/>
|	"(" EXP BINOP EXP ")"<br/>
|	IDFR "(" ARGS ")"<br/>
|	BLOCK<br/>
|	"if" EXP "then" BLOCK "else" BLOCK<br/>
|	"while" EXP "do" BLOCK<br/>
|	"repeat" BLOCK "until" EXP<br/>
|	"print" EXP<br/>
|	"space"<br/>
|	"newline"<br/>
|	"skip"<br/>
ARGS →	(EXP ("," EXP)*)?<br/>
BINOP →	"=="  |  "<"  |  ">"  |  "<="  |  ">="<br/>
|	 "+"  |  "-"  |  "*"  |   "/"  |  "&"  |  "|"  | "^"<br/>
TYPE →	"int" | "bool" | "unit"<br/>
IDFR →	(an identifier)<br/>
INTLIT →	(an integer)<br/>
BOOLLIT →	"true" | "false"

Example:

    int main(int n) {
        int i := 0;
        while (i < n) do {
            print_row(i);
            i := (i + 1)
        };
        0
    }

    unit print_row(int n) {
        int i := 0;
        while (i < n) do {
            print 1;
            i := (i + 1)
        };
        print newline
    }
    
