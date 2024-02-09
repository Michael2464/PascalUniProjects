uses crt;

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

  procedure OutputComplex(a:complex);
  begin
    if (a.i:2:1 < 0) then
      writeln(a.r:2:1 + ' - ' + (-1) * a.i:2:1 + 'i')
    else if (a.i:2:1 > 0) then
      writeln(a.r:2:1 + ' + ' + a.i:2:1 + 'i')
    else
      writeln(a.r:2:1);
  end;

const n = 10;

var a1:array[1..n] of complex;
var a2:array[1..n] of complex;
var a3:array[1..n] of complex;
var i:integer;

begin
  clrscr;

  // randomly fill arrays
  for i:=1 to n do
  begin
    a1[i].r := random(10);
    a1[i].i := random(10);
    a2[i].r := random(10);
    a2[i].i := random(10);

    goToXY(0, i);
    OutputComplex(a1[i]);
    goToXY(15, i);
    OutputComplex(a2[i]);
    
    // Add arrays
    a3[i] := Add(a1[i], a2[i]);
    goToXY(35, i);
    OutputComplex(a3[i]);
    writeln();
  end;
  
end.