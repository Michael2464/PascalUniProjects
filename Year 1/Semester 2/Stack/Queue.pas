Unit Queue;

Interface
  Type PtrQ = ^Queue_;
  Queue_ = record
    Data: integer;
    Next: PtrQ;
  end;
  
  procedure PushQueue(top, left, right:PtrQ);
  procedure ReadQueue(top, left, right:PtrQ);

Implementation

  procedure PushQueue(top, left, right:PtrQ);
  var ok:boolean; val:integer;
  begin
    ok := True;
    New(top);
    
    while ok do
    begin
      write('Enter Data: ');
      read(val);
      if val = 999 then
      begin
        ok := False;
        top^.Next := NIL;
      end;
      else
      begin
        top^.Data := val;
        right := top;
        left := top;
      end;
    end;
  end;
  
  procedure ReadStack(top, bottom:Ptr);
  begin
    bottom := top;
    while bottom <> NIL do
    begin
      writeln(bottom^.Data);
      bottom := bottom^.Next;
    end;
  end;
  
end.