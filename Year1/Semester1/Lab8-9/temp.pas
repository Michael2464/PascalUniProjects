uses VectorLib;

var a,b,c:vector;

begin
  a := OneVector();
  b := OneVector();
  
  c := AddVectors(a, b);
  OutputVector(c);

end.