var x, y, n:real;
Begin
  n := 0;
  read(x, y);
  if (x*x + y*y <= 1) then
  begin
    if (x>0)and(y>0) then n := 1 else 
    if (x<0)and(y<0) then n := 2;
  end;
  write(n);
End.