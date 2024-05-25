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
    Write('Введите количество узлов в дереве: ');
    read(n);
    Top:=Nil;
    for i:= 1 to n do
    begin
    Write('Введите число: ');
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
      writeln('Выберете пункт');
      writeln('1:  Создание дерева');
      writeln('2:  Обход сверху вниз');
      writeln('3:  Обход снизу вверх');
      writeln('4:  Обход вершин на одном уровня');
      writeln('5:  Высота дерева');
      writeln('6:  Просмотр дерева');
      writeln('7:  Найти Узел');
      writeln('0:  Выход');
      readln(input);
      ClrScr;
          
      case input of
        1: begin
            MakeTree(Top);
           end;
        2: begin
                Writeln('Получили: ');
                WayUpDown(Top);
                Wait;
               end;
            3: begin
                Writeln('Получили: ');
                WayDownUp(Top);
                Wait;
               end;
            4: begin
                Write('Введите уровень: ');
                readln(Level);
                WayHoriz(Top, Level);
                Wait;
               end;
            5: begin
                writeln('Высота вашего дерева: ', TreeLength(Top));
                Wait;
               end;
            6: begin
                ViewTree(Top);
                Wait;
               end;
            7: begin
                Write('Введите номер искомого узла: ');
                readln(Level);
                if SearchNode(Top, Level) = nil then
                  Writeln('Узла с таким номером не обнаружено')
                else 
                  Writeln('Узел найден');
                wait;
               end;
            0: Ok:= false;
          end
       end
    end;
end. 