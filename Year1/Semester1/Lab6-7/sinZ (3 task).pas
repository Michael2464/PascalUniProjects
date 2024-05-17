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
    if (a.i < 0) then
      writeln(a.r:2:1, ' - ', (-1) * a.i:2:1, 'i')
    else if (a.i > 0) then
      writeln(a.r:2:1, ' + ', a.i:2:1, 'i')
    else
      writeln(a.r:2:1);
  end;

const eps = 0.001;

var z2, z:complex;
var p, s:complex;
var k, m:integer;

begin
  InputComplex(z);
  z2 := Multiply(z, z); // z = z^2
  
  p := z;  
  s := z;
  
  k := 2;
  
  while(NormComplex(p) > eps) do
  begin
    m := 2 * k;
    p := Multiply(p, Prod(z2, -1/(m-1)/(m-2)));
    s := Add(s, p);
    k := k + 1;
  end;
  
  OutputComplex(s);
  writeln(sin(z.r));
end.
