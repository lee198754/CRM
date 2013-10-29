unit CustChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ADODB,
  bainaADOQuery, cxLabel, cxPC;

type
  TFrm_Move = class(TBaseData_Frm)
    LAdoCustO: TbainaADOQuery;
    LAdoCustN: TbainaADOQuery;
    LAdoUser: TbainaADOQuery;
    LDSCustO: TDataSource;
    LDSCustN: TDataSource;
    LDSUser: TDataSource;
    LAdoCust: TbainaADOQuery;
    LAdoUpdate: TbainaADOQuery;
    Query: TbainaADOQuery;
    AddType: TbainaADOQuery;
    cxPageControl1: TcxPageControl;
    EdtUserO: TcxButtonEdit;
    cxGrid1: TcxGrid;
    GrdCustO: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxLabel1: TcxLabel;
    EdtUserN: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxGrid2: TcxGrid;
    GrdCustN: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxButton6: TcxButton;
    cxButton5: TcxButton;
    cxButton4: TcxButton;
    cxButton3: TcxButton;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    procedure EdtUserOClick(Sender: TObject);
    procedure EdtUserNClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure SelectUser(UserName:String);
    Procedure ShowCustO;
    Procedure ShowCustN;
  public
    { Public declarations }
  end;

var
  Frm_Move: TFrm_Move;

implementation

uses DataBase, Search;

{$R *.dfm}
Var
  ODeptID,NDeptID,OUserID,NUserID:Integer;

procedure TFrm_Move.EdtUserOClick(Sender: TObject);
begin
  inherited;
  SelectUser('原用户名称');
  ODeptID:=LAdoUser.FieldByName('DeptID_').AsInteger;
  OUserID:=LAdoUser.FieldByName('UserID_').AsInteger;
  ShowCustO;
end;

procedure TFrm_Move.SelectUser(UserName:String);
begin
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_Move.LDSUser;
  Frm_Search.GrdSearch.Columns[0].Caption:=UserName;
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='UserName_';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_Move';
  Frm_search.ShowModal;
end;

procedure TFrm_Move.EdtUserNClick(Sender: TObject);
begin
  inherited;
  SelectUser('新用户名称');
  NDeptID:=LAdoUser.FieldByName('DeptID_').AsInteger;
  NUserID:=LAdoUser.FieldByName('UserID_').AsInteger;
  ShowCustN;
end;

procedure TFrm_Move.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoUser.Close;
  LAdoUser.SQL.Clear;
  LAdoUser.SQL.Add('Select a.UserID_,a.UserName_,b.DeptID_ From Users_ a,DepartMent_ b Where A.DeptID_=B.DeptID_ ');
  IF Not (DataBaseModule.dtclsData.UserCode_='Admin') Then
    Begin
      LAdoUser.SQL.Add(' And A.Deptid_=:DeptID');
      LAdoUser.Parameters.ParamByName('DeptID').Value:=DatabaseModule.dtclsData.DeptID_;
    End;
  LAdoUser.Prepared;
  LAdoUser.Open;
end;

procedure TFrm_Move.ShowCustN;
Var
  I:Integer;
begin
  LAdoCustN.Close;
  LAdoCustN.SQL.Clear;
  LAdoCustN.SQL.Add('Select DeptID_,CustID,CustName,BelongID From CustTemp ');
  LAdoCustN.Prepared;
  LAdoCustN.Open;

  IF GrdCustN.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LDSCustN.DataSet.FieldCount - 4 Do
    Begin
      GrdCustN.CreateColumn;
      GrdCustN.Columns[I].Name:='CustNColumns'+IntToStr(I);
   End;
          GrdCustN.DataController.DataSource:=LDSCustN;
          GrdCustN.Columns[0].Caption:='客户名称';
          GrdCustN.Columns[0].DataBinding;
          GrdCustN.Columns[0].DataBinding.FieldName:='CustName';
          GrdCustN.Columns[0].DataBinding.ValueType:='String';
          GrdCustN.Columns[0].Width:=250;
end;

procedure TFrm_Move.ShowCustO;
Var
  I:Integer;
begin
  LAdoCustO.Close;
  LAdoCustO.SQL.Clear;
  LAdoCustO.SQL.Add('Delete CustTempO');
  LAdoCustO.SQL.Add('Insert Into CustTempO (DeptID_,CustID,CustName,BelongID) Select DeptID_,CustID,CustName,BelongID From Customer Where BelongID=:BelongID And CustClass=:CustClass');
  LAdoCustO.Parameters.ParamByName('BelongID').Value:= OUserID;
  LAdoCustO.Parameters.ParamByName('CustClass').Value:= Boolean(1);
  LAdoCustO.Prepared;
  LAdoCustO.ExecSQL;

  LAdoCustO.Close;
  LAdoCustO.SQL.Clear;
  LAdoCustO.SQL.Add('Select DeptID_,CustID,CustName,BelongID  From CustTempO Where BelongID=:BelongID');
  LAdoCustO.Parameters.ParamByName('BelongID').Value:= OUserID;
  LAdoCustO.Prepared;
  LAdoCustO.Open;

  IF GrdCustO.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LDSCustO.DataSet.FieldCount - 4 Do
    Begin
      GrdCustO.CreateColumn;
      GrdCustO.Columns[I].Name:='CustOColumns'+IntToStr(I);
   End;
          GrdCustO.DataController.DataSource:=LDSCustO;
          GrdCustO.Columns[0].Caption:='客户名称';
          GrdCustO.Columns[0].DataBinding;
          GrdCustO.Columns[0].DataBinding.FieldName:='CustName';
          GrdCustO.Columns[0].DataBinding.ValueType:='String';
          GrdCustO.Columns[0].Width:=250;
end;

procedure TFrm_Move.cxButton1Click(Sender: TObject);
begin
  inherited;
  IF (LAdoCustN.State=DSBrowse) And (Not (LAdoCustO.IsEmpty)) Then
    Begin
      LAdoCustN.Append;
      LAdoCustN.FieldByName('DeptID_').AsInteger:=LAdoCustO.FieldByName('DeptID_').AsInteger;
      LAdoCustN.FieldByName('BelongID').AsInteger:=LAdoCustO.FieldByName('BelongID').AsInteger;
      LAdoCustN.FieldByName('CustName').AsString:=LAdoCustO.FieldByName('CustName').AsString;
      LAdoCustN.FieldByName('CustID').AsInteger:=LAdoCustO.FieldByName('CustID').AsInteger;
      LAdoCustN.Post;
      LAdoCustO.Delete;
    End;
end;

procedure TFrm_Move.cxButton2Click(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  IF (LAdoCustN.State=DSBrowse) And (Not (LAdoCustO.IsEmpty)) Then
    Begin
      LAdoCustO.First;
      FOR I:=1 TO LAdoCustO.RecordCount DO
        Begin
          LAdoCustN.Append;
          LAdoCustN.FieldByName('DeptID_').AsInteger:=LAdoCustO.FieldByName('DeptID_').AsInteger;
          LAdoCustN.FieldByName('BelongID').AsInteger:=LAdoCustO.FieldByName('BelongID').AsInteger;
          LAdoCustN.FieldByName('CustName').AsString:=LAdoCustO.FieldByName('CustName').AsString;
          LAdoCustN.FieldByName('CustID').AsInteger:=LAdoCustO.FieldByName('CustID').AsInteger;
          LAdoCustN.Post;
          LAdoCustO.Delete;
          LAdoCustO.Next;
        End;
    End;
end;

procedure TFrm_Move.cxButton3Click(Sender: TObject);
begin
  inherited;
  IF (LAdoCustO.State=DSBrowse) And (Not (LAdoCustN.IsEmpty)) Then
    Begin
      LAdoCustO.Append;
      LAdoCustO.FieldByName('DeptID_').AsInteger:=LAdoCustN.FieldByName('DeptID_').AsInteger;
      LAdoCustO.FieldByName('BelongID').AsInteger:=LAdoCustN.FieldByName('BelongID').AsInteger;
      LAdoCustO.FieldByName('CustName').AsString:=LAdoCustN.FieldByName('CustName').AsString;
      LAdoCustO.Post;
      LAdoCustN.Delete;
    End;
end;

procedure TFrm_Move.cxButton4Click(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  IF (LAdoCustO.State=DSBrowse) And (Not (LAdoCustN.IsEmpty)) Then
    Begin
      LAdoCustN.First;
      FOR I:=1 TO LAdoCustN.RecordCount DO
        Begin
          LAdoCustO.Append;
          LAdoCustO.FieldByName('DeptID_').AsInteger:=LAdoCustN.FieldByName('DeptID_').AsInteger;
          LAdoCustO.FieldByName('BelongID').AsInteger:=LAdoCustN.FieldByName('BelongID').AsInteger;
          LAdoCustO.FieldByName('CustName').AsString:=LAdoCustN.FieldByName('CustName').AsString;
          LAdoCustO.FieldByName('CustID').AsInteger:=LAdoCustN.FieldByName('CustID').AsInteger;
          LAdoCustO.Post;
          LAdoCustN.Delete;
          LAdoCustN.Next;
        End;
    End;
end;

procedure TFrm_Move.cxButton5Click(Sender: TObject);
Var
  I,LCustID:Integer;
  ParentID,SelfID:String;
begin
  inherited;
  IF LAdoCustN.IsEmpty Then Exit
  Else
    Begin
      LAdoCustN.First;
      DatabaseModule.dtclsData.BeginTrans;
      Try
        FOR I:=1 TO LAdoCustN.RecordCount Do
          Begin
            LCustID:= LAdoCustN.FieldByName('CustID').AsInteger;
            //更新合同资料
            //更新资料
            //更新销售资料
            //更新和销售明细资料
            //更新费用资料
            //更新联系人资料
            //更新销售预测资料


            LAdoUpdate.Close;
            LAdoUpdate.SQL.Clear;
            LAdoUpdate.SQL.Add('Update Contract Set DeptID_='+IntToStr(NDeptID)+',BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID));
            LAdoUpdate.SQL.Add('Update CustActive Set DeptID_='+IntToStr(NDeptID)+',BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID));
            LAdoUpdate.SQL.Add('Update Contact Set BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID));
            LAdoUpdate.SQL.Add('Update Day_ Set BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID));
            //LAdoUpdate.SQL.Add('Update FileType Set BelongID='+IntToStr(NUserID)+' Where BelongID='+IntToStr(OUserID));
            //LAdoUpdate.SQL.Add('Update FileCenter Set FileSelfID='+SelfID+',DeptID_='+IntToStr(NDeptID)+',BelongID='+IntToStr(NUserID)+' Where BelongID='+IntToStr(OUserID));
            LAdoUpdate.SQL.Add('Update SaleForecast Set DeptID_='+IntToStr(NDeptID)+',BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID));
            LAdoUpdate.SQL.Add('Update SaleMaste Set DeptID_='+IntToStr(NDeptID)+',BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID));
            LAdoUpdate.SQL.Add('Update Expend Set DeptID_='+IntToStr(NDeptID)+',BelongID='+IntToStr(NUserID)+' Where CustID='+IntToStr(LCustID)+' And ExpendOption='+IntToStr(1));
            LAdoUpdate.Prepared;
            LAdoUpdate.ExecSQL;

            LAdoCust.Close;
            LAdoCust.SQL.Clear;
            LAdoCust.SQL.Add('Update Customer set DeptID_=:DeptID,BelongID=:BelongID Where CustID=:CustID');
            LAdoCust.Parameters.ParamByName('CustID').Value:=LAdoCustN.FieldByName('CustID').AsInteger;
            LAdoCust.Parameters.ParamByName('DeptID').Value:=NDeptID;
            LAdoCust.Parameters.ParamByName('BelongID').Value:=NUserID;
            LAdoCust.ExecSQL;
            LAdoCustN.Next;
          End;
        {Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('Delete FileType where BelongID=:BelongID');
        Query.Parameters.ParamByName('BelongID').Value:=OUserID;
        Query.Prepared;
        Query.ExecSQL;}
        LAdoCustO.UpdateBatch;
        DatabaseModule.dtclsData.CommitTrans;
        Application.MessageBox('客户资料变更完成','提示',MB_OK+MB_Iconwarning);
        ShowCustN;
      Except
        DatabaseModule.dtclsData.RollbackTrans;
        Raise;
      End;
    End;
end;

procedure TFrm_Move.cxButton6Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_Move.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
