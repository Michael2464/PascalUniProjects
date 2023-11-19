Unit MatrixLib;
Interface
  uses ComplexLib;
  uses crt;
  const n = 5;
  Type matrix = array[1..n, 1..n] of complex;

  function AddMatrix(a, b:matrix):matrix;
  function MultiplyMatrix(a, b:matrix):matrix;
  function ProdMatrix(a:matrix; b:real):matrix;
  function ZeroMatrix():matrix;
  function OneMatrix():matrix;
  function NormMatrix(a:matrix):real;
  procedure InputMatrix(var a:matrix);
  procedure InputMatrixRandom(var a:matrix; min, max:real);
  procedure OutputMatrix(var a:matrix);

Implementation

  function AddMatrix(a, b:matrix):matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := AddComplex(a[i][j], b[i][j]);

    AddMatrix := res;
  end;

  function MultiplyMatrix(a, b:matrix):matrix;
  var res:matrix; i,j:integer;
  begin
    for i := 1 to n do
      for j := 1 to n do
        res[i][j] := MultiplyComplex(a[i][j], b[i][j]);

    MultiplyMatrix := res;
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
      for j := 1 to n do
      begin
        goToXY(j+7, i);
        OutputComplex(a[i][j]);
      end;
  end;
end.