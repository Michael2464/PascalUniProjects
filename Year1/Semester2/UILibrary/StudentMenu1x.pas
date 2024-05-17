Unit StudentMenu1x;

// TODO: drop out students with certain amount of 2s

Interface
  uses crt;
  
  Type Student = record
    Name: string;
    CalculusGrade: integer;
    CSGrade: integer;
    PhysicsGrade: integer;
    Next: ^Student;
  end;

  var Top: ^Student;

  procedure Push(Name: string; CalculusGrade, CSGrade, PhysicsGrade: integer);
  procedure ViewAllStudents;
  procedure AddStudentGrades;
  procedure BadGuys;
  procedure RetakeExam;
  procedure DropOutStudent;
  
  procedure StudentMenu1xUI;
  
Implementation

  procedure Push(Name: string; CalculusGrade, CSGrade, PhysicsGrade: integer);
  var NewNode: ^Student;
  begin
    New(NewNode);
    NewNode^.Name := Name;
    NewNode^.CalculusGrade := CalculusGrade;
    NewNode^.CSGrade := CSGrade;
    NewNode^.PhysicsGrade := PhysicsGrade;
    NewNode^.Next := Top;
    Top := NewNode;
  end;

  procedure AddStudentGrades;
  var
    Name: string;
    CalculusGrade, CSGrade, PhysicsGrade: integer;
  begin
    readln();
    write('Enter student name: ');
    readln(Name);
    write('Enter calculus grade: ');
    read(CalculusGrade);
    write('Enter CS grade: ');
    read(CSGrade);
    write('Enter physics grade: ');
    read(PhysicsGrade);
    Push(Name, CalculusGrade, CSGrade, PhysicsGrade);
    writeln;
    writeln('Grades added successfully :)');
  end;


  procedure ViewAllStudents;
  var Current: ^Student;
  begin
    writeln('Student Grades:');
    writeln('---------------------------------------------------');
    writeln('| Name            | Calc | Comp Science | Physics |');
    writeln('---------------------------------------------------');
    Current := Top;
    while Current <> nil do
    begin
      writeln('|', Current^.Name:16, '|', Current^.CalculusGrade:5, '|', 
        Current^.CSGrade:8, '|', Current^.PhysicsGrade:10, '|');
      Current := Current^.Next;
    end;
    writeln('---------------------------------------------------');
  end;


  procedure BadGuys;
  var 
    Current: ^Student;
    Count: integer;
    AmountOf2: integer;
  begin
    ClrScr;
    write('Enter amount of двоек блин: ');
    read(AmountOf2);
    Current := Top;
    while Current <> nil do
    begin
      Count := 0;
      if Current^.CalculusGrade = 2 then
        Inc(Count);
      if Current^.CSGrade = 2 then
        Inc(Count);
      if Current^.PhysicsGrade = 2 then
        Inc(Count);
      if Count = AmountOf2 then
        writeln(Current^.Name);
      Current := Current^.Next;
    end;
    writeln('--------------------------------------');
  end;

  procedure RetakeExam;
  var
    Current: ^Student;
  begin
    readln();
    Current := Top;
    while Current <> nil do
    begin
      if Current^.CalculusGrade = 2 then
        Current^.CalculusGrade := 4;
      if Current^.CSGrade = 2 then
        Current^.CSGrade := 5;
      if Current^.PhysicsGrade = 2 then
        Current^.PhysicsGrade := 4;
      writeln('Exam retook successful for ', Current^.Name);
      Current := Current^.Next;
    end;
  end;


  procedure DropOutStudent;
  var
    Current, Previous: ^Student;
    Temp: ^Student;
  begin
    readln();
    Current := Top;
    Previous := nil;
    
    while Current <> nil do
    begin
      if(Current^.CalculusGrade < 3) or (Current^.CSGrade < 3) or (Current^.PhysicsGrade < 3) then
      begin
        if Previous = nil then
          Top := Current^.Next
        else
          Previous^.Next := Current^.Next;
        
        writeln('Student is dropped out: ', Current^.Name);
        Temp := Current^.Next; 
        Dispose(Current);      
        Current := Temp;       
      end
      else
      begin
        Previous := Current;
        Current := Current^.Next;        
      end;
    end;
  end;
  
  
  procedure StudentMenu1xUI;
  var input, wait:integer; 
  var n:real; 
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('[Student Tree]');
      writeln('--------------');
      writeln('1) Add student grades');
      writeln('2) View all students');
      writeln('3) Bad Guys');
      writeln('4) Retake exam');
      writeln('5) Drop out student');
      writeln('0) Back');
      read(input);
      ClrScr;
      
      if(input = 1) then
      begin
        writeln('Add student grades');
        writeln('------------------');
        AddStudentGrades();
        read(wait);
      end;
      
      if(input = 2) then
      begin
        writeln('View all students');
        writeln('-----------------');
        ViewAllStudents();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        writeln('Bad Guys');
        writeln('--------');
        BadGuys();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        writeln('Retake exam');
        writeln('-----------');
        RetakeExam();
        read(wait);
      end;
      
      if(input = 5) then
      begin
        writeln('Retake exam');
        writeln('-----------');
        DropOutStudent();
        read(wait);
      end;
    end;
  end;
  
end.