unit Right;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, DB, ADODB, bainaADOQuery, Menus, Grids, DBGrids,
  ComCtrls, dxtree, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, StdCtrls, Buttons,  ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxContainer, cxListBox, cxGridLevel, cxControls,
   cxGridTableView, cxGridDBTableView, cxGrid, dxdbtree, cxTextEdit,
  cxGridCustomView, cxGridCustomTableView, cxLookAndFeelPainters, cxButtons,
  cxPC;
  //cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  //cxGridCustomView, cxGridCustomTableView, cxGridTableView,  cxLabel,  cxPC, cxDBEdit;
   //dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxdbtree,  SWPanel,
   //RzPanel, cxSplitter, RzSplit, RzTabs,   cxCheckBox, cxControls,   cxGridDBTableView, cxGrid,  cxContainer,  cxEdit, cxListBox,
   //cxGraphics, cxGridCustomView, cxGridCustomTableView,  cxStyles,   cxCustomData,

type
  TFrm_Right = class(TBaseData_Frm)
    PageControl1: TcxPageControl;
    TabSheet1: TcxTabSheet;
    TabSheet2: TcxTabSheet;
    TabSheet3: TcxTabSheet;
    TabSheet4: TcxTabSheet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    UserGrpM: TbainaADOQuery;
    DSUserGrpM: TDataSource;
    User: TbainaADOQuery;
    UserGrpL: TbainaADOQuery;
    Query: TbainaADOQuery;
    DSUser: TDataSource;
    DSGrpL: TDataSource;
    Panel1: TPanel;
    UserGrpMList: TdxDBTreeView;
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Panel3: TPanel;
    TabSheet5: TcxTabSheet;
    Panel6: TPanel;
    QueryModule: TbainaADOQuery;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    cxListBox1: TcxListBox;
    cxListBox2: TcxListBox;
    ModuleList: TcxGridDBTableView;
    CxGridLevel1: TcxGridLevel;
    CxGrid: TcxGrid;
    DSModule: TDataSource;
    TreeView1: TTreeView;
    UserRight: TbainaADOQuery;
    GroupRight: TbainaADOQuery;
    QueryRight: TbainaADOQuery;
    DSRight: TDataSource;
    RightAdd: TbainaADOQuery;
    cxGrid1: TcxGrid;
    GridRight: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    cxGrid5: TcxGrid;
    RightDept: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    TreeView2: TTreeView;
    Panel5: TPanel;
    cxGrid8: TcxGrid;
    RightUser: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    TreeView3: TTreeView;
    AdoDeptRight: TbainaADOQuery;
    DSDeptRight: TDataSource;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    AdoUserRight: TbainaADOQuery;
    DSUserRight: TDataSource;
    TabSheet6: TcxTabSheet;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    BtnExport: TcxButton;
    BtnClear: TcxButton;
    AdoDictM: TbainaADOQuery;
    AdoDictD: TbainaADOQuery;
    DSDictM: TDataSource;
    DSDictD: TDataSource;
    AdoMTable: TbainaADOQuery;
    AdoDTable: TbainaADOQuery;
    AdoField: TbainaADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    BtnEdit: TcxButton;
    img1: TImage;
    LAdoSingle: TbainaADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cxListBox1Click(Sender: TObject);
    procedure cxListBox2Click(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TreeView2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure TreeView3Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure UserGrpMListChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure ShowGroupUser;
    Procedure ShowTree(Treeview:TTreeview);
    function SetFieldwidth(Grid:TDbGrid;FieldName:String;width:Integer):Boolean;
    Procedure ShowTabelDict;
  public
    UserGrpNum,UserGrpName:String;
    IFGrpEnable,ISAdd,ISEdit:Boolean;
    { Public declarations }
  end;

var
  Frm_Right: TFrm_Right;

implementation

uses DataBase, AddUserGrp, MainFrm;

{$R *.dfm}

Var
  UserGrpID:Integer;

procedure TFrm_Right.FormCreate(Sender: TObject);
begin
  inherited;

  User.Close();
  User.SQL.Clear;
  User.SQL.Add('Select UserID_,UserName_,DeptID_ From Users_');
  User.Prepared;
  User.Open;
  User.FieldByName('UserID_').DisplayLabel:='用户ID号';
  User.FieldByName('UserName_').DisplayLabel:='用户名';
  User.FieldByName('DeptID_').DisplayLabel:='部门ID号';
  DBGrid1.Columns[0].Visible:=False;
  DBGrid1.Columns[2].Visible:=False;

  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrm_Right.FormActivate(Sender: TObject);
begin
  inherited;
  UserGrpM.Close;
  UserGrpM.SQL.Clear;
  UserGrpM.SQL.Add('Select GrpID_,GrpCode_,GrpName_,ISEnable_ From UserGroup_');
  UserGrpM.Prepared;
  UserGrpM.Open;
  UserGrpMList.DataSource:=DSUserGrpM;
  UserGrpMList.ParentField:='GrpID_';
  UserGrpMList.KeyField:='GrpID_';
  UserGrpMList.ListField:='GrpName_';
end;

procedure TFrm_Right.N1Click(Sender: TObject);
begin
  inherited;
  ISAdd:=True;
  ISEdit:=False;
  Frm_UserGrpAdd := TFrm_UserGrpAdd.Create(Self);
  Frm_UserGrpAdd.ShowModal;
end;

procedure TFrm_Right.N2Click(Sender: TObject);
begin
  inherited;
  ISEdit:=True;
  ISAdd:=False;
  Frm_UserGrpAdd := TFrm_UserGrpAdd.Create(Self);
  Frm_UserGrpAdd.ShowModal;
end;

procedure TFrm_Right.N3Click(Sender: TObject);
begin
  inherited;
  IF Application.MessageBox('删除该权限组将会删除该权限组下的所有用户的权限!继续吗?','系统提示',MB_YESNO+MB_IconWarning)=IDYes Then
    Begin
      DatabaseModule.dtclsData.BeginTrans;
      Try
        Query.Close;
        Query.SQL.Clear;
        
        Query.SQL.Add('Delete UserGroupAccess_ Where UserOrGroup=:AUserOrGroup And UserORGroupID_=:AGrpID');
        Query.SQL.Add('Delete UserGroupDeptAccess_ Where UserOrGroup=:BUserOrGroup And UserORGroupID_=:BGrpID');
        Query.SQL.Add('Delete UserGroupUserAccess_ Where UserOrGroup=:CUserOrGroup And UserORGroupID_=:CGrpID');
        Query.SQL.Add('Delete GroupUsers_ Where GrpID_=:DGrpID');
        Query.SQL.Add('Delete UserGroup_ where GrpID_=:EGrpID');

        Query.Parameters.ParamByName('AGrpID').Value:=UserGrpM.Fieldbyname('GrpID_').AsInteger;
        Query.Parameters.ParamByName('BGrpID').Value:=UserGrpM.Fieldbyname('GrpID_').AsInteger;
        Query.Parameters.ParamByName('CGrpID').Value:=UserGrpM.Fieldbyname('GrpID_').AsInteger;
        Query.Parameters.ParamByName('AUserOrGroup').Value:=Boolean(1);
        Query.Parameters.ParamByName('BUserOrGroup').Value:=Boolean(1);
        Query.Parameters.ParamByName('CUserOrGroup').Value:=Boolean(1);
        Query.Parameters.ParamByName('DGrpID').Value:=UserGrpM.fieldbyname('GrpID_').AsInteger;
        Query.Parameters.ParamByName('EGrpID').Value:=UserGrpM.fieldbyname('GrpID_').AsInteger;

        Query.Prepared;
        Query.ExecSQL;
        DatabaseModule.dtclsData.CommitTrans;
        Frm_Right.FormActivate(Self);
      Except
        DataBaseModule.dtclsData.RollbackTrans;
        Raise
      End;
    End;
end;

procedure TFrm_Right.BitBtn1Click(Sender: TObject);
begin
  inherited;
  IF (Edit1.Text='') OR (User.IsEmpty) Then Exit;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select UserID_,GrpID_ From GroupUsers_ Where UserID_=:UserID And GrpID_=:GrpID');
  Query.Parameters.ParamByName('UserID').Value:= User.fieldbyname('UserID_').AsInteger;
  Query.Parameters.ParamByName('GrpID').Value:= UserGrpM.fieldbyname('GrpID_').AsInteger;
  Query.Prepared;
  Query.Open;
  IF Not(Query.IsEmpty) Then Exit;
  DatabaseModule.dtclsData.BeginTrans;
  Try
  UserGrpL.Close;
  UserGrpL.SQL.Clear;
  UserGrpL.SQL.Add('Insert into GroupUsers_ (UserID_,GrpID_,DeptID_) values(:UserID,:GrpID,:DeptID)');
  UserGrpL.Parameters.ParamByName('UserID').Value:=User.fieldbyname('UserID_').AsInteger;
  UserGrpL.Parameters.ParamByName('DeptID').Value:=User.fieldbyname('DeptID_').AsInteger;
  UserGrpL.Parameters.ParamByName('GrpID').Value:=UserGrpM.fieldbyname('GrpID_').AsInteger;
  UserGrpL.Prepared;
  UserGrpL.ExecSQL;
  DatabaseModule.dtclsData.CommitTrans;
  ShowGroupUser;
  Except
    DatabaseModule.dtclsData.RollbackTrans;
    Raise;
  End;
end;

procedure TFrm_Right.ShowGroupUser;
begin
  IF UserGrpM.FieldByName('ISEnable_').AsBoolean=Boolean(0) Then
  Begin
    Label1.Visible:=True;
    Label1.Caption:=UserGrpMList.Selected.Text+'已被禁用';
    BitBtn1.Enabled:=False;
    BitBtn2.Enabled:=False;
  End
  Else
  Begin
    Label1.Visible:=False;
    BitBtn1.Enabled:=True;
    BitBtn2.Enabled:=True;
  End;
  Edit1.Text:=UserGrpMList.Selected.Text;
  UserGrpID:=UserGrpM.fieldbyname('GrpID_').AsInteger;
  UserGrpNum:=UserGrpM.Fieldbyname('GrpCode_').AsString;
  UserGrpName:=UserGrpM.fieldbyname('GrpName_').AsString;
  IFGrpEnable:=UserGrpM.FieldByName('ISEnable_').AsBoolean;
  UserGrpL.Close;
  UserGrpL.SQL.Clear;
  UserGrpL.SQL.Add('Select a.UserName_,B.UserID_ From Users_ a,GroupUsers_ b where b.GrpID_=:GrpID And a.UserID_=B.UserID_');
  UserGrpL.Parameters.ParamByName('GrpID').Value:=UserGrpM.Fieldbyname('GrpID_').AsInteger;
  UserGrpL.Prepared;
  UserGrpL.Open;
  UserGrpL.FieldByName('UserName_').DisplayLabel:='用户名';
  Dbgrid2.Columns[1].Visible:=False;
end;

procedure TFrm_Right.BitBtn2Click(Sender: TObject);
begin
  inherited;
  IF DSGrpL.DataSet.IsEmpty Then Exit;
  DatabaseModule.dtclsData.BeginTrans;
  Try
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Delete GroupUsers_ Where UserID_=:UserID');
  Query.Parameters.ParamByName('UserID').Value:=UserGrpL.fieldbyname('UserID_').AsInteger;
  Query.Prepared;
  Query.ExecSQL;
  DatabaseModule.dtclsData.CommitTrans;
  ShowGroupUser;
  Except
    DatabaseModule.dtclsData.RollbackTrans;
    Raise;
  End;
end;

procedure TFrm_Right.BitBtn3Click(Sender: TObject);
Var
  I,J,K,M,N,SCount,PID:Integer;
  FrmName,FrmDesc:String;
begin
  inherited;
  IF Not (DSModule.DataSet.IsEmpty) Then
    Begin
      BitBtn3.Enabled:=False;
      Exit;
    End;
  M:=CxListBox1.Count;
  FOR I:=0 TO M-1 DO
    Begin
      DSModule.DataSet.Append;
      DSModule.DataSet.FieldByName('ModName_').AsString:=Main_Frm.Mainmenu.Items[I].Name;
      DSModule.DataSet.FieldByName('Describe_').AsString:=Main_Frm.Mainmenu.Items[I].Caption;
      DSModule.DataSet.FieldByName('IFModule_').AsBoolean:=Boolean(1);
      DSModule.DataSet.Post;
      QueryModule.UpdateBatch;
      PID:=DSModule.DataSet.fieldbyname('ModID_').AsInteger;

      SCount:=Main_Frm.Mainmenu.Items[I].Count;
      FOR J:=0 To SCount-1 DO
        Begin
          FrmName:=Main_Frm.Mainmenu.Items[I].Items[J].Name;
          FrmDesc:=Main_Frm.Mainmenu.Items[I].Items[J].Caption;
          M:=Length(FrmName);
          N:=0;
          FOR K:=1 To M Do
            Begin
              N:=N+1;
              IF Copy(FrmName,K,1)='_' Then
                Begin
                  FrmName:=Copy(FrmName,N+1,M-N);
                  DSModule.DataSet.Append;
                  DSModule.DataSet.FieldByName('ModName_').AsString:=Main_Frm.Mainmenu.Items[I].Name;
                  DSModule.DataSet.FieldByName('FromName_').AsString:=FrmName;
                  DSModule.DataSet.FieldByName('IFModule_').AsBoolean:=Boolean(0);
                  DSModule.DataSet.FieldByName('ParentModID').AsInteger:=PID;
                  DSModule.DataSet.FieldByName('Describe_').AsString:=FrmDesc;
                  DSModule.DataSet.Post;
                  Break;
                End;
            End;
        End;
       QueryModule.UpdateBatch;   
    End;
end;

procedure TFrm_Right.cxListBox1Click(Sender: TObject);
Var
  I,M:Integer;

begin
  inherited;
  M:=CxListBox1.ItemIndex;
  CxListBox2.Clear;
  FOR I:=0 TO Main_Frm.Mainmenu.Items[M].Count-1 Do
    Begin
      CxListBox2.Items.Add(Main_Frm.Mainmenu.Items[M].Items[I].Caption);
    End;
end;

procedure TFrm_Right.cxListBox2Click(Sender: TObject);
Var
  I,m,N:integer;
  FrmName:String;
begin
  inherited;
  N:=0;
  FrmName:=Main_Frm.Mainmenu.Items[CxListBox1.itemindex].Items[CxListBox2.itemindex].Name;
  M:=Length(FrmName);
  FOR I:=1 To M DO
    Begin
      N:=N+1;
      IF Copy(FrmName,I,1)='_' Then
        Begin
          FrmName:=Copy(FrmName,N+1,M-N);
          Break;
        End;
    End;
end;

procedure TFrm_Right.TabSheet5Show(Sender: TObject);
Var
  I,M:Integer;
begin
  inherited;
  CxListBox1.Clear;
  For I:=0 To Main_Frm.Mainmenu.Items.Count-1 DO
    Begin
      CxListBox1.Items.Add(Main_frm.Mainmenu.Items[I].Caption);
    End;
  //调入模块
  QueryModule.Close;
  QueryModule.SQL.Clear;
  QueryModule.SQL.Add('Select MODID_, ModName_,FromName_,IFModule_,ParentModID,Describe_ From Module_');
  QueryModule.Prepared;
  QueryModule.Open;

  IF ModuleList.ColumnCount<>0 Then ModuleList.ClearItems;
    FOR M:=0 TO QueryModule.FieldCount-1 Do
      Begin
        ModuleList.CreateColumn;
        ModuleList.Columns[M].Name:='MUserColumn'+IntToStr(M);
        //Userview.Columns[M].Caption:='用户名称';
      End;

  ModuleList.DataController.DataSource:=DSModule;
  ModuleList.Columns[0].Caption:='模块ID';
  ModuleList.Columns[0].DataBinding;
  ModuleList.Columns[0].DataBinding.FieldName:='ModID_';
  ModuleList.Columns[0].DataBinding.ValueType:='Float';
  ModuleList.Columns[0].Visible := False;

  ModuleList.Columns[1].Caption:='模块名称';
  ModuleList.Columns[1].DataBinding;
  ModuleList.Columns[1].DataBinding.FieldName:='ModName_';
  ModuleList.Columns[1].DataBinding.ValueType:='String';

  ModuleList.Columns[2].Caption:='窗体名称';
  ModuleList.Columns[2].DataBinding;
  ModuleList.Columns[2].DataBinding.FieldName:='FromName_';
  ModuleList.Columns[2].DataBinding.ValueType:='String';

  ModuleList.Columns[3].Caption:='是否模块';
  ModuleList.Columns[3].DataBinding;
  ModuleList.Columns[3].DataBinding.FieldName:='IFModule_';
  ModuleList.Columns[3].DataBinding.ValueType:='Boolean';
  ModuleList.Columns[3].Width:=70;

  ModuleList.Columns[4].Caption:='描述';
  ModuleList.Columns[4].DataBinding;
  ModuleList.Columns[4].DataBinding.FieldName:='Describe_';
  ModuleList.Columns[4].DataBinding.ValueType:='String';

  ModuleList.Columns[5].Caption:='父模块ID';
  ModuleList.Columns[5].DataBinding;
  ModuleList.Columns[5].DataBinding.FieldName:='ParentModID';
  ModuleList.Columns[5].DataBinding.ValueType:='Float';
  ModuleList.Columns[5].Visible := False;


end;

procedure TFrm_Right.BitBtn4Click(Sender: TObject);
Var
  I,K,M,N,PID,SCount:Integer;
  FrmName,FrmDesc,pName:String;
  IFAdd:Boolean;
begin
  inherited;
  IF CxListBox2.Count = 0 Then Exit;
  IFAdd:=False;
  FrmName:=Main_Frm.Mainmenu.Items[CxListBox1.itemindex].Name;
  FrmDesc:=Main_Frm.Mainmenu.Items[CxListBox1.itemindex].Caption;
  //查看父模块是否存在
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select ModID_,ModName_ from Module_ Where ModName_=:ModName');
  Query.Parameters.ParamByName('ModName').Value:=FrmName;
  Query.Prepared;
  Query.Open;
  IF Query.IsEmpty Then
    Begin
      //增加父模块
      DSModule.DataSet.Append;
      DSModule.DataSet.FieldByName('ModName_').AsString:=FrmName;
      DSModule.DataSet.FieldByName('Describe_').AsString:=FrmDesc;

      DSModule.DataSet.FieldByName('IFModule_').AsBoolean:=Boolean(1);
      DSModule.DataSet.Post;
      QueryModule.UpdateBatch;
      PID:=DSModule.DataSet.fieldbyname('ModID_').AsInteger;
      PName:=DSModule.DataSet.fieldbyname('ModName_').AsString;
    End
  Else
    Begin
      //得到父模块ID查寻子模块是否存在
      PID:=Query.fieldbyname('ModID_').AsInteger;
      PName:=Query.fieldbyname('ModName_').AsString;
    End;

  SCount:=Main_Frm.Mainmenu.Items[CxListBox1.itemindex].Count;
  FOR K:=0 TO Scount-1 DO
    Begin
      FrmName:=Main_frm.Mainmenu.Items[CxListbox1.ItemIndex].Items[K].Name;
      FrmDesc:=Main_frm.Mainmenu.Items[CxListbox1.ItemIndex].Items[K].Caption;
      M:=Length(FrmName);
      N:=0;
      FOR I:=1 To M DO
        Begin
          N:=N+1;
          IF Copy(FrmName,I,1)='_' Then
            Begin
              FrmName:=Copy(FrmName,N+1,M-N);
              //查看子模块是否存在
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from Module_ where FromName_=:FromName');
              Query.Parameters.ParamByName('FromName').Value:=FrmName;
              Query.Prepared;
              Query.Open;

              IF Query.IsEmpty Then
                Begin
                  DSModule.DataSet.Append;
                  DSModule.DataSet.FieldByName('ModName_').AsString:=PName;
                  DSModule.DataSet.FieldByName('FromName_').AsString:=FrmName;
                  DSModule.DataSet.FieldByName('Describe_').AsString:=FrmDesc;
                  DSModule.DataSet.FieldByName('IFModule_').AsBoolean:=Boolean(0);
                  DSModule.DataSet.FieldByName('ParentModID').AsInteger:=PID;
                  DSModule.DataSet.Post;
                  IFAdd:=True;
                End;
              Break;
            End;
        End;
    End;
  QueryModule.UpdateBatch;
  IF IFAdd=True Then
    Begin
      //增加到模块权限列表
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select DISTINCT UserOrGroupID_ From UserGroupAccess_ Where UserOrGroup=:UserOrGroup');
      Query.Parameters.ParamByName('UserOrGroup').Value:=0;
      Query.Prepared;
      Query.Open;
      IF Not Query.IsEmpty Then
      Begin
        Query.First;
        FOR I:=0 TO Query.RecordCount - 1 Do
          Begin
            LAdoSingle.Close;
            LAdoSingle.SQL.Clear;
            LAdoSingle.SQL.Add('Insert into UserGroupAccess_ (ModID_,UserOrGroupID_,UserOrGroup,CreateBy_,CreateD_,RBrowser,RAdd,RDelete,REdit,RPrint,RCheck,RUncheck,RPrice,RSum)');
            LAdoSingle.SQL.Add(' Values(:ModID,:UserOrGroupID,0,:CreateBy,:CreateD,0,0,0,0,0,0,0,0,0)');
            LAdoSingle.Parameters.ParamByName('ModID').Value:=DSModule.DataSet.FieldByName('ModID_').AsInteger;
            LAdoSingle.Parameters.ParamByName('UserOrGroupID').Value:=Query.FieldByName('UserOrGroupID_').AsInteger;
            LAdoSingle.Parameters.ParamByName('CreateBy').Value:=DatabaseModule.dtclsData.UserID_;
            LAdoSingle.Parameters.ParamByName('CreateD').Value:=Date;
            LAdoSingle.ExecSQL;
            Query.Next;
          End;
      End;

      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select DISTINCT UserOrGroupID_ From UserGroupAccess_ Where UserOrGroup=:UserOrGroup');
      Query.Parameters.ParamByName('UserOrGroup').Value:=1;
      Query.Prepared;
      Query.Open;
      IF Not Query.IsEmpty Then
      Begin
        Query.First;
        FOR I:=0 TO Query.RecordCount - 1 Do
          Begin
            LAdoSingle.Close;
            LAdoSingle.SQL.Clear;
            LAdoSingle.SQL.Add('Insert into UserGroupAccess_ (ModID_,UserOrGroupID_,UserOrGroup,CreateBy_,CreateD_,RBrowser,RAdd,RDelete,REdit,RPrint,RCheck,RUncheck,RPrice,RSum)');
            LAdoSingle.SQL.Add(' Values(:ModID,:UserOrGroupID,1,:CreateBy,:CreateD,0,0,0,0,0,0,0,0,0)');
            LAdoSingle.Parameters.ParamByName('ModID').Value:=DSModule.DataSet.FieldByName('ModID_').AsInteger;
            LAdoSingle.Parameters.ParamByName('UserOrGroupID').Value:=Query.FieldByName('UserOrGroupID_').AsInteger;
            LAdoSingle.Parameters.ParamByName('CreateBy').Value:=DatabaseModule.dtclsData.UserID_;
            LAdoSingle.Parameters.ParamByName('CreateD').Value:=Date;
            LAdoSingle.ExecSQL;
            Query.Next;
          End;
      End;
    End;
end;

procedure TFrm_Right.TabSheet2Show(Sender: TObject);
begin
  inherited;
  ShowTree(Treeview1);       
end;


procedure TFrm_Right.TreeView1Click(Sender: TObject);
Var
  I,M,UserID:Integer;

begin
  inherited;
  IF (Treeview1.Selected.Text<>'用户') And (Treeview1.Selected.Text<>'用户组')  Then
    Begin
      IF Treeview1.Selected.Parent.Text='用户' Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserID_ From Users_ where UserName_=:UserName');
          Query.Parameters.ParamByName('UserName').Value:=TreeView1.Selected.Text;
          Query.Prepared;
          Query.Open;
          UserID:=Query.fieldbyname('UserID_').AsInteger;
        End;
      IF Treeview1.Selected.Parent.Text='用户组' Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select GrpID_ From UserGroup_ where GrpName_=:GrpName');
          Query.Parameters.ParamByName('GrpName').Value:=TreeView1.Selected.Text;
          Query.Prepared;
          Query.Open;
          UserID:=Query.fieldbyname('GrpID_').AsInteger;
        End;




          //查找用户权限列表
          IF Treeview1.Selected.Parent.Text='用户' Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from UserGroupAccess_ Where userOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
              Query.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(0);
              Query.Prepared;
              Query.Open;
            End;
          IF Treeview1.Selected.Parent.Text='用户组' Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from UserGroupAccess_ Where userOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
              Query.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(1);
              Query.Prepared;
              Query.Open;
            End;

          IF Query.IsEmpty Then
            Begin
              QueryModule.Close;
              QueryModule.SQL.Clear;
              QueryModule.SQL.Add('Select ModID_,Describe_ From Module_ Where IFModule_=:IFModule');
              QueryModule.Parameters.ParamByName('IFModule').Value:=Boolean(0);
              QueryModule.Prepared;
              QueryModule.Open;
              QueryModule.First;
              DatabaseModule.dtclsData.BeginTrans;
              Try
                For I:=1 TO QueryModule.RecordCount Do
                Begin
                  RightAdd.Close;
                  RightAdd.SQL.Clear;
                  RightAdd.SQL.Add('Insert into UserGroupAccess_(ModID_,UserOrGroupID_,UserOrGroup,CreateBy_,CreateD_');
                  RightAdd.SQL.Add(' ,RBrowser,RAdd,RDelete,REdit,RPrint,RCheck,Runcheck,RPrice,Acc_)');
                  RightAdd.SQL.Add(' Values(:ModID,:UserOrGroupID,:UserOrGroup,:Createby,:CreateD,:RBrowser,:RAdd,:RDelete,:REdit,:RPrint,:RCheck,:Runcheck,:RPrice,:Acc)');
                  RightAdd.Parameters.ParamByName('ModID').Value:=QueryModule.fieldbyname('ModID_').AsInteger;
                  RightAdd.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
                  IF Treeview1.Selected.Parent.Text='用户' Then
                    RightAdd.Parameters.ParamByName('UserOrgroup').Value:=Boolean(0);
                  IF Treeview1.Selected.Parent.Text='用户组' Then
                    RightAdd.Parameters.ParamByName('UserOrgroup').Value:=Boolean(1);
                  RightAdd.Parameters.ParamByName('Createby').Value:=DatabaseModule.dtclsData.UserID_;
                  RightAdd.Parameters.ParamByName('CreateD').Value:=Now;
                  RightAdd.Parameters.ParamByName('RBrowser').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('RAdd').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('RDelete').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('REdit').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('RPrint').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('RCheck').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('RUncheck').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('RPrice').Value:=Boolean(0);
                  RightAdd.Parameters.ParamByName('Acc').Value:=0;
                  RightAdd.Prepared;
                  RightAdd.ExecSQL;
                  QueryModule.Next;
                End;
                DataBaseModule.dtclsData.CommitTrans;
              Except
                DataBaseModule.dtclsData.RollbackTrans;
                Raise;
              End;
            End;

      IF Treeview1.Selected.Parent.Text='用户' Then
        Begin
          QueryRight.Close;
          QueryRight.SQL.Clear;
          QueryRight.SQL.Add('Select a.Describe_,B.RBrowser,B.RAdd,B.RDelete,B.REdit,B.RPrint,B.RCheck,B.RUncheck,B.RPrice,B.Acc_');
          QueryRight.SQL.Add(' From Module_ a,UserGroupAccess_ b where a.ModID_=b.ModID_ And UserOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
          QueryRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
          QueryRight.Parameters.ParamByName('UserOrGroup').Value:=Boolean(0);
          QueryRight.Prepared;
          QueryRight.Open;
        End;
      IF Treeview1.Selected.Parent.Text='用户组' Then
        Begin
          QueryRight.Close;
          QueryRight.SQL.Clear;
          QueryRight.SQL.Add('Select a.Describe_,B.RBrowser,B.RAdd,B.RDelete,B.REdit,B.RPrint,B.RCheck,B.RUncheck,B.RPrice,B.Acc_');
          QueryRight.SQL.Add(' From Module_ a,UserGroupAccess_ b where a.ModID_=b.ModID_ And UserOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
          QueryRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
          QueryRight.Parameters.ParamByName('UserOrGroup').Value:=Boolean(1);
          QueryRight.Prepared;
          QueryRight.Open;
        End;

      IF GridRight.ColumnCount<>0 Then GridRight.ClearItems;
        FOR M:=0 TO QueryRight.FieldCount-1 Do
          Begin
            GridRight.CreateColumn;
            GridRight.Columns[M].Name:='RUserColumn'+IntToStr(M);
            //Userview.Columns[M].Caption:='用户名称';
          End;

      GridRight.DataController.DataSource:=DSRight;
      GridRight.Columns[0].Caption:='模块名称';
      GridRight.Columns[0].DataBinding;
      GridRight.Columns[0].DataBinding.FieldName:='Describe_';
      GridRight.Columns[0].DataBinding.ValueType:='String';

      GridRight.Columns[1].Caption:='查看';
      GridRight.Columns[1].DataBinding;
      GridRight.Columns[1].DataBinding.FieldName:='RBrowser';
      GridRight.Columns[1].DataBinding.ValueType:='Boolean';
      GridRight.Columns[1].Width:=60;

      GridRight.Columns[2].Caption:='新增';
      GridRight.Columns[2].DataBinding;
      GridRight.Columns[2].DataBinding.FieldName:='RAdd';
      GridRight.Columns[2].DataBinding.ValueType:='Boolean';
      GridRight.Columns[2].Width:=60;

      GridRight.Columns[3].Caption:='删除';
      GridRight.Columns[3].DataBinding;
      GridRight.Columns[3].DataBinding.FieldName:='RDelete';
      GridRight.Columns[3].DataBinding.ValueType:='Boolean';
      GridRight.Columns[3].Width:=60;

      GridRight.Columns[4].Caption:='修改';
      GridRight.Columns[4].DataBinding;
      GridRight.Columns[4].DataBinding.FieldName:='REdit';
      GridRight.Columns[4].DataBinding.ValueType:='Boolean';
      GridRight.Columns[4].Width:=60;

      GridRight.Columns[5].Caption:='列印';
      GridRight.Columns[5].DataBinding;
      GridRight.Columns[5].DataBinding.FieldName:='RPrint';
      GridRight.Columns[5].DataBinding.ValueType:='Boolean';
      GridRight.Columns[5].Width:=60;

      GridRight.Columns[6].Caption:='审核';
      GridRight.Columns[6].DataBinding;
      GridRight.Columns[6].DataBinding.FieldName:='RCheck';
      GridRight.Columns[6].DataBinding.ValueType:='Boolean';
      GridRight.Columns[6].Width:=60;

      GridRight.Columns[7].Caption:='反审核';
      GridRight.Columns[7].DataBinding;
      GridRight.Columns[7].DataBinding.FieldName:='RUncheck';
      GridRight.Columns[7].DataBinding.ValueType:='Boolean';
      GridRight.Columns[7].Width:=60;

      GridRight.Columns[8].Caption:='单价';
      GridRight.Columns[8].DataBinding;
      GridRight.Columns[8].DataBinding.FieldName:='RPrice';
      GridRight.Columns[8].DataBinding.ValueType:='Boolean';
      GridRight.Columns[8].Width:=60;

      GridRight.Columns[9].Caption:='权限码';
      GridRight.Columns[9].DataBinding;
      GridRight.Columns[9].DataBinding.FieldName:='Acc_';
      GridRight.Columns[9].DataBinding.ValueType:='Float';
      GridRight.Columns[9].Width:=60;
      GridRight.Columns[9].Visible := False;
      End;

end;

procedure TFrm_Right.BitBtn5Click(Sender: TObject);
Var
  I:Integer;
  M,N:real;
begin
  inherited;
  M:=0;
  IF QueryRight.IsEmpty Then Exit;
  QueryRight.First;
  FOR I:=1 TO QueryRight.RecordCount DO
    Begin
      IF QueryRight.FieldByName('RBrowser').AsBoolean=Boolean(1) Then M:=Exp(Ln(2)*0);
      IF QueryRight.FieldByName('RAdd').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*1);
      IF QueryRight.FieldByName('RDelete').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*2);
      IF QueryRight.FieldByName('REdit').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*3);
      IF QueryRight.FieldByName('RPrint').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*4);
      IF QueryRight.FieldByName('Rcheck').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*5);
      IF QueryRight.FieldByName('Runcheck').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*6);
      IF QueryRight.FieldByName('RPrice').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*7);
      GridRight.Columns[9].EditValue:=M;
      M:=0;
      QueryRight.Next;
    End;
  DSRight.DataSet.DisableControls;
    QueryRight.Edit;
    QueryRight.Post;
  DSRight.DataSet.EnableControls;
  GridRight.OptionsData.Editing:=False;
  BitBtn5.Enabled:=False;
end;

procedure TFrm_Right.BitBtn6Click(Sender: TObject);
begin
  inherited;
  IF QueryRight.IsEmpty Then Exit
  Else
    Begin
      GridRight.OptionsData.Editing:=True;
      BitBtn5.Enabled:=True;
    End;

end;

procedure TFrm_Right.ShowTree(Treeview: TTreeview);
Var
  Node:TTreeNode;
  I:Integer;
begin

          UserRight.Close;
          UserRight.SQL.Clear;
          UserRight.SQL.Add('Select DeptID_,Username_ From Users_');
          UserRight.Prepared;
          UserRight.Open;
          UserRight.First;
          TreeView.Items.Clear;

          Node:=Treeview.Items.Add(Nil,'用户');
          FOR I:=0 TO UserRight.RecordCount-1 DO
            Begin
              Treeview.Items.AddChild(Node,UserRight.FieldByName('Username_').AsString);

              UserRight.Next;
            End;

          GroupRight.Close;
          GroupRight.SQL.Clear;
          GroupRight.SQL.Add('Select GrpID_,Grpname_ From UserGroup_');
          GroupRight.Prepared;
          GroupRight.Open;
          GroupRight.First;

          Node:=Treeview.Items.Add(Nil,'用户组');
          FOR I:=0 TO GroupRight.RecordCount-1 DO
            Begin
              Treeview.Items.AddChild(Node,GroupRight.FieldByName('Grpname_').AsString);

              GroupRight.Next;
            End;
end;

procedure TFrm_Right.TabSheet3Show(Sender: TObject);
begin
  inherited;
   ShowTree(Treeview2);
end;

procedure TFrm_Right.TabSheet4Show(Sender: TObject);
begin
  inherited;
  ShowTree(Treeview3);
end;

procedure TFrm_Right.TreeView2Click(Sender: TObject);
Var
  I,M,UserID,UserORGroup:Integer;

begin
  inherited;
  IF (Treeview2.Selected.Text<>'用户') And (Treeview2.Selected.Text<>'用户组')  Then
    Begin
      IF Treeview2.Selected.Parent.Text='用户' Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserID_ From Users_ where UserName_=:UserName');
          Query.Parameters.ParamByName('UserName').Value:=TreeView2.Selected.Text;
          Query.Prepared;
          Query.Open;
          UserID:=Query.fieldbyname('UserID_').AsInteger;
          UserOrGroup:=0;
        End;
      IF Treeview2.Selected.Parent.Text='用户组' Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select GrpID_ From UserGroup_ where GrpName_=:GrpName');
          Query.Parameters.ParamByName('GrpName').Value:=TreeView2.Selected.Text;
          Query.Prepared;
          Query.Open;
          UserID:=Query.fieldbyname('GrpID_').AsInteger;
          UserOrGroup:=1;
        End;




          //查找用户权限列表
          {IF Treeview2.Selected.Parent.Text='用户' Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from UserGroupDeptAccess_ Where userOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
              Query.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(0);
              Query.Prepared;
              Query.Open;
            End;
          IF Treeview2.Selected.Parent.Text='用户组' Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from UserGroupDeptAccess_ Where userOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
              Query.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(1);
              Query.Prepared;
              Query.Open;
            End;}

          //IF Query.ISEmpty Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select DeptID_ From DepartMent_ Where DeptID_ Not in (Select AccDeptID_ From UserGroupDeptAccess_  Where UserOrGroupID_=:UserID And UserOrGroup=:UserOrGroup)');
              Query.Parameters.ParamByName('UserID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(UserOrGroup);
              Query.Prepared;
              Query.Open;
              Query.First;
              DatabaseModule.dtclsData.BeginTrans;
              Try
                For I:=1 TO Query.RecordCount Do
                Begin
                  AdoDeptRight.Close;
                  AdoDeptRight.SQL.Clear;
                  AdoDeptRight.SQL.Add('Insert into UserGroupDeptAccess_(AccDeptID_,UserOrGroupID_,UserOrGroup,CreateBy_,CreateD_');
                  AdoDeptRight.SQL.Add(' ,RBrowser,RAdd,RDelete,REdit,RPrint,RCheck,Runcheck,RPrice,DeptAcc_,RSum)');
                  AdoDeptRight.SQL.Add(' Values(:AccDeptID,:UserOrGroupID,:UserOrGroup,:Createby,:CreateD,:RBrowser,:RAdd,:RDelete,:REdit,:RPrint,:RCheck,:Runcheck,:RPrice,:DeptAcc,:Rsum)');
                  AdoDeptRight.Parameters.ParamByName('AccDeptID').Value:=Query.fieldbyname('DeptID_').AsInteger;
                  AdoDeptRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
                  IF Treeview2.Selected.Parent.Text='用户' Then
                    AdoDeptRight.Parameters.ParamByName('UserOrgroup').Value:=Boolean(0);
                  IF Treeview2.Selected.Parent.Text='用户组' Then
                    AdoDeptRight.Parameters.ParamByName('UserOrgroup').Value:=Boolean(1);
                  AdoDeptRight.Parameters.ParamByName('Createby').Value:=DatabaseModule.dtclsData.UserID_;
                  AdoDeptRight.Parameters.ParamByName('CreateD').Value:=Now;
                  AdoDeptRight.Parameters.ParamByName('RBrowser').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('RAdd').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('RDelete').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('REdit').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('RPrint').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('RCheck').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('RUncheck').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('RPrice').Value:=Boolean(0);
                  AdoDeptRight.Parameters.ParamByName('DeptAcc').Value:=0;
                  AdoDeptRight.Parameters.ParamByName('RSum').Value:=0;
                  AdoDeptRight.Prepared;
                  AdoDeptRight.ExecSQL;
                  Query.Next;
                End;
                DataBaseModule.dtclsData.CommitTrans;
              Except
                DataBaseModule.dtclsData.RollbackTrans;
                Raise;
              End;
            End;

      IF Treeview2.Selected.Parent.Text='用户' Then
        Begin
          AdoDeptRight.Close;
          AdoDeptRight.SQL.Clear;
          AdoDeptRight.SQL.Add('Select a.DeptName_,B.RBrowser,B.RDelete,B.REdit,B.RCheck,B.RUncheck,B.RPrice,B.DeptAcc_');
          AdoDeptRight.SQL.Add(' From DepartMent_ a,UserGroupDeptAccess_ b where a.DeptID_=b.AccDeptID_ And UserOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
          AdoDeptRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
          AdoDeptRight.Parameters.ParamByName('UserOrGroup').Value:=Boolean(0);
          AdoDeptRight.Prepared;
          AdoDeptRight.Open;
        End;
      IF Treeview2.Selected.Parent.Text='用户组' Then
        Begin
          AdoDeptRight.Close;
          AdoDeptRight.SQL.Clear;
          AdoDeptRight.SQL.Add('Select a.DeptName_,B.RBrowser,B.RDelete,B.REdit,B.RCheck,B.RUncheck,B.RPrice,B.DeptAcc_');
          AdoDeptRight.SQL.Add(' From DepartMent_ a,UserGroupDeptAccess_ b where a.DeptID_=b.AccDeptID_ And UserOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
          AdoDeptRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
          AdoDeptRight.Parameters.ParamByName('UserOrGroup').Value:=Boolean(1);
          AdoDeptRight.Prepared;
          AdoDeptRight.Open;
        End;

      IF RightDept.ColumnCount<>0 Then RightDept.ClearItems;
        FOR M:=0 TO AdoDeptRight.FieldCount-1 Do
          Begin
            RightDept.CreateColumn;
            RightDept.Columns[M].Name:='DUserColumn'+IntToStr(M);
            //Userview.Columns[M].Caption:='用户名称';
          End;

      RightDept.DataController.DataSource:=DSDeptRight;
      RightDept.Columns[0].Caption:='部门名称';
      RightDept.Columns[0].DataBinding;
      RightDept.Columns[0].DataBinding.FieldName:='DeptName_';
      RightDept.Columns[0].DataBinding.ValueType:='String';

      RightDept.Columns[1].Caption:='查看';
      RightDept.Columns[1].DataBinding;
      RightDept.Columns[1].DataBinding.FieldName:='RBrowser';
      RightDept.Columns[1].DataBinding.ValueType:='Boolean';
      RightDept.Columns[1].Width:=60;

      RightDept.Columns[2].Caption:='删除';
      RightDept.Columns[2].DataBinding;
      RightDept.Columns[2].DataBinding.FieldName:='RDelete';
      RightDept.Columns[2].DataBinding.ValueType:='Boolean';
      RightDept.Columns[2].Width:=60;

      RightDept.Columns[3].Caption:='修改';
      RightDept.Columns[3].DataBinding;
      RightDept.Columns[3].DataBinding.FieldName:='REdit';
      RightDept.Columns[3].DataBinding.ValueType:='Boolean';
      RightDept.Columns[3].Width:=60;

      RightDept.Columns[4].Caption:='审核';
      RightDept.Columns[4].DataBinding;
      RightDept.Columns[4].DataBinding.FieldName:='RCheck';
      RightDept.Columns[4].DataBinding.ValueType:='Boolean';
      RightDept.Columns[4].Width:=60;

      RightDept.Columns[5].Caption:='反审核';
      RightDept.Columns[5].DataBinding;
      RightDept.Columns[5].DataBinding.FieldName:='RUnCheck';
      RightDept.Columns[5].DataBinding.ValueType:='Boolean';
      RightDept.Columns[5].Width:=60;

      RightDept.Columns[6].Caption:='单价';
      RightDept.Columns[6].DataBinding;
      RightDept.Columns[6].DataBinding.FieldName:='RPrice';
      RightDept.Columns[6].DataBinding.ValueType:='Boolean';
      RightDept.Columns[6].Width:=60;

      RightDept.Columns[7].Caption:='权限码';
      RightDept.Columns[7].DataBinding;
      RightDept.Columns[7].DataBinding.FieldName:='DeptAcc_';
      RightDept.Columns[7].DataBinding.ValueType:='Float';
      RightDept.Columns[7].Width:=60;
      RightDept.Columns[7].Visible := False;
      End;

end;

procedure TFrm_Right.BitBtn7Click(Sender: TObject);
begin
  inherited;
  IF AdoDeptRight.IsEmpty Then Exit
  Else
    Begin
      RightDept.OptionsData.Editing:=True;
      BitBtn8.Enabled:=True;
    End;
end;

procedure TFrm_Right.BitBtn8Click(Sender: TObject);
Var
  I:Integer;
  M,N:real;
begin
  inherited;
  M:=0;
  
  AdoDeptRight.First;

  FOR I:=1 TO AdoDeptRight.RecordCount DO
    Begin
      IF AdoDeptRight.FieldByName('RBrowser').AsBoolean=Boolean(1) Then M:=Exp(Ln(2)*0);
      //IF QueryRight.FieldByName('RAdd').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*1);
      IF AdoDeptRight.FieldByName('RDelete').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*1);
      IF AdoDeptRight.FieldByName('REdit').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*2);
      //IF QueryRight.FieldByName('RPrint').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*4);
      IF AdoDeptRight.FieldByName('Rcheck').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*5);
      IF AdoDeptRight.FieldByName('Runcheck').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*6);
      IF AdoDeptRight.FieldByName('RPrice').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*7);
      RightDept.Columns[7].EditValue:=M;
      M:=0;
      AdoDeptRight.Next;
    End;
  DSDeptRight.DataSet.DisableControls;
    AdoDeptRight.Edit;
    AdoDeptRight.Post;
  DSDeptRight.DataSet.EnableControls;
  RightDept.OptionsData.Editing:=False;
  BitBtn8.Enabled:=False;
end;

procedure TFrm_Right.TreeView3Click(Sender: TObject);
Var
  I,M,UserID,UserORGroup:Integer;

begin
  inherited;
  IF (Treeview3.Selected.Text<>'用户') And (Treeview3.Selected.Text<>'用户组')  Then
    Begin
      IF Treeview3.Selected.Parent.Text='用户' Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserID_ From Users_ where UserName_=:UserName');
          Query.Parameters.ParamByName('UserName').Value:=TreeView3.Selected.Text;
          Query.Prepared;
          Query.Open;
          UserID:=Query.fieldbyname('UserID_').AsInteger;
          UserORGroup:=0;
        End;
      IF Treeview3.Selected.Parent.Text='用户组' Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select GrpID_ From UserGroup_ where GrpName_=:GrpName');
          Query.Parameters.ParamByName('GrpName').Value:=TreeView3.Selected.Text;
          Query.Prepared;
          Query.Open;
          UserID:=Query.fieldbyname('GrpID_').AsInteger;
          UserOrGroup:=1;
        End;




          //查找用户权限列表
          {IF Treeview3.Selected.Parent.Text='用户' Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from UserGroupUserAccess_ Where userOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
              Query.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(0);
              Query.Prepared;
              Query.Open;
            End;
          IF Treeview3.Selected.Parent.Text='用户组' Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select * from UserGroupUserAccess_ Where userOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
              Query.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(1);
              Query.Prepared;
              Query.Open;
            End; }

          //IF Query.ISEmpty Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select UserID_ From Users_ Where UserID_ Not in (Select UserID_ From UserGroupUserAccess_  Where UserOrGroupID_=:UserID And UserOrGroup=:UserOrGroup)');
              Query.Parameters.ParamByName('UserID').Value:=UserID;
              Query.Parameters.ParamByName('UserOrGroup').Value:=Boolean(UserOrGroup);
              Query.Prepared;
              Query.Open;
              Query.First;
              DatabaseModule.dtclsData.BeginTrans;
              Try
                For I:=1 TO Query.RecordCount Do
                Begin
                  AdoUserRight.Close;
                  AdoUserRight.SQL.Clear;
                  AdoUserRight.SQL.Add('Insert into UserGroupUserAccess_(UserID_,UserOrGroupID_,UserOrGroup,CreateBy_,CreateD_');
                  AdoUserRight.SQL.Add(' ,RBrowser,RAdd,RDelete,REdit,RPrint,RCheck,Runcheck,RPrice,UserAcc_,RSum)');
                  AdoUserRight.SQL.Add(' Values(:UserID,:UserOrGroupID,:UserOrGroup,:Createby,:CreateD,:RBrowser,:RAdd,:RDelete,:REdit,:RPrint,:RCheck,:Runcheck,:RPrice,:UserAcc,:Rsum)');
                  AdoUserRight.Parameters.ParamByName('UserID').Value:=Query.fieldbyname('UserID_').AsInteger;
                  AdoUserRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
                  IF Treeview3.Selected.Parent.Text='用户' Then
                    AdoUserRight.Parameters.ParamByName('UserOrgroup').Value:=Boolean(0);
                  IF Treeview3.Selected.Parent.Text='用户组' Then
                    AdoUserRight.Parameters.ParamByName('UserOrgroup').Value:=Boolean(1);
                  AdoUserRight.Parameters.ParamByName('Createby').Value:=DatabaseModule.dtclsData.UserID_;
                  AdoUserRight.Parameters.ParamByName('CreateD').Value:=Now;
                  AdoUserRight.Parameters.ParamByName('RBrowser').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('RAdd').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('RDelete').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('REdit').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('RPrint').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('RCheck').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('RUncheck').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('RPrice').Value:=Boolean(0);
                  AdoUserRight.Parameters.ParamByName('UserAcc').Value:=0;
                  AdoUserRight.Parameters.ParamByName('RSum').Value:=0;
                  AdoUserRight.Prepared;
                  AdoUserRight.ExecSQL;
                  Query.Next;
                End;
                DataBaseModule.dtclsData.CommitTrans;
              Except
                DataBaseModule.dtclsData.RollbackTrans;
                Raise;
              End;
            End;

      IF Treeview3.Selected.Parent.Text='用户' Then
        Begin
          AdoUserRight.Close;
          AdoUserRight.SQL.Clear;
          AdoUserRight.SQL.Add('Select a.UserName_,B.RBrowser,B.RDelete,B.REdit,B.RCheck,B.RUncheck,B.RPrice,B.UserAcc_');
          AdoUserRight.SQL.Add(' From Users_ a,UserGroupUserAccess_ b where a.UserID_=b.UserID_ And UserOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
          AdoUserRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
          AdoUserRight.Parameters.ParamByName('UserOrGroup').Value:=Boolean(0);
          AdoUserRight.Prepared;
          AdoUserRight.Open;
        End;
      IF Treeview3.Selected.Parent.Text='用户组' Then
        Begin
          AdoUserRight.Close;
          AdoUserRight.SQL.Clear;
          AdoUserRight.SQL.Add('Select a.UserName_,B.RBrowser,B.RDelete,B.REdit,B.RCheck,B.RUncheck,B.RPrice,B.UserAcc_');
          AdoUserRight.SQL.Add(' From Users_ a,UserGroupUserAccess_ b where a.UserID_=b.UserID_ And UserOrGroupID_=:UserOrGroupID And UserOrGroup=:UserOrGroup');
          AdoUserRight.Parameters.ParamByName('UserOrGroupID').Value:=UserID;
          AdoUserRight.Parameters.ParamByName('UserOrGroup').Value:=Boolean(1);
          AdoUserRight.Prepared;
          AdoUserRight.Open;
        End;

      IF RightUser.ColumnCount<>0 Then RightUser.ClearItems;
        FOR M:=0 TO AdoUserRight.FieldCount-1 Do
          Begin
            RightUser.CreateColumn;
            RightUser.Columns[M].Name:='UUserColumn'+IntToStr(M);
            //Userview.Columns[M].Caption:='用户名称';
          End;

      RightUser.DataController.DataSource:=DSUserRight;
      RightUser.Columns[0].Caption:='用户名称';
      RightUser.Columns[0].DataBinding;
      RightUser.Columns[0].DataBinding.FieldName:='UserName_';
      RightUser.Columns[0].DataBinding.ValueType:='String';

      RightUser.Columns[1].Caption:='查看';
      RightUser.Columns[1].DataBinding;
      RightUser.Columns[1].DataBinding.FieldName:='RBrowser';
      RightUser.Columns[1].DataBinding.ValueType:='Boolean';
      RightUser.Columns[1].Width:=60;

      RightUser.Columns[2].Caption:='删除';
      RightUser.Columns[2].DataBinding;
      RightUser.Columns[2].DataBinding.FieldName:='RDelete';
      RightUser.Columns[2].DataBinding.ValueType:='Boolean';
      RightUser.Columns[2].Width:=60;

      RightUser.Columns[3].Caption:='修改';
      RightUser.Columns[3].DataBinding;
      RightUser.Columns[3].DataBinding.FieldName:='REdit';
      RightUser.Columns[3].DataBinding.ValueType:='Boolean';
      RightUser.Columns[3].Width:=60;

      RightUser.Columns[4].Caption:='审核';
      RightUser.Columns[4].DataBinding;
      RightUser.Columns[4].DataBinding.FieldName:='RCheck';
      RightUser.Columns[4].DataBinding.ValueType:='Boolean';
      RightUser.Columns[4].Width:=60;

      RightUser.Columns[5].Caption:='反审核';
      RightUser.Columns[5].DataBinding;
      RightUser.Columns[5].DataBinding.FieldName:='RUnCheck';
      RightUser.Columns[5].DataBinding.ValueType:='Boolean';
      RightUser.Columns[5].Width:=60;

      RightUser.Columns[6].Caption:='单价';
      RightUser.Columns[6].DataBinding;
      RightUser.Columns[6].DataBinding.FieldName:='RPrice';
      RightUser.Columns[6].DataBinding.ValueType:='Boolean';
      RightUser.Columns[6].Width:=60;

      RightUser.Columns[7].Caption:='权限码';
      RightUser.Columns[7].DataBinding;
      RightUser.Columns[7].DataBinding.FieldName:='UserAcc_';
      RightUser.Columns[7].DataBinding.ValueType:='Float';
      RightUser.Columns[7].Width:=60;
      RightUser.Columns[7].Visible := False;
      End;

end;

procedure TFrm_Right.BitBtn9Click(Sender: TObject);
begin
  inherited;
  IF AdoUserRight.IsEmpty Then Exit
  Else
    Begin
      RightUser.OptionsData.Editing:=True;
      BitBtn10.Enabled:=True;
    End;
end;

procedure TFrm_Right.BitBtn10Click(Sender: TObject);
Var
  I:Integer;
  M,N:real;
begin
  inherited;
  M:=0;
  AdoUserRight.First;

  FOR I:=1 TO AdoUserRight.RecordCount DO
    Begin
      IF AdoUserRight.FieldByName('RBrowser').AsBoolean=Boolean(1) Then M:=Exp(Ln(2)*0);
      //IF QueryRight.FieldByName('RAdd').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*1);
      IF AdoUserRight.FieldByName('RDelete').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*1);
      IF AdoUserRight.FieldByName('REdit').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*2);
      //IF QueryRight.FieldByName('RPrint').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*4);
      IF AdoUserRight.FieldByName('Rcheck').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*5);
      IF AdoUserRight.FieldByName('Runcheck').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*6);
      IF AdoUserRight.FieldByName('RPrice').AsBoolean=Boolean(1) Then M:=M+Exp(Ln(2)*7);
      RightUser.Columns[7].EditValue:=M;
      M:=0;
      AdoUserRight.Next;
    End;
  DSUserRight.DataSet.DisableControls;
    AdoUserRight.Edit;
    AdoUserRight.Post;
  DSUserRight.DataSet.EnableControls;
  RightUser.OptionsData.Editing:=False;
  BitBtn10.Enabled:=False;
end;

procedure TFrm_Right.BtnExportClick(Sender: TObject);
Var
  TableCount,FieldCount:integer;
  TableSL:TStringList;
begin
  inherited;
  BtnClear.Click;
  TableSL:=TStringList.Create;
  With DatabaseModule Do
    Begin
      Dtclsdata.GetTableNames(TableSL,False);
      
      Dtclsdata.BeginTrans;
      Try
        FOR TableCount:=0 TO TableSL.Count - 1 DO
          Begin
            AdoDictM.Append;
            AdoDictM.FieldByName('TableName_').AsString:=TableSL[TableCount];
            AdoDictM.FieldByName('CreateBy_').AsInteger:=DtclsData.UserID_;
            AdoDictM.FieldByName('CreateD_').AsDateTime:=Date;
            AdoDictM.Post;
          End;
        Dtclsdata.CommitTrans;
      Except
        DtclsData.RollbackTrans;
        Raise;
      End;

      AdoDictM.First;
      FOR TableCount:=1 TO AdoDictM.RecordCount DO
        Begin
          //AdoField.TableName:=AdoDictM.FieldByName('TableName_').AsString;
          AdoField.Close;
          AdoField.SQL.Clear;

          AdoField.SQL.Add('select a.name as LtableName,b.name as LFieldName,b.length as LLength,c.name as LTypeName,d.value as LDescribe');
          AdoField.SQL.Add(' from sysobjects a,syscolumns b,systypes c,sysproperties d');
          AdoField.SQL.Add(' where a.name=:TableName And a.xtype='+'''U'''+' and a.id = b.id and b.xUsertype=c.xUsertype and b.ID=d.ID and b.colid=d.smallid');
          AdoField.Parameters.ParamByName('TableName').Value:= AdoDictM.FieldByName('TableName_').AsString;
          AdoField.Open;
          DtclsData.BeginTrans;
          Try
            AdoField.First;
            FOR FieldCount:=1 TO AdoField.RecordCount Do
              Begin
                AdoDictD.Append;
                AdoDictD.FieldByName('DictMid_').AsInteger:=AdoDictM.FieldByName('DictMID_').AsInteger;
                AdoDictD.FieldByName('FieldName_').AsString:= AdoField.fieldByName('LFieldName').AsString;
                AdoDictD.FieldByName('FieldNote_').AsString:=AdoField.FieldbyName('LDescribe').AsString;
                AdoDictD.FieldByName('FieldLen_').AsInteger:=AdoField.fieldByName('LLength').AsInteger;
                AdoDictD.FieldByName('FieldType_').AsString:=AdoField.FieldByName('LTypeName').AsString;
                AdoDictD.FieldByName('CreateBy_').AsInteger:=DtclsData.UserID_;
                AdoDictD.FieldByName('CreateD_').AsDateTime:=Date;
                AdoDictD.Post;
                AdoField.Next;
              End;
            AdoDictD.UpdateBatch;
            DtclsData.CommitTrans;
          Except
            DtclsData.RollbackTrans;
            Raise;
          End;
          AdoDictM.Next;  
        End;
    End;
end;

procedure TFrm_Right.BtnClearClick(Sender: TObject);
begin
  inherited;
  AdoField.Close;
  AdoField.SQL.Clear;
  AdoField.SQL.Add('Delete DataDictMast');
  AdoField.SQL.Add('Delete Bill_DataDictLine');
  AdoField.Prepared;
  AdoField.ExecSQL;
      AdoDictM.Close;
      AdoDictM.SQL.Clear;
      AdoDictM.SQL.Add('Select DictMID_,TableName_,CreateBY_,CreateD_ From DataDictMast');
      AdoDictM.Prepared;
      AdoDictM.Open;
      AdoDictD.Close;
      AdoDictD.SQL.Clear;
      AdoDictD.SQL.Add('Select DictMID_,FieldName_,FieldNote_,FieldLen_,FieldType_,CreateBy_,CreateD_ From Bill_DataDictLine');
      AdoDictD.Prepared;
      AdoDictD.Open;
  ShowTabelDict;    
end;

procedure TFrm_Right.TabSheet6Show(Sender: TObject);


begin
  inherited;
  ShowTabelDict;
end;

procedure TFrm_Right.BtnEditClick(Sender: TObject);
begin
  inherited;
  IF BtnEdit.Tag=0 Then
    Begin
      DBGrid4.ReadOnly:=False;
      BtnEdit.Caption:='保存数据表';
      BtnEdit.Tag:=1;
      AdoDictD.Edit;
    End
  Else
    Begin
      DBGrid4.ReadOnly:=True;
      BtnEdit.Caption:='修改数据表';
      BtnEdit.Tag:=0;
      AdoDictD.UpdateBatch;
    End;
end;

procedure TFrm_Right.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
      AdoDictD.Close;
      AdoDictD.SQL.Clear;
      AdoDictD.SQL.Add('Select DictMID_,FieldName_,FieldNote_,FieldType_,FieldLen_,CreateBy_,CreateD_ From Bill_DataDictLine Where DictMID_=:DictMID');
      AdoDictD.Parameters.ParamByName('DictMID').Value:=AdoDictM.FieldByName('DictMID_').AsInteger;
      AdoDictD.Prepared;
      AdoDictD.Open;
      DSDictD.DataSet.FieldByName('DictMID_').DisplayLabel:='编号';
      DSDictD.DataSet.FieldByName('DictMID_').Visible := False;
      DSDictD.DataSet.FieldByName('FieldName_').DisplayLabel:='字段名';
      DSDictD.DataSet.FieldByName('FieldNote_').DisplayLabel:='字段说明';
      DSDictD.DataSet.FieldByName('FieldType_').DisplayLabel:='字段类型';
      DSDictD.DataSet.FieldByName('FieldLen_').DisplayLabel:='字段长度';
      DSDictD.DataSet.FieldByName('CreateBy_').DisplayLabel:='建立人ID';
      DSDictD.DataSet.FieldByName('CreateBy_').Visible := False;
      DSDictD.DataSet.FieldByName('CreateD_').DisplayLabel:='建立日期';
      DSDictD.DataSet.FieldByName('CreateD_').Visible := False;

      SetFieldwidth(DBGrid4,'FieldName_',100);
      SetFieldwidth(DBGrid4,'FieldNote_',100);
      SetFieldwidth(DBGrid4,'FieldType_',80);
      SetFieldwidth(DBGrid4,'FieldLen_',60);
end;

procedure TFrm_Right.UserGrpMListChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  ShowGroupUser;
end;

function TFrm_Right.SetFieldwidth(Grid: TDbGrid; FieldName: String;
  width: Integer): Boolean;
var
  i:integer;
begin
  Result := False;
  for i := 0 To Grid.Columns.Count  -1 Do
  Begin
      if Grid.Columns.Items[i].FieldName = FieldName Then
      begin
         Grid.Columns.Items[i].Width := width;
         Result := True;
      end;
  End;
end;

procedure TFrm_Right.ShowTabelDict;
begin
  AdoDictM.Close;
      AdoDictM.SQL.Clear;
      AdoDictM.SQL.Add('Select DictMID_,TableName_,CreateBY_,CreateD_ From DataDictMast');
      AdoDictM.Prepared;
      AdoDictM.Open;
      DSDictM.DataSet.FieldByName('DictMid_').DisplayLabel:='编号';
      DSDictM.DataSet.FieldByName('DictMid_').Visible := False;
      DSDictM.DataSet.FieldByName('TableName_').DisplayLabel:='表名';
      DSDictM.DataSet.FieldByName('CreateBy_').DisplayLabel:='建立人ID';
      DSDictM.DataSet.FieldByName('CreateBy_').Visible := False;
      DSDictM.DataSet.FieldByName('CreateD_').DisplayLabel:='建立日期';
      DSDictM.DataSet.FieldByName('CreateD_').Visible := False;
      SetFieldwidth(DBGrid3,'TableName_',100);

      AdoDictD.Close;
      AdoDictD.SQL.Clear;
      AdoDictD.SQL.Add('Select DictMID_,FieldName_,FieldNote_,FieldType_,FieldLen_,CreateBy_,CreateD_ From Bill_DataDictLine');
      AdoDictD.Prepared;
      AdoDictD.Open;
      DSDictD.DataSet.FieldByName('DictMID_').DisplayLabel:='编号';
      DSDictD.DataSet.FieldByName('DictMID_').Visible := False;
      DSDictD.DataSet.FieldByName('FieldName_').DisplayLabel:='字段名';
      DSDictD.DataSet.FieldByName('FieldNote_').DisplayLabel:='字段说明';
      DSDictD.DataSet.FieldByName('FieldType_').DisplayLabel:='字段类型';
      DSDictD.DataSet.FieldByName('FieldLen_').DisplayLabel:='字段长度';
      DSDictD.DataSet.FieldByName('CreateBy_').DisplayLabel:='建立人ID';
      DSDictD.DataSet.FieldByName('CreateBy_').Visible := False;
      DSDictD.DataSet.FieldByName('CreateD_').DisplayLabel:='建立日期';
      DSDictD.DataSet.FieldByName('CreateD_').Visible := False;
      SetFieldwidth(DBGrid4,'FieldName_',100);
      SetFieldwidth(DBGrid4,'FieldNote_',100);
      SetFieldwidth(DBGrid4,'FieldType_',80);
      SetFieldwidth(DBGrid4,'FieldLen_',60);
end;

procedure TFrm_Right.FormShow(Sender: TObject);
begin
  inherited;

  IF DatabaseModule.dtclsData.UserCode_='Admin' Then
    Begin
      TabSheet5.Show;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from DataDictMast');
      Query.Prepared;
      Query.Open;
      IF Query.IsEmpty Then BtnExport.Click;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from Module_');
      Query.Prepared;
      Query.Open;
      IF Query.IsEmpty Then BitBtn3.Click;
      Query.Close;

      Tabsheet5.TabVisible:=True;
      Tabsheet6.TabVisible:=True;
      PageControl1.ActivePage:=TabSheet1;
    End
  Else
    Begin
      Tabsheet5.TabVisible:=False;
      Tabsheet6.TabVisible:=False;
    End;
end;

procedure TFrm_Right.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
