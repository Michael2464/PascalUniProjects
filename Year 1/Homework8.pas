const eps = 0.001;
var s, p, t: real;
    k:integer;
    
begin
  read(t);
  p:= t;
  s:= t;
  k:=1;
  
  while(abs(p) > eps) do 
  begin
    p := p *((-t)*t)/(2*k+1) / (2*k);
    s := s + p;
    k := k+1;
  end;
  writeln(s);
  write(sin(t));
  
end.