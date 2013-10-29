unit Dept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, StdCtrls, Buttons, Mask, DBCtrls, Grids, DBGrids, DB,
  ADODB, bainaADOQuery, cxControls, cxContainer, cxEdit, cxLabel, XPMenu;

type
  TFrm_Dept = class(TBase_Frm)
    BitBtn1: TBitBtn;
    Query: TbainaADOQuery;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    cxLabel1: TcxLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Dept: TFrm_Dept;

implementation

uses DataBase, NewUser, PublicClass, DataClass;

{$R *.dfm}

procedure TFrm_Dept.BitBtn1Click(Sender: TObject);
begin
  inherited;
  IF Frm_User.IFAdd=True Then
    Begin
      IF Edit1.Text='' Then Application.MessageBox('部门名称不能为空','系统提示',MB_OK+MB_IconWarning)
      Else
        Begin
          DataBaseModule.dtclsData.BeginTrans;
          Try
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('Insert into DepartMent_(DeptName_) values(:DeptName)');
            Query.Parameters.ParamByName('DeptName').Value:=Edit1.Text;
            Query.Prepared;
            Query.ExecSQL;
            DataBaseModule.dtclsData.CommitTrans;
            Frm_User.IFAdd:=False;
            Close();
          Except
            DataBaseModule.DtclsData.RollBackTrans;
            Raise;
          End;
        End;
    End;
  IF Frm_User.IFEdit=True Then
    Begin
      IF Edit1.Text=Frm_User.PDeptName Then Close;
      IF Edit1.Text='' Then Application.MessageBox('部门名称不能为空','系统提示',MB_OK+MB_IconWarning)
      Else
        Begin
          DataBaseModule.dtclsData.BeginTrans;
          Try
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('Update DepartMent_ Set DeptName_=:NDeptName Where DeptName_=:ODeptName');
            Query.Parameters.ParamByName('NDeptName').Value:=Edit1.Text;
            Query.Parameters.ParamByName('ODeptName').Value:=Frm_User.PDeptName;
            Query.Prepared;
            Query.ExecSQL;
            DataBaseModule.dtclsData.CommitTrans;
            Frm_User.IFEdit:=False;
            Close();
          Except
            DataBaseModule.DtclsData.RollBackTrans;
            Raise;
          End;
        End;
    End;
end;

procedure TFrm_Dept.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Frm_User.SpeedButton3.Click;
  Action:=CaFree;
end;

procedure TFrm_Dept.FormActivate(Sender: TObject);
begin
  inherited;
  IF Frm_User.IFAdd=True Then Edit1.Text:='';
  IF Frm_User.IFEdit=True Then
    Edit1.Text:=Frm_User.PDeptName;
end;

procedure TFrm_Dept.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
