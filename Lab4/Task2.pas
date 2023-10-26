const n = 10;

Type Arr = array[1..n] of integer;

var a:Arr;
    i, save:integer;

begin
  for i := 1 to n do
    a[i] := i;
  
  for i := 1 to n do
    write(a[i], ' ');
  
  for i := 1 to trunc(n/2) do
  begin
    save := a[2*i];
    a[2*i] := a[2*i-1];
    a[2*i-1] := save;
  end;
  
  writeln();  
  for i := 1 to n do
    write(a[i], ' ');

end.

const n = 10;

var a:array[1..n] of integer;
    i, save:integer;

const n = 10;
var a:array[1..n] of integer;
    i,j, save:integer;

begin
  Randomize();
  // Randomly fill the array
  for i := 1 to n do
  begin
    a[i] := random(10);
    write(a[i], ' ')
  end;
  writeln();

  // Sorting
  for i := 1 to n-1 do
    for j := 1 to n-1 do 
    begin
      if a[j+1] < a[j] then
      begin
        save := a[j];
        a[j] := a[j+1];
        a[j+1] := save;
      end;
    end;
    
  writeln('After sorting: ');
  for i := 1 to n do
    write(a[i], ' ');
  
end.