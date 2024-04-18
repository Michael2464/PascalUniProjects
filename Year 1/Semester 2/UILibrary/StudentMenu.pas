Unit StudentMenu;

Interface
  uses Stack;
  uses crt;
  
  Type PtrVertical = ^StackVertical;
      StackVertical = record
        ID: integer;
        Name: string[20];
        Next: PtrVertical;
      end;
  Type PtrHorizontal = ^StackHorizontal;
      StackHorizontal = record
        ID: integer;
        Group: string[10];
        Head: PtrVertical;
        Next: PtrHorizontal;
      end;
      
   var Horiz: PtrHorizontal;
   
   procedure CreateHorizontalMenu;
   procedure CreateVerticalMenu(var vertical: PtrVertical);
   procedure ChooseVerticalMenu;
   procedure ReadVerticalMenu(var vertical: PtrVertical; n:integer);
   procedure StudentMenuUI;
   
Implementation

  procedure CreateHorizontalMenu;
  var Vertic: PtrVertical;
      top: PtrHorizontal;
      GroupValue: string[10];
      ok: boolean;
      k:integer;    
  begin
    ok := True; Horiz := NIL; k := 0;
    while ok do
    begin
      write('Enter group name: ');
      readln(GroupValue);
      
      if(GroupValue = 'n') or (GroupValue = 'N') or (GroupValue = 'н') or (GroupValue = 'Н') then
        ok := False
      else
      begin
        New(top); // allocate memory
        top^.Next := Horiz;
        top^.ID := k;
        top^.Group := GroupValue;
        CreateVerticalMenu(Vertic);
        top^.Head := Vertic;
        Horiz := top;
      end;
    end;
  end;
  
  procedure CreateVerticalMenu(var vertical: PtrVertical);
  var top: PtrVertical;
      ok: boolean;
      NameValue: string[20];
      n: integer;
  begin
    ok := true; 
    vertical := NIL; 
    n := 0;
    
    while ok do
    begin
      write('Enter students name: ');
      readln(NameValue);
      if(NameValue = 'n') or (NameValue = 'N') or (NameValue = 'н') or (NameValue = 'Н') then
        ok := false
      else
      begin
        New(top);
        top^.Next := vertical;
        top^.ID := n;
        top^.Name := NameValue;
        vertical := top;
      end;
    end;
  end;
  
  procedure ChooseVerticalMenu;
  var top: PtrHorizontal;
      n,k: integer;
  begin
    top := Horiz; n:= 0;
    while top <> NIL do
    begin
      n := n + 1;
      writeln(n:5, '.', top^.Group:6);
      top := top^.Next;
    end;
    GoToXY(30, 0);
    writeln('Choose menu option pls: ');
    GoToXY(39, 1);
    top := Horiz;
    k := Horiz^.ID + 1;
    while (top^.ID + n <> k) do
      top := top^.Next;
    
    ReadVerticalMenu(top^.Head, n);
  end;
  
  procedure ReadVerticalMenu(var vertical: PtrVertical; n:integer);
  var top: PtrVertical;
      posX, posY: integer;
  begin
    top := vertical; posY := 2; posX := 12 * n - 7;
    while top <> NIL do
    begin
      posY := posY + 1;
      GoToXY(posX, posY);
      write(top^.Name);
      top := top^.Next;
    end;
  end;
  
  procedure StudentMenuUI;
  var input, wait:integer; 
  var n:real;
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('Student Menu');
      writeln('Enter option:');
      writeln('1) Create');
      writeln('2) View');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        CreateHorizontalMenu();
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        ChooseVerticalMenu();
      end;
    end;
  end;
  
end.