Unit StudentFile;

Interface
  uses crt;
  
  Type Student = record
    Name: string[10];
    Marks: array[1..3] of string[2];
  end;
  
  procedure MakeFile;
  procedure ReadFile;
  procedure AddFile;
  procedure BadGuys;
  
  procedure MakeAndAddText;
  procedure ViewText;
  procedure BadGuysText;
  
  procedure StudentFileUI;

Implementation
  
  procedure MakeFile;
  var 
    ch: char;
    Ok: boolean;
    FileName: string;
    StudentFile: file of Student;
    FlowStudent: Student;
  begin
    readln();
    Ok := True;
    write('Write a file name: ');
    readln(FileName);
    if not FileExists(FileName) then
    begin
      writeln('File is not found :(');
      exit;
    end;
    
    ClrScr;
    assign(StudentFile, FileName);
    rewrite(StudentFile);
    with FlowStudent do
      while Ok do
      begin
        GoToXY(1, 1); 
        write('Continue input? y/n: ');
        GoToXY(1, 2); 
        readln(ch);
        ClrScr;
        if (ch = 'n') or (ch = 'N') then
        begin
         Ok := False;
         close(StudentFile);
        end
        else
        begin
          GoToXY(1, 1); write('Enter student`s last name: ');
          GoToXY(1, 2); readln(Name);
          GoToXY(1, 3); write('Enter their Math grade: ');
          GoToXY(1, 4); readln(Marks[1]); 
          GoToXY(1, 5); write('Enter their Physics grade: ');
          GoToXY(1, 6); readln(Marks[2]); 
          GoToXY(1, 7); write('Enter their Chemistry grade: ');
          GoToXY(1, 8); readln(Marks[3]); 
          ClrScr;
          GoToXY(1, 8); 
          ClearLine;
          write(StudentFile, FlowStudent);
        end;
    end;
  end;
  
  procedure ReadFile;
  var 
    k: integer;
    FileName: string[12];
    FlowStudent: Student;
    StudentFile: file of Student;
  begin
    readln();
    k := 3;
    write('Enter the name of the file: ');
    readln(FileName);
    if not FileExists(FileName) then
    begin
      writeln('File is not found :(');
      exit;
    end;
    
    assign(StudentFile, FileName);
    reset(StudentFile);
    with FlowStudent do
      while not EOF(StudentFile) do
      begin
        k := k + 1;
        read(StudentFile, FlowStudent);
        GoToXY(1, k); write(Name);
        GoToXY(21, k); write(Marks);
      end;
    close(StudentFile); 
    writeln;
  end;
  
  procedure AddFile;
  var 
    ch: char;
    Ok: boolean;
    NewName, FileName: string;
    NewFile, StudentFile: file of Student;
    FlowStudent: Student;
  begin 
    readln();
    Ok := True;
    write('Enter the file name: ');
    readln(FileName);
    if not FileExists(FileName) then
    begin
      writeln('File is not found :(');
      exit;
    end;
    
    assign(StudentFile, FileName); 
    reset(StudentFile);    
    NewName := 'aaaa';
    assign(NewFile, NewName); 
    rewrite(NewFile);
    ClrScr;
    
    while not EOF(StudentFile) do
    begin
    read(StudentFile, FlowStudent);
      write(NewFile, FlowStudent);
    end;
    with FlowStudent do 
      while Ok do
      begin
        GoToXY(1, 1); writeln('Continue input? y/n');
        GoToXY(1, 2); readln(ch);
        ClrScr;
        GoToXY(1, 1); ClearLine;
        if (ch = 'n') or (ch = 'N') then
        begin
          Ok := False;
          Close(NewFile);
        end
        else 
        begin
          GoToXY(1, 1); write('Enter student name: ');
          GoToXY(1, 2); readln(FlowStudent.Name); 
          GoToXY(1, 3); write('Enter their Calculus grade: ');
          GoToXY(1, 4); readln(FlowStudent.Marks[1]); 
          GoToXY(1, 5); write('Enter their CS grade: ');
          GoToXY(1, 6); readln(FlowStudent.Marks[2]); 
          GoToXY(1, 7); write('Enter their Physics grade: ');
          GoToXY(1, 8); readln(FlowStudent.Marks[3]); 
          ClrScr;
          GoToXY(1, 8); ClearLine;
          write(NewFile, FlowStudent); 
        end;
      end;
    close(StudentFile);
    erase(StudentFile);
    rename(NewFile, FileName);
  end;
  
  procedure BadGuys;
  var
    FileName: string;
    StudentFile: file of Student;
    FlowStudent: Student;
    CountMarks: integer;
    MarkAmount: integer;
  begin
    readln();
    write('Enter the file name: ');
    readln(FileName);
    if not FileExists(FileName) then
    begin
      writeln('File is not found :(');
      exit;
    end;
    
    assign(StudentFile, FileName);
    reset(StudentFile);
    begin
    write('Enter the mark amount (1, 2, 3): ');
    read(MarkAmount);
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      if FlowStudent.Marks[1] = '2' then
        Inc(CountMarks);
      if FlowStudent.Marks[2] = '2' then
        Inc(CountMarks);
      if FlowStudent.Marks[3] = '2' then
        Inc(CountMarks);
      if CountMarks = MarkAmount then
      begin
        writeln();
        writeln(FlowStudent.Name);
        writeln('Calculus grade: ', FlowStudent.Marks[1]); 
        writeln('CS grade: ', FlowStudent.Marks[2]);
        writeln('Physics grade: ', FlowStudent.Marks[3]);
      end;
    end;
    close(StudentFile);
    end;
  end;
  
  
  procedure MakeAndAddText;
  var ch: char;
      ok: boolean;
      TextName: string;
      Name: string;
      Marks: string[3];
      StudentText: Text; // text file
  begin
    ClrScr;
    readln();
    write('Enter file name: ');
    readln(TextName);
    assign(StudentText, TextName);
    append(StudentText);
    if not FileExists(TextName) then
      rewrite(StudentText);
    while ok do
    begin
      write('Will enter something? (y/n): ');
      readln(ch);
      ClearLine;
      if(ch <> 'y') then
      begin
        ok := false;
        close(StudentText);
      end
      else
      begin
        write('Enter the name: ');
        readln(Name);
        ClearLine;
        write('Enter 3 marks (without spaces): '); 
        readln(Marks); 
        write(StudentText, Name:10, Marks:3);
      end;
    end;
    close(StudentText);
  end;
  
  procedure ViewText;
  var k: integer;
      ch: char;
      TextName: string[12];
      Name: string[10];
      Marks: string[3];
      StudentText: Text;
  begin
    ClrScr;
    readln();
    k := 3;
    write('Enter file name: ');
    readln(TextName);
    assign(StudentText, TextName);
    reset(StudentText);
    if not FileExists(TextName) then
      writeln('File ', TextName, ' is not found')
    else
    begin
      while not EOF(StudentText) do 
      begin
        k := k + 1;
        read(StudentText, Name, Marks);
        GoToXY(1, k); write(Name);
        GoToXY(12, k); write(Marks);
      end;
    end;
    close(StudentText);
  end;

  procedure BadGuysText;
  var ch: char;
      k: byte;
      TextName: string[12];
      Name: string[10];
      Marks: string[3];
      StudentText: Text;
  begin
    ClrScr;
    readln();
    k := 3;
    write('Enter file name: ');
    readln(TextName);
    assign(StudentText, TextName);
    reset(StudentText);
    if not FileExists(TextName) then
      writeln('File ', TextName, 'is not found')
    else
    begin
      while not EOF(StudentText) do 
      begin
        read(StudentText, Name, Marks);
        // TODO (if Marks contain 2).
        //if()
      end;
    end;
  end;
  
  procedure StudentFileUI();
  var input, wait:integer; 
  var n:real; 
  begin
    input := -1;
    while(input <> 0) do
    begin
      ClrScr;
      writeln('[Student File]');
      writeln('--------------');
      writeln('1) Make file');
      writeln('2) Read file');
      writeln('3) Add file');
      writeln('4) Bad guys');
      writeln('-----------');
      writeln('5) Make and add (text) file');
      writeln('6) View (text) file');
      writeln('7) Bad guys (text)');
      writeln('0) Back');
      read(input);
      
      if(input = 1) then
      begin
        ClrScr;
        writeln('Make file|');
        writeln('----------');
        MakeFile();
        read(wait);
      end;
      
      if(input = 2) then
      begin
        ClrScr;
        writeln('Read file|');
        writeln('----------');
        ReadFile();
        read(wait);
      end;
      
      if(input = 3) then
      begin
        ClrScr;
        writeln('Add file|');
        writeln('---------');
        AddFile();
        read(wait);
      end;
      
      if(input = 4) then
      begin
        ClrScr;
        writeln('Bad guys|');
        writeln('---------');
        BadGuys();
        read(wait);
      end;
      
      if(input = 5) then
      begin
        ClrScr;
        writeln('Make and add (text) file|');
        writeln('---------------');
        MakeAndAddText();
        read(wait);
      end;
      
      if(input = 6) then
      begin
        ClrScr;
        writeln('View (text) file|');
        writeln('---------');
        ViewText();
        read(wait);
      end;
      
      if(input = 7) then
      begin
        ClrScr;
        writeln('Bad guys (text)|');
        writeln('---------');
        BadGuysText();
        read(wait);
      end;
    end;
  end;

end.