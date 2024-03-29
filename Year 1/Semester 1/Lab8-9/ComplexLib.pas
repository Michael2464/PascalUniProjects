﻿Unit ComplexLib;

Interface
  uses Crt;
  Type complex = record
    r:real;
    i:real;
  end;
  const eps = 0.001;
  
  function AddComplex(a, b:complex):complex;
  function MultiplyComplex(a, b:complex):complex;
  function ProdComplex(a:complex; b:real):complex;
  function ZeroComplex():complex;
  function OneComplex():complex;
  function NormComplex(a:complex):real;
  function ComplexSin(a:complex):complex;
  function ComplexCos(a:complex):complex;
  procedure ComplexUI();
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
  
  function ComplexCos(a:complex):complex;
  var p,s,a2:complex; m,k:integer;
  begin
    a2 := MultiplyComplex(a, a);
    
    p := OneComplex();  
    s := OneComplex();
  
    k := 1;
    
    while(NormComplex(p) > eps) do
    begin
        m := 2 * k;
        p := MultiplyComplex(p, ProdComplex(a2, -1/(m)/(m-1)));
        s := AddComplex(s, p);
        k := k + 1;
    end;
    ComplexCos := p;
  end;
    
  function ComplexSin(a:complex):complex;
  var p,s, a2:complex; m,k:integer;
  begin
    a2 := MultiplyComplex(a, a);
    
    p := a;  
    s := a;
  
    k := 2;
    
    while(NormComplex(p) > eps) do
    begin
      m := 2 * k;
      p := MultiplyComplex(p, ProdComplex(a2, -1/(m-1)/(m-2)));
      s := AddComplex(s, p);
      k := k + 1;
    end;
    
    ComplexSin := p;
  end;
  
  procedure ComplexUI();
  var input, wait:integer; 
  var a,b,c:complex; n:real;
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('(Complex numbers)');
      writeln('Enter option:');
      writeln('1) Add complex number');
      writeln('2) Multiply complex number');
      writeln('3) Prod complex number');
      writeln('4) Zero complex number');
      writeln('5) One complex number');
      writeln('6) Norm complex number');
      writeln('7) Complex Sin');
      writeln('8) Complex Cos');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Add complex numbers');
        writeln('First complex');
        InputComplex(a);
        writeln('Second complex');
        InputComplex(b);
        c := AddComplex(a, b);
        write('Result: ');
        OutputComplex(c);
        writeln();
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Multiply complex numbers');
        writeln('First complex:');
        InputComplex(a);
        writeln('Second complex:');
        InputComplex(b);
        c := MultiplyComplex(a, b);
        write('Result: ');
        OutputComplex(c);
        writeln();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Prod complex number');
        writeln('Complex:');
        InputComplex(a);
        writeln('Number:');
        read(n);
        c := ProdComplex(a, n);
        write('Result: ');
        OutputComplex(c);
        writeln();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Zero complex');
        a := ZeroComplex();
        OutputComplex(a);
        writeln();
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('One complex');
        a := OneComplex();
        OutputComplex(a);
        writeln();
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Norm complex number');
        writeln('Complex:');
        InputComplex(a);
        write('Result: ');
        write(NormComplex(a));
        writeln();
        read(wait);
      end;
      
      if(input = 7) then
      begin
        ClrScr;
        writeln('Complex Sin');
        InputComplex(a);
        write('Result: ');
        b := ComplexSin(a);
        OutputComplex(b);
        writeln();
        read(wait);
      end;
      
      if(input = 8) then
      begin
        ClrScr;
        writeln('Complex Cos');
        InputComplex(a);
        write('Result: ');
        b := ComplexCos(a);
        OutputComplex(b);
        writeln();
        read(wait);
      end;
    end;
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
      write(a.r:2:2, ' - ', (-1) * a.i:2:2, 'i')
    else if (a.i > 0) then
      write(a.r:2:2, ' + ', a.i:2:2, 'i')
    else
      write(a.r:2:2);
  end;
end.