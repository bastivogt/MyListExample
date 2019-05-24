program project1;

uses sebastian.vogt.lists;



type
  TPerson = record
    Firstname: string;
    Name: string;
    Age: Integer;
  end;

  TPersonList = specialize TBaseList<TPerson>;



procedure WritePerson(VPerson: TPerson);
begin
  WriteLn(VPerson.Firstname, ' ', VPerson.Name, ' (', VPerson.Age, ')');
end;

var
  liste: TStringList;
  people: TPersonList;
  person: TPerson;
  i: Integer;


begin

  liste := TStringList.Create(3);

  liste.Add('Eins');
  liste.Add('Zwei');
  liste.Add('Drei');
  liste.Add('Vier');
  liste.Add('Fünf');
  liste.Add('Sechs');

  //liste.RemoveAt(1);

  for i := 0 to liste.Count - 1 do begin
    WriteLn(liste.getValue(i));
  end;

  WriteLn('==============================================');
  //liste.RemoveAt(1);
  liste.Clear;
  liste.Add('Eins');
  liste.Add('Zwei');
  liste.Add('Drei');

  for i := 0 to liste.Count - 1 do begin
    WriteLn(liste.getValue(i));
  end;

  (*

  for i := 0 to liste.Count - 1 do begin
    WriteLn(liste.GetValue(i));
    if liste.GetValue(i) = 'Drei' then begin
      WriteLn('JUUUHUUU');
    end;
  end;

  *)





  (*
  people := TPersonList.Create;

  person.Firstname := 'Sebastian';
  person.Name := 'Vogt';
  person.Age := 38;
  people.Add(person);

  person.Firstname := 'Joel';
  person.Name := 'Vogt';
  person.Age := 12;
  people.Add(person);

  person.Firstname := 'Noah';
  person.Name := 'Vogt';
  person.Age := 10;
  people.Add(person);

  person.Firstname := 'Ute';
  person.Name := 'Meusel';
  person.Age := 38;
  people.Add(person);

  person.Firstname := 'Buddy';
  person.Name := 'Vogt';
  person.Age := 2;
  people.Add(person);


  for i := 0 to people.Count - 1 do begin
    WritePerson(people.GetValue(i));
  end;

  end;
  *)

















  WriteLn('Press any key to quit ...');
  ReadLn;
end.

