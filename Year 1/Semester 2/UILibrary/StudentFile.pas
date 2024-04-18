Unit StudentFile;

Interface
  uses crt;
  
  Type Student = record
    Name: string[10];
    Marks: string[3];
  end;
  
  var Mode: integer;
  
  procedure MakeFile;
  procedure ReadFile;
  procedure AddFile;
  
  procedure MakeAndAddText;
  procedure ViewText;
  procedure MyWrite(str: string[10]);
  procedure BadGuys;

Implementation
  
  procedure MakeFile;
  var ch: char;
      ok: boolean;
      FileName: string[12];
      StudentFile: file of Student;
      FlowStudent: Student; 
  begin
    ClrScr; 
    ok := true;
    write('Enter file name (12 characters max): ');
    readln(FileName);
    assign(StudentFile, FileName);
    rewrite(StudentFile);
    
    with FlowStudent do
    begin
      while ok do
      begin
        GoToXY(30, 10);
        write('Will enter something (y/n): ');
        readln(ch);
        ClearLine;
        if(ch = 'n') then
        begin
          ok := false;
          Close(StudentFile);
        end
        else 
        begin
          write('Enter the name: ');
          readln(Name);
          ClearLine;
          write('Enter 3 marks (without spaces): '); 
          readln(Marks); 
          write(StudentFile, FlowStudent);
        end;
      end;
    end;
  end;
  
  procedure ReadFile;
  var k:  integer;
      ch: char;
      FileName: string[12];
      StudentFile: file of Student;
      FlowStudent: Student;
  begin
    ClrScr;
    k := 3;
    write('Enter file name: ');
    readln(FileName);
    assign(StudentFile, FileName);
    reset(StudentFile);
    while not EOF(StudentFile) do
    begin
      k := k + 1;
      read(StudentFile, FlowStudent);
      GoToXY(1, k); write(FlowStudent.Name);
      GoToXY(11, k); write(FlowStudent.Marks);
    end;
    Close(StudentFile);
  end;
  
  procedure AddFile;
  var ch: char;
      ok: boolean;
      FileName, NewName: string[12];
      StudentFile, NewFile: file of Student;
      FlowStudent: Student;
  begin
    ClrScr;
    ok := true;
    write('Enter file name to copy from: ');
    readln(FileName);
    assign(StudentFile, FileName);
    reset(StudentFile);
    NewName := 'aaaa';
    assign(NewFile, NewName);
    rewrite(NewFile);
    
    // Copying data from one file to another
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      write(NewFile, FlowStudent);
    end;
    
    with FlowStudent do
    begin
      while ok do
      begin
        GoToXY(30, 10);
        write('Will enter something? (y/n): ');
        GoToXY(30, 11);
        readln(ch);
        ClearLine;
        if(ch <> 'y') then
        begin
          ok := false;
          close(NewFile);
        end
        else
        begin
          write('Enter the name: ');
          readln(Name);
          ClearLine;
          write('Enter 3 marks (without spaces): '); 
          readln(Marks); 
          write(NewFile, FlowStudent);
        end;
      end;
      close(StudentFile);
      erase(StudentFile);
      close(NewFile);
    end;
  end;
  
  procedure MakeAndAddText;
  var ch: char;
      ok: boolean;
      TextName: string[12];
      Name: string[10];
      Marks: string[3];
      StudentText: Text; // text file
  begin
    ClrScr;
    write('Enter file name: ');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-} append(StudentText); {$I+}
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
    k := 3;
    write('Enter file name: ');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-} reset(StudentText); {$I+}
    if not FileExists(TextName) then
      writeln('File ', TextName, ' is not found')
    else
    begin
      while not EOF(StudentText) do 
      begin
        k := k + 1;
        read(StudentText, Name, Marks);
        GoToXY(1, k); MyWrite(Name);
        GoToXY(12, k); write(Marks);
      end;
    end;
    close(StudentText);
  end;
  
  procedure MyWrite(str: string[10]);
  var res: string;
      i, n: byte;
  begin
    res := str;
    n := length(str); i := 1;
    while (res[i] = ' ') and (i <= n) do
      i := i + 1;
    delete(res, 1, i-1);
    write(res);
    // WHAT NEXT? WHERE DOES THIS VALUE DO!
  end;

  procedure BadGuys;
  var ch: char;
      k: byte;
      TextName: string[12];
      Name: string[10];
      Marks: string[3];
      StudentText: Text;
  begin
    ClrScr;
    k := 3;
    write('Enter file name: ');
    readln(TextName);
    assign(StudentText, TextName);
    {$I-} reset(StudentText); {$I+}
    if not FileExists(TextName) then
      writeln('File ', TextName, 'is not found')
    else
    begin
      while not EOF(StudentText) do 
      begin
        read(StudentText, Name, Marks);
        // TODO (if Marks contain 2).
        if()
      end;
    end;
  end;

end.