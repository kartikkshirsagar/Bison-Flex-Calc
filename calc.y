%{
    #define YYSTYPE double
    #include<stdio.h>
    #include<math.h>

%}

%token NUMBER
%token ADD SUB MUL DIV POW
%token EOL
%token OP CP
%%
    calclist: | calclist exp EOL {printf("=%f\n",$2);}
    ;

    exp : factor
        | exp ADD factor {$$ = $1+$3;}
        | exp SUB factor {$$ = $1-$3;}
    ;

    factor : term
            | factor MUL term {$$ = $1*$3;}
            | factor DIV term {$$ = $1/$3;}
            | factor POW term {$$ = pow($1,$3);}
    ;
    term : NUMBER
          | OP exp CP {$$=$2;}
    ;


%%
int main(int argc, char **argv)
{  
    yyparse();
}

yyerror(char *s){  fprintf(stderr, "error: %s\n", s);}