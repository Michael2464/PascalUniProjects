Unit StackList;

Interface
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
  
  procedure CreateHorizontalMenu();
  procedure CreateVerticalMenu(var vertical: PtrVertical);
  procedure ChooseVerticalMenu();
  procedure PutVerticalMenu(var vertical: PtrVertical; n: integer);

Implementation

  procedure CreateHorizontalMenu();
  var vertical: PtrVertical; 
      top: PtrHorizontal;
      GroupName: string[10];
      Ok: boolean;
      n: integer;
  begin
    Ok := true; Horiz := NIL; n := 0;
    while Ok do 
    begin
      write('Enter group name: ');
      read(GroupName);
      if (GroupName = 'N') or (GroupName = 'n') or (GroupName = 'Т') or (GroupName = 'т') then
        Ok := false
      else
      begin
        New(top);
        Top^.Next := Horiz;
        Top^.ID := n;
        Top^.Group := GroupName;
        CreateVerticalMenu(vertical);
        Top^.Head := vertical;
        Horiz := top;
      end;
    end;
  end;
  
  procedure CreateVerticalMenu(var vertical: PtrVertical);
  var top: PtrVertical;
      Ok: boolean;
      NameValue: string[20];
      n: integer;
  begin
    Ok := true; vertical := NIL; n := 0;
    while Ok do
    begin
      write('Enter students name: ');
      read(NameValue);
      if (NameValue = 'N') or (NameValue = 'n') or (NameValue = 'Т') or (NameValue = 'т') then
        Ok := false
      else
      begin
        New(top);
        top^.Next := vertical;
        top^.Name := NameValue;
        vertical := top;
      end;
    end;
  end;
  
  procedure ChooseVerticalMenu();
  var top: PtrHorizontal;
      n,k:integer;
  begin
    top := Horiz; n := 0;
    while top <> NIL do 
    begin
      n := n + 1;
      write(n:5, '. ', top^.Group:6);
      top := top^.Next;
    end;
    GoToXY(30, 22);
    writeln('Choose a menu item:');
    GoToXY(39, 23);
    top := Horiz;
    k := Horiz^.ID + 1; // What???
    while(top^.ID + n <> k) do
      top := top^.Next;
    
    PutVerticalMenu(top^.Head, n);
  end;
  
  procedure PutVerticalMenu(var vertical: PtrVertical; n: integer);
  var top: PtrVertical;
      posX, posY: integer;
  begin
    top := vertical; 
    posY := 2; // columns
    posX := 12 * n - 7; // raws
    while top <> NIL do
    begin
      posY := posY + 1;
      GoToXY(posX, posY);
      write(top^.Name);
      top := top^.Next;
      // Finish
    end;
    
  end;
  
end.