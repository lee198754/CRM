unit Bulletin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxContainer, cxTextEdit, cxMemo, Grids, DBGrids,
  ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  frxClass, frxDBSet, dxBar, cxLookAndFeels, dxBarExtItems, ImgList,
  ActnList, XPMenu, ADODB, bainaADOQuery, Menus, cxLabel;

type
  TFrm_Bulletin = class(TBaseData_Frm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EdtContent: TcxDBMemo;
    EdtTitle: TcxDBTextEdit;
    EdtMan: TcxDBTextEdit;
    EdtDate: TcxDBDateEdit;
    GrdBulletin: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    LAdoBulletin: TbainaADOQuery;
    LDSBulletin: TDataSource;
    LAdoBulletinList: TbainaADOQuery;
    LDSBulletinList: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GrdBulletinList: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure GrdBulletinCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowBulletin;
    Procedure ShowBulletinList;
  public
    { Public declarations }
  end;

var
  Frm_Bulletin: TFrm_Bulletin;

implementation

uses NewBulletin, PublicClass, DataBase;

{$R *.dfm}

procedure TFrm_Bulletin.ShowBulletin;
Var
  I:Integer;
begin
  LAdoBulletin.Close;
  LAdoBulletin.SQL.Clear;
  LAdoBulletin.SQL.Add('Select a.BulletinNum,a.DeptID_,a.BulletinMan,a.BulletinDate,a.BulletinTitle,a.BulletinContent,');
  LAdoBulletin.SQL.Add(' B.BulletinNum,B.UserID,B.IFread');
  LadoBulletin.SQL.Add(' From Bulletin a,BulletinList b Where B.UserID=:UserID And a.BulletinNum=b.BulletinNum Order by a.BulletinDate Desc');
  LadoBulletin.Parameters.ParamByName('UserID').Value:=DatabaseModule.dtclsData.UserID_;
  LAdoBulletin.Prepared;
  LAdoBulletin.Open;
  IF GrdBulletin.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LDSBulletin.DataSet.FieldCount - 6 Do
    Begin
      GrdBulletin.CreateColumn;
      GrdBulletin.Columns[I].Name:='BulletinColumns'+IntToStr(I);
   End;
          GrdBulletin.DataController.DataSource:=LDSBulletin;
          GrdBulletin.Columns[0].Caption:='公告标题';
          GrdBulletin.Columns[0].DataBinding;
          GrdBulletin.Columns[0].DataBinding.FieldName:='BulletinTitle';
          GrdBulletin.Columns[0].DataBinding.ValueType:='String';

          GrdBulletin.Columns[1].Caption:='公告内容';
          GrdBulletin.Columns[1].DataBinding;
          GrdBulletin.Columns[1].DataBinding.FieldName:='BulletinContent';
          GrdBulletin.Columns[1].DataBinding.ValueType:='String';
          GrdBulletin.Columns[1].Width:=300;

          GrdBulletin.Columns[2].Caption:='发布人';
          GrdBulletin.Columns[2].DataBinding;
          GrdBulletin.Columns[2].DataBinding.FieldName:='BulletinMan';
          GrdBulletin.Columns[2].DataBinding.ValueType:='String';

          GrdBulletin.Columns[3].Caption:='发布时间';
          GrdBulletin.Columns[3].DataBinding;
          GrdBulletin.Columns[3].DataBinding.FieldName:='BulletinDate';
          GrdBulletin.Columns[3].DataBinding.ValueType:='DateTime';

          EdtTitle.DataBinding.DataField:='BulletinTitle';
          EdtMan.DataBinding.DataField:='BulletinMan';
          EdtDate.DataBinding.DataField:='BulletinDate';
          EdtContent.DataBinding.DataField:='BulletinContent';
end;

procedure TFrm_Bulletin.ShowBulletinList;
Var
  I:Integer;
begin
  LAdoBulletinList.Close;
  LAdoBulletinList.SQL.Clear;
  LAdoBulletinList.SQL.Add('Select BulletinNum,UserID,UserName,IFRead From BulletinList where BulletinNum=:BulletinNum');
  LadoBulletinList.Parameters.ParamByName('BulletinNum').Value:=LAdoBulletin.FieldByName('BulletinNum').AsString;
  LAdoBulletinList.Prepared;
  LAdoBulletinList.Open;
  IF GrdBulletinList.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LDSBulletinList.DataSet.FieldCount - 3 Do
    Begin
      GrdBulletinList.CreateColumn;
      GrdBulletinList.Columns[I].Name:='BulletinListColumns'+IntToStr(I);
   End;
          GrdBulletinList.DataController.DataSource:=LDSBulletinList;
          GrdBulletinList.Columns[0].Caption:='可阅人';
          GrdBulletinList.Columns[0].DataBinding;
          GrdBulletinList.Columns[0].DataBinding.FieldName:='UserName';
          GrdBulletinList.Columns[0].DataBinding.ValueType:='String';

          GrdBulletinList.Columns[1].Caption:='是否已阅';
          GrdBulletinList.Columns[1].DataBinding;
          GrdBulletinList.Columns[1].DataBinding.FieldName:='IFRead';
          GrdBulletinList.Columns[1].DataBinding.ValueType:='Boolean';
          GrdBulletinList.Columns[1].Width:=60;
end;

procedure TFrm_Bulletin.FormCreate(Sender: TObject);
begin
  inherited;
  ShowBulletin;
  ShowBulletinList;
end;

procedure TFrm_Bulletin.N1Click(Sender: TObject);
begin
  inherited;
  ISAdd:=True;
  ISEdit:=False;
  Frm_NewBulletin:=TFrm_NewBulletin.Create(Self);
  Frm_NewBulletin.ShowModal;
  ShowBulletinList;
end;

procedure TFrm_Bulletin.N2Click(Sender: TObject);
begin
  inherited;
  IF LAdoBulletin.IsEmpty Then Exit;
  ISAdd:=False;
  ISEdit:=True;
  Frm_NewBulletin:=TFrm_NewBulletin.Create(Self);
  Frm_NewBulletin.ShowModal;
  ShowBulletinList;
end;

procedure TFrm_Bulletin.GrdBulletinCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF (LAdoBulletin.FieldByName('BulletinMan').AsString=DatabaseModule.dtclsData.UserName_) Then
    Begin
      //N1.Enabled:=False;
      N2.Enabled:=True;
      N3.Enabled:=True;
    End
  Else
    Begin
      //N1.Enabled:=False;
      N2.Enabled:=False;
      N3.Enabled:=False;
    End;
  ShowBulletinList;
    IF Not (LAdoBulletin.IsEmpty) Then
      Begin
        LAdoBulletinList.Locate('UserID',DatabaseModule.dtclsData.UserID_,[loPartialKey]);
        IF LAdoBulletin.FieldByName('IFRead').AsBoolean=Boolean(0) Then
          Begin
            Try
              LAdoBulletinList.Edit;
              LAdoBulletinList.FieldByName('IFRead').AsBoolean:=Boolean(1);
              LAdoBulletinList.Post;
            Except
              Raise;
            End;
          End;
      End;
end;

procedure TFrm_Bulletin.N5Click(Sender: TObject);
begin
  inherited;
  ShowBulletin;
end;

procedure TFrm_Bulletin.N3Click(Sender: TObject);
Var
  I:Integer;
  BulletinNum:String;
begin
  inherited;
  IF LAdoBulletin.IsEmpty Then Exit;
  IF Application.MessageBox('是否要删除此公告?','询问',MB_YESNO+MB_Iconquestion)=IDNO Then Exit
  Else
    Begin
          DatabaseModule.DtclsData.BeginTrans;
          Try
            BulletinNum:=LAdoBulletin.FieldByName('BulletinNum').AsString;

            LAdoBulletinList.Close;
            LAdoBulletinList.SQL.Clear;
            LAdoBulletinList.SQL.Add('Delete BulletinList where bulletinNum=:MBulletinNum');
            LAdoBulletinList.Parameters.ParamByName('MBulletinNum').Value:=LAdoBulletin.FieldByName('BulletinNum').AsString;
            LAdoBulletinList.Prepared;
            LAdoBulletinList.ExecSQL;

            LAdoBulletin.Close;
            LAdoBulletin.SQL.Clear;
            LAdoBulletin.SQL.Add('Delete Bulletin where bulletinNum=:DBulletinNum');
            LAdoBulletin.Parameters.ParamByName('DBulletinNum').Value:=BulletinNum;
            LAdoBulletin.Prepared;
            LAdoBulletin.ExecSQL;

            DatabaseModule.dtclsData.CommitTrans;
          Except
            DatabaseModule.dtclsData.RollbackTrans;
            Raise;
          End;
        ShowBulletin;
        ShowBulletinList;  
    End;
end;

procedure TFrm_Bulletin.Timer1Timer(Sender: TObject);
begin
  inherited;
  N5.Click;
end;

end.
