uses ComplexLib;
uses MatrixLib;

var a, b, c:matrix;
var i,j:integer;

begin
  InputMatrixRandom(a, -10, 10);
  InputMatrixRandom(b, -10, 10);
  
  for i := 1 to n do
    for j := 1 to n do
       c[i][j] := MultiplyComplex(a[i][j], b[j][i]);
  
  OutputMatrix(c);
end.