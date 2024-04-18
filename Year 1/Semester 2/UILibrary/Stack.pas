Unit Stack;

Interface
  uses crt;
  Type PtrS = ^Stack_;
  Stack_ = record
    Data: integer;
    Next: PtrS;
  end;
  
  procedure PushNewStack(var top, bottom: PtrS);
  procedure PushStack(var top, bottom: PtrS);
  procedure PopStack(var top, bottom: PtrS);
  procedure ReadStack(var bottom: PtrS);
  procedure ReverseStack(var top: PtrS);
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
  
  procedure PushNewStack(var top, bottom: PtrS);
  var ok:boolean; val:integer;
  begin
    ok := True;
    
    while bottom <> NIL do
      bottom := bottom^.Next;
    top := bottom;   
    
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
  var bottomSave: PtrS;
  begin
    bottomSave := bottom;
    
    while bottomSave <> NIL do
    begin
      writeln(bottomSave^.Data);
      bottomSave := bottomSave^.Next;
    end;
  end;  
  
  procedure ReverseStack(var top: PtrS);
  var bottomSave: PtrS;
  var topNew, bottomNew: PtrS;
  begin
    bottomSave := top;
    
    while bottomSave <> NIL do
    begin
      New(bottomNew);
      bottomNew^.Next := topNew;
      bottomNew^.Data := bottomSave^.Data;
      topNew := bottomNew;
      bottomSave := bottomSave^.Next;
    end;
    
    top := topNew;
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
  var top1_, bottom1_, top2_, bottom2_: PtrS; // to make copies of stacks if needed. 
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('(Stack)');
      writeln('Enter option:');
      writeln('1) Push new stack');
      writeln('2) Push stack');
      writeln('3) Pop stack');
      writeln('4) Read stack');
      writeln('5) Reverse stack');
      writeln('6) Connect stacks');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Push new elements to the stack');
        PushNewStack(top1, bottom1);
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Push elements to the stack');
        PushStack(top1, bottom1);
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Pop elements from the stack');
        PopStack(top1, bottom1);
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Read elements from the stack');
        ReadStack(bottom1);
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('Stack is reversed');
        ReverseStack(bottom1);
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('Connect two stacks');
        writeln('First:');
        top1_ := top1;
        bottom1_ := bottom1;
        top2_ := top2;
        bottom2_ := bottom2;
        
        PushNewStack(top1_, bottom1_);
        writeln('Second:');
        PushNewStack(top2_, bottom2_);
        ConnectStacks(top1_, top2_);
        ReadStack(bottom2_);
        read(wait);
      end;
    end;
  end;
  
end.