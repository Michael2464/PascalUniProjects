Unit Queue;

Interface
  Type PtrQ = ^Queue_;
  Queue_ = record
    Data: integer;
    Next: PtrQ;
  end;
  
  var top, left, right:PtrQ;
  
  procedure PushQueue(top, left, right:PtrQ);
  procedure ReadQueue(top, left, right:PtrQ);

Implementation

  procedure PushQueue(top, left, right:PtrQ);
  var ok:boolean; val:integer;
  begin
    ok := True;
    
    while ok do
    begin
      write('Enter Data: ');
      read(val);
      if val = 999 then
      begin
        ok := False;
        top^.Next := NIL;
      end
      else 
      begin
        New(top);
        top^.Data := val;
        right := top;
        left := top;
      end;
    end;
  end;
  
  procedure ReadQueue(top, left, right:PtrQ);
  var bottom:PtrQ;
  begin
    bottom := top;
    while bottom <> NIL do
    begin
      writeln(bottom^.Data);
      bottom := bottom^.Next;
    end;
  end;
  
end.