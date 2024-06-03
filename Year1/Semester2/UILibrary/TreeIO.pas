Unit TreeIO;

Interface
  uses crt;

  const g = 11;
  Type Node = record
     ch: char;
     left, right: byte;
  end;

  var Tree:array of Node;
      Root, n: byte;

  procedure CreateTree(var Tree: array of Node; var Root: byte; var n: byte);
  procedure WayUpDown(Next:byte);
  procedure WayDownUp(Next:byte);
  procedure WayHoriz(Next,Level:byte);
  procedure TreeIOUI();

Implementation

  procedure Wait;
  begin
    repeat until KeyPressed;
    while Keypressed do ReadKey;
  end;

procedure CreateTree(var Tree: array of Node; var Root: byte; var n: byte);
var
  i, j: byte;
  ch: char;
  left, right: byte;
begin
  write('Enter node amount: ');
  readln(n);
  setLength(Tree, n+1);
  
  for i := 1 to n do
  begin
    write('Enter a node (', i, '): ');
    readln(ch);
    Tree[i].ch := ch;
    write('Enter index of left and right subtrees of (', i, ') (enter 0 if do not exist): ');
    readln(left, right);
    Tree[i].left := left;
    Tree[i].right := right;
  end;
  write('Enter the index of the root node: ');
  readln(Root);
end;


procedure WayUpDown(Next:byte);
begin
  if Next<>0 then
    with Tree[Next] do
    begin
      write(ch,' ');
      WayUpDown(left);
      WayUpDown(right);
    end;
end;

procedure WayDownUp(Next: byte);
begin
  if Next<>0 then
    with Tree[Next] do
    begin
      write(ch,' ');
      WayUpDown(right);
      WayUpDown(left);
    end;
end;

procedure WayHoriz(Next, Level: byte);
begin
  if Next <>0 then
    with Tree[Next] do
      if Level=1 then write(ch,' ')
    else
    begin
      WayHoriz(left,Level-1);
      WayHoriz(right,Level-1);
    end;
end;

procedure TreeIOUI();
var Level:byte;
  choice: Integer;
  Ok:boolean;
begin
  ClrScr();
  Ok := true;
  while Ok do
  begin
    writeln('[Tree I/O]');
    writeln('-----------------');
    writeln('1. Create tree');
    writeln('2. Way Up Down');
    writeln('3. Way Down Up');
    writeln('4. Same level nodes');
    writeln('5. Exit');
    readln(choice);
    ClrScr();
  
    case choice of
      1:begin
        CreateTree(Tree, Root, n);
        end;
      2:begin
          WayUpDown(Root);
        end;
      3:begin
          WayDownUp(Root);
        end;
      4:begin
          write('Enter the level: ');
          readln(Level);
          WayHoriz(Root, Level);
        end;
      5:
        Ok := false;
    else
      writeln('Error :(');
      ClrScr();
      TreeIOUI();
    Wait();
    end;
  end;
  end;
end.
