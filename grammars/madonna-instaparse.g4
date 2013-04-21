program 
    : body 
    ;

body         
    : statementList
    ;

function
    : Identifier LP Identifier RP
    ;

lValue
    : Identifier 
    | function
    | differential
    | matrix
    ;

differential
    : DDT LP (Identifier|matrix) RP
    | Identifier PRIME+
    ;

matrix
    : Identifier LB expression (',' expression)* RB
    ;


statementList
    : statement + 
    ;

equation
    : lValue comparison rValue NL?
    ;

statement
    : initStatement 
    | integrationEquation
    | nextStatement
    | limitStatement
    | flowStatement
    | methodStatement
    | equation
    | differentialEquation 
    | renameStatement
    ;

differentialEquation 
    : differential equation NL?
    ;

integrationEquation
    : IntegrationParameter equation NL?
    ;

integrationMethod : IntegrationMethod;


nextStatement
    : NEXT equation 
    ;

methodStatement
    : METHOD integrationMethod NL
    ;

initStatement
    : INIT statement NL?
    ;

flowStatement
    : FLOW statement NL?
    ;

limitStatement
    : LIMIT statement NL?
    ;
    
conditionalExpression
    :  iF expression NL? tHEN expression (eLSE expression NL?)? 
    ;



iF : IF ;

tHEN : THEN ;

eLSE : ELSE;

rValue : expression ; 

expression
    :   function
    |   matrix
    |   conditionalExpression
    |   expression DOTDOT expression
    |   LP expression RP expression*
    |   expression LP expression* RP
    |   (MIN) expression
    |   expression ',' expression 
    |   expression (MULT|DIV) expression
    |   expression (PLUS|MIN) expression
    |   expression Comparison expression
    |   expression AND expression
    |   expression OR expression
    |   expression NOT expression
    |   value 
    ;

renameStatement
    : RENAME renamableParameter Comparison Identifier NL?
    ;

comparison : Comparison ;

renamableParameter
    : IntegrationParameter
    | TIME
    ;


value
    : number
    | Identifier
    ;

number
    : FloatingPoint 
    | Integer
    ;







WSNL : #"[ \t\r\n]"
     ;

NL  : ('\n' '\n'*) 
    | ('\r'?'\n')
    |  ('\n' WSNL*) 
    ;

INIT : ('I'|'i')('N'|'n')('I'|'i')('T'|'t')
     ;

LIMIT : ('L'|'l')('I'|'i')('M'|'m')('I'|'i')('T'|'t')
      ;

FLOW  : ('F'|'f')('L'|'l')('O'|'o')('W'|'w')
      ;

METHOD : ('M'|'m')('E'|'e')('T'|'t')('H'|'h')('O'|'o')('D'|'d')
       ;

RENAME : ('R'|'r')('E'|'e')('N'|'n')('A'|'a')('M'|'m')('E'|'e');

NEXT : ('N'|'n')('E'|'e')('X'|'x')('T'|'t')
     ;

IF  : ('I'|'i')('F'|'f')
    ;

THEN  : ('T'|'t')('H'|'h')('E'|'e')('N'|'n')
      ;

ELSE  : ('E'|'e')('L'|'l')('S'|'s')('E'|'e')
      ;



IntegrationMethod
    :   ('E'|'e')('U'|'u')('L'|'l')('E'|'e')('R'|'r')
    |   ('R'|'r')('K'|'k')'4'
    |   ('R'|'r')('K'|'k')'2'
    |  ('A'|'a')('U'|'u')('T'|'t')('O'|'o')
    |  ('S'|'s')('T'|'t')('I'|'i')('F'|'f')('F'|'f')
    ;

Identifier
    : TIME
    | IntegrationMethod
    | IntegrationParameter 
    | Letter (Letter|Integer)*
    ;

IntegrationParameter
    : ('S'|'s')('T'|'t')('A'|'a')('R'|'r')('T'|'t')('T'|'t')('I'|'i')('M'|'m')('E'|'e')
    | ('S'|'s')('T'|'t')('O'|'o')('P'|'p')('T'|'t')('I'|'i')('M'|'m')('E'|'e')
    | ('D'|'d')('T'|'t')
    | ('D'|'d')('T'|'t')('M'|'m')('I'|'i')('N'|'n')
    | ('D'|'d')('T'|'t')('M'|'m')('A'|'a')('X'|'x')
    | ('T'|'t')('O'|'o')('L'|'l')('E'|'e')('R'|'r')('A'|'a')('N'|'n')('C'|'c')('E'|'e')
    | ('D'|'d')('T'|'t')('O'|'o')('U'|'u')('T'|'t')
    | ('R'|'r')('O'|'o')('O'|'o')('T'|'t')('T'|'t')('O'|'o')('L'|'l')
    ;



TIME : ('T'|'t')('I'|'i')('M'|'m')('E'|'e');

Comparison
    : '<=' | '>=' | '>' | '<' | '<>' | '='
    ;

DOTDOT : '..';

FloatingPoint  
    : #"[0-9]"+ '.' #"[0-9]"+ Exponent?
    |   '.' "[0-9]"+ Exponent?            
    |   #"[0-9]"+ Exponent            
    ;

Integer : #"[0-9]" #"[0-9]"*  ; 

 
Exponent : ('e'|'E') ('+'|'-')? #"[0-9]"+ ;

SingleLineComment
    : <';' #".*" NL>
    ;

MultiLineComment
    : <'{' #".*" '}'> 
    ;


WS  : <#" \t"+ > 
    ;

DDT : ('D'|'d')'/'('D'|'d')('T'|'t');

LP  : '(';

RP  : ')';

LB : '[';

RB : ']';

MIN : '-';

POW : '**'|'^';

PLUS : '+';

MULT : '*';

DIV : '/';



PRIME : '\''
      ; 

AND : ('A'|'a')('N'|'n')('D'|'d');

OR : ('O'|'o')('R'|'r');

NOT : ('N'|'n')('O'|'o')('T'|'t');


Letter
    : LatinLetter | '_'
    ;

LatinLetter
    : #"[a-zA-Z]"
    ;

