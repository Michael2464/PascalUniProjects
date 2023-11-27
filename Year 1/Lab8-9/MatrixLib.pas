Unit MatrixLib;

Interface
  uses ComplexLib;
  uses crt;

  const n = 2;
  Type matrix = array[1..n, 1..n] of complex;

  function AddMatrices(a, b:matrix):matrix;
  function MultiplyMatrices(a, b:matrix):matrix;
  function ProdMatrix(a:matrix; b:real):matrix;
  function ZeroMatrix():matrix;
  function OneMatrix():matrix;
  function NormMatrix(a:matrix):real;
  procedure MatrixUI();
  procedure InputMatrix(var a:matrix);
  procedure InputMatrixRandom(var a:matrix; min, max:real);
  procedure OutputMatrix(var a:matrix);

Implementation

  function AddMatrices(a, b:matrix):matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := AddComplex(a[i][j], b[i][j]);

    AddMatrices := res;
  end;

  function MultiplyMatrices(a, b:matrix):matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := MultiplyComplex(a[i][j], b[i][j]);

    MultiplyMatrices := res;
  end;

  function ProdMatrix(a:matrix; b:real):matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := ProdComplex(a[i][j], b);
    ProdMatrix := res;
  end;

  function ZeroMatrix():matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := ZeroComplex();

    ZeroMatrix := res;
  end;

  function OneMatrix():matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := OneComplex();

    OneMatrix := res;
  end;
  
  function NormMatrix(a:matrix):real;
  var res:real; i,j:integer;
  begin
    res := 0;
    for i := 1 to n do
      for j := 1 to n do
        res := res + sqr(NormComplex(a[i][j]));
    res := sqrt(res);
    NormMatrix := res;
  end;
  
  procedure MatrixUI();
  var input, wait:integer; a,b,c:matrix; m:real;
  begin
    input := -1;
    
    while(input <> 0) do 
    begin
      ClrScr;
      writeln('(Complex matrix)');
      writeln('Enter option:');
      writeln('1) Add matrices');
      writeln('2) Multiply matrices');
      writeln('3) Prod matrix');
      writeln('4) Zero matrix');
      writeln('5) One matrix');
      writeln('6) Norm matrix');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Add matrices');
        writeln('First matrix ', n, 'x', n, ':');
        InputMatrix(a);
        writeln('Second matrix ', n, 'x', n, ':');
        InputMatrix(b);
        c := AddMatrices(a, b);
        writeln('Result: ');
        OutputMatrix(c);
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Multiply matrices');
        writeln('First matrix ', n, 'x', n, ':');
        InputMatrix(a);
        writeln('Second matrix ', n, 'x', n, ':');
        InputMatrix(b);
        c := MultiplyMatrices(a, b);
        writeln('Result:');
        OutputMatrix(c);
        writeln();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Prod matrix');
        writeln('Matrix ', n, 'x', n, ':');
        InputMatrix(a);
        writeln('Number:');
        read(m);
        c := ProdMatrix(a, m);
        writeln('Result:');
        OutputMatrix(c);
        writeln();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Zero matrix ', n, 'x', n, ':');
        a := ZeroMatrix();
        OutputMatrix(a);
        writeln();
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('One matrix ', n, 'x', n, ':');
        a := OneMatrix();
        OutputMatrix(a);
        writeln();
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Norm matrix');
        writeln('Matrix ', n, 'x', n, ':');
        InputMatrix(a);
        write('Result: ');
        write(NormMatrix(a));
        writeln();
        read(wait);
      end;
    end;
  
  end;
  
  procedure InputMatrix(var a:matrix);
  var i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        InputComplex(a[i][j]);
  end;
  
  procedure InputMatrixRandom(var a:matrix; min, max:real);
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        InputComplexRandom(a[i][j], min, max);
  end;
  procedure OutputMatrix(var a:matrix);
  var i,j:integer;
  begin
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        //goToXY(j+7, i);
        OutputComplex(a[i][j]);
        if(j <> n) then write(' | ');
      end;
      writeln();
    end;
  end;
end.