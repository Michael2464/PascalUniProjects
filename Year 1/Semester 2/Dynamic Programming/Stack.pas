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
  procedure ConnectStacks(var bottom, top:PtrS);

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
  
  procedure ConnectStacks(var bottom, top:PtrS);
  begin
    while top^.Next <> NIL do
      top := top^.Next;
    top^.Next := bottom;
  end;
  
end.