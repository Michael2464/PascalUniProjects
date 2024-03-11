uses Stack;

// TODO: Add Stack to UI library!!!
// TODO: Add Queue to UI library!!!

var top1, bottom1: PtrS;
var top2, bottom2: PtrS;

begin
  
  PushStack(top1, bottom1);
  PushStack(top2, bottom2);
  writeln('-----');
  ConnectStacks(top1, top2);
  ReadReversedStack(bottom2);
  
end.