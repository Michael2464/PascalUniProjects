uses ComplexLib;
uses MatrixLib;
uses CMatrixLib;
uses VectorLib;
uses CVectorLib;
uses Stack;
uses StudentMenu;
uses crt;

var input:integer;

var topStack1, bottomStack1: PtrS;
var topStack2, bottomStack2: PtrS;

begin
  input := -1;
  
  while(input <> 0) do
  begin
    ClrScr;
    writeln('Enter option:');
    writeln('1) Complex numbers');
    writeln('2) CMatrices');
    writeln('3) Matrices');
    writeln('4) Vectors');
    writeln('5) CVectors');
    writeln('6) Stack');
    writeln('7) Student Menu');
    writeln('0) Exit');
    read(input);
    
    case (input) of 
      1: ComplexUI();
      2: CMatrixUI();
      3: MatrixUI();
      4: VectorUI();
      5: CVectorUI();
      6: StackUI(topStack1, bottomStack1, topStack2, bottomStack2);
      7: StudentMenuUI();
    end;
  end;
  
end.