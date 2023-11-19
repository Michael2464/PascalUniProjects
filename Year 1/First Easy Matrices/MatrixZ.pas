uses Crt;

const n = 6;
var a:array[1..n,1..n] of integer;
var i, j:integer;

begin
    for i:=1 to n do
        for j:=1 to n do
            a[i, j]:=0;
    
    for j:=1 to n do
    begin
        a[1, j] := 1;
        a[n, j] := 1;
    end;
        
    for i:=1 to n do
        a[i, n+1-i] := 1;
    
    for i:=1 to n do
        for j:=1 to n do
        begin
            goToXY(j, i);
            write(a[i][j]);
        end;
end.