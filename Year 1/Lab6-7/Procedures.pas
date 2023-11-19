Unit Complex;
Interface

  Type complex = record
    r:real,
    i:real
  end;

  function Add(a, b:complex):complex;
  function Multiply(a, b:complex):complex;
  function Prod(a:complex, b:real; var res:complex);
  function Zero(var res:complex);
  function One(var res:complex);
  function Input(var input:complex);
  function Output(var input:complex);

Implementation

  procedure Add(a, b:complex; var res:complex);
  begin
    res.r := a.r + b.r;
    res.i := a.i + b.i;
  end;

  procedure Multiply(a, b:complex; var res:complex);
  begin
    res.r := a.r * b.r - a.i * b.i;
    res.i := a.r * b.i + a.i * b.r;
  end;

  procedure Prod(a:complex, b:real; var res:complex);
  begin
    res.r := a.r * b;
    res.i := a.i * b;
  end;

  procedure Zero(var res:complex);
  begin
    res.r := 0;
    res.i := 0;
  end;

  procedure One(var res:complex);
  begin
    res.r := 1;
    res.i := 0;
  end;

  procedure InputComplex(var input:complex);
  begin
    write("Enter r: ");
    input(input.r);
    write("Enter i: ");
    input(input.i);
  end;

  procedure OutputComplex(a:complex);
  begin
    if a.i < 0 then
      writeln(a.r + ' - ' + (-1) * a.i);
    else if a.i > 0 then
      writeln(a.r + ' + ' + a.i);
    else
      writeln(a.r);
  end;
