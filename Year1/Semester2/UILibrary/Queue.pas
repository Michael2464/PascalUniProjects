Unit Queue;

Interface
  uses crt; 
  type PtrQ = ^_Queue;
       _Queue = record
         Inf:integer;
         Next: PtrQ;
     end;
    
  var Top, Kon, Left, Right, RightOut: PtrQ; 
  var val:integer;

  procedure MakeQueue;
  procedure AddQueue;
  procedure ViewQueue;
  procedure DeleteQueue;
  procedure QueueUI; 

Implementation
  procedure MakeQueue;
  var ok:boolean;
  begin
    ok := true;
    write('Enter a number: ');
    read(val);
    New(Top);
    if val = 999 then
    begin
      ok := false; 
      Top^.Next := Nil
    end;
    
    Top^.Inf := val; 
    Right := Top; 
    Left := Top;
    
    while ok do
    begin
      write('Enter a number: ');
      read(val);
      if val = 999 then
      begin
        ok := False; 
        Top^.Next := Nil;
      end
      else
      begin
        New(Top);
        Right^.Next := Top;
        Top^.Inf := val;
        Right := Top;
      end;
    end;
  end;

  procedure AddQueue;
  var ok:boolean;
  begin
    ok := true;
    while ok do 
    begin 
      write('Enter a number: ');
      read(val);
      if val = 999 then
      begin
        ok := false;
        Top^.Next := Nil;
      end
      else
      begin
        New(Top); 
        Right^.Next := Top;
        Top^.Inf := val;
        Right := Top;
      end;
    end;
    RightOut := Right;
  end;

  procedure ViewQueue;
  begin
    Top:=Left;
    
    while Top <> Nil do
    begin
      writeln(Top^.Inf);
      Top := Top^.Next;
    end;
  end;

  procedure DeleteQueue;
  var Temp: PtrQ;
  begin
    if Left <> nil then
    begin
      Temp := Left;
      Left := Left^.Next;
      Dispose(Temp); // ?
    end
    else
      writeln('Queue is empty :(');
  end;
  
  procedure QueueUI;
  var input, wait:integer; 
  var n:real; 
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('[Queue]');
      writeln('--------------');
      writeln('1) Make Queue');
      writeln('2) Add Queue');
      writeln('3) View Queue');
      writeln('4) Delete Queue');
      writeln('0) Back');
      read(input);
      ClrScr;
      
      if(input = 1) then
      begin
        writeln('Make Queue');
        writeln('------------------');
        MakeQueue();
        read(wait);
      end;
      
      if(input = 2) then
      begin
        writeln('Add Queue');
        writeln('---------');
        AddQueue();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        writeln('View Queue');
        writeln('----------');
        ViewQueue();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        writeln('Delete Queue');
        writeln('------------');
        DeleteQueue();
        read(wait);
      end;
    end;
  end;
  
end.
