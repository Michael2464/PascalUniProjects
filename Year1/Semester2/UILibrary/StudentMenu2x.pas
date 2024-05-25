Unit StudentMenu2x;

Interface
  uses crt, Stack;

  Type PtrVertic = ^StackVertic;
    StackVertic = record
      Number: integer;
      Name: string[20];
      Next: PtrVertic;
    end;
    
  PtrHoriz = ^StackHoriz;
    StackHoriz = record
      Number: integer;
      Group: string[10];
      Head: PtrVertic;
      Next: PtrHoriz;
    end;
    
 var Horiz: PtrHoriz;
 
 procedure MakeMenuHorizon;
 procedure MakeMenuVertic(var Vertic: PtrVertic);
 procedure ChoiceMenuHorizon;
 procedure PutMenuVertic(Vertic: PtrVertic; n: integer);
 procedure StudentMenu2xUI;
 
 
Implementation

  procedure Wait;
  begin
    repeat until KeyPressed;
      while KeyPressed do ReadKey
  end; 

  procedure MakeMenuHorizon;
  var Vertic: PtrVertic;
      Top: PtrHoriz;
      GroupValue: string[10];
      Ok: boolean;
      k: integer;
  begin
    Ok := true; 
    Horiz := Nil; 
    k := 0;
    while Ok do
    begin
      readln();
      write('Enter group value: ');
      readln(GroupValue); 
      k := k + 1;
      if (GroupValue = 'n') or (GroupValue = 'N') then 
        Ok:= false
      else
      begin
        New(Top);
        Top^.Next:= Horiz;
        Top^.Number:= k;
        Top^.Group:= GroupValue;
        MakeMenuVertic(Vertic);
        Top^.Head:= Vertic;
        Horiz:= Top;
      end;
    end;
  end;

  procedure MakeMenuVertic(var Vertic: PtrVertic);
  var Top: PtrVertic;
      Ok: boolean;
      NameValue: string[20];
      k, i: integer;
  begin
    Ok := True; 
    Vertic := Nil; 
    k := 0;
    while Ok do
    begin
      write('Enter student name: ');
      readln(NameValue); 
      k := k + 1;
      if (NameValue = 'n') or (NameValue = 'N') then 
        Ok := False
      else
      begin
        New(Top);
        Top^.Next:= Vertic;
        Top^.Number:= k;
        Top^.Name:= NameValue;
        Vertic:= Top;
      end;
    end;
  end;
    
  procedure ChoiceMenuHorizon;
  var Top: PtrHoriz;
      n, k: integer;
      Ok: boolean;
  begin
    Top := Horiz; 
    n := 0; 
    Ok := true;
    while Top <> Nil do
    begin
      n:= n + 1;
      write(n:5, '.', Top^.Group:3, '        ');
      Top:= Top^.Next;
    end;
    while Ok do
    begin
      TextBackground(white);
      GoToXY(40, 19); writeln('Enter 0 to exit');
      TextBackground(black);
      GoToXY(40, 20); writeln('Choose menu index: ');
      GoToXY(40, 21); read(n);
      GoToXY(40, 21); ClearLine;
      if n = 0 then
      begin
        Ok := False;
      end
      else
      begin
        GoToXY(40, 3); ClearLine;
        GoToXY(40, 4); ClearLine;
        GoToXY(40, 5); ClearLine;
        GoToXY(40, 6); ClearLine;
        GoToXY(40, 7); ClearLine;
        GoToXY(40, 8); ClearLine;
        GoToXY(40, 9); ClearLine;
        GoToXY(40, 10); ClearLine;
        GoToXY(40, 11); ClearLine;
        GoToXY(40, 12); ClearLine;
        GoToXY(40, 13); ClearLine;
        GoToXY(40, 14); ClearLine;
        GoToXY(40, 15); ClearLine;
        GoToXY(40, 16); ClearLine;
        GoToXY(40, 17); ClearLine;
        GoToXY(40, 18); ClearLine;
        
        Top := Horiz;
        k := 1 + Horiz^.Number;
        while(Top^.Number + n <> k) do 
          Top := Top^.Next;
        PutMenuVertic(Top^.Head, n);
      end;
    end;
  end;
    
  procedure PutMenuVertic(Vertic: PtrVertic; n: integer);
  var Top: PtrVertic;
      PosX, PosY: integer;
  begin
    Top := Vertic; 
    PosY := 2; 
    PosX := 10;
    while Top <> nil do
    begin
      PosY := PosY + 1;
      PosX := (n - 1) * 17 + 1;
      GotoXY(PosX, PosY);
      Write(' ');
      Write(Top^.Name);
      Write(' ');
      Top := Top^.Next;
    end;
  end;
    
  procedure StudentMenu2xUI;
  var input:integer; 
      Ok:boolean;
  begin
    Ok := true;
    while Ok do
    begin
      clrscr;
      writeln('[Student Menu 2x]:');
      writeln('1: Create menu');
      writeln('2: View menu');
      writeln('0: Exit');
      read(input);
      
      ClrScr;
      case input of
        1: begin 
            Clrscr;
            MakeMenuHorizon;
           end;
               
        2: begin
            Clrscr;
            ChoiceMenuHorizon;
            Wait;
           end;
               
        0: Ok:= false;
      end
    end
  end;
end.
    
    
    