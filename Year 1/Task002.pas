var s, f:real;
    t, i, k:integer;

begin
  read(t);
  
  s := 1;
  f := 1;
  
  for i:= 1 to 100 do
  begin
    k := (2*i);
    f := f * (-t)*(t)/(k)/(k-1);
    s := s + f;
  end;
  writeln(s);
  writeln(cos(t));
end.