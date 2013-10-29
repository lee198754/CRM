unit TelManagerUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, bainaADOQuery, cxControls, cxContainer,
  cxEdit, cxLabel, Buttons;

type
  TTelManagerFrm = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    cxLabel1: TcxLabel;
    Query: TbainaADOQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    teladd , teledit  : Boolean ;
    UserID,TelNo : STRING ;
    Indexid : Integer ;
    { Public declarations }
  end;

var
  TelManagerFrm: TTelManagerFrm;

implementation

uses DataBase, NewUser;

{$R *.dfm}

procedure TTelManagerFrm.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TTelManagerFrm.BitBtn1Click(Sender: TObject);
begin
  inherited;
  IF teladd =True Then
    Begin
      IF Edit1.Text='' Then Application.MessageBox('电话号码不能为空','系统提示',MB_OK+MB_IconWarning)
      Else
        Begin
          DataBaseModule.dtclsData.BeginTrans;
          Try
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('Insert into UserTel(UserID ,Telphone ) values(:UserID , :Telphone )');
            Query.Parameters.ParamByName('UserID').Value:= UserID ;
            Query.Parameters.ParamByName('Telphone').Value:= Edit1.Text;
            Query.Prepared;
            Query.ExecSQL;
            DataBaseModule.dtclsData.CommitTrans;
            teladd := False ;
            Close();
            Frm_User.showtel ;
          Except
            DataBaseModule.DtclsData.RollBackTrans;
            Raise;
          End;
        End;
    End;
  if teledit = True Then
    Begin
      IF Edit1.Text= TelNo  Then Close;
      IF Edit1.Text='' Then Application.MessageBox('部门名称不能为空','系统提示',MB_OK+MB_IconWarning)
      Else
        Begin
          DataBaseModule.dtclsData.BeginTrans;
          Try
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('Update UserTel Set Telphone =:Telphone Where UserID =:UserID and IndexID = :Indexid ');
            Query.Parameters.ParamByName('Telphone').Value:=Edit1.Text;
            Query.Parameters.ParamByName('UserID').Value:= UserID ;
            Query.Parameters.ParamByName('Indexid').Value:=Indexid ;
            Query.Prepared;
            Query.ExecSQL;
            DataBaseModule.dtclsData.CommitTrans;
            teledit :=False;
            Close();
            Frm_User.showtel ;
          Except
            DataBaseModule.DtclsData.RollBackTrans;
            Raise;
          End;
        End;
    End;
end;


procedure TTelManagerFrm.FormActivate(Sender: TObject);
begin
  if teledit = True then
  Edit1.Text := TelNo ;
end;

end.
