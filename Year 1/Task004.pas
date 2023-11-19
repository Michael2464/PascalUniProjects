var s, f, eps:real;
    t, i, k:integer;

begin
  read(t);
  
  eps:=0.001;
  s := t;
  f := t;
  i := 1;
  
  while abs(f) > eps do
  begin
    k := (2*i);
    f := f * (-t)*(t)/(k)/(k+1);
    s := s + f;
    i := i + 1;
  end;
  writeln(s);
  writeln(cos(t));
end.