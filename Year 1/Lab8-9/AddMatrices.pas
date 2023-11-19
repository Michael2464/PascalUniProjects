uses ComplexLib;

var a,b,c: matrix;
var i,j:integer;

begin
  InputMatrixRandom(a, -10, 10);
  InputMatrixRandom(b, -10, 10);
  
  c := AddMatrix(a, b);
  
  OutputMatrix();
  
end.