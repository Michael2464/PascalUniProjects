var x, y:real;
    n:integer;
 
begin
  n:=0;
  read(x, y);
  if(x*x+y*y>=1) and (sqr(x-1)+sqr(y-1)<=1) then n:=3
  else if (x>=0) and (y>=0) and (sqr(x-1)+sqr(y-1)>1) then n:=1
  else if (x<=0) and (y<=0) and (x*x+y*y<=1) then n:=2;
  write(n);
end.