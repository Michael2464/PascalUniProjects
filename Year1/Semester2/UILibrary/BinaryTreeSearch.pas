Unit BinaryTreeSearch;

Interface
  uses crt;

  Type NodePtr = ^Node;
    Node = record
      Key: byte;
      Left, Right: NodePtr;
    end;
    
  var Symbol, Key: char;
      Ok: boolean;
      Top, Leaf: NodePtr;
      Level: byte;

  procedure MakeTree(var Top: NodePtr);
  procedure WayUpDown(Top: NodePtr);
  function TreeLength(Top: NodePtr): byte;
  procedure WayDownUp(Top: NodePtr);
  procedure WayHoriz(Top: NodePtr; Level: byte);
  procedure ViewTree(Top: NodePtr);
  function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
  procedure BinaryTreeSearchUI;

Implementation
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure MakeNode(NewKey:byte; var Top: NodePtr);
  begin
    if Top= Nil then
    begin
      New(Top); 
      Top^.Key := NewKey;
      Top^.Left := Nil; 
      Top^.Right := Nil
    end
    else
    if NewKey < Top^.Key then
    begin
      MakeNode(NewKey,Top^.Left);
    end
    else
      MakeNode(NewKey,Top^.Right)
  end;

  procedure MakeTree(var Top: NodePtr);
  var i, n, InputKey:byte;
  begin
    write('Enter node amount in a tree: ');
    read(n);
    Top := Nil;
    
    for i:= 1 to n do
    begin
    write('Enter a value: ');
    read(InputKey);
      MakeNode(InputKey,Top)
    end;
  end;

  procedure WayDownUp(Top: NodePtr);
  begin
  if Top <> nil then
  begin
    WayDownUp(Top^.Left);
    WayDownUp(Top^.Right);
    write(Top^.Key:3)
  end
  end;

  procedure WayUpDown(Top: NodePtr);
  begin
  if Top <> nil then
  begin
    write(Top^.Key:3);
    WayUpDown(Top^.Left);
    WayUpDown(Top^.Right)
  end
  end;

  function TreeLength(Top: NodePtr): byte;
  var LengthLeft, LengthRight: byte;
  begin
    if Top = nil then TreeLength := 0
    else
    begin
      LengthLeft := TreeLength(Top^.Left);
      LengthRight := TreeLength(Top^.Right);
      if LengthLeft > LengthRight then TreeLength := LengthLeft + 1
      else TreeLength := LengthRight + 1
    end;
  end;

  procedure WayHoriz(Top: NodePtr; Level: byte);
  begin
  if Top <> nil then
    if Level = 1 then write(Top^.Key:3, ' ')
    else
    begin
      WayHoriz(Top^.Left, Level- 1);
      WayHoriz(Top^.Right, Level- 1)
    end
  end;

  procedure ViewTree(Top: NodePtr);
  var i, HighTree: byte;  
  begin
    HighTree := TreeLength(Top);
    for i := 1 to HighTree do
    begin
      writeln; WayHoriz(Top, i)
    end;
  end;

  function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
  begin
    if Top = nil then SearchNode := nil
    else
    if Top^.Key = SearchKey then SearchNode := Top
    else
    if SearchKey < Top^.Key then
      SearchNode := SearchNode(Top^.Left, SearchKey)
    else
      SearchNode := SearchNode(Top^.Right, SearchKey)
  end;

  procedure BinaryTreeSearchUI;
  var input: integer; Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('[Binary Tree Search]:');
      writeln('1) Create tree');
      writeln('2) View up down');
      writeln('3) View down up');
      writeln('4) View same level nodes');
      writeln('5) Tree height');
      writeln('6) View tree');
      writeln('7) Find node');
      writeln('0) Exit');
      readln(input);
      ClrScr;
          
      case input of
        1: begin
            MakeTree(Top);
           end;
        2: begin
                WayUpDown(Top);
                writeln();
                Wait();
               end;
            3: begin
                WayDownUp(Top);
                writeln();
                Wait();
               end;
            4: begin
                Write('Enter node level(byte): ');
                readln(Level);
                WayHoriz(Top, Level);
                Wait;
               end;
            5: begin
                writeln('Tree height: ', TreeLength(Top));
                Wait;
               end;
            6: begin
                ViewTree(Top);
                Wait;
               end;
            7: begin
                Write('Enter node (byte): ');
                readln(Level);
                if SearchNode(Top, Level) = nil then
                  Writeln('Node does not exist :(')
                else 
                  Writeln('Node is found :)');
                wait;
               end;
            0: Ok:= false;
          end
       end
    end;
end. 