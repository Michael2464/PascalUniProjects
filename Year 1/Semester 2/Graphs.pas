uses GraphABC;

var clearColor:Color;
var whiteColor:Color;

var width, height: integer;
var beginX, endX, beginY, endY:integer;

var x, dx: integer;
var coeff:integer;

var point1, point2: Point;

function Func(x:real):real;
begin
  Func := x*x;
end;

function ToRadians(x:integer):integer;
begin
  ToRadians := round(x / 180 * 3.1415);
end;

begin
  SetWindowCaption('Graph Renderer');
  
  clearColor := RGB(255, 100, 20);
  whiteColor := RGB(255, 255, 255);
  
  width := WindowWidth();
  height := WindowHeight();
  
  beginX := 10;
  endX := width-beginX;
  beginY := 50;
  endY := height - beginY;
  
  SetFontSize(30);
  SetBrushColor(whiteColor);
  SetPenColor(whiteColor);
  TextOut(round(endX/2.5), 10, 'Sin(x)');
  
  
  SetBrushColor(clearColor);
  SetPenColor(clearColor);
  
  x := beginX;
  dx := round((endX - beginX) / 100);
  coeff := 5;
  
  while x < endX do
  begin
    point1.X := round(x);
    point1.Y := round(endY + 1*point1.X);
    point2.X := round(x+dx);
    point2.Y := round(endY + 1*point2.X);
    
    Line(point1, point2);
    x := x + dx;
  end;
end.