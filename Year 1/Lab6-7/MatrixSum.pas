Type complex = record
    r:real;
    i:real;
end;

  function Add(a, b:complex):complex;
  var res:complex;
  begin
    res.r := a.r + b.r;
    res.i := a.i + b.i;
    Add := res;
  end;

  function Multiply(a, b:complex):complex;
  var res:complex;
  begin
    res.r := a.r * b.r - a.i * b.i;
    res.i := a.r * b.i + a.i * b.r;
    Multiply := res;
  end;

  function Prod(a:complex; b:real):complex;
  var res:complex;
  begin
    res.r := a.r * b;
    res.i := a.i * b;
    Prod := res;
  end;

  function Zero():complex;
  var res:complex;
  begin
    res.r := 0;
    res.i := 0;
    Zero := res;
  end;

  function One():complex;
  var res:complex;
  begin
    res.r := 1;
    res.i := 0;
    One := res;
  end;
  
  function NormComplex(a:complex):real;
  var res:real;
  begin
    res := sqrt(sqr(a.r) + sqr(a.i));
    NormComplex := res;
  end;
  
  procedure InputComplex(var input:complex);
  begin
    write('Enter r: ');
    read(input.r);
    write('Enter i: ');
    read(input.i);
  end;

  procedure OutputComplexN(a:complex);
  begin
    if (a.i < 0) then
      writeln(a.r + ' - ' + (-1) * a.i + 'i')
    else if (a.i > 0) then
      writeln(a.r + ' + ' + a.i + 'i')
    else
      writeln(a.r);
  end;

  procedure OutputComplex(a:complex);
  begin
    if (a.i < 0) then
      write(a.r:2:2, ' - ', (-1) * a.i:2:2, 'i')
    else if (a.i > 0) then
      write(a.r:2:2, ' + ', a.i:2:2, 'i')
    else
      write(a.r:2:2);
  end;

const n = 10;

var a1:array[1..n][1..n] of complex;
var a2:array[1..n][1..n] of complex;
var a3:array[1..n][1..n] of complex;
var i,j:integer;

begin
  // randomly fill arrays
  for i:=1 to n do
  begin
    for j:=1 to n do
      begin
      a1[i][j].r := random(-10, 10);
      a1[i][j].i := random(-10, 10);
      a2[i][j].r := random(-10, 10);
      a2[i][j].i := random(-10, 10);
    
      // Add arrays
      a3[i][j] := Add(a1[i][j], a2[i][j]);
      OutputComplex(a3[i][j]);
      write('  ');
    end;
    writeln();
  end;
  
end.