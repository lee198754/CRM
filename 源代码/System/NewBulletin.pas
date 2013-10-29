unit NewBulletin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, frxClass, frxDBSet, dxBar, cxLookAndFeels,
  dxBarExtItems, cxClasses, ImgList, ActnList, XPMenu, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLabel, cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar, cxContainer,
  cxTextEdit, Buttons, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ADODB, bainaADOQuery, ComCtrls, dxtree, dxdbtree, cxTreeView;

type
  TFrm_NewBulletin = class(TBaseData_Frm)
    EdtTitle: TcxTextEdit;
    EdtContent: TcxMemo;
    cxLabel1: TcxLabel;
    GrdUser: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GrdReadUser: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    LReadUser: TbainaADOQuery;
    LBulletin: TbainaADOQuery;
    LUser: TbainaADOQuery;
    LDSUser: TDataSource;
    LDSReadUser: TDataSource;
    Query: TbainaADOQuery;
    procedure BtnSureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_NewBulletin: TFrm_NewBulletin;

implementation

uses DataBase, PublicClass, Bulletin;

{$R *.dfm}
var
  BulletinNum:String;


procedure TFrm_NewBulletin.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF (Not ((EdtTitle.Text='') And (EdtContent.Text=''))) And (Not (LReadUser.IsEmpty)) Then
    Begin
      With DatabaseModule Do
        Begin
          IF ISAdd=True Then
            Begin
              Dtclsdata.BeginTrans;
              Try
                Frm_Bulletin.LAdoBulletin.Append;
                Frm_Bulletin.LAdoBulletin.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinNum').AsString:=BulletinNum;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinMan').AsString:=DatabaseModule.dtclsData.UserName_;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinDate').AsDateTime:=Now;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinTitle').AsString:=EdtTitle.Text;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinContent').AsString:=EdtContent.Text;
                Frm_Bulletin.LAdoBulletin.Post;
                LReadUser.UpdateBatch;
                Dtclsdata.CommitTrans;
                BtnExit.Click;
              Except
                DtclsData.RollbackTrans;
                Raise;
              End;
            End;
          IF ISEdit=True Then
            Begin
              Dtclsdata.BeginTrans;
              Try
                Frm_Bulletin.LAdoBulletin.Edit;
                //Frm_Bulletin.LAdoBulletin.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
                //Frm_Bulletin.LAdoBulletin.FieldByName('BulletinNum').AsString:=BulletinNum;
                //Frm_Bulletin.LAdoBulletin.FieldByName('BulletinMan').AsString:=DatabaseModule.dtclsData.UserName_;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinDate').AsDateTime:=Now;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinTitle').AsString:=EdtTitle.Text;
                Frm_Bulletin.LAdoBulletin.FieldByName('BulletinContent').AsString:=EdtContent.Text;
                Frm_Bulletin.LAdoBulletin.Post;
                LReadUser.UpdateBatch;
                Dtclsdata.CommitTrans;
                BtnExit.Click;
              Except
                DtclsData.RollbackTrans;
                Raise;
              End;
            End;
        End;
    End
  Else Application.MessageBox('标题和内容,可阅人不能为空','提示',MB_OK+MB_IConwarning);
end;

procedure TFrm_NewBulletin.FormCreate(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  BulletinNum:='';
  IF ISAdd=True Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select Top 1 BulletinNum From Bulletin Where BulletinMan=:BulletinMan Order by BulletinNum Desc');
      Query.Parameters.ParamByName('BulletinMan').Value:=DatabaseModule.dtclsData.UserName_;
      Query.Prepared;
      Query.Open;
      IF Query.IsEmpty Then
        Begin
          Case Length(FloatToStr(DatabaseModule.dtclsData.UserID_)) OF
          1:BulletinNum:= FloatToStr(DatabaseModule.dtclsData.UserID_)+'000100001';
          2:BulletinNum:= FloatToStr(DatabaseModule.dtclsData.UserID_)+'00100001';
          3:BulletinNum:= FloatToStr(DatabaseModule.dtclsData.UserID_)+'0100001';
          4:BulletinNum:= FloatToStr(DatabaseModule.dtclsData.UserID_)+'100001';
          End;
        End
      Else BulletinNum:=FloatToStr(StrToFloat(Query.FieldByName('BulletinNum').AsString)+1);
    End;
  IF ISEdit=True Then
    Begin
      EdtTitle.Text:=Frm_Bulletin.LAdoBulletin.FieldByName('BulletinTitle').AsString;
      EdtContent.Text:=Frm_Bulletin.LAdoBulletin.FieldByName('BulletinContent').AsString;
      BulletinNum:=Frm_Bulletin.LAdoBulletin.FieldByName('BulletinNum').AsString;
    End;
  LUser.Close;
  LUser.SQL.Clear;
  LUser.SQL.Add('Select a.UserID_,a.USerName_,b.DeptName_ From Users_ a,DepartMent_ b where a.deptID_=b.deptID_');
  Luser.Prepared;
  LUser.Open;

  IF GrdUser.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LDSUser.DataSet.FieldCount - 2 Do
    Begin
      GrdUser.CreateColumn;
      GrdUser.Columns[I].Name:='BulletinColumns'+IntToStr(I);
   End;
          GrdUser.DataController.DataSource:=LDSUser;
          GrdUser.Columns[0].Caption:='部门';
          GrdUser.Columns[0].DataBinding;
          GrdUser.Columns[0].DataBinding.FieldName:='DeptName_';
          GrdUser.Columns[0].DataBinding.ValueType:='String';
          GrdUser.Columns[0].Width:=100;

          GrdUser.Columns[1].Caption:='姓名';
          GrdUser.Columns[1].DataBinding;
          GrdUser.Columns[1].DataBinding.FieldName:='UserName_';
          GrdUser.Columns[1].DataBinding.ValueType:='String';

  LReadUser.Close;
  LReadUser.SQL.Clear;
  LReadUser.SQL.Add('Select BulletinNum,IFRead,UserID,UserName From BulletinList  where bulletinNum=:Bulletinnum ');
  LReadUser.Parameters.ParamByName('BulletinNum').Value:=BulletinNum;
  LReaduser.Prepared;
  LReadUser.Open;
  IF ISAdd=True Then
    Begin
      LReadUser.Append;
      LReadUser.FieldByName('BulletinNum').AsString:=BulletinNum;
      LReadUser.FieldByName('UserID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      LReadUser.FieldByName('UserName').AsString:=DatabaseModule.dtclsData.UserName_;
      LReadUser.FieldByName('IFRead').AsBoolean:=Boolean(1);
      LReadUser.Prepared;
      LReadUser.Post;
    End;
  IF GrdReadUser.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LDSReadUser.DataSet.FieldCount - 3 Do
    Begin
      GrdReadUser.CreateColumn;
      GrdReadUser.Columns[I].Name:='ReadUserColumns'+IntToStr(I);
   End;
          GrdReadUser.DataController.DataSource:=LDSReadUser;
          GrdReadUser.Columns[0].Caption:='可阅人';
          GrdReadUser.Columns[0].DataBinding;
          GrdReadUser.Columns[0].DataBinding.FieldName:='UserName';
          GrdReadUser.Columns[0].DataBinding.ValueType:='String';
          GrdReadUser.Columns[0].Width:=100;

          GrdReadUser.Columns[1].Caption:='是否已阅';
          GrdReadUser.Columns[1].DataBinding;
          GrdReadUser.Columns[1].DataBinding.FieldName:='IFRead';
          GrdReadUser.Columns[1].DataBinding.ValueType:='Boolean';
          GrdReadUser.Columns[1].Width:=60;
end;

procedure TFrm_NewBulletin.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  IF LUser.IsEmpty Then Exit;
  IF LReadUser.Locate('UserID',LUser.FieldByName('UserID_').AsInteger,[loCaseInsensitive]) Then Exit;
  LReadUser.Append;
  LReadUser.FieldByName('BulletinNum').AsString:=BulletinNum;
  LReadUser.FieldByName('UserID').AsInteger:=LUser.FieldByName('UserID_').AsInteger;
  LReadUser.FieldByName('UserName').AsString:=LUser.FieldByName('UserName_').AsString;
  LReadUser.FieldByName('IFRead').AsBoolean:=Boolean(0);
  LReadUser.Prepared;
  LReadUser.Post;
end;

procedure TFrm_NewBulletin.SpeedButton2Click(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  IF LUser.IsEmpty Then Exit;
  LUser.First;
  FOR I:=1 TO Luser.RecordCount DO
    Begin
      IF Not LReadUser.Locate('UserID',LUser.FieldByName('UserID_').AsInteger,[loCaseInsensitive]) Then
        Begin
          LReadUser.Append;
          LReadUser.FieldByName('BulletinNum').AsString:=BulletinNum;
          LReadUser.FieldByName('UserID').AsInteger:=LUser.FieldByName('UserID_').AsInteger;
          LReadUser.FieldByName('UserName').AsString:=LUser.FieldByName('UserName_').AsString;
          LReadUser.FieldByName('IFRead').AsBoolean:=Boolean(0);
          LReadUser.Prepared;
          LReadUser.Post;
        End;
      LUser.next;  
    End;
end;

procedure TFrm_NewBulletin.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  IF (LReadUser.IsEmpty) OR (LReadUser.FieldByName('UserID').AsInteger=DatabaseModule.dtclsData.UserID_) Then Exit;
  LReadUser.Delete;
end;

procedure TFrm_NewBulletin.SpeedButton4Click(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  IF LReadUser.IsEmpty Then Exit;
  FOR I:=1 TO LReadUser.RecordCount DO
    Begin
      IF Not (LReadUser.FieldByName('UserID').AsInteger=DatabaseModule.dtclsData.UserID_) Then
        LReadUser.Delete;
      LReadUser.Next;
    End;
end;

procedure TFrm_NewBulletin.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TFrm_NewBulletin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
