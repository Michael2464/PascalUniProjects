Unit Stack;

Interface
  uses crt;
  Type PtrS = ^Stack_;
  Stack_ = record
    Data: integer;
    Next: PtrS;
  end;
  
  procedure PushStack(var top, bottom: PtrS);
  procedure PopStack(var top, bottom: PtrS);
  procedure ReadStack(var bottom: PtrS);
  procedure ReadReversedStack(var bottom: PtrS);
  procedure ConnectStacks(var bottom, top:PtrS);
  procedure StackUI(var top1, bottom1, top2, bottom2: PtrS);

Implementation

  procedure PushStack(var top, bottom: PtrS);
  var ok:boolean; val:integer;
  
  begin
    ok := True;
    
    while ok do
    begin
      write('Enter Data: ');
      read(val);
      if val = 999 then
        Ok := false
      else
      begin
        New(bottom);
        bottom^.Next := top;
        bottom^.Data := val;
        top := bottom;
      end;
    end;
  end;
  
  procedure PopStack(var top, bottom: PtrS);
  var ok:boolean; val:integer;
  begin
    ok := True;
    
    while ok do
    begin
      write('Enter 1 if pop, 0 if stop: ');
      read(val);
      if val = 0 then
        Ok := false
      else
      begin
        bottom := bottom^.Next;
        top := bottom;
      end;
    end;
  end;
  
  procedure ReadStack(var bottom: PtrS);
  begin
    while bottom <> NIL do
    begin
      writeln(bottom^.Data);
      bottom := bottom^.Next;
    end;
  end;  
  
  procedure ReadReversedStack(var bottom: PtrS);
  begin
    while bottom <> NIL do
    begin
      writeln(bottom^.Data);
      bottom := bottom^.Next;
    end;
  end;
  
  procedure ConnectStacks(var bottom, top:PtrS);
  begin
    while top^.Next <> NIL do
      top := top^.Next;
    top^.Next := bottom;
  end;
  
  procedure StackUI(var top1, bottom1, top2, bottom2: PtrS);
  var input, wait:integer; 
  var n:real;
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('(Stack)');
      writeln('Enter option:');
      writeln('1) Push stack');
      writeln('2) Pop stack');
      writeln('3) Read stack');
      writeln('4) Connect stacks');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Push elements to the stack');
        PushStack(top1, bottom1);
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Pop elements from the stack');
        PopStack(top1, bottom1);
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Read elements from the stack');
        ReadStack(bottom1);
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Connect two stacks');
        writeln('First:');
        PushStack(top1, bottom1);
        writeln('Second:');
        PushStack(top2, bottom2);
        read(wait);
      end;
    end;
  end;
  
end.