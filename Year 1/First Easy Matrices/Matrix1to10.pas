uses Crt;

const n = 10;
var a:array[1..n,1..n] of integer;
var i, j:integer;

begin
    for i:=1 to n do
        for j:=1 to n do
            a[i, j]:=0;
    
    for i:=1 to n do
        a[i, i] := i;
    
    for i:=1 to n do
        for j:=1 to n do
        begin
            goToXY(i, j);
            write(a[i][j])
        end;
end.