Unit BinaryTree;

Interface
  uses crt;

  Type NodePtr = ^Node;
    Node = record
      Key: byte;
      Left, Right: NodePtr;
    end;

  var Top, Root: NodePtr; 
      Level: byte;

  procedure MakeNode(NewKey: byte; var Top: NodePtr);
  procedure MakeBinTree(var Top: NodePtr);
  procedure BinUpDown(Top: NodePtr);
  procedure BinDownUp(Top: NodePtr);
  function High(Top: NodePtr): byte;
  procedure BinHoriz(Top: NodePtr; level: byte); 
  procedure ViewBinTree(Top: NodePtr);
  function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
  procedure DeleteSubTree(Top: NodePtr);
  procedure BinaryTreeUI;

Implementation

  procedure Wait;
  begin
    repeat until Keypressed;
    while Keypressed do readKey;
  end;

  procedure MakeNode(NewKey: byte; var Top: NodePtr);
  begin
    if Top = nil then 
    begin
      New(Top); 
      Top^.Key := NewKey;
      Top^.Left := nil; 
      Top^.Right := nil;
    end
    else
    begin
      if NewKey < Top^.Key then
        MakeNode(NewKey, Top^.Left)
      else
        MakeNode(NewKey, Top^.Right);
    end;
  end;

  procedure MakeBinTree(var Top: NodePtr);
  var i, n, InputKey: byte;
      Key: char;
  begin
    GoToXY(1, 2); write('Fill the tree randomly?: ');
    readln(Key); ClrScr;
    if Key in ['y', 'Y'] then 
    begin
      GoToXY(1, 2); write('Node amount: '); 
      readln(n); 
      ClrScr; 
      Top := nil;
      for i := 1 to n do
      begin
        InputKey := random(n);
        MakeNode(InputKey, Top);
      end;
    end
    else 
    begin
      GoToXY(1, 2); write('Node amount: '); 
      readln(n); ClrScr; 
      Top := nil;
      for i := 1 to n do
        begin
          GoToXY(1, 2); write('Value of (', i, '/', n, ') node: '); 
          readln(InputKey); 
          ClrScr();
          MakeNode(InputKey, Top);
        end
     end
end;

procedure BinUpDown(Top: NodePtr);
  begin
    if Top <> nil then 
      begin
        write(Top^.Key:4);
        BinUpDown(Top^.Right);
        BinUpDown(Top^.Left);
      end
  end;

procedure BinDownUp(Top: NodePtr);
  begin
    if Top <> nil then 
      begin
        BinDownUp(Top^.Right);
        BinDownUp(Top^.Left);
        write(Top^.Key:4);
      end
  end;

function High(Top: NodePtr): byte;
var
  HighLeft, HighRight: byte;
  begin
    if Top = Nil then High := 0
    else 
      begin
        HighLeft := High(Top^.left);
        HighRight := High(Top^.Right);
        if HighLeft > HighRight then
          High := HighLeft + 1
        else
          High := HighRight + 1;
      end
  end;

procedure BinHoriz(Top: NodePtr; Level: byte);
  begin
    if Top <> Nil then
      if Level = 1 then write(Top^.Key)
      else 
        begin
          BinHoriz(Top^.Left, Level - 1);
          BinHoriz(Top^.Right, Level - 1);
        end
end;


procedure ViewBinTree(Top: NodePtr);
var i, HighTree: byte;
  begin
    HighTree := High(Top);
    for i := 1 to HighTree do
      begin
        writeln;
        BinHoriz(Top, i);
      end
end;

function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
  begin
    if Top = Nil then 
      SearchNode := Nil
    else if Top^.Key = SearchKey then SearchNode := Top
    else if SearchKey < Top^.Key then
      SearchNode := SearchNode(Top^.Left, SearchKey)
    else SearchNode := SearchNode(Top^.Right, SearchKey);
end;

procedure DeleteSubTree(Top: NodePtr);
var Tmp: NodePtr; DeleteKey: byte;
  begin
    GoToXY(1, 2); write('Enter node to delete: '); readln(DeleteKey); ClrScr;
    Tmp := SearchNode(Top, DeleteKey);
    if Tmp <> nil then 
      begin
        Tmp^.Left := nil;
        Tmp^.Right := nil;
      end;
  end;
  
  

  procedure BinaryTreeUI;
  var Ok: boolean;
      input: integer;
  begin
    Ok := True;
    while Ok do
    begin
      Clrscr;
      writeln('[Binary Tree]:');
      writeln('1) Create binary tree');
      writeln('2) View binary tree');
      writeln('3) View binary tree up down');
      writeln('4) View binary tree down up');
      writeln('5) View same level nodes');
      writeln('6) Delete subtree');
      writeln('0) Exit');
      readln(input);
      clrScr;
      
      case input of
        1: begin
            MakeBinTree(Top); 
            Wait();
           end;
        2: begin
            ViewBinTree(Top);
            Wait();
           end;
        3: begin
            BinUpDown(Top);
            Wait();
          end;
        4: begin
            BinDownUp(Top);
            Wait();
           end;
        5: begin
            GoToXY(1, 5);
            write('Enter node level:');
            readln(Level);
            BinHoriz(Top, level);
            Wait();
           end;
        6: begin
            DeleteSubTree(Top); 
            Wait();
           end;
        0: ok := False;
      else
      begin
        GoToXY(1, 21);
        writeln('Error! Try again :[]');
        Wait()
      end;
    end;
  end;
end;
end.