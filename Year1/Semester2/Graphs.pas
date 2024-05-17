uses graphABC;

var
  x, y, prevX, prevY: real;
  deltaX, deltaY:integer;
  i: integer;
  
begin 
   SetWindowWidth(800);
   SetWindowHeight(600); 
   
   deltaX := 100;
   deltaY := 400;
   
   Line(deltaX, deltaY, deltaX, -deltaY); 
   Line(deltaX, -deltaY, deltaX, 10*deltaX); 
   Line(deltaX, deltaY, 10*deltaX, deltaY);
   
   for i := 1 to 8 do
   begin
     Line(deltaX + 45*i, 5+deltaY, deltaX+45*i, -5+deltaY);
     SetFontSize(8); 
     TextOut(deltaX + 45*i - 6, deltaY+10, 45*i);
   end;
   
   for i := -4 to 4 do
   begin
     Line(deltaX-5, round(deltaY -100*i/2), deltaX+5, round(deltaY -100*i/2));
     SetFontSize(8); 
     TextOut(deltaX-20, round(deltaY-5-100*i/2), i/2);
   end;
   
   prevX := deltaX;
   prevY := deltaY; 
   for i := 0 to 360 do
   begin
     x := deltaX + i;
     y := -sin(i * pi / 180) * 100  + deltaY; 
     line(round(prevX), round(prevY), round(x), round(y)); 
     prevx := x;
     prevy := y;
   end;
end.