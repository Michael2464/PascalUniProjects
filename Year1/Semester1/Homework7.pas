var s, t:real;
    k, f:integer;
    
begin
  s := 1;
  read(t);
  
  f := 1;
  s := s + t;
  
  for k := 2 to 100 do
  begin
    t := t*t;
    f := f * k;
    s := s + ((1/k) * t); 
  end;
  write(s);
  
end.