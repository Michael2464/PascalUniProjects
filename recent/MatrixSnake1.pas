uses Crt;

const n = 10;

var a:array[1..n,1..n] of integer;
    i, j, m:integer;

begin
    for i:=1 to n do
      for j:=1 to n do
        a[i,j] := 0;
  
    m := 1;
    
    for i:=1 to trunc((n+1)/2) do
    begin
      // -------------------
      for j:=i to n+1-i do
      begin
        a[i][j] := m;
        m := m + 1;
      end;
      // -------------------
      for j:=i+1 to n-i do
      begin
        a[j][n-i+1] := m;
        m := m + 1;
      end;
      // -------------------
      for j:=n-i+1 downto i do
      begin
        a[n-i+1][j] := m;
        m := m + 1;
      end;
      // -------------------
      for j:=n-i downto i+1 do
      begin
        a[j][i] := m;
        m := m + 1;
      end;
      // -------------------
    end;
    
    for i:=1 to n do
    begin
      for j:=1 to n do
      begin
        write(a[i][j], ' ');
      end;
      writeln();
    end;
	
	for i:=1 to n do
      for j:=1 to n do
      begin
        goToXY(j, i);
        write(a[i][j]);
      end;

end.