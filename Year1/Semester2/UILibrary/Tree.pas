Unit Tree;

Interface
  uses crt;

  Type NodePtr = ^Node;
  Node = record
    Name: char;
    Key: byte;
    Left, Right: NodePtr
  end;
  
  var Key,Symbol: char;
      Flag: boolean;
      Top, Leaf: NodePtr;
      Level, Mode: byte;
 
  procedure MakeSubTrees(Leaf:NodePtr);
  procedure Wait;
  procedure MakeTree(var Top: NodePtr);
  procedure WayUpDown(Top: NodePtr);
  procedure WayDownUp(Top: NodePtr);
  procedure WayHoriz(Top: NodePtr; Level: byte);
  function Height(Top: NodePtr): byte;
  procedure ViewTree(Top: NodePtr);
  procedure SearchNode(Top: NodePtr; var Leaf: NodePtr);
  procedure AddSubTree(Top: NodePtr);
  procedure TreeUI;

Implementation
  
  procedure MakeSubTrees(Leaf:NodePtr);
  var top: NodePtr;
  begin
    //GoToXY(10, 4); 
    write('Enter the current node: ');
    //GoToXY(40, 19); 
    readln(Leaf^.Name);
    //GoToXY(30, 18); 
    writeln(' ');
    //GoToXY(40, 19); 
    writeln(' ');
    //GoToXY(25, 20); 
    writeln('Does ', Leaf^.Name, ' have left subtree?');
    //GoToXY(40, 21); 
    readln(Key);
    //GoToXY(25, 20); 
    writeln(' ');
    //GoToXY(40, 21); 
    writeln(' ');
    if Key in ['y', 'Y'] then
    begin
      new(Top); 
      Leaf^.Left := Top; 
      MakeSubTrees(Top)
    end
    else 
    Leaf^.Left := nil;
    //GoToXY(25, 20); 
    writeln('Does ', Leaf^.Name, ' have right subtree?');
    //GoToXY(40, 21); 
    readln(Key);
    //GoToXY(25, 20); 
    writeln(' ');
    //GoToXY(40, 21); 
    writeln(' ');
    if Key in ['y', 'Y'] then
    begin
      new(Top); 
      Leaf^.Right := Top; 
      MakeSubTrees(Top)
    end
    else Leaf^.Right := nil;
  end;
 
  procedure Wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;

  procedure MakeTree(var Top: NodePtr);
  begin
    new(Top);
    MakeSubTrees(Top)
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

  procedure WayHoriz(Top: NodePtr; Level: byte); // save level nodes
  begin
    if Top <> nil then
    if Level = 1 then write(Top^.Name, ' ')
    else
    begin
      WayHoriz(Top^.Left, Level - 1);
      WayHoriz(Top^.Right, Level - 1)
    end;
  end;

  function Height(Top: NodePtr): byte; // height of a tree
  var HeightLeft, HeightRight: byte;
  begin
    if Top = nil then Height := 0
    else
    begin
      HeightLeft := Height(Top^.Left);
      HeightRight := Height(Top^.Right);
      if HeightLeft > HeightRight then 
        Height := HeightLeft + 1
      else Height := HeightRight + 1
    end;
  end;

  procedure ViewTree(Top: NodePtr);
  var i, HeightTree: byte;
  begin
    HeightTree := Height(Top);
    for i := 1 to HeightTree do
    begin
      writeln; 
      WayHoriz(Top, i)
    end;
  end;

  procedure SearchNode(Top: NodePtr; var Leaf: NodePtr); 
  begin
    if (Top <> nil) and (Flag = True) then
    begin
      if Symbol = Top^.Name then
      begin
        Flag := False; 
        Leaf := Top
      end
      else
      begin
        SearchNode(Top^.Left, Leaf);
        SearchNode(Top^.Right, Leaf)
      end;
    end;
  end;


  procedure AddSubTree(Top: NodePtr);
  begin
    //GoToXY(30, 18); 
    writeln('Enter the node: ');
    //GoToXY(40, 19); 
    readln(Symbol);
    Flag := True; 
    SearchNode(Top, Leaf); 
    ClrScr;
    if Flag = True then
    begin
      write('Node ', Symbol, 'is not found :('); Wait
    end
    else
    begin
      //GoToXY(25, 20);
      writeln('Do you want to add left subtree to ', Leaf^.Name, ' ?');
      //GoToXY(40, 21); 
      readln(Key);
      //GoToXY(23, 20);
      writeln(' ');
      //GoToXY(40, 21);
      writeln(' ');
      if Key in ['y', 'Y'] then
      if Leaf^.Left <> nil then
      begin
        //GoToXY(25, 19);
        writeln('Left subtree of ', Leaf^.Name, ' already exists :|');
        //GoToXY(25, 20); 
        writeln('Still want :()?');
        //GoToXY(40, 21); 
        readln(Key);
        //GoToXY(25, 19);
        writeln(' ');
        //GoToXY(25, 20); 
        writeln(' ');
        //GoToXY(40, 21); 
        writeln(' ');
        if Key in ['y', 'Y'] then
        begin
          MakeTree(Top); 
          Leaf^.Left := Top
        end
      end
      else
      begin
        MakeTree(Top); Leaf^.Left := Top
      end;
      //GoToXY(25, 20);
      writeln('Do you want to add right subtree to ', Leaf^.Name, ' ?');
      //GoToXY(40, 21); 
      readln(Key);
      //GoToXY(23, 20);
      writeln(' ');
      //GoToXY(40, 21); 
      writeln(' ');
      if Key in ['y', 'Y'] then
      if Leaf^.Right <> nil then
      begin
        //GoToXY(25, 19);
        writeln('Right subtree of ', Leaf^.Name, ' already exists :|');
        //GoToXY(25, 20); 
        writeln('Still want :()?');
        //GoToXY(40, 21); 
        readln(Key);
        //GoToXY(25, 19);
        writeln(' ');
        //GoToXY(25, 20); 
        writeln(' ');
        //GoToXY(40, 21); 
        writeln(' ');
        if Key in ['y', 'Y'] then
        begin
          MakeTree(Top); 
          Leaf^.Right := Top
        end
      end
      else
      begin
        MakeTree(Top); 
        Leaf^.Right := Top
      end;
    end;
  end;

  procedure TreeUI;
  var ok:boolean;
      Mode, Level:byte;
      Top: NodePtr;
  begin
    Ok := True;
    while Ok do
    begin
      ClrScr;
      writeln('[Tree]');
      writeln('------');
      writeln('1) Create tree');
      writeln('2) Go up down');
      writeln('3) Go down up');
      writeln('4) Go same level nodes');
      writeln('5) Tree height');
      writeln('6) View tree');
      writeln('7) Add subtree');
      writeln('0) Back'); 
      readln(Mode);
      
      ClrScr;
      case Mode of
      1: begin 
           writeln('Create tree');
           writeln('-----------');
           MakeTree(Top);
         end;
      2: begin 
           writeln('Go up down');
           writeln('----------');
           WayUpDown(Top); 
           Wait 
         end;
      3: begin 
           writeln('Go down up');
           writeln('----------');
           WayDownUp(Top); 
           Wait 
         end;
      4: begin
           writeln('Go same level nodes');
           writeln('-------------------');
           readln();
           //GoToXY(30, 18);
           write('Enter a level: ');
           //GoToXY(40, 19); 
           readln(Level); 
           ClrScr;
           WayHoriz(Top, Level); 
           Wait
         end;
      5: begin 
          writeln('Tree height');
          writeln('-----------');
          writeln(Height(Top):3); 
          Wait;
         end;
      6: begin 
          writeln('View tree');
          writeln('---------');
          ViewTree(Top); 
          Wait;
         end;
      7: begin
           writeln('Add subtree');
           writeln('-----------');
           AddSubTree(Top);
         end;
      0: Ok := False
      else
      begin
        //GoToXY(30, 23); 
        writeln('ERrOr :>[]');
        Wait();
      end;
      end;
    end;
  end;
  
end.