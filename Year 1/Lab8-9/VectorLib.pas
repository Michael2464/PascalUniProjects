Unit VectorLib;

Interface
  const vectorSizeAmountIntegerHellYeah = 3;
  Type vector = array[1..vectorSizeAmountIntegerHellYeah] of real;

  function AddVector(a, b:vector):vector;
  function MultiplyVector(a, b:vector):vector;
  function ProdVector(a:vector; b:real):vector;
  function ZeroVector():vector;
  function OneVector():vector;
  function NormVector(a:vector):real;
  procedure InputVector(var a:vector);
  procedure InputVectorRandom(var a:vector; min, max:real);
  procedure OutputVector(var a:vector);

Implementation

  function AddVector(a, b:vector):vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := a[i] + b[i];

    AddVector := res;
  end;

  function MultiplyVector(a, b:vector):vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := a[i] * b[i];

    MultiplyVector := res;
  end;

  function ProdVector(a:vector; b:real):vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := a[i] * b;
    ProdVector := res;
  end;

  function ZeroVector():vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := 0;
    ZeroVector := res;
  end;

  function OneVector():vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := 1;
    OneVector := res;
  end;
  
  function NormVector(a:vector):real;
  var res:real; i:integer;
  begin
    res := 0;
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res := res + sqr(a[i]);
    res := sqrt(res);
    NormVector := res;
  end;
  
  procedure InputVector(var a:vector);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
    begin
      write('Enter a number: ');
      read(a[i]);      
    end;
  end;
  
  procedure InputVectorRandom(var a:vector; min, max:real);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      a[i] := random(min, max);
  end;
  
  procedure OutputVector(var a:vector);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      write(a[i]:2:2, ' ');
  end;
end.