unit Tree;

Interface
  uses Crt;

  const n = 11;
 
  Type NodePtr = ^Node;
    Node = record
      Name: char;
      Left, Right: NodePtr;
    end;

  var treeArr: array[1..n] of NodePtr;
  var Symbol, Key: char;
      Ok: boolean;
      Top, Leaf: NodePtr;
      Level: byte;

  procedure MakeTree(var Top: NodePtr);
  procedure WayUpDown(Top: NodePtr);
  procedure WayDownUp(Top: NodePtr);
  procedure WayHoriz(Top: NodePtr; Level: byte);
  function TreeLength(Top: NodePtr): byte;
  procedure ViewTree(Top: NodePtr);
  procedure AddSubTree(Top: NodePtr);
  procedure DeleteSubTree(Top: NodePtr);
  procedure TreeUI;

Implementation
  
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;
  
  procedure MakeSubTrees(Leaf: NodePtr);
  var Top: NodePtr;
  begin
    GoToXY(30, 18); write('Enter the current node: ');
    GoToXY(40, 19); readln(Leaf^.Name);
    GoToXY(30, 18); writeln(' '); ClearLine;
    GoToXY(40, 19); writeln(' ');
    GoToXY(25, 20); write(Leaf^.Name, ' has left subtree?: '); 
    GoToXY(40, 21); readln(Key);
    GoToXY(25, 20); writeln(' '); ClearLine;
    GoToXY(40, 21); writeln(' ');
    if Key in ['y', 'Y'] then
    begin
      new(Top); 
      Leaf^.Left := Top; 
      MakeSubTrees(Top)
    end
    else 
      Leaf^.Left := nil;
    
    GoToXY(25, 20); write(Leaf^.Name, ' has right subtree?: ');
    GoToXY(40, 21); readln(Key);
    GoToXY(25, 20); writeln(' '); ClearLine;
    GoToXY(40, 21); writeln(' ');
    if Key in ['y', 'Y'] then
    begin
      new(Top);
      Leaf^.Right := Top; 
      MakeSubTrees(Top)
    end
    else 
      Leaf^.Right := nil;
  end;

  procedure MakeTree(var Top: NodePtr);
  begin
    new(Top); 
    MakeSubTrees(Top);
  end;

  procedure WayUpDown(Top: NodePtr);
  begin
    if Top <> nil then
    begin
      write(Top^.Name, ' ');
      WayUpDown(Top^.Left);
      WayUpDown(Top^.Right)
    end;
  end;

  procedure WayDownUp(Top: NodePtr);
  begin
    if Top <> nil then
    begin
      WayDownUp(Top^.Left);
      WayDownUp(Top^.Right);
      write(Top^.Name, ' ')
    end;
  end;

  procedure WayHoriz(Top: NodePtr; Level: byte);
  begin
    if Top <> nil then
    begin
      if Level = 1 then 
        write(Top^.Name, ' ');
    end
    else
    begin
      WayHoriz(Top^.Left, Level- 1);
      WayHoriz(Top^.Right, Level- 1)
    end;
  end;

  function TreeLength(Top: NodePtr): byte;
  var LengthLeft, LengthRight: byte;
  begin
    if Top = nil then 
      TreeLength := 0
    else
    begin
      LengthLeft := TreeLength(Top^.Left);
      LengthRight := TreeLength(Top^.Right);
      if LengthLeft > LengthRight then TreeLength := LengthLeft + 1
      else TreeLength := LengthRight + 1
    end;
  end;

  procedure ViewTree(Top: NodePtr);
  var i, HighTree: byte;
  begin
    HighTree := TreeLength(Top);
    for i := 1 to HighTree do
    begin
      writeln; 
      WayHoriz(Top, i)
    end;
  end;


  procedure Search(Top: NodePtr; var Leaf: NodePtr);
  begin
    if (Top <> nil) and (Ok = True) then
    begin
      if Symbol = Top^.Name then
      begin
        Ok := False; 
        Leaf := Top
      end
      else
      begin
        Search(Top^.Left, Leaf);
        Search(Top^.Right, Leaf)
      end;
    end;
  end;

  procedure AddSubTree(Top: NodePtr);
  begin
    GoToXY(30, 18); write('Enter current node: ');
    GoToXY(40, 19); readln(Symbol);
    Ok := True; 
    Search(Top, Leaf);
    if Ok = True then
    begin
      write('Node ', Symbol, ' is not found :('); 
      Wait();
    end
    else
    begin
      GoToXY(28, 20);
      write('Wanna add left subtree to ', Leaf^.Name, ' ? (y/n): ');
      GoToXY(40, 21); readln(Key);
    if Key in ['y', 'Y'] then
      if Leaf^.Left <> Nil then
      begin
        GoToXY(25, 19);
        writeln(Leaf^.Name, ' already has left subtree!');
        GoToXY(25, 20); write('Still want(y/n)?: ');
        GoToXY(40, 21); readln(Key);
        if Key in ['y', 'Y'] then
        begin
          MakeTree(Top); 
          Leaf^.Left := Top
        end;
      end
      else
      begin
        MakeTree(Top); 
        Leaf^.Left := Top
      end;
      GoToXY(25, 20);
      write('Wanna add right subtree to ', Leaf^.Name, '(y/n)?: ');
      GoToXY(40, 21); readln(Key);
      GoToXY(23, 20);
      writeln(' ');
      GoToXY(40, 21); writeln(' ');
      if Key in ['y', 'Y'] then
        if Leaf^.Right <> nil then
        begin
          GoToXY(25, 19);
          writeln(Leaf^.Name, ' already has right subtree!');
          GoToXY(25, 20); writeln('Still want?');
          GoToXY(40, 21); readln(Key);
          GoToXY(25, 19);
          writeln(' ');
          GoToXY(25, 20); writeln(' ');
          GoToXY(40, 21); writeln(' ');
        if Key in ['y', 'Y'] then
        begin
          MakeTree(Top); 
          Leaf^.Right := Top
        end;
      end
      else
      begin
        MakeTree(Top); 
        Leaf^.Right := Top
      end;
    end;
  end;

  procedure DeleteSubTree(Top: NodePtr);
  begin 
    GoToXY(30, 18); writeln('Enter the node: ');
    GoToXY(40, 19); readln(Symbol);
    Ok := True; 
    Search(Top, Leaf); 
    clrscr;
    
    if Ok = True then
    begin
      writeln('Node ', Symbol, ' is not found :('); Wait;
    end
    else
    begin
      GoToXY(25, 20);
      write('Wanna delete left subtree ', Leaf^.Name, '?: ');
      GoToXY(40, 21); readln(Key);
      GoToXY(25, 20);
      writeln(' ');
      GoToXY(40, 21); writeln(' ');
      if Key in ['y', 'Y'] then
      begin
        GoToXY(25, 20);
        write('Really wanna delete left subtree?: ');
        GoToXY(40, 21); readln(Key);
        GoToXY(25, 20);
        writeln(' ');
        GoToXY(40, 21); writeln(' ');
        if Key in ['y', 'Y'] then 
          Leaf^.Left := nil
      end;
      GoToXY(25, 20);
      write('Wanna delete right subtree ', Leaf^.Name, '?: ');
      GoToXY(40, 21); readln(Key);
      GoToXY(25, 20);
      writeln(' ');
      GoToXY(40, 21); writeln(' ');
      if Key in ['y', 'Y'] then
      begin
        GoToXY(25, 20);
        write('Really wanna delete right subtree?: ');
        GoToXY(40, 21); readln(Key);
        GoToXY(25, 20);
        writeln(' ');
        GoToXY(40, 21); writeln(' ');
        if Key in ['y', 'Y'] then 
          Leaf^.Right := nil
      end;
    end;
  end;

  procedure TreeUI;
  var input: integer; 
      Ok: boolean;
  begin
    Ok:= true;
    while Ok do
    begin
      ClrScr;
      writeln('[Tree]:');
      writeln('1) Create tree');
      writeln('2) View tree up down');
      writeln('3) View tree down up');
      writeln('4) View same tree level');
      writeln('5) Tree lenght');
      writeln('6) View tree');
      writeln('7) Add subtree');
      writeln('8) Delete subtree');
      writeln('0) Exit');
      readln(input);
      clrscr;
      
      case input of
        1: begin
            ClrScr();
            MakeTree(Top);
           end;
        2: begin
            ClrScr();
            WayUpDown(Top);
            Wait();
           end;
        3: begin
            ClrScr();
            WayDownUp(Top);
            Wait();
           end;
        4: begin
            ClrScr();
            WayHoriz(Top, Level);
            Wait();
           end;
        5: begin
            ClrScr();
            writeln(TreeLength(Top));
            Wait();
           end;
        6: begin
            ClrScr();
            ViewTree(Top);
            Wait();
           end;
        7: begin
            ClrScr();
            AddSubTree(Top);
            Wait();
           end;
        8: begin
            ClrScr();
            DeleteSubTree(Top);
            Wait();
           end;
        0: Ok:= false;
      end;
    end;
  end;
end.