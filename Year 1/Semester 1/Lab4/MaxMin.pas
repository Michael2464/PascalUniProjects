const n = 4;

var a:array[1..n, 1..n] of integer;
var aM:array[1..n] of integer;
var i, j, max, min:integer;


begin
  randomize();
  for i := 1 to n do
    for j := 1 to n do 
      a[i][j] := random(10);
  
  for i := 1 to n do
  begin  
    max := a[i][1];
    for j := 2 to n do
    begin
      if a[i][j] > max then
        max := a[i][j];
    end;
    aM[i] := max;
  end;
  
  min := aM[1];
  for i:=1 to n-1 do
  begin
    if(aM[i+1] < aM[i]) then
      min := aM[i+1];
  end;
  
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      write(a[i][j], ' ');      
    end;
    writeln(' ', aM[i]);
  end;
  writeln(min);
end.