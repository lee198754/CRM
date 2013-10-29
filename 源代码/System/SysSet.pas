unit SysSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, ComCtrls, ExtCtrls, StdCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, DB, ADODB, bainaADOQuery;

type
  TFrm_SysSet = class(TBaseData_Frm)
    pgc1: TPageControl;
    pnl1: TPanel;
    tstab1: TTabSheet;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    lbl1: TLabel;
    edtCompanyName: TEdit;
    lbl2: TLabel;
    edtOnLineUserCount: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    sharepath: TcxTextEdit;
    Label2: TLabel;
    shareuser: TcxTextEdit;
    Label3: TLabel;
    sharepwd: TcxTextEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    ShareIP: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    EdtDigit: TEdit;
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SysSet: TFrm_SysSet;

implementation

{$R *.dfm}
uses
  dataBase;
procedure TFrm_SysSet.btn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrm_SysSet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  Frm_SysSet := nil;
end;

procedure TFrm_SysSet.FormCreate(Sender: TObject);
begin
  inherited;
  edtCompanyName.Text := DataBaseModule.dtclsData.CompanyName;
  edtOnLineUserCount.Text :=Inttostr(DataBaseModule.dtclsData.OnLineUserCount);
  With DatabaseModule Do
    Begin
      IF AdoShareSet.IsEmpty Then Exit
      Else
        Begin
          SharePath.Text:=AdoShareSet.FieldByName('SharePath').AsString;
          ShareUser.Text:=AdoShareSet.FieldByName('ShareUser').AsString;
          SharePwd.Text:=AdoShareSet.FieldByName('Sharepwd').AsString;
          ShareIP.Text:=AdoShareSet.FieldByName('ShareIP').AsString;
          EdtDigit.Text:=AdoShareSet.FieldByName('DecDigit').AsString
        End;
    End;
end;

procedure TFrm_SysSet.btn3Click(Sender: TObject);
begin
  inherited;
  SharePath.Properties.ReadOnly:=False;
  ShareUser.Properties.ReadOnly:=False;
  SharePwd.Properties.ReadOnly:=False;
  ShareIP.Properties.ReadOnly:=False;
  EdtDigit.ReadOnly:=False;
end;

procedure TFrm_SysSet.btn1Click(Sender: TObject);
begin
  inherited;
  //IF (SharePath.Text<>'') And (ShareUser.Text<>'') Then
    Begin
      With DatabaseModule DO
        Begin
          IF AdoShareSet.IsEmpty Then
            Begin
              AdoShareSet.Append;
              AdoShareSet.FieldByName('CreateBy_').AsString:=DtClsData.UserName_;
              AdoShareSet.FieldByName('CreateD_').AsDateTime:=Now;
            End
          Else
            Begin
              AdoShareSet.Edit;
              AdoShareSet.FieldByName('UpdateBy_').AsString:=DtClsData.UserName_;
              AdoShareSet.FieldByName('UpdateD_').AsDateTime:=Now;
            End;
          AdoShareSet.FieldByName('sharepath').AsString:=SharePath.Text;
          AdoShareSet.FieldByName('shareuser').AsString:=ShareUser.Text;
          AdoShareSet.FieldByName('SharePwd').AsString:=SharePwd.Text;
          AdoShareSet.FieldByName('ShareIP').AsString:=ShareIP.Text;
          AdoShareSet.FieldByName('DecDigit').AsInteger:=StrToInt(EdtDigit.Text);
          AdoShareSet.Post;
          btn2.Click;
        End;
    End;
end;

end.
