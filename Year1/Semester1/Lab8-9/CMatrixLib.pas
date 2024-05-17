Unit CMatrixLib;

Interface
  uses ComplexLib;
  uses crt;

  const n = 3;
  Type cMatrix = array[1..n, 1..n] of complex;

  function AddCMatrices(a, b:cMatrix):cMatrix;
  function MultiplyCMatrices(a, b:cMatrix):cMatrix;
  function ProdCMatrix(a:cMatrix; b:real):cMatrix;
  function ZeroCMatrix():cMatrix;
  function OneCMatrix():cMatrix;
  function NormCMatrix(a:cMatrix):real;
  procedure CMatrixUI();
  procedure InputCMatrix(var a:cMatrix);
  procedure InputCMatrixRandom(var a:cMatrix; min, max:real);
  procedure OutputCMatrix(var a:cMatrix);

Implementation

  function AddCMatrices(a, b:cMatrix):cMatrix;
  var res:cMatrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := AddComplex(a[i][j], b[i][j]);

    AddCMatrices := res;
  end;
  
  function MultiplyCMatrices(a, b:cMatrix):cMatrix;
  var res:cMatrix; i,j,k:integer; sum:complex;
  begin
    for i := 1 to n do
    begin
      for j := 1 to n do
      begin
        sum := ZeroComplex();
        for k:= 1 to n do
        begin
          sum := AddComplex(sum, MultiplyComplex(a[i][k], b[k][j]));
        end;
        res[i][j] := sum;
      end;
    end;

    MultiplyCMatrices := res;
  end;

  function ProdCMatrix(a:cMatrix; b:real):cMatrix;
  var res:cMatrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := ProdComplex(a[i][j], b);
    ProdCMatrix := res;
  end;

  function ZeroCMatrix():cMatrix;
  var res:cMatrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := ZeroComplex();

    ZeroCMatrix := res;
  end;

  function OneCMatrix():cMatrix;
  var res:cMatrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := i to i do
        res[i][j] := OneComplex();
    for i := 1 to n do
      for j := i to i do
        res[i][j] := OneComplex();

    OneCMatrix := res;
  end;
  
  function NormCMatrix(a:cMatrix):real;
  var res:real; i,j:integer;
  begin
    res := 0;
    for i := 1 to n do
      for j := 1 to n do
        res := res + sqr(NormComplex(a[i][j]));
    res := sqrt(res);
    NormCMatrix := res;
  end;
  
  procedure CMatrixUI();
  var input, wait:integer; a,b,c:cMatrix; m:real;
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
        InputCMatrix(a);
        writeln('Second matrix ', n, 'x', n, ':');
        InputCMatrix(b);
        c := AddCMatrices(a, b);
        writeln('Result: ');
        OutputCMatrix(c);
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Multiply matrices');
        writeln('First matrix ', n, 'x', n, ':');
        InputCMatrix(a);
        writeln('Second matrix ', n, 'x', n, ':');
        InputCMatrix(b);
        c := MultiplyCMatrices(a, b);
        writeln('Result:');
        OutputCMatrix(c);
        writeln();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Prod matrix');
        writeln('Matrix ', n, 'x', n, ':');
        InputCMatrix(a);
        writeln('Number:');
        read(m);
        c := ProdCMatrix(a, m);
        writeln('Result:');
        OutputCMatrix(c);
        writeln();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Zero matrix ', n, 'x', n, ':');
        a := ZeroCMatrix();
        OutputCMatrix(a);
        writeln();
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('One matrix ', n, 'x', n, ':');
        a := OneCMatrix();
        OutputCMatrix(a);
        writeln();
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Norm matrix');
        writeln('Matrix ', n, 'x', n, ':');
        InputCMatrix(a);
        write('Result: ');
        write(NormCMatrix(a));
        writeln();
        read(wait);
      end;
    end;
  
  end;
  
  procedure InputCMatrix(var a:cMatrix);
  var i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
      begin
        write('[', i, ']', '[', j, ']: ');
        InputComplex(a[i][j]);
      end;
  end;
  
  procedure InputCMatrixRandom(var a:cmatrix; min, max:real);
  var res:cmatrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        InputComplexRandom(a[i][j], min, max);
  end;
  procedure OutputCMatrix(var a:cmatrix);
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