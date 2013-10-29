unit ServiceRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxTextEdit,
  cxMemo, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBar,
  cxLookAndFeels, dxBarExtItems, ImgList, ActnList, XPMenu, ADODB,
  bainaADOQuery, cxDBEdit;

type
  TFrm_ServiceRecord = class(TBaseData_Frm)
    GrdMan: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GrdRecord: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    LAdoMan: TbainaADOQuery;
    LAdoRecord: TbainaADOQuery;
    LDSMan: TDataSource;
    LDSRecord: TDataSource;
    cxDBMemo1: TcxDBMemo;
    procedure FormActivate(Sender: TObject);
    procedure GrdRecordCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure ShowSelect;
    Procedure ShowRecord;
  public
    { Public declarations }
    ServiceID:Integer;
  end;

var
  Frm_ServiceRecord: TFrm_ServiceRecord;

implementation

uses DataBase;

{$R *.dfm}

procedure TFrm_ServiceRecord.ShowRecord;
Var
  I:Integer;
begin
  LAdoRecord.Close;
  LAdoRecord.SQL.Clear;
  LAdoRecord.SQL.Add('Select ServiceID,Serrecord,CreateBy_,CreateD_,UpdateBy_,UpdateD_ From SerProc Where ServiceID=:ServiceID');
  LAdoRecord.Parameters.ParamByName('ServiceID').Value:=ServiceID;
  LAdoRecord.Prepared;
  LAdoRecord.Open;
  IF GrdRecord.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LAdoRecord.FieldCount - 2 Do
    Begin
      GrdRecord.CreateColumn;
      GrdRecord.Columns[I].Name:='ServiceColumns'+IntToStr(I);
   End;
          GrdRecord.DataController.DataSource:=LDSRecord;
          GrdRecord.Columns[0].Caption:='维护记录';
          GrdRecord.Columns[0].DataBinding;
          GrdRecord.Columns[0].DataBinding.FieldName:='Serrecord';
          GrdRecord.Columns[0].DataBinding.ValueType:='String';
          GrdRecord.Columns[0].Width:=80;

          GrdRecord.Columns[1].Caption:='建立人';
          GrdRecord.Columns[1].DataBinding;
          GrdRecord.Columns[1].DataBinding.FieldName:='CreateBy_';
          GrdRecord.Columns[1].DataBinding.ValueType:='String';
          GrdRecord.Columns[1].Width:=80;

          GrdRecord.Columns[2].Caption:='建立日期';
          GrdRecord.Columns[2].DataBinding;
          GrdRecord.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdRecord.Columns[2].DataBinding.ValueType:='Datetime';
          GrdRecord.Columns[2].Width:=80;

          GrdRecord.Columns[3].Caption:='修改人';
          GrdRecord.Columns[3].DataBinding;
          GrdRecord.Columns[3].DataBinding.FieldName:='UpdateBy_';
          GrdRecord.Columns[3].DataBinding.ValueType:='String';
          GrdRecord.Columns[3].Width:=80;

          GrdRecord.Columns[4].Caption:='修改日期';
          GrdRecord.Columns[4].DataBinding;
          GrdRecord.Columns[4].DataBinding.FieldName:='UpdateD_';
          GrdRecord.Columns[4].DataBinding.ValueType:='Datetime';
          GrdRecord.Columns[4].Width:=80;
end;

procedure TFrm_ServiceRecord.ShowSelect;
Var
  I:Integer;
begin
  LAdoMan.Close;
  LAdoMan.SQL.Clear;
  LAdoMan.SQL.Add('Select ServiceNum,SelectUser,IFMain,CreateBy_,CreateD_,UpdateBy_,UpdateD_ From SelectUser Where ServiceNum=:ServiceNum');
  LAdoMan.Parameters.ParamByName('ServiceNum').Value:= ServiceID;
  LAdoMan.Prepared;
  LAdoMan.Open;

  IF GrdMan.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LAdoMan.FieldCount - 2 Do
    Begin
      GrdMan.CreateColumn;
      GrdMan.Columns[I].Name:='ManColumns'+IntToStr(I);
   End;
          GrdMan.DataController.DataSource:=LDSMan;
          GrdMan.Columns[0].Caption:='维护人员';
          GrdMan.Columns[0].DataBinding;
          GrdMan.Columns[0].DataBinding.FieldName:='SelectUser';
          GrdMan.Columns[0].DataBinding.ValueType:='String';
          GrdMan.Columns[0].Width:=80;

          GrdMan.Columns[1].Caption:='是否主维护';
          GrdMan.Columns[1].DataBinding;
          GrdMan.Columns[1].DataBinding.FieldName:='IFMain';
          GrdMan.Columns[1].DataBinding.ValueType:='Boolean';
          GrdMan.Columns[1].Width:=80;

          GrdMan.Columns[2].Caption:='安排日期';
          GrdMan.Columns[2].DataBinding;
          GrdMan.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdMan.Columns[2].DataBinding.ValueType:='Datetime';
          GrdMan.Columns[2].Width:=80;

          GrdMan.Columns[3].Caption:='安排人';
          GrdMan.Columns[3].DataBinding;
          GrdMan.Columns[3].DataBinding.FieldName:='CreateBy_';
          GrdMan.Columns[3].DataBinding.ValueType:='String';
          GrdMan.Columns[3].Width:=80;

          GrdMan.Columns[4].Caption:='修改人';
          GrdMan.Columns[4].DataBinding;
          GrdMan.Columns[4].DataBinding.FieldName:='UpdateBy_';
          GrdMan.Columns[4].DataBinding.ValueType:='String';
          GrdMan.Columns[4].Width:=80;

          GrdMan.Columns[5].Caption:='修改日期';
          GrdMan.Columns[5].DataBinding;
          GrdMan.Columns[5].DataBinding.FieldName:='UpdateD_';
          GrdMan.Columns[5].DataBinding.ValueType:='Datetime';
          GrdMan.Columns[5].Width:=80;
end;

procedure TFrm_ServiceRecord.FormActivate(Sender: TObject);
begin
  inherited;
  ShowSelect;
  ShowRecord;
end;

procedure TFrm_ServiceRecord.GrdRecordCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  CxDBMemo1.DataBinding.DataSource:=LDSRecord;
  CxDBMemo1.DataBinding.DataField:='Serrecord'
end;

procedure TFrm_ServiceRecord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
