unit Password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, cxGraphics, DB, ADODB, bainaADOQuery, cxLabel,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  StdCtrls, Buttons, XPMenu;

type
  TFrm_Password = class(TBase_Frm)
    ComboDept: TcxComboBox;
    ComboUser: TcxComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    QueryDept: TbainaADOQuery;
    QueryUser: TbainaADOQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxLabel5: TcxLabel;
    EdtUser: TcxTextEdit;
    OldPassword: TEdit;
    FNewPassword: TEdit;
    SNewPassword: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ComboDeptFocusChanged(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Password: TFrm_Password;

implementation

uses DataBase, PublicClass;

{$R *.dfm}

procedure TFrm_Password.FormCreate(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  QueryDept.Close;
  QueryDept.SQL.Clear;
  QueryDept.SQL.Add('Select DeptID_,DeptName_ From DepartMent_');
  QueryDept.Prepared;
  QueryDept.Open;
  ComboDept.Properties.Items.Clear;
  FOR I:=1 TO QueryDept.RecordCount DO
    Begin
      ComboDept.Properties.Items.Add(QueryDept.FieldByName('Deptname_').AsString);
      QueryDept.Next;
    End;
end;

procedure TFrm_Password.ComboDeptFocusChanged(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  QueryUser.Close;
  QueryUser.SQL.Clear;
  QueryUser.SQL.Add('Select b.UserName_ From DepartMent_ a,Users_ b where a.DeptName_=:DeptName And a.DeptID_=b.DeptID_');
  QueryUser.Parameters.ParamByName('DeptName').Value:=ComboDept.Text;
  QueryUser.Prepared;
  QueryUser.Open;
  ComboUser.Properties.Items.Clear;
  FOR I:=1 TO QueryUser.RecordCount DO
    Begin
      ComboUser.Properties.Items.Add(QueryUser.Fieldbyname('UserName_').AsString);
      QueryUser.Next;
    End;
end;

procedure TFrm_Password.BitBtn1Click(Sender: TObject);
begin
  inherited;
  QueryUser.Close;
  QueryUser.SQL.Clear;
  QueryUser.SQL.Add('Select Password_ From Users_ where UserName_=:UserName');
  QueryUser.Parameters.ParamByName('UserName').Value:=EdtUser.Text;
  QueryUser.Prepared;
  QueryUser.Open;
  IF UncrypKey(QueryUser.FieldByName('Password_').AsString,'Tushiqi')<>OldPassword.Text Then Application.MessageBox('原密码输入错误,请重新输入','系统提示',MB_OK+MB_IconWarning)
  Else
    Begin
      IF FNewPassword.Text='' Then
        Begin
          Application.MessageBox('密码不能为空','系统提示',MB_OK+MB_IconWarning);
          Exit;
        End;   
      IF FNewPassword.Text=SNewPassword.Text Then
        Begin
          DatabaseModule.dtclsData.BeginTrans;
          Try
            QueryUser.Close;
            QueryUser.SQL.Clear;
            QueryUser.SQL.Add('Update Users_ Set Password_=:Password Where UserName_=:UserName');
            QueryUser.Parameters.ParamByName('Password').Value:=EncrypKey(FNewPassword.Text,'Tushiqi');
            QueryUser.Parameters.ParamByName('UserName').Value:=EdtUser.Text;
            QueryUser.Prepared;
            QueryUser.ExecSQL;
            DatabaseModule.dtclsData.CommitTrans;
            Application.MessageBox('密码修改成功,请重新登录验证！','系统提示',MB_OK+MB_IconWarning);
            Close;
          Except
            DatabaseModule.dtclsData.RollbackTrans;
            Raise
          End;
        End;
    End;
end;

procedure TFrm_Password.BitBtn2Click(Sender: TObject);
begin
  inherited;
  DatabaseModule.dtclsData.BeginTrans;
  IF ComboUser.Text<>'' Then
    Begin
          Try
            QueryUser.Close;
            QueryUser.SQL.Clear;
            QueryUser.SQL.Add('Update Users_ Set Password_=:Password Where UserName_=:UserName');
            QueryUser.Parameters.ParamByName('Password').Value:=EncrypKey('1234','Tushiqi');
            QueryUser.Parameters.ParamByName('UserName').Value:=ComboUser.Text;
            QueryUser.Prepared;
            QueryUser.ExecSQL;
            DatabaseModule.dtclsData.CommitTrans;
            Application.MessageBox('密码修改成功,请重新登录验证！','系统提示',MB_OK+MB_IconWarning);
            Close;
          Except
            DatabaseModule.dtclsData.RollbackTrans;
            Raise
          End;
    End;
end;

end.
