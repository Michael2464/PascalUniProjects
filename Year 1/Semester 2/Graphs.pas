uses graphABC;

var
  x, y, prevX, prevY: real;
  i: integer;
  
begin 
   SetWindowWidth(800);
   SetWindowHeight(600); 
   
   Line(40, 200, 40, -400); 
   Line(40, 200, 400, 200); 
   
   prevX := 40;
   prevY := 200; 
   for i := 0 to 360 do
   begin
     x := 40 + i;
     y := -sin(i * pi / 60) * 100  + 200; 
     line(round(prevX), round(prevY), round(x), round(y)); 
     prevx := x;
     prevy := y;
   end;
end.