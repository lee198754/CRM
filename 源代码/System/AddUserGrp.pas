unit AddUserGrp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, StdCtrls, Buttons, cxLabel, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, DB, ADODB, bainaADOQuery, XPMenu;

type
  TFrm_UserGrpAdd = class(TBase_Frm)
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    UserGrpM: TbainaADOQuery;
    Query: TbainaADOQuery;
    cxCheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_UserGrpAdd: TFrm_UserGrpAdd;

implementation

uses Right, DataBase;

{$R *.dfm}

procedure TFrm_UserGrpAdd.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_UserGrpAdd.FormActivate(Sender: TObject);
begin
  inherited;
  IF Frm_right.ISAdd=True Then
    Begin
      cxTextEdit1.Text:='';
      cxTextEdit2.Text:='';
      cxCheckBox1.Checked:=True;
    End;
  IF Frm_Right.ISEdit=True Then
    Begin
      cxTextEdit1.Text:=Frm_right.UserGrpNum;
      cxTextEdit1.Properties.ReadOnly:=False;
      cxTextEdit2.Text:=Frm_right.UserGrpName;
      cxCheckBox1.Checked:=Frm_Right.IFGrpEnable;
    End;
end;

procedure TFrm_UserGrpAdd.BitBtn1Click(Sender: TObject);
Var
  I:integer;
begin
  inherited;
  IF (Cxtextedit1.Text='') OR (cxtextedit2.Text='') Then Application.MessageBox('用户组编号和名称不能为空','系统提示',MB_OK+MB_IconWarning);
  IF Frm_Right.ISAdd=True Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from UserGroup_ where GrpCode_=:GrpCode OR GrpName_=:GrpName');
      Query.Parameters.ParamByName('GrpCode').Value:=CxTextEdit1.Text;
      Query.Parameters.ParamByName('GrpName').Value:=CxTextEdit2.Text;
      Query.Prepared;
      Query.Open;
      IF Query.IsEmpty Then
        Begin
          Databasemodule.dtclsData.BeginTrans;
          Try
            UserGrpM.Close;
            UserGrpM.SQL.Clear;
            UserGrpM.SQL.Add('Insert into UserGroup_ (GrpCode_,GrpName_,ISEnable_) values(:GrpCode,:GrpName,:ISEnable)');
            UserGrpM.Parameters.ParamByName('GrpCode').Value:=Cxtextedit1.Text;
            UserGrpM.Parameters.ParamByName('GrpName').Value:=Cxtextedit2.Text;
            IF cxCheckBox1.Checked=True Then
              UserGrpM.Parameters.ParamByName('ISEnable').Value:=Boolean(1)
            Else
              UserGrpM.Parameters.ParamByName('ISEnable').Value:=Boolean(0);
            UserGrpM.ExecSQL;
            
            Databasemodule.dtclsData.CommitTrans;
            Close;
          Except
            DatabaseModule.dtclsData.RollbackTrans;
            Raise;
          End;
        End
      Else
        Begin
          Application.MessageBox('用户组编号或名称重复','系统提示',MB_OK+MB_IconWarning);
          Exit;
        End;
    End;
  IF Frm_Right.ISEdit=True Then
    Begin
      IF (CxTextEdit2.Text=Frm_Right.UserGrpName)  Then
        Begin
          IF cxCheckbox1.Checked=Frm_Right.IFGrpEnable Then Close
            Else
              Begin
                Databasemodule.dtclsData.BeginTrans;
                Try
                  UserGrpM.Close;
                  UserGrpM.SQL.Clear;
                  UserGrpM.SQL.Add('Update UserGroup_ Set ISEnable_=:ISEnable Where GrpName_=:GrpName');
                  IF cxCheckBox1.Checked=True Then
                    UserGrpM.Parameters.ParamByName('ISEnable').Value:=Boolean(1)
                  Else
                    UserGrpM.Parameters.ParamByName('ISEnable').Value:=Boolean(0);
                  UserGrpM.Parameters.ParamByName('GrpName').Value:=CxTextEdit2.Text;  
                  UserGrpM.ExecSQL;
                  Databasemodule.dtclsData.CommitTrans;
                  Close;
                Except
                  DatabaseModule.dtclsData.RollbackTrans;
                  Raise;
                End;
              End;
        End
      Else
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select * from UserGroup_ where GrpName_=:GrpName');
          Query.Parameters.ParamByName('GrpName').Value:=CxTextEdit2.Text;
          Query.Prepared;
          Query.Open;
          IF Query.IsEmpty Then
            Begin
              Databasemodule.dtclsData.BeginTrans;
              Try
                UserGrpM.Close;
                UserGrpM.SQL.Clear;
                UserGrpM.SQL.Add('Update UserGroup_ Set GrpName_=:NGrpName,ISEnable_=:ISEnable Where GrpName_=:OGrPName');
                UserGrpM.Parameters.ParamByName('NGrpName').Value:=Cxtextedit2.Text;
                UserGrpM.Parameters.ParamByName('OGrpName').Value:=Frm_Right.UserGrpName;
                IF cxCheckBox1.Checked=True Then
                  UserGrpM.Parameters.ParamByName('ISEnable').Value:=Boolean(1)
                Else
                  UserGrpM.Parameters.ParamByName('ISEnable').Value:=Boolean(0);
                UserGrpM.ExecSQL;
                Databasemodule.dtclsData.CommitTrans;
                Close;
              Except
                DatabaseModule.dtclsData.RollbackTrans;
                Raise;
              End;
            End
          Else
            Begin
              Application.MessageBox('用户组名称重复','系统提示',MB_OK+MB_IconWarning);
              Exit;
            End;
        End;
    End;
end;

procedure TFrm_UserGrpAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Frm_Right.FormActivate(self);
end;

end.
