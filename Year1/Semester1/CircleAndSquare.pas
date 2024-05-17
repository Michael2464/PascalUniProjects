var x, y, m: real;
    i,n:integer;
    
begin
  n := 1000000;
  m := 0;
  for i:=1 to n do
  begin
    x := Random(0.0, 1.0);
    y := Random(0.0, 1.0);    
    if (x*x+y*y<=1) then m:= m+1;
  end;
  writeln(m/n);
  writeln(pi/4);
  
end.