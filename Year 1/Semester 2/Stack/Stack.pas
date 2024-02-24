Unit Stack;

Interface
  Type PtrS = ^Stack_;
  Stack_ = record
    Data: integer;
    Next: PtrS;
  end;
  
  var top, bottom: PtrS;
  
  procedure PushStack();
  procedure ReadStack();

Implementation

  procedure PushStack();
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
  
  procedure ReadStack();
  begin
    bottom := top;
    while bottom <> NIL do
    begin
      writeln(bottom^.Data);
      bottom := bottom^.Next;
    end;
  end;
  
end.