uses ComplexLib;
uses MatrixLib;

var a, c:matrix;
var i,j:integer;
var k:real;

begin
  InputMatrixRandom(a, -10, 10);
  
  for i := 1 to n do
    for j := 1 to n do
       c[i][j] := ProdComplex(a[i][j], k);
  
  OutputMatrix(c);
end.