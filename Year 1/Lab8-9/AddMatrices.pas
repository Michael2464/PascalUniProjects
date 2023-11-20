uses crt;

Type complex = record
    r:real;
    i:real;
  end;
  
function AddComplex(a, b:complex):complex;
  var res:complex;
  begin
    res.r := a.r + b.r;
    res.i := a.i + b.i;
    AddComplex := res;
  end;

  function MultiplyComplex(a, b:complex):complex;
  var res:complex;
  begin
    res.r := a.r * b.r - a.i * b.i;
    res.i := a.r * b.i + a.i * b.r;
    MultiplyComplex := res;
  end;

  function ProdComplex(a:complex; b:real):complex;
  var res:complex;
  begin
    res.r := a.r * b;
    res.i := a.i * b;
    ProdComplex := res;
  end;

  function ZeroComplex():complex;
  var res:complex;
  begin
    res.r := 0;
    res.i := 0;
    ZeroComplex := res;
  end;

  function OneComplex():complex;
  var res:complex;
  begin
    res.r := 1;
    res.i := 0;
    OneComplex := res;
  end;
  
  function NormComplex(a:complex):real;
  var res:real;
  begin
    res := sqrt(sqr(a.r) + sqr(a.i));
    NormComplex := res;
  end;
  
  procedure InputComplex(var a:complex);
  begin
    write('Enter r: ');
    read(a.r);
    write('Enter i: ');
    read(a.i);
  end;
  
  procedure InputComplexRandom(var a:complex; min,max:real);
  begin
    a.r := random(min, max);
    a.i := random(min, max);
  end;

  procedure OutputComplex(var a:complex);
  begin
    if (a.i < 0) then
      writeln(a.r:2:2, ' - ', (-1) * a.i:2:2, 'i')
    else if (a.i > 0) then
      writeln(a.r:2:2, ' + ', a.i:2:2, 'i')
    else
      writeln(a.r:2:2);
  end;
  
  const n = 5;
  Type matrix = array[1..n, 1..n] of complex;

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
        goToXY(j+7, i+3);
        OutputComplex(a[i][j]);
      end;
  end;

var a,b,c: matrix;
var i,j:integer;


begin
  InputMatrixRandom(a, -10, 10);
  InputMatrixRandom(b, -10, 10);
  
  c := AddMatrix(a, b);
  
  OutputMatrix(c);
  
end.