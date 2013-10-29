unit NewUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, dxBarExtItems, cxClasses, ImgList,
  ActnList, XPMenu, cxImage, cxCheckBox, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, ComCtrls, DB, ADODB, bainaADOQuery, DataClass, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, StdCtrls, ExtCtrls, cxLookAndFeels, Buttons,
  Menus, cxButtonEdit, cxGridExportLink, frxClass, frxDBSet, cxPC,
  cxLookAndFeelPainters, cxButtons;

type
  TFrm_User = class(TBaseData_Frm)
    TreeView1: TTreeView;
    DSQuery: TDataSource;
    Panel1: TPanel;
    GridUser: TcxGrid;
    UserView: TcxGridDBTableView;
    GridUserLevel1: TcxGridLevel;
    PageControl1: TcxPageControl;
    TabSheet1: TcxTabSheet;
    UserNum: TcxTextEdit;
    UserName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    UserSystem: TcxCheckBox;
    UserStop: TcxCheckBox;
    TabSheet2: TcxTabSheet;
    UserCard: TcxTextEdit;
    UserWPhone: TcxTextEdit;
    UserFPhone: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel17: TcxLabel;
    UserICQ: TcxTextEdit;
    UserMobil: TcxTextEdit;
    UserEmail: TcxTextEdit;
    UserAddress: TcxTextEdit;
    UserMemo: TcxMemo;
    UserSex: TcxComboBox;
    UserDept: TcxComboBox;
    UserIn: TcxDateEdit;
    UserOut: TcxDateEdit;
    UserBirthday: TcxDateEdit;
    DSUser: TDataSource;
    Query: TbainaADOQuery;
    SpeedButton3: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    QueryUser: TbainaADOQuery;
    UserDuty: TcxButtonEdit;
    dlgSave1: TSaveDialog;
    DeleteQuery: TbainaADOQuery;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel2: TPanel;
    BtnSave: TcxButton;
    BtnCancel: TcxButton;
    cxtbsht1: TcxTabSheet;
    bndqry1: TbainaADOQuery;
    ds1: TDataSource;
    cxgrdbtblvwGrid2DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid2Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxgrdbclmnGrid2DBTableView1IndexId: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1UserID: TcxGridDBColumn;
    cxgrdbclmnGrid2DBTableView1Telphone: TcxGridDBColumn;
    pm1: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    LAdoHideSelect: TbainaADOQuery;
    UserViewColumn1: TcxGridDBColumn;
    UserViewColumn2: TcxGridDBColumn;
    UserViewColumn3: TcxGridDBColumn;
    UserViewColumn4: TcxGridDBColumn;
    UserViewColumn5: TcxGridDBColumn;
    UserViewColumn6: TcxGridDBColumn;
    UserViewColumn7: TcxGridDBColumn;
    UserViewColumn8: TcxGridDBColumn;
    UserViewColumn9: TcxGridDBColumn;
    UserViewColumn10: TcxGridDBColumn;
    UserViewColumn11: TcxGridDBColumn;
    UserViewColumn12: TcxGridDBColumn;
    UserViewColumn13: TcxGridDBColumn;
    UserViewColumn14: TcxGridDBColumn;
    procedure TreeView1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actModifyExecute(Sender: TObject);
    procedure actundoExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure UserDeptPropertiesChange(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure UserDutyClick(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure UserViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bndqry1BeforePost(DataSet: TDataSet);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure UserViewColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure UserViewCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    Procedure EditReadonly(Readonly:Boolean;Color:TColor);
    Procedure RefreshTree;
    Procedure ShowTree;
    Procedure ShowUser;
    Procedure UpdateReport;
  public
    { Public declarations }
      IFAdd,IFEdit:Boolean;
      PDeptName:String;
      procedure showtel ;


      
  end;

var
  Frm_User: TFrm_User;

implementation

Uses DataBase, PublicClass, Dept, Dict, ReportFrom, TelManagerUnt,
  Dictother;

{$R *.dfm}
Var
  ISAdd,ISEdit,ISCancel:Boolean;
  DeptID:Integer;
  RecordNO:TBookMark;

procedure TFrm_User.TreeView1Click(Sender: TObject);
begin
  inherited;
  IF Treeview1.Selected=Nil Then Exit;
  PDeptName:=Treeview1.Selected.Text;
  RefreshTree;
  ShowUser;
  showtel ;
end;

procedure TFrm_User.FormCreate(Sender: TObject);
begin
  inherited;
  IFAdd:=False;
  IFEdit:=False;
  EditReadonly(True,ClBtnface);
  ShowTree;

end;

procedure TFrm_User.actAddExecute(Sender: TObject);
begin
  inherited;
 IF Treeview1.Selected=Nil Then
   Begin
     Application.MessageBox('请先选择部门','提示',MB_OK+MB_Iconwarning);
     BTCancel.Click;
     Exit;
   End;
 ISAdd:=True;
 ISEdit:=False;
 BtnSave.Visible:=True;
 BtnCancel.Visible:=True;
 EditReadonly(False,Clwhite);
 PageControl1.ActivePage:=TabSheet1;
 UserNum.SetFocus;
 UserStop.Checked:=True;
 UserDept.Text:=Treeview1.Selected.Text;
 cxtbsht1.TabVisible := False ;
end;

procedure TFrm_User.EditReadonly(Readonly: Boolean ; Color:TColor);
begin
  IF (ISAdd=True) And (ISEdit=False) Then
    Begin
      UserNum.Text:='';
      UserName.Text:='';
      UserSex.Text:='';
      UserDept.Text:='';
      UserDuty.Text:='';
      UserIn.Text:='';
      UserOut.Text:='';
      UserStop.Checked:=False;
      UserSystem.Checked:=False;
      UserBirthday.Text:='';
      UserCard.Text:='';
      Userwphone.Text:='';
      Userfphone.Text:='';
      Usermobil.Text:='';
      UserICQ.Text:='';
      UserEmail.Text:='';
      UserAddress.Text:='';
      UserMemo.Text:='';
    End;
  IF ISEdit=True Then UserNum.Properties.ReadOnly:=Not Readonly
  Else UserNum.Properties.ReadOnly:=Readonly;
  
  UserName.Properties.ReadOnly:=Readonly;
  UserSex.Properties.ReadOnly:=Readonly;
  UserDept.Properties.ReadOnly:=Readonly;
  UserDuty.Properties.ReadOnly:=Readonly;
  UserIn.Properties.ReadOnly:= Readonly;
  UserOut.Properties.ReadOnly:=Readonly;
  UserStop.Enabled:=Not Readonly;
  UserSystem.Enabled:=Not Readonly;
  UserBirthday.Properties.Readonly:=Readonly;
  UserCard.Properties.ReadOnly:=Readonly;
  Userwphone.Properties.ReadOnly:=Readonly;
  Userfphone.Properties.ReadOnly:=Readonly;
  Usermobil.Properties.ReadOnly:=Readonly;
  UserICQ.Properties.ReadOnly:=Readonly;
  UserEmail.Properties.ReadOnly:=Readonly;
  UserAddress.Properties.ReadOnly:=Readonly;
  UserMemo.Properties.ReadOnly:=Readonly;

  UserNum.Style.Color:=Color;
  UserName.Style.Color:=Color;
  UserSex.Style.Color:=Color;
  UserDept.Style.Color:=Color;
  UserDuty.Style.Color:=Color;
  UserIn.Style.Color:=Color;
  UserOut.Style.Color:=Color;
  UserBirthday.Style.Color:=Color;
  UserCard.Style.Color:=Color;
  Userwphone.Style.Color:=Color;
  Userfphone.Style.Color:=Color;
  Usermobil.Style.Color:=Color;
  UserICQ.Style.Color:=Color;
  UserEmail.Style.Color:=Color;
  UserAddress.Style.Color:=Color;
  UserMemo.Style.Color:=Color;

  Treeview1.Enabled:=Readonly;
  Griduser.Enabled:=Readonly;
end;

procedure TFrm_User.actModifyExecute(Sender: TObject);
begin
  inherited;
  IF DSUser.DataSet.IsEmpty Then
    Begin
      Application.MessageBox('请先选择要修改的数据','系统提示',MB_OK+MB_IconWarning);
      BTCancel.Click;
      Exit;
    End
  Else
    Begin
      RecordNo:=DSUser.DataSet.GetBookmark;
      ISEdit:=True;
      ISAdd:=False;
      EditReadonly(False,Clwhite);
      BtnSave.Visible:=True;
      BtnCancel.Visible:=True;
      //BtnEnabled(False);
      cxtbsht1.TabVisible := False ; // add lmz
    End;
end;

procedure TFrm_User.actundoExecute(Sender: TObject);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  BtnSave.Visible:=False;
  BtnCancel.Visible:=False;
  EditReadonly(True,Clbtnface);
  TreeView1Click(Treeview1.Selected);
  cxtbsht1.TabVisible := true ; // add lmz ; 
end;

procedure TFrm_User.actSaveExecute(Sender: TObject);
begin
  //inherited;
  With DatabaseModule DO
    Begin
      IF ISAdd=True Then
        Begin
            IF (UserNum.Text='') OR (UserName.Text='') then
            Begin
              Application.MessageBox('用户编号和名称不能为空','系统提示',MB_OK+MB_IconWarning);
              Exit;
            End;
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('Select * from Users_ where UserCode_=:UserCode OR UserName_=:UserName');
            Query.Parameters.ParamByName('UserCode').Value:=UserNum.Text;
            Query.Parameters.ParamByName('UserName').Value:=UserName.Text;
            Query.Prepared;
            Query.Open;
          IF Query.IsEmpty Then
          Begin
            DtclsData.BeginTrans;
            Try
              
              Adoquery.Close;
              Adoquery.SQL.Clear;
              Adoquery.SQL.Add('Insert into Users_(Usercode_,UserName_,UserSex_,DeptID_,Password_,ISEnable_,IFSystem_,UserDuty_,UserBirthday_, ');
              Adoquery.SQL.Add(' UserIndate_,UserOutDate_,WorkPhone_,FamilyPhone_,UserMobile_,UserICQ_,UserEmail,UserIDCard_, ');
              Adoquery.SQL.Add(' UserAddress_,UserMemo_,Created_,CreateBy_)');
              Adoquery.SQL.Add(' Values(:UserNum,:UserName,:UserSex,:DeptID,:Password,:ISEnable,:IFSystem,:UserDuty,:Userbirthday,:UserIndate');
              Adoquery.SQL.Add(',:UserOutDate,:WorkPhone,:FamilyPhone,:UserMobile,:UserICQ,:UserIDCard,:UserEmail,:UserAddress');
              Adoquery.SQL.Add(',:UserMemo,:Created,:CreateBy)');
              Adoquery.Parameters.ParamByName('UserNum').Value:=UserNum.Text;
              Adoquery.Parameters.ParamByName('UserName').Value:=UserName.Text;
              Adoquery.Parameters.ParamByName('UserSex').Value:=UserSex.Text;
              Adoquery.Parameters.ParamByName('DeptID').Value:=DeptID;
              Adoquery.Parameters.ParamByName('Password').Value:=EncrypKey('1234','Tushiqi');
              IF UserStop.Checked=True Then Adoquery.Parameters.ParamByName('ISEnable').value:=Boolean(1)
              Else Adoquery.Parameters.ParamByName('ISEnable').value:=Boolean(0);
              IF UserSystem.Checked=True Then Adoquery.Parameters.ParamByName('IFSystem').value:=Boolean(1)
              Else Adoquery.Parameters.ParamByName('IFSystem').value:=Boolean(0);
              Adoquery.Parameters.ParamByName('UserDuty').Value:=UserDuty.Text;
              IF UserBirthday.Text='' Then Adoquery.Parameters.ParamByName('UserBirthday').Value:=Null
              Else Adoquery.Parameters.ParamByName('UserBirthday').Value:=UserBirthday.Date;
              IF UserIn.Text='' Then Adoquery.Parameters.ParamByName('UserIndate').Value:=Null
              Else Adoquery.Parameters.ParamByName('UserIndate').Value:=UserIn.Date;
              IF UserOut.Text='' Then Adoquery.Parameters.ParamByName('UserOutDate').Value:=Null
              Else Adoquery.Parameters.ParamByName('UserOutDate').Value:=UserOut.Date;
              Adoquery.Parameters.ParamByName('WorkPhone').Value:=UserWPhone.Text;
              Adoquery.Parameters.ParamByName('Familyphone').Value:=UserFPhone.Text;
              Adoquery.Parameters.ParamByName('UserMobile').Value:=UserMobil.Text;
              Adoquery.Parameters.ParamByName('UserICQ').Value:=UserIcq.Text;
              Adoquery.Parameters.ParamByName('UserEmail').Value:=UserEmail.Text;
              Adoquery.Parameters.ParamByName('UserIDCard').Value:=UserCard.Text;
              Adoquery.Parameters.ParamByName('UserAddress').Value:=UserAddress.Text;
              Adoquery.Parameters.ParamByName('UserMemo').Value:=UserMemo.Text;
              Adoquery.Parameters.ParamByName('Created').Value:=Now;
              Adoquery.Parameters.ParamByName('CreateBy').Value:=DataBaseModule.dtclsData.UserID_;
              Adoquery.ExecSQL;
              DtclsData.CommitTrans;
              RefreshTree;
              //EditReadonly(True,Clbtnface);
              BTCancel.Click;
              DSUser.DataSet.Last;
            Except
              DtclsData.RollbackTrans;
              Raise;
            End;
          End
        Else
          Application.MessageBox('用户编号或名称重复!','系统提示',MB_OK+MB_IconWarning);
        End;
      
      IF ISEdit=True Then
        Begin
          DtclsData.BeginTrans;
            Try
              Adoquery.Close;
              Adoquery.SQL.Clear;
              Adoquery.SQL.Add('Update Users_ Set UserName_=:UserName, UserSex_=:UserSex, DeptID_=:DeptID, ISEnable_=:ISEnable, IFSystem_=:IFSystem');
              Adoquery.SQL.Add(',UserDuty_=:UserDuty, UserBirthday_=:Userbirthday,UserIndate_=:UserIndate,UserOutDate_=:UserOutDate');
              Adoquery.SQL.Add(',WorkPhone_=:WorkPhone,FamilyPhone_=:FamilyPhone,UserMobile_=:UserMobile,UserICQ_=:UserICQ,UserEmail=:UserEmail');
              Adoquery.SQL.Add(',UserIDCard_=:UserIDCard,UserAddress_=:UserAddress,UserMemo_=:UserMemo,Updated_=:UpdateD,UpdateBy_=:UpdateBy');
              Adoquery.SQL.Add('Where UserCode_=:UserCode');
              Adoquery.Parameters.ParamByName('UserName').Value:= UserName.Text;
              Adoquery.Parameters.ParamByName('UserSex').Value:= UserSex.Text;
              Adoquery.Parameters.ParamByName('DeptID').Value:=  DeptID;
              IF UserStop.Checked=True Then Adoquery.Parameters.ParamByName('ISEnable').Value:=Boolean(1)
              Else Adoquery.Parameters.ParamByName('ISEnable').Value:=Boolean(0);
              IF UserSystem.Checked=True Then Adoquery.Parameters.ParamByName('IFSystem').Value:=Boolean(1)
              Else Adoquery.Parameters.ParamByName('IFSystem').Value:=Boolean(0);
              Adoquery.Parameters.ParamByName('UserDuty').Value:=UserDuty.Text;
              IF UserBirthday.Text='' Then Adoquery.Parameters.ParamByName('UserBirthday').Value:=Null
              Else Adoquery.Parameters.ParamByName('UserBirthday').Value:=UserBirthday.Date;
              IF UserIn.Text='' Then Adoquery.Parameters.ParamByName('UserIndate').Value:=Null
              Else Adoquery.Parameters.ParamByName('UserIndate').Value:=UserIn.Date;
              IF UserOut.Text='' Then Adoquery.Parameters.ParamByName('UserOutDate').Value:=Null
              Else Adoquery.Parameters.ParamByName('UserOutDate').Value:=UserOut.Date;
              Adoquery.Parameters.ParamByName('WorkPhone').Value:= UserWPhone.Text;
              Adoquery.Parameters.ParamByName('Familyphone').Value:= UserFPhone.Text;
              Adoquery.Parameters.ParamByName('UserMobile').Value:= UserMobil.Text;
              Adoquery.Parameters.ParamByName('UserICQ').Value:= UserIcq.Text;
              Adoquery.Parameters.ParamByName('UserEmail').Value:= UserEmail.Text;
              Adoquery.Parameters.ParamByName('UserIDCard').Value:= UserCard.Text;
              Adoquery.Parameters.ParamByName('UserAddress').Value:= UserAddress.Text;
              Adoquery.Parameters.ParamByName('UserMemo').Value:= UserMemo.Text;
              Adoquery.Parameters.ParamByName('UpdateD').Value:=Now;
              Adoquery.Parameters.ParamByName('UpdateBy').Value:=DataBaseModule.dtclsData.UserID_;
              Adoquery.Parameters.ParamByName('UserCode').Value:=UserNum.Text;
              Adoquery.ExecSQL;
              DtclsData.CommitTrans;
              RefreshTree;
              //EditReadonly(True,Clbtnface);
              BTCancel.Click;
              DSUser.DataSet.GotoBookmark(RecordNO);
            Except
              DtclsData.RollbackTrans;
              Raise;
            End;
        End;
        cxtbsht1.TabVisible := true ; // add lmz
    End;

end;

procedure TFrm_User.RefreshTree;
Var
  I,M,FCount:Integer;
begin
  inherited;
  FCount:=0;
  I:=Treeview1.Selected.Index+1;
  With DataBaseModule DO
  Begin
    AdoUser.Close;
    AdoUser.SQL.Clear;
    AdoUser.SQL.Add('Select a.DeptID_,a.DeptName_,b.UserID_,b.UserCode_,b.UserName_,b.Password_,b.UserSex_,b.UserDuty_,b.isEnable_,b.IFSystem_ ,');
    AdoUser.SQL.Add(' b.UserBirthday_,b.UserIndate_,b.UserOutDate_ ,b.WorkPhone_ ,b.Familyphone_ ,b.UserMobile_,b.UserICQ_ ,b.UserEmail ,b.UserIDCard_ ,');
    AdoUser.SQL.Add(' b.UserAddress_ ,b.UserPhoto_ ,b.UserMemo_ ');
    AdoUser.SQL.Add(' From DepartMent_ a, Users_ b where a.DeptID_=b.DeptID_ And a.DeptName_=:DeptName');
    AdoUser.Parameters.ParamByName('DeptName').Value:=Treeview1.Selected.Text;
    AdoUser.Prepared;
    AdoUser.Open;
    FCount:=Adoquery.fieldcount;
    {IF Userview.ColumnCount<>0 Then Userview.ClearItems;
    FOR M:=0 TO DSUser.DataSet.FieldCount - 7 Do
      Begin
        Userview.CreateColumn;
        Userview.Columns[M].Name:='UserColumn'+IntToStr(M);
        //Userview.Columns[M].Caption:='用户名称';
      End;
    Userview.DataController.DataSource:=DSUser;
    Userview.Columns[0].Caption:='用户编号';
    Userview.Columns[0].DataBinding;
    Userview.Columns[0].DataBinding.FieldName:='UserCode_';
    Userview.Columns[0].DataBinding.ValueType:='Float';

    Userview.Columns[1].Caption:='用户名称';
    Userview.Columns[1].DataBinding;
    Userview.Columns[1].DataBinding.FieldName:='UserName_';
    Userview.Columns[1].DataBinding.ValueType:='String';

    Userview.Columns[2].Caption:='性别';
    Userview.Columns[2].DataBinding;
    Userview.Columns[2].DataBinding.FieldName:='UserSex_';
    Userview.Columns[2].Width:=30;
    Userview.Columns[2].DataBinding.ValueType:='String';

    Userview.Columns[3].Caption:='职务';
    Userview.Columns[3].DataBinding;
    Userview.Columns[3].DataBinding.FieldName:='UserDuty_';
    Userview.Columns[3].DataBinding.ValueType:='String';

    Userview.Columns[4].Caption:='部门';
    Userview.Columns[4].DataBinding;
    Userview.Columns[4].DataBinding.FieldName:='DeptName_';
    Userview.Columns[4].DataBinding.ValueType:='String';

    Userview.Columns[5].Caption:='启用';
    Userview.Columns[5].DataBinding;
    Userview.Columns[5].DataBinding.FieldName:='ISEnable_';
    Userview.Columns[5].DataBinding.ValueType:='Boolean';

    Userview.Columns[6].Caption:='系统管理员';
    Userview.Columns[6].DataBinding;
    Userview.Columns[6].DataBinding.FieldName:='IFSystem_';
    Userview.Columns[6].DataBinding.ValueType:='Boolean';
    Userview.Columns[6].Width:=70;

    Userview.Columns[6].Caption:='生日';
    Userview.Columns[6].DataBinding;
    Userview.Columns[6].DataBinding.FieldName:='UserBirthday_';
    Userview.Columns[6].DataBinding.ValueType:='Datetime';

    Userview.Columns[7].Caption:='入职日期';
    Userview.Columns[7].DataBinding;
    Userview.Columns[7].DataBinding.FieldName:='UserIndate_';
    Userview.Columns[7].DataBinding.ValueType:='Datetime';

    Userview.Columns[8].Caption:='离职日期';
    Userview.Columns[8].DataBinding;
    Userview.Columns[8].DataBinding.FieldName:='UserOutDate_';
    Userview.Columns[8].DataBinding.ValueType:='Datetime';

    Userview.Columns[9].Caption:='工作电话';
    Userview.Columns[9].DataBinding;
    Userview.Columns[9].DataBinding.FieldName:='WorkPhone_';
    Userview.Columns[9].DataBinding.ValueType:='String';

    Userview.Columns[10].Caption:='家庭电话';
    Userview.Columns[10].DataBinding;
    Userview.Columns[10].DataBinding.FieldName:='Familyphone_';
    Userview.Columns[10].DataBinding.ValueType:='String';

    Userview.Columns[11].Caption:='手机';
    Userview.Columns[11].DataBinding;
    Userview.Columns[11].DataBinding.FieldName:='UserMobile_';
    Userview.Columns[11].DataBinding.ValueType:='String';

    Userview.Columns[12].Caption:='身份证';
    Userview.Columns[12].DataBinding;
    Userview.Columns[12].DataBinding.FieldName:='UserIDCard_';
    Userview.Columns[12].DataBinding.ValueType:='String';

    Userview.Columns[13].Caption:='身份证';
    Userview.Columns[13].DataBinding;
    Userview.Columns[13].DataBinding.FieldName:='UserIDCard_';
    Userview.Columns[13].DataBinding.ValueType:='String';

    Userview.Columns[14].Caption:='地址';
    Userview.Columns[14].DataBinding;
    Userview.Columns[14].DataBinding.FieldName:='UserAddress_';
    Userview.Columns[14].DataBinding.ValueType:='String';}

  End;
  IF DSUser.DataSet.RecordCount>0 Then
  Begin
    BTDelete.Enabled:=True;
    BTEdit.Enabled:=True;
  End
  Else
    Begin
      BTDelete.Enabled:=False;
      BTEdit.Enabled:=False;
    End;  
end;

procedure TFrm_User.UserDeptPropertiesChange(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin
      Adoquery.Close;
      Adoquery.SQL.Clear;
      Adoquery.SQL.Add('Select DeptID_ From DepartMent_ where DeptName_=:DeptName');
      Adoquery.Parameters.ParamByName('Deptname').Value:=UserDept.Text;
      Adoquery.Prepared;
      Adoquery.Open;
      DeptID:= Adoquery.fieldbyname('DeptID_').AsInteger;
    End;

end;

procedure TFrm_User.actDelExecute(Sender: TObject);
Var
  UserNum:String;
begin
  inherited;
  IF DSUser.DataSet.IsEmpty Then Exit;
      UserNum:= IntToStr(DSUser.DataSet.fieldbyname('UserID_').AsInteger);
      With DatabaseModule Do
        Begin
          DeleteQuery.Close;
          DeleteQuery.SQL.Clear;
          DeleteQuery.SQL.Add('Select * From Customer Where BelongID=:BelongID');
          DeleteQuery.Parameters.ParamByName('BelongID').Value:= DSUser.DataSet.fieldbyname('UserID_').AsString;
          DeleteQuery.Prepared;
          DeleteQuery.Open;
          IF DeleteQuery.IsEmpty Then
            Begin
              IF Application.MessageBox('确认要删除该用户资料吗？','请谨慎操作!',MB_YESNO+MB_IconWarning)=IDNO Then Exit
              Else
                Begin
                  DtclsData.BeginTrans;
                  Try
                    Adoquery.Close;
                    Adoquery.SQL.Clear;
                    AdoQuery.SQL.Add('Delete From Note Where BelongID='+UserNum);//删除通讯录
                    
                    AdoQuery.SQL.Add('Delete From GroupUsers_ Where UserID_='+UserNum);//删除组用户
                    AdoQuery.SQL.Add('Delete From UserGroupUserAccess_ Where UserOrGroup='+'''0'''+' And UserOrGroupID_='+UserNum);//删除组权限
                    AdoQuery.SQL.Add('Delete From UserGroupDeptAccess_ Where UserOrGroup='+'''0'''+' And UserOrGroupID_='+UserNum);//删除部门权限
                    AdoQuery.SQL.Add('Delete From UserGroupAccess_ Where UserOrGroup='+'''0'''+' And UserOrGroupID_='+UserNum);//删除用户权限
                    Adoquery.SQL.Add('Delete from Users_ where UserCode_=:UserNum');
                    Adoquery.Parameters.ParamByName('UserNum').Value:=DSUser.DataSet.fieldbyname('UserCode_').AsString;
                    Adoquery.Prepared;
                    Adoquery.ExecSQL;
                    DtclsData.CommitTrans;
                    RefreshTree;
                  Except
                    DtclsData.RollbackTrans;
                    Raise;
                  End;
                End;
            End
          Else
            Application.MessageBox('该用户下有客户资料存在,不允许删除','提示',MB_OK+MB_Iconwarning);
        End;

end;

procedure TFrm_User.ShowTree;
Var
  I:Integer;
  Node:TTreeNode;
begin

  With DataBaseModule DO
    Begin
      UserDept.Clear;
        Begin
          AdoQuery.Close;
          Adoquery.SQL.Clear;
          Adoquery.SQL.Add('Select DeptID_,Deptname_ From DepartMent_');
          Adoquery.Prepared;
          Adoquery.Open;
          Adoquery.First;
          TreeView1.Items.Clear;
          UserDept.Properties.Items.Clear;
          Node:=Nil;//Treeview1.Items.Add(Nil,'部门');
          FOR I:=0 TO Adoquery.RecordCount-1 DO
            Begin
              Treeview1.Items.AddChild(Node,Adoquery.FieldByName('Deptname_').AsString);
              UserDept.Properties.Items.Add(Adoquery.FieldByName('Deptname_').AsString);
              Adoquery.Next;
            End;
          Treeview1.Items.GetFirstNode;
        End;
    End;
end;

procedure TFrm_User.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  ShowTree;
end;

procedure TFrm_User.N1Click(Sender: TObject);
begin
  inherited;
  IFADD:=True;
  Frm_Dept := TFrm_Dept.Create(Self);
  with Frm_Dept Do
  begin
    ShowModal;
  End;
end;

procedure TFrm_User.N2Click(Sender: TObject);
begin
  inherited;
  IFEdit:=True;
  Frm_Dept := TFrm_Dept.Create(Self);
  with Frm_Dept Do
  begin
    ShowModal;
  End;
end;

procedure TFrm_User.N3Click(Sender: TObject);
Var
  TVText:String;
begin
  inherited;
  IF Treeview1.Selected=Nil Then Exit;
  QueryUser.Close;
  QueryUser.SQL.Clear;
  QueryUser.SQL.Add('Select UserName_ From Users_ a,DepartMent_ b where b.DeptName_=:DeptName And a.DeptID_=b.DeptID_');
  QueryUser.Parameters.ParamByName('DeptName').Value:=Treeview1.Selected.Text;
  QueryUser.Prepared;
  QueryUser.Open;
      IF QueryUser.IsEmpty Then
        Begin
          QueryUser.Close;
          QueryUser.SQL.Clear;
          QueryUser.SQL.Add('Delete From DepartMent_ where DeptName_=:Deptname');
          QueryUser.Parameters.ParamByName('DeptName').Value:=Treeview1.Selected.Text;
          QueryUser.Prepared;
          QueryUser.ExecSQL;
          ShowTree;
        End
      Else Application.MessageBox('该部门下存在用户,不能删除','系统提示',MB_OK+MB_IconWarning);
  Treeview1.Selected:=Nil;
end;

procedure TFrm_User.UserDutyClick(Sender: TObject);
begin
  inherited;
  IF UserDuty.Properties.ReadOnly=True Then Exit;
  With DatabaseModule DO
     Begin
       AdoDictOther.Close;
       AdoDictOther.SQL.Clear;
       AdoDictOther.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictOther.Parameters.ParamByName('FieldName').Value:='职务';
       AdoDictOther.Prepared;
       AdoDictOther.Open;

       AdoDictOther.FieldByName('DictID').Visible:=False;
       AdoDictOther.FieldByName('FieldName').Visible:=False;
       AdoDictOther.FieldByName('IFCust').Visible:=False;
       AdoDictOther.FieldByName('Context').DisplayLabel:='职务';
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:='UserDuty_';
  Frm_Dictother.DictDuty:='职务';
  Frm_Dictother.DictIFCust:=0;
  Frm_Dictother.FrmName:='Frm_user';
  Frm_Dictother.ShowModal;
end;


procedure TFrm_User.actExportExecute(Sender: TObject);
begin
  inherited;
  if dlgSave1.Execute then
  ExportGridToExcel(dlgSave1.FileName ,GridUser);
end;

procedure TFrm_User.ShowUser;
begin
  UserNum.Text:=DSUser.DataSet.fieldbyname('UserCode_').AsString;
  UserName.Text:=DSUser.DataSet.fieldbyname('UserName_').AsString;
  UserDept.Text:=DSUser.DataSet.fieldbyname('DeptName_').AsString;
  UserSex.Text:=DSUser.DataSet.fieldbyname('UserSex_').AsString;
  UserDuty.Text:=DSUser.DataSet.fieldbyname('UserDuty_').AsString;
  IF DSUser.DataSet.fieldbyname('UserBirthday_').AsString='' Then UserBirthday.Text:=''
  Else  UserBirthday.Date:=DSUser.DataSet.fieldbyname('UserBirthday_').AsDateTime;
  IF DSUser.DataSet.fieldbyname('UserIndate_').AsString='' Then UserIn.Text:=''
  Else UserIn.Date:=DSUser.DataSet.fieldbyname('UserIndate_').AsDateTime;
  IF DSUser.DataSet.fieldbyname('UserOutDate_').AsString='' Then UserOut.Text:=''
  Else UserOut.Date:=DSUser.DataSet.fieldbyname('UserOutDate_').AsDateTime;
  UserWphone.Text:=DSUser.DataSet.fieldbyname('WorkPhone_').AsString;
  UserFphone.Text:=DSUser.DataSet.fieldbyname('Familyphone_').AsString;
  UserMobil.Text:=DSUser.DataSet.fieldbyname('UserMobile_').AsString;
  UserICQ.Text:=DSUser.DataSet.fieldbyname('UserICQ_').AsString;
  UserEmail.Text:=DSUser.DataSet.fieldbyname('UserEmail').AsString;
  UserCard.Text:=DSUser.DataSet.fieldbyname('UserIDCard_').AsString;
  UserAddress.Text:=DSUser.DataSet.fieldbyname('UserAddress_').AsString;
  UserMemo.Text:=DSUser.DataSet.fieldbyname('UserMemo_').AsString;
  IF Userview.DataController.DataSet.fieldbyname('ISEnable_').AsBoolean=Boolean(1) Then
    UserStop.Checked:=True
  Else
    UserStop.Checked:=False;

  IF Userview.DataController.DataSet.fieldbyname('IFSystem_').AsBoolean=Boolean(1) Then
    UserSystem.Checked:=True
  Else
    UserSystem.Checked:=False;
end;

procedure TFrm_User.UserViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ShowUser;
//--------------------------------------------------
  bndqry1.Close ;
  bndqry1.Parameters.ParamByName('UserID').Value := DSUser.DataSet.Fieldbyname('Usercode_').Value ;
  bndqry1.Open ;
//--------------------------------------------------
end;

procedure TFrm_User.FormShow(Sender: TObject);
begin
  inherited;
  UpdateReport;
  Userview.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'ini\User.ini');
end;

procedure TFrm_User.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=False;
end;

procedure TFrm_User.UpdateReport;
begin
  Self.LoadReport(PopupMenu2);
  Self.AddReportdataSet(DataBaseModule.AdoUser);
end;

procedure TFrm_User.bndqry1BeforePost(DataSet: TDataSet);
begin
  inherited;
  if (UserNum.Text <> '') and (bndqry1.FieldByName('Telphone').Value <> '') then
  bndqry1.FieldByName('UserID').Value := UserNum.Text ;
end;

procedure TFrm_User.N9Click(Sender: TObject);
begin
    if  DSUser.DataSet.IsEmpty Then
    Begin
      Application.MessageBox('没有用户资料','系统提示',MB_OK+MB_IconWarning);
      Exit;
    End else
    begin
      TelManagerFrm := TTelManagerFrm.Create(Self);
      with TelManagerFrm Do
      begin
        teladd := True ;
        UserID := DSUser.DataSet.Fieldbyname('UserCode_').Value ;
        ShowModal;
      End;
    end ;
end;
procedure TFrm_User.N10Click(Sender: TObject);
begin
  inherited;
  if  ds1.DataSet.IsEmpty Then
    Begin
      Application.MessageBox('没有可编辑资料','系统提示',MB_OK+MB_IconWarning);
      Exit;
    end else
    begin
      TelManagerFrm := TTelManagerFrm.Create(Self);
      with TelManagerFrm Do
      begin
        Indexid := ds1.DataSet.Fieldbyname('Indexid').Value ;
        UserID := ds1.DataSet.Fieldbyname('UserID').Value ;
        TelNo := ds1.DataSet.fieldbyname('Telphone').Value ;
        teledit := True ;
        ShowModal;
      End;
   end ;
end;
procedure TFrm_User.N11Click(Sender: TObject);
begin
  inherited;
  if ds1.DataSet.IsEmpty Then
  Begin
    Application.MessageBox('没有可删除的资料','系统提示',MB_OK+MB_IconWarning);
    Exit;
  end else
  begin
    QueryUser.Close ;
    QueryUser.SQL.Clear ;
    QueryUser.SQL.Add('delete from UserTel where IndexID = :Indexid') ;
    QueryUser.Parameters.ParamByName('Indexid').Value := bndqry1.fieldbyname('IndexID').Value ;
    QueryUser.ExecSQL;
    showtel ;
  end ;
end;

procedure TFrm_User.showtel;
begin
  bndqry1.Close ;
  bndqry1.Parameters.ParamByName('Userid').Value := DSUser.DataSet.fieldbyname('UserCode_').Value ;
  bndqry1.Open ;
end;

procedure TFrm_User.UserViewColumnSizeChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  UserView.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\User.ini');
end;

procedure TFrm_User.UserViewCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  UserView.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\User.ini');
end;

end.
