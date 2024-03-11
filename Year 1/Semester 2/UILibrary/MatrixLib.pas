Unit MatrixLib;

Interface
  uses crt;

  const n = 3;
  Type Matrix = array[1..n, 1..n] of real;

  function AddMatrices(a, b:Matrix):Matrix;
  function MultiplyMatrices(a, b:Matrix):Matrix;
  function ProdMatrix(a:Matrix; b:real):Matrix;
  function ZeroMatrix():Matrix;
  function OneMatrix():Matrix;
  function NormMatrix(a:Matrix):real;
  procedure MatrixUI();
  procedure InputMatrix(var a:Matrix);
  procedure InputMatrixRandom(var a:Matrix; min, max:real);
  procedure OutputMatrix(var a:Matrix);

Implementation

  function AddMatrices(a, b:Matrix):Matrix;
  var res:Matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := a[i][j] + b[i][j];

    AddMatrices := res;
  end;

  function MultiplyMatrices(a, b:Matrix):Matrix;
  var res:Matrix; i,j,k:integer; num:real;
  begin
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        num := 0;
        for k:= 1 to n do
        begin
          num := num + a[i][k] * b[k][j];
        end;
        res[i][j] := num;
      end;
    end;

    MultiplyMatrices := res;
  end;

  function ProdMatrix(a:Matrix; b:real):Matrix;
  var res:Matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := a[i][j] * b;
    ProdMatrix := res;
  end;

  function ZeroMatrix():Matrix;
  var res:Matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := 0;

    ZeroMatrix := res;
  end;

  function OneMatrix():Matrix;
  var res:Matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := 0;
    for i := 1 to n do
      for j := i to i do
        res[i][j] := 1;

    OneMatrix := res;
  end;
  
  function NormMatrix(a:Matrix):real;
  var res:real; i,j:integer;
  begin
    res := 0;
    for i := 1 to n do
      for j := 1 to n do
        res := res + sqr(a[i][j]);
    res := sqrt(res);
    NormMatrix := res;
  end;
  
  procedure MatrixUI();
  var input, wait:integer; a,b,c:Matrix; m:real;
  begin
    input := -1;
    
    while(input <> 0) do 
    begin
      ClrScr;
      writeln('(Matrix)');
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
      begin
        write('[', i, ']', '[', j, ']: ');
        read(a[i][j]);
      end;
  end;
  
  procedure InputMatrixRandom(var a:matrix; min, max:real);
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        a[i][j] := random(min, max);
  end;
  
  procedure OutputMatrix(var a:matrix);
  var i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
      begin
        goToXY(3*j+7, i+20);
        write(a[i][j]);
      end;
  end;
end.