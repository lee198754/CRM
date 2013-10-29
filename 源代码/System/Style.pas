unit Style;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles;

type
  TFrm_Style = class(TForm)
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Style: TFrm_Style;

implementation

uses MainFrm;

{$R *.dfm}

procedure TFrm_Style.BitBtn1Click(Sender: TObject);
Var
  Styleini:TIniFile;
begin
  Styleini:=TInifile.Create(ExtractFilePath(Application.ExeName)+'style.ini');
  IF RadioButton1.Checked Then
    Styleini.WriteString('option','style','1');
  IF RadioButton2.Checked Then
    Styleini.WriteString('option','style','2');
  IF RadioButton3.Checked Then
    Styleini.WriteString('option','style','3');
  Styleini.Free;
  Close;  
end;

procedure TFrm_Style.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
