const n = 10;
var a:array[1..n,1..n] of integer;
var i, j:integer;

begin
    for i:=1 to n do
        for j:=1 to n do
            a[i, j]:=0;
    
        
    for i:=1 to n do
      for j := i to n do
        a[i, j] := 1;
    
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            write(a[i][j], ' ');
        end;
        writeln();
    end;
end.