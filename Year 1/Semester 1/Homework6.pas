var s:real;
    n, k, f:integer;

begin
  s := 2;
  f := 1;
  
  for n:= 1 to 50 do
  begin
    k := (2*n);
    f := f * (2*n-1);
    s := s + k/f;
  end;
  write(s);
end.