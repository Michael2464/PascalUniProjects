uses VectorLib;

var a,b,c:vector;
var i:integer;

begin
  InputVectorRandom(a, -5, 10);
  InputVectorRandom(b, -5, 10);
  
  OutputVector(a);
  writeln();
  OutputVector(b);
  writeln();
  
  c := AddVector(a, b);
  
  OutputVector(c);
  
end.