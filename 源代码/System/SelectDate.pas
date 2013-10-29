unit SelectDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TFrm_SelectDate = class(TForm)
    BeginDate: TcxDateEdit;
    EndDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SelectDate: TFrm_SelectDate;

implementation

uses Customer, PublicClass, Supply;

{$R *.dfm}

procedure TFrm_SelectDate.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_SelectDate.cxButton1Click(Sender: TObject);
begin
  IF BeginDate.Text<>'' Then
    Begin
      Try
        StrToDatetime(BeginDate.Text);
      Except
        BeginDate.Text:='';
        Exit;
      End;
      IF ISCust=True Then
        Frm_CustManager.CustBeginDate:= DateTimeToStr(BeginDate.Date)
      Else Frm_Supply.CustBeginDate:= DateTimeToStr(BeginDate.Date);
    End
  Else
    Begin
      IF ISCust=True Then
        Frm_CustManager.CustBeginDate:= ''
      Else Frm_Supply.CustBeginDate:='';
    End;
  IF EndDate.Text<>'' Then
    Begin
      Try
        StrToDatetime(EndDate.Text);
      Except
        EndDate.Text:='';
        Exit;
      End;
      IF ISCust=True Then
        Frm_CustManager.CustEndDate:= DateTimeToStr(EndDate.Date+1)
      Else Frm_Supply.CustEndDate:= DateTimeToStr(EndDate.Date+1);
    End
  Else
    Begin
      IF ISCust=True Then
        Frm_CustManager.CustEndDate:= ''
      Else Frm_Supply.CustEndDate:= '';
    End;
  Close;
end;

procedure TFrm_SelectDate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
