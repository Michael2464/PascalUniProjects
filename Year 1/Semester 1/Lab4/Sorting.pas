const n = 10;

var a:array[1..n] of integer;
var i, j, index, save, m:integer;


begin
  for i := 1 to n do
  begin
    a[i] := random(10);
    write(a[i], ' ');
  end;
  
  for i := 1 to n do
  begin
    m := a[i];  
    for j := i to n-1 do
    begin
      if(a[j+1] < m) then 
      begin
        m := a[j+1];
        index := j+1;
      end;
    end;
    save := a[i];
    a[i] := m;
    a[index] := save;
  end;
  
  writeln();
  for i := 1 to n do
    write(a[i], ' ');
end.