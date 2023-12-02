uses ComplexLib;
uses MatrixLib;
uses VectorLib;
uses CVectorLib;
uses Crt;

var input:integer;

begin
  input := -1;
  
  while(input <> 0) do
  begin
    ClrScr;
    writeln('Enter option:');
    writeln('1) Complex numbers');
    writeln('2) Complex matrices');
    writeln('3) Matrices');
    writeln('4) Vectors');
    writeln('5) CVectors');
    writeln('0) Exit');
    read(input);
    
    case (input) of 
      1: ComplexUI();
      2: CMatrixUI();
      3: MatrixUI();
      4: VectorUI();
      5: CVectorUI();
    end;
  end;
  
end.