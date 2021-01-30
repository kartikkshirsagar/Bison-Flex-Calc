%{
   #define YYSTYPE double
   #include "calc.tab.h"
   #include <stdlib.h>
%}

digit [0-9]
integer {digit}+
real {integer}("."{integer})?

%%
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"^"     { return POW; }
{real}  {yylval=atof(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   {}
"("     {return OP;}
")"     {return CP;}
.       { printf("Mystery character %s\n", yytext); }


%%

