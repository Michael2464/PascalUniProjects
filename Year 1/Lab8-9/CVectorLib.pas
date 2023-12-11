Unit CVectorLib;

Interface
  uses Crt;
  uses ComplexLib;

  const vectorSizeAmountIntegerHellYeah = 4;
  Type cVector = array[1..vectorSizeAmountIntegerHellYeah] of complex;

  function AddCVectors(a, b:cVector):cVector;
  function MultiplyCVectors(a, b:cVector):cVector;
  function ProdCVector(a:cVector; b:real):cVector;
  function ZeroCVector():cVector;
  function OneCVector():cVector;
  function NormCVector(a:cVector):real;
  procedure CVectorUI();
  procedure InputCVector(var a:cVector);
  procedure InputCVectorRandom(var a:cVector; min, max:real);
  procedure OutputCVector(var a:cVector);

Implementation

  function AddCVectors(a, b:cVector):cVector;
  var res:cVector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := AddComplex(a[i], b[i]);

    AddCVectors := res;
  end;

  function MultiplyCVectors(a, b:cVector):cVector;
  var res:cVector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := MultiplyComplex(a[i], b[i]);

    MultiplyCVectors := res;
  end;

  function ProdCVector(a:cVector; b:real):cVector;
  var res:cVector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := ProdComplex(a[i], b);
    ProdCVector := res;
  end;

  function ZeroCVector():cVector;
  var res:cVector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := ZeroComplex();
    ZeroCVector := res;
  end;

  function OneCVector():cVector;
  var res:cVector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := OneComplex();
    OneCVector := res;
  end;
  
  function NormCVector(a:cVector):real;
  var res:real; i:integer;
  begin
    res := 0;
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res := res + NormComplex(a[i]);
    res := sqrt(res);
    NormCVector := res;
  end;
  
  procedure CVectorUI();
  var input, wait:integer; 
  var a,b,c:cVector; m:real;
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('(Complex vectors)');
      writeln('Enter option:');
      writeln('1) Add CVectors');
      writeln('2) Multiply CVectors');
      writeln('3) Prod CVector');
      writeln('4) Zero CVector');
      writeln('5) One CVector');
      writeln('6) Norm CVector');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Add CVectors');
        writeln('First CVector:');
        InputCVector(a);
        writeln('Second CVector:');
        InputCVector(b);
        c := AddCVectors(a, b);
        write('Result: ');
        OutputCVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Multiply CVectors');
        writeln('First CVector:');
        InputCVector(a);
        writeln('Second CVector:');
        InputCVector(b);
        c := MultiplyCVectors(a, b);
        write('Result: ');
        OutputCVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Prod CVector');
        writeln('CVector:');
        InputCVector(a);
        writeln('Number:');
        read(m);
        c := ProdCVector(a, m);
        write('Result: ');
        OutputCVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Zero CVector:');
        a := ZeroCVector();
        OutputCVector(a);
        writeln();
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('One CVector:');
        a := OneCVector();
        OutputCVector(a);
        writeln();
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Norm CVector');
        writeln('Input CVector:');
        InputCVector(a);
        write('Result: ');
        write(NormCVector(a));
        writeln();
        read(wait);
      end;
    end;
  end;
  
  procedure InputCVector(var a:cVector);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
    begin
      write('[', i, ']: ');
      InputComplex(a[i]);
    end;
  end;
  
  procedure InputCVectorRandom(var a:cVector; min, max:real);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      InputComplexRandom(a[i], min, max);
  end;
  
  procedure OutputCVector(var a:cVector);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
    begin
      OutputComplex(a[i]);
      if(i <> vectorSizeAmountIntegerHellYeah) then write('  ');
    end;
  end;
end.