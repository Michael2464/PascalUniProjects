var s, f:real;
    t, i, k:integer;

begin
  
  read(t);
  
  s := t;
  f := t;
  
  for i:= 2 to 100 do
  begin
    k := (2*i);
    f := f * (t*t)/(k-1)/(k-2);
    s := s + f;
  end;

  writeln(s);
  writeln(sin(t));
end.