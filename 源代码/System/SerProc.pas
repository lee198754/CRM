unit SerProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxMaskEdit, cxButtonEdit, ExtCtrls, ADODB, bainaADOQuery;

type
  TFrm_SerProc = class(TBaseData_Frm)
    EdtMemo: TcxMemo;
    cxLabel1: TcxLabel;
    DSSerProc: TDataSource;
    Panel1: TPanel;
    cxLabel17: TcxLabel;
    ExpendType: TcxButtonEdit;
    cxLabel19: TcxLabel;
    ExpendMoney: TcxTextEdit;
    ExpendMan: TcxButtonEdit;
    cxLabel18: TcxLabel;
    cxGrid1: TcxGrid;
    GrdExpend: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BtnAdd: TcxButton;
    BtnDel: TcxButton;
    LAdoExpend: TbainaADOQuery;
    LDSExpend: TDataSource;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    procedure BtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure ExpendTypeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure ShowExpendRecord;
  public
    { Public declarations }
  end;

var
  Frm_SerProc: TFrm_SerProc;

implementation

uses DataBase, PublicClass, Dict, Dictother;

{$R *.dfm}

procedure TFrm_SerProc.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_SerProc.FormCreate(Sender: TObject);
begin
  inherited;
  IF ISAdd=True Then EdtMemo.Text:='';
  IF ISEdit=True Then EdtMemo.Text:=DatabaseModule.AdoSerProc.FieldByName('Serrecord').AsString;
  IF ISBrowse=True Then
    Begin
      BtnSure.Visible:=False;
      //BtnAdd.Enabled:=False;
      //BtnDel.Enabled:=False;
    End;
  //ShowExpendRecord;
end;

procedure TFrm_SerProc.BtnSureClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
    Begin
      IF AdoPreService.IsEmpty Then Exit;
      IF EdtMemo.Text='' Then Exit;
      DtclsData.BeginTrans;
      Try
      IF ISAdd=True Then
        Begin
          AdoSerProc.Append;
          AdoSerProc.FieldByName('ServiceID').AsInteger:=AdoPreService.FieldByName('ServiceID').AsInteger;
          AdoSerProc.FieldByName('Serrecord').AsString:=EdtMemo.Text;
          AdoSerProc.FieldByName('CreateD_').AsDateTime:=Now;
          AdoSerProc.FieldByName('CreateBy_').AsString:=DatabaseModule.dtclsData.UserName_;
          AdoSerProc.Post;
        End;
      IF ISEdit=True Then
        Begin
          AdoSerProc.Edit;
          AdoSerProc.FieldByName('Serrecord').AsString:=EdtMemo.Text;
          AdoSerProc.FieldByName('UpdateD_').AsDateTime:=Now;
          AdoSerProc.FieldByName('UpdateBy_').AsString:=DatabaseModule.dtclsData.UserName_;
          AdoSerProc.Post;
        End;
        //LAdoExpend.UpdateBatch;
        DtclsData.CommitTrans;
        BtnExit.Click;
      Except
        DtclsData.RollbackTrans;
        Raise;
      End;
    End;
end;

procedure TFrm_SerProc.BtnAddClick(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(ExpendMoney.Text);
  Except
    Application.MessageBox('费用金额输入有误.','提示',MB_OK+MB_Iconwarning);
    ExpendMoney.Text:='0';
    Exit;
  End;
  IF (ExpendType.Text='') OR (ExpendMoney.Text='0') Then
    Begin
      Application.MessageBox('费用类型不能为空,费用金额不能为零.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
          LAdoExpend.Append;
          LAdoExpend.FieldByName('DeptID_').AsInteger:=DataBaseModule.DtClsData.DeptID_;
          //LAdoExpend.FieldByName('ActiveNum').AsString:=ActiveNum.Text;
          LAdoExpend.FieldByName('ExpendType').AsString:=ExpendType.Text;
          LAdoExpend.FieldByName('ExpendMoney').AsFloat:=StrToFloat(ExpendMoney.Text);
          LAdoExpend.FieldByName('ExpendDate').AsDateTime:=Date;
          LAdoExpend.FieldByName('IFCheck').AsBoolean:=Boolean(0);
          LAdoExpend.FieldByName('CreateBy_').AsString:=DatabaseModule.DtclsData.UserName_;
          LAdoExpend.FieldByName('CreateD_').AsDateTime:=Date;
          LAdoExpend.FieldByName('CustID').AsInteger:=DatabaseModule.AdoCust.FieldByName('CustID').AsInteger;
          LAdoExpend.FieldByName('ExpendOption').AsInteger:=1;
          LAdoExpend.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
          LAdoExpend.Post;
  ExpendType.Text:='';
  ExpendMoney.Text:='0';
end;

procedure TFrm_SerProc.BtnDelClick(Sender: TObject);
begin
  inherited;
  IF LAdoExpend.IsEmpty Then Exit;
  LAdoExpend.Delete;
end;

procedure TFrm_SerProc.ShowExpendRecord;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      LAdoExpend.Close;
      LAdoExpend.SQL.Clear;
      LAdoExpend.SQL.Add('Select ActiveNum,DeptID_,CustID,ProjID,ServiceID,ExpendType,ExpendOption,ExpendMoney,ExpendDate,ExpendMemo,CreateBy_,CreateD_,UpdateBY_,UpdateD_,BelongID,IFCheck');
      LAdoExpend.SQL.Add(' From Expend Where ActiveNum=:ActiveNum');
      //LAdoExpend.Parameters.ParamByName('ActiveNum').Value:=ActiveNum.Text;
      LAdoExpend.Prepared;
      LAdoExpend.Open;
    End;
    
  IF GrdExpend.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdExpend.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO LDSExpend.DataSet.FieldCount - 15 Do
    Begin
      GrdExpend.CreateColumn;
      GrdExpend.Columns[I].Name:='ExpendColumns'+IntToStr(I);
   End;
          GrdExpend.DataController.DataSource:=LDSExpend;
          GrdExpend.Columns[0].Caption:='费用类型';
          GrdExpend.Columns[0].DataBinding;
          GrdExpend.Columns[0].DataBinding.FieldName:='ExpendType';
          GrdExpend.Columns[0].DataBinding.ValueType:='String';

          GrdExpend.Columns[1].Caption:='费用金额';
          GrdExpend.Columns[1].DataBinding;
          GrdExpend.Columns[1].DataBinding.FieldName:='ExpendMoney';
          GrdExpend.Columns[1].DataBinding.ValueType:='Float';
          GrdExpend.Columns[1].Width:=150;

       GrdExpend.OptionsView.ScrollBars:=SSBoth;
end;

procedure TFrm_SerProc.ExpendTypeClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:='费用类型';
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:='费用类型';
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:='ExpendType';
  Frm_Dictother.DictDuty:='费用类型';
  Frm_Dictother.DictIFCust:=0;
  Frm_Dictother.FrmName:='Frm_CustActive';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_SerProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
