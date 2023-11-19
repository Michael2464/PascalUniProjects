Unit ComplexLib;
Interface

  Type complex = record
    r:real;
    i:real;
  end;

  function AddComplex(a, b:complex):complex;
  function MultiplyComplex(a, b:complex):complex;
  function ProdComplex(a:complex; b:real):complex;
  function ZeroComplex():complex;
  function OneComplex():complex;
  function NormComplex(a:complex):real;
  procedure InputComplex(var a:complex);
  procedure InputComplexRandom(var a:complex; min,max:real);
  procedure OutputComplex(var a:complex);

Implementation

  function AddComplex(a, b:complex):complex;
  var res:complex;
  begin
    res.r := a.r + b.r;
    res.i := a.i + b.i;
    AddComplex := res;
  end;

  function MultiplyComplex(a, b:complex):complex;
  var res:complex;
  begin
    res.r := a.r * b.r - a.i * b.i;
    res.i := a.r * b.i + a.i * b.r;
    MultiplyComplex := res;
  end;

  function ProdComplex(a:complex; b:real):complex;
  var res:complex;
  begin
    res.r := a.r * b;
    res.i := a.i * b;
    ProdComplex := res;
  end;

  function ZeroComplex():complex;
  var res:complex;
  begin
    res.r := 0;
    res.i := 0;
    ZeroComplex := res;
  end;

  function OneComplex():complex;
  var res:complex;
  begin
    res.r := 1;
    res.i := 0;
    OneComplex := res;
  end;
  
  function NormComplex(a:complex):real;
  var res:real;
  begin
    res := sqrt(sqr(a.r) + sqr(a.i));
    NormComplex := res;
  end;
  
  procedure InputComplex(var a:complex);
  begin
    write('Enter r: ');
    read(a.r);
    write('Enter i: ');
    read(a.i);
  end;
  
  procedure InputComplexRandom(var a:complex; min,max:real);
  begin
    a.r := random(min, max);
    a.i := random(min, max);
  end;

  procedure OutputComplex(var a:complex);
  begin
    if (a.i < 0) then
      writeln(a.r:2:2, ' - ', (-1) * a.i:2:2, 'i')
    else if (a.i > 0) then
      writeln(a.r:2:2, ' + ', a.i:2:2, 'i')
    else
      writeln(a.r:2:2);
  end;
end.