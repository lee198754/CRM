program Demo;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  SkinForm in 'SkinForm.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
