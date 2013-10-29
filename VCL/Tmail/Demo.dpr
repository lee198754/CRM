program Demo;

uses
  Forms,
  DemoForm in 'DemoForm.pas' {Form1},
  Mail2000 in 'Mail2000.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Mail2000 Demo';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
