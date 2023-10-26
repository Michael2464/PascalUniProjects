Type complex = record
  r: real;
  i: real;
end;

var i:integer;
  p, s, pR, z:complex;

procedure Multiply(u, v:complex; var w:complex);
begin
  w.r := u.r*v.r - u.i*v.i;
  w.i := u.r*v.i + u.i*v.r;
end;

begin
  write('Enter r: ');
  read(z.r);
  write('Enter i: ');
  read(z.i);
  
  p.r := 1;
  p.i := 0;
  s.r := 1;
  s.i := 0;
  
  for i := 1 to 100 do
  begin
    Multiply(p, z, pR);
    p.r := pR.r;
    p.i := pR.i;
    
    s.r := s.r + p.r;
    s.i := s.i + p.i;
  end;
  
  if s.i > 0 do
	writeln(s.r, ' + ', s.i, 'i');
  else
    writeln(s.r, ' + ', s.i, 'i');
  
  
end.