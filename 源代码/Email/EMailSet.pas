unit EMailSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, XPMenu, ComCtrls,EMailFrm, StdCtrls, DB, Mask, DBCtrls,
  Buttons;

type
  TEMailSet_Frm = class(TBase_Frm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    dbedtUsername: TDBEdit;
    ds1: TDataSource;
    lbl1: TLabel;
    lbl2: TLabel;
    dbedtPwd: TDBEdit;
    Label1: TLabel;
    dbedtEMail: TDBEdit;
    Label2: TLabel;
    dbedtSMTP: TDBEdit;
    Label3: TLabel;
    dbedtPOP3: TDBEdit;
    lbl3: TLabel;
    dbedtSmtp_port: TDBEdit;
    Label4: TLabel;
    dbedtpop3_port: TDBEdit;
    dbchkIsBackUP: TDBCheckBox;
    dbchkAuthenticate: TDBCheckBox;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EMailSet_Frm: TEMailSet_Frm;

implementation

{$R *.dfm}
uses
   DataClass;
procedure TEMailSet_Frm.FormCreate(Sender: TObject);
begin
  inherited;
  if EMail_Frm.qryEml_set.IsEmpty Then
  begin
    EMail_Frm.qryEml_set.Insert;
    EMail_Frm.qryEml_set.FieldByName('Smtp_port').AsInteger := 25;
    EMail_Frm.qryEml_set.FieldByName('pop3_port').AsInteger := 110;
  end else
    EMail_Frm.qryEml_set.Edit;
end;

procedure TEMailSet_Frm.btn1Click(Sender: TObject);
begin
  inherited;
  if ds1.State in [dsinsert,dsedit] Then
  begin
    ds1.DataSet.FieldByName('BelongID').AsInteger:=TDataClass(Email_Frm.qryEml_set.Connection).UserID_;
    ds1.DataSet.FieldByName('CreateBy_').AsString :=
        TDataClass(EMail_Frm.qryEml_set.Connection).UserName_;
    ds1.DataSet.FieldByName('CreateD_').AsString  :=
        FormatDateTime('YYYY-MM-DD hh:mm',now);
    EMail_Frm.qryEml_set.Post;
  end;
  close;
end;

procedure TEMailSet_Frm.btn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TEMailSet_Frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  EMailSet_Frm := nil;
end;

end.
