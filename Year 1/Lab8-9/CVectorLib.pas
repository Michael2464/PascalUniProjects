Unit CVectorLib;

Interface
  uses Crt;
  uses ComplexLib;

  const vectorSizeAmountIntegerHellYeah = 3;
  Type cVector = array[1..vectorSizeAmountIntegerHellYeah] of complex;

  function AddCVectors(a, b:cVector):cVector;
  function MultiplyCVectors(a, b:cVector):cVector;
  function MultiplyMultipleCVectors(a, b, z:cVector):complex;
  function MultiplyCVectorsScalar(a, b:cVector):complex;
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

  function MultiplyMultipleCVectors(a, b, z:cVector):complex;
  var res:cVector; realRes:complex; i:integer;
  begin
    res[1] := (AddComplex(MultiplyComplex(a[2], b[3]), ProdComplex(MultiplyComplex(a[3],b[2]), -1)));
    res[2] := (AddComplex(MultiplyComplex(a[1], b[3]), ProdComplex(MultiplyComplex(a[3],b[1]), -1)));
    res[2] := ProdComplex(res[2], -1);
    res[3] := (AddComplex(MultiplyComplex(a[1], b[2]), ProdComplex(MultiplyComplex(a[2],b[1]), -1)));
    
    realRes := MultiplyCVectorsScalar(res, z);
    
    MultiplyMultipleCVectors := realRes;
  end;
  
  function MultiplyCVectors(a, b:cVector):cVector;
  var res:cVector; i:integer;
  begin
    res[1] := (AddComplex(MultiplyComplex(a[2], b[3]), ProdComplex(MultiplyComplex(a[3],b[2]), -1)));
    res[2] := (AddComplex(MultiplyComplex(a[1], b[3]), ProdComplex(MultiplyComplex(a[3],b[1]), -1)));
    res[2] := ProdComplex(res[2], -1);
    res[3] := (AddComplex(MultiplyComplex(a[1], b[2]), ProdComplex(MultiplyComplex(a[2],b[1]), -1)));

    MultiplyCVectors := res;
  end;
  
  function MultiplyCVectorsScalar(a, b:cVector):complex;
  var res:complex; i:integer;
  begin
    res := ZeroComplex();
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res := AddComplex(res, MultiplyComplex(a[i], b[i]));

    MultiplyCVectorsScalar := res;
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
  var a,b,c,z:cVector; m:real; compl:complex;
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('(Complex vectors)');
      writeln('Enter option:');
      writeln('1) Add CVectors');
      writeln('2) Multiply CVectors');
      writeln('3) Multiply Multiple CVectors');
      writeln('4) Multiply CVectors Scalar');
      writeln('5) Prod CVector');
      writeln('6) Zero CVector');
      writeln('7) One CVector');
      writeln('8) Norm CVector');
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
        writeln('Multiply Multiple CVectors');
        writeln('First CVector:');
        InputCVector(a);
        writeln('Second CVector:');
        InputCVector(b);
        writeln('Third CVector:');
        InputCVector(z);
        c := MultiplyCVectors(MultiplyCVectors(a, b), z);
        write('Result: ');
        OutputCVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Multiply CVectors Scalar');
        writeln('First CVector:');
        InputCVector(a);
        writeln('Second CVector:');
        InputCVector(b);
        compl := MultiplyCVectorsScalar(a, b);
        write('Result: ');
        OutputComplex(compl);
        writeln();
        read(wait);
      end;
      
      if(input = 5) then
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
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Zero CVector:');
        a := ZeroCVector();
        OutputCVector(a);
        writeln();
        read(wait);
      end;
      
      if(input = 7) then
      begin
        ClrScr;
        writeln('One CVector:');
        a := OneCVector();
        OutputCVector(a);
        writeln();
        read(wait);
      end;
      
      if(input = 8) then
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