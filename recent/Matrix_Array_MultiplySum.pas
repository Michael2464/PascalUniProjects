const n = 3;

var matrix:array[1..n,1..n] of integer;
    a:array[1..n] of integer;
    r:array[1..n] of integer;
    i, j:integer;

begin
    for i:= 1 to n do
        for j := 1 to n do
            matrix[i][j] := Random(5);
       
    for i := 1 to n do
    begin
        a[i] := Random(5);
        r[i] := 0;
    end;
        
    for i:= 1 to n do
    begin
        for j := 1 to n do
        begin
            r[i] := r[i] + (matrix[i][j] * a[i]);
        end;
    end;
    
    for i:= 1 to n do
    begin
        for j := 1 to n do
        begin
            write(matrix[i][j], ' ');
        end;
        write('  ', a[i]);
        write('   ', r[i]);
        writeln();
    end;
end.