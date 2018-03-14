%{#include <stdio.h>
  int yylex(void);
  void yyerror(char*);
%}

%union { char* str; int nb; }

%token tIF tWHILE tELSE tMAIN tCONST tINTEGER tRETURN tPRINTF tACOLGAU tACOLDROI tSEMICOLON tCOMMA tPLUS tMINUS tSLASH tMUL tEQUAL tPARGAU tPARDROI tEOF tTAB tSPACE tINT tVARIABLE tEXP
%type <str> tVARIABLE
%type <nb> tINTEGER
%%

  Main :
    tINT tSPACE tMAIN tPARGAU tPARDROI tACOLGAU Content tACOLDROI
    {
      printf("Declaration de la fonction : 'main' \n");
    }
    ;

  Content : {printf("Content : 'none' \n")}
    |VariableDefinition {};
    |VariableDeclaration {};

  VariableDeclaration : Variable tSEMICOLON {};
  VariableDefinition : Variable tSPACE tEQUAL tSPACE tINTEGER tSPACE tSEMICOLON {printf("Valeur de la variable : '%d'\n",$3)};
  Variable :
    |tINT tSPACE tVARIABLE RemVariable {printf("Variable : '%s' \n", $3)};

  RemVariable : {printf("Variable : 'none' \n")}
    |tCOMMA tVARIABLE RemVariable {printf("Variable 2 : '%s' \n", $2)}


%%

int main(void) {
  yyparse();
  return 0;
}

/*Program :
  | Fonction Program
  ;

Fonction :
  tVARIABLE tPARGAU tPARDROI tACOLGAU tACOLDROI
  {
    printf("Declaration de la fonction : '%s' \n", $1);
  }
  ; */
