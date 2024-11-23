grammar SimpleLang;

prog : dec+ EOF;

dec
    : typed_idfr LParen (vardec+=typed_idfr(Comma vardec+=typed_idfr)*)? RParen body
;

typed_idfr
    : type Idfr
;

type
    : Int     #IntType
    | Bool    #BoolType
    | Unit    #UnitType
;

body
    : LBrace (typed_idfr Assign ene+=exp Semicolon)* ene+=exp(Semicolon ene+=exp)* RBrace
;

block
    : LBrace ene+=exp(Semicolon ene+=exp)* RBrace
;

exp
    : Idfr Assign exp                                       #AssignExpr
    | LParen exp binop exp RParen                           #BinOpExpr
    | Idfr LParen (args+=exp (Comma args+=exp)*)? RParen    #InvokeExpr
    | block                                                 #BlockExpr
    | If exp Then block Else block                          #IfExpr
    | While exp Do block                                    #WhileExpr
    | Repeat block Until exp                                #RepeatExpr
    | Print exp                                             #PrintExpr
    | Space                                                 #SpaceExpr
    | NewLine                                               #NewLineExpr
    | Skip                                                  #SkipExpr
    | Idfr                                                  #IdExpr
    | IntLit                                                #IntExpr
    | BoolLit                                               #BoolLitExpr
;

binop
    : Eq              #EqBinop
    | Less            #LessBinop
    | LessEq          #LessEqBinop
    | Greater         #GreaterBinop
    | GreaterEq       #GreaterEqBinop
    | Plus            #PlusBinop
    | Minus           #MinusBinop
    | Times           #TimesBinop
    | Div             #DivBinop
    | And             #AndBinop
    | Or              #OrBinop
    | Xor             #XorBinop
;

/* Tokens */
LParen : '(' ;
Comma : ',' ;
RParen : ')' ;
LBrace : '{' ;
Semicolon : ';' ;
RBrace : '}' ;

Eq : '==' ;
Less : '<' ;
LessEq : '<=' ;
Greater : '>' ;
GreaterEq : '>=' ;
Plus : '+' ;
Times : '*' ;
Minus : '-' ;
Div : '/' ;
And : '&' ;
Or : '|' ;
Xor : '^' ;

Assign : ':=' ;

Print : 'print' ;
Space : 'space' ;
NewLine : 'newline' ;
Skip : 'skip' ;
If : 'if' ;
Then : 'then' ;
Else : 'else' ;

While : 'while' ;
Repeat : 'repeat' ;
Until : 'until' ;
Do : 'do' ;

Int : 'int' ;
Bool : 'bool' ;
Unit : 'unit' ;

BoolLit : 'true' | 'false' ;
IntLit : '0' | ('-'? [1-9][0-9]*) ;
Idfr : [a-z][A-Za-z0-9_]* ;
WS : [ \n\r\t]+ -> skip ;