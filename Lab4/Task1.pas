const n = 10;

var a:array[1..n] of integer;
    i, save:integer;

begin
  for i:=1 to n do
  begin
    a[i] := i;
	write(i, ' ')
  end;
    
  for i:= 1 to trunc(n/3) do
  begin
    save := a[3*i];
    a[3*i] := a[3*i-2];
    a[3*i-2] := save;
  end;
  
  writeln();
  for i:=1 to n do
    write(a[i], ' ');
end.