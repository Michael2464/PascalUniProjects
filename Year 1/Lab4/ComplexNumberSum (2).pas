Uses Complex;

const eps = 0.0001;

var i:integer;
  p, z, z2, s:complex;
  k:integer;


begin
  InputComplex(z);
  
  p.r := 1;
  p.i := 0;
  Multiply(z, z, z2);
  k := 1;

  while(p.r > eps)
  begin
    Multiple(p, -z2, p);
    Prod(p, 1/(2*k)/(2*k-1), p);
    Add(s, p, s);
  end;  

  OutputComplex(s);  
end.