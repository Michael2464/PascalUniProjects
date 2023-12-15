Unit VectorLib;

Interface
  uses Crt;

  const vectorSizeAmountIntegerHellYeah = 3;
  Type vector = array[1..vectorSizeAmountIntegerHellYeah] of real;

  function AddVectors(a, b:vector):vector;
  function MultiplyVectorsScalar(a, b:vector):real;
  function MultiplyVectors(a, b:vector):vector;
  function MultiplyMultipleVectors(a, b, z:vector):real;
  function ProdVector(a:vector; b:real):vector;
  function ZeroVector():vector;
  function OneVector():vector;
  function NormVector(a:vector):real;
  procedure VectorUI();
  procedure InputVector(var a:vector);
  procedure InputVectorRandom(var a:vector; min, max:real);
  procedure OutputVector(var a:vector);

Implementation

  function AddVectors(a, b:vector):vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := a[i] + b[i];

    AddVectors := res;
  end;

  function MultiplyVectors(a, b:vector):vector;
  var res:vector; i:integer;
  begin
    res[1] := (a[2]*b[3] - a[3]*b[2]);
    res[2] := -(a[1]*b[3] - a[3]*b[1]);
    res[3] := (a[1]*b[2] - a[2]*b[1]);
    
    MultiplyVectors := res;
  end;
  
  function MultiplyMultipleVectors(a, b, z:vector):real;
  var res:vector; realRes:real; i:integer;
  begin
    res[1] :=  (a[2] * b[3] - a[3] * b[2]);
    res[2] := -(a[1] * b[3] - a[3] * b[1]);
    res[3] := (a[1] * b[2] - a[2] * b[1]);
    
    realRes := MultiplyVectorsScalar(res, z);
    
    MultiplyMultipleVectors := realRes;
  end;
  
  function MultiplyVectorsScalar(a, b:vector):real;
  var res:real; i:integer;
  begin
    res := 0;
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res := res + a[i]*b[i];

    MultiplyVectorsScalar := res;
  end;

  function ProdVector(a:vector; b:real):vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := a[i] * b;
    ProdVector := res;
  end;

  function ZeroVector():vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := 0;
    ZeroVector := res;
  end;

  function OneVector():vector;
  var res:vector; i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res[i] := 1;
    OneVector := res;
  end;
  
  function NormVector(a:vector):real;
  var res:real; i:integer;
  begin
    res := 0;
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      res := res + sqr(a[i]);
    res := sqrt(res);
    NormVector := res;
  end;
  
  procedure VectorUI();
  var input, wait:integer; 
  var a,b,c, z:vector; m:real; s:real;
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('(Vectors)');
      writeln('Enter option:');
      writeln('1) Add vectors');
      writeln('2) Multiply vectors');
      writeln('3) Multiply multiple vectors');
      writeln('4) Multiply vectors scalar');
      writeln('5) Prod vector');
      writeln('6) Zero vector');
      writeln('7) One vector');
      writeln('8) Norm vector');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Add vectors');
        writeln('First vector:');
        InputVector(a);
        writeln('Second vector:');
        InputVector(b);
        c := AddVectors(a, b);
        write('Result: ');
        OutputVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Multiply vectors');
        writeln('First vector:');
        InputVector(a);
        writeln('Second vector:');
        InputVector(b);
        c := MultiplyVectors(a, b);
        write('Result: ');
        OutputVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Multiply multiple vectors');
        writeln('First vector:');
        InputVector(a);
        writeln('Second vector:');
        InputVector(b);
        writeln('Third vector:');
        InputVector(z);
        s := MultiplyMultipleVectors(a, b, z);
        write('Result: ');
        write(s);
        writeln();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Multiply vectors scalar');
        writeln('First vector:');
        InputVector(a);
        writeln('Second vector:');
        InputVector(b);
        s := MultiplyVectorsScalar(a, b);
        write('Result: ');
        writeln(s);
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('Prod vector');
        writeln('Vector:');
        InputVector(a);
        writeln('Number:');
        read(m);
        c := ProdVector(a, m);
        write('Result: ');
        OutputVector(c);
        writeln();
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Zero vector:');
        a := ZeroVector();
        OutputVector(a);
        writeln();
        read(wait);
      end;
      
      if(input = 7) then
      begin
        ClrScr;
        writeln('One vector:');
        a := OneVector();
        OutputVector(a);
        writeln();
        read(wait);
      end;
      
      if(input = 8) then
      begin
        ClrScr;
        writeln('Norm vector');
        writeln('Input vector:');
        InputVector(a);
        write('Result: ');
        write(NormVector(a));
        writeln();
        read(wait);
      end;
    end;
  end;
  
  procedure InputVector(var a:vector);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
    begin
      write('[', i, ']: ');
      read(a[i]);      
    end;
  end;
  
  procedure InputVectorRandom(var a:vector; min, max:real);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
      a[i] := random(min, max);
  end;
  
  procedure OutputVector(var a:vector);
  var i:integer;
  begin
    for i := 1 to vectorSizeAmountIntegerHellYeah do
    begin
      write(a[i]:2:2);
      if(i <> vectorSizeAmountIntegerHellYeah) then write('  ');
    end;
  end;
end.