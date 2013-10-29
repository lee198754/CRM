unit Pay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ADODB, bainaADOQuery,
  cxGridLevel, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Menus, StdCtrls, cxRadioGroup,
  cxLookAndFeelPainters, cxButtons, cxLabel, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, cxGridExportLink;

type
  TFrm_Pay = class(TBaseData_Frm)
    GrdSaleM: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GrdPay: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    LAdoSaleM: TbainaADOQuery;
    LAdoPayList: TbainaADOQuery;
    Query: TbainaADOQuery;
    LDSSaleM: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    LDSPayList: TDataSource;
    N2: TMenuItem;
    Panel1: TPanel;
    FDate: TcxDateEdit;
    EDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    RBNotFinish: TcxRadioButton;
    RBFinish: TcxRadioButton;
    SaveDlg: TSaveDialog;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure GrdSaleMCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RBFinishClick(Sender: TObject);
    procedure RBNotFinishClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowPayList;
    Procedure showSaleM;
  public
    { Public declarations }
  end;

var
  Frm_Pay: TFrm_Pay;

implementation

uses DataBase, Cash;

{$R *.dfm}

procedure TFrm_Pay.FormCreate(Sender: TObject);
begin
  inherited;
  ShowSaleM;
end;

procedure TFrm_Pay.ShowPayList;
Var
  I:integer;
begin
  LAdoPayList.Close;
  LAdoPayList.SQL.Clear;
  LAdoPayList.SQL.Add('Select DeptID_,SaleID,PayMoney,CreateBy_,CreateD_,belongID From PayDetail Where SaleID=:SaleID');
  LAdoPayList.Parameters.ParamByName('SaleID').Value:= LAdoSaleM.FieldByName('SaleID').AsString;
  LAdoPayList.Prepared;
  LAdoPayList.Open;

  IF GrdPay.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  //GrdContract.OptionsView.ScrollBars:=SSNone;

  FOR I:=0 TO LDSPayList.DataSet.FieldCount - 3 Do
    Begin
      GrdPay.CreateColumn;
      GrdPay.Columns[I].Name:='PayColumns'+IntToStr(I);
   End;
          GrdPay.DataController.DataSource:=LDSPayList;
          GrdPay.Columns[0].Caption:='销售单号';
          GrdPay.Columns[0].DataBinding;
          GrdPay.Columns[0].DataBinding.FieldName:='SaleID';
          GrdPay.Columns[0].DataBinding.ValueType:='String';

          GrdPay.Columns[1].Caption:='收款人';
          GrdPay.Columns[1].DataBinding;
          GrdPay.Columns[1].DataBinding.FieldName:='CreateBy_';
          GrdPay.Columns[1].DataBinding.ValueType:='String';

          GrdPay.Columns[2].Caption:='收款日期';
          GrdPay.Columns[2].DataBinding;
          GrdPay.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdPay.Columns[2].DataBinding.ValueType:='Datetime';

          GrdPay.Columns[3].Caption:='收款金额';
          GrdPay.Columns[3].DataBinding;
          GrdPay.Columns[3].DataBinding.FieldName:='PayMoney';
          GrdPay.Columns[3].DataBinding.ValueType:='Float';


end;

procedure TFrm_Pay.N1Click(Sender: TObject);
begin
  inherited;
  Frm_Cash:=TFrm_Cash.Create(self);
  Frm_Cash.ShowModal;
  showSaleM;
end;

procedure TFrm_Pay.showSaleM;
Var
  I:Integer;
begin
  inherited;
  LAdoSaleM.Close;
  LAdoSaleM.SQL.Clear;
  LAdoSaleM.SQL.Add('Select a.SaleID,a.SaleNum,b.CustName,a.SaleMoney,a.FactMoney,a.CancelMoney,(a.saleMoney-a.FactMoney-a.CancelMoney) AS ArrearMoney ,a.IFFinish,a.belongID,a.UpdateBy_,a.updateD_');
  LAdoSaleM.SQL.Add(',b.CustNum,c.UserName_ From SaleMaste a,Customer b,Users_ c Where a.IFCheck=:IFCheck And a.IFFinish=:IFFinish And a.CustID=b.CustID And a.BelongID=c.UserID_');
  IF (FDate.Text<>'') And (EDate.Text<>'') Then
    Begin
      LAdoSaleM.SQL.Add(' And a.UpdateD_>=:BFDate And a.UpdateD_<=:BEDate');
      LAdoSaleM.Parameters.ParamByName('BFDate').Value:=FDate.Text;
      LAdoSaleM.Parameters.ParamByName('BEDate').Value:=EDate.Text;
    End;
  IF RBNotFinish.Checked Then
    LAdoSaleM.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
  IF RBFinish.Checked Then
    LAdoSaleM.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
  LAdoSaleM.Parameters.ParamByName('IFCheck').Value:=Boolean(1);
  LAdoSaleM.Prepared;
  LAdoSaleM.Open;

  IF GrdSaleM.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  //GrdContract.OptionsView.ScrollBars:=SSNone;

  FOR I:=0 TO LDSSaleM.DataSet.FieldCount - 3 Do
    Begin
      GrdSaleM.CreateColumn;
      GrdSaleM.Columns[I].Name:='SaleMColumns'+IntToStr(I);
   End;
          GrdSaleM.DataController.DataSource:=LDSSaleM;
          GrdSaleM.Columns[0].Caption:='销售单号';
          GrdSaleM.Columns[0].DataBinding;
          GrdSaleM.Columns[0].DataBinding.FieldName:='SaleID';
          GrdSaleM.Columns[0].DataBinding.ValueType:='String';

          GrdSaleM.Columns[1].Caption:='票据号';
          GrdSaleM.Columns[1].DataBinding;
          GrdSaleM.Columns[1].DataBinding.FieldName:='SaleNum';
          GrdSaleM.Columns[1].DataBinding.ValueType:='String';
          GrdSaleM.Columns[1].Width:=150;

          GrdSaleM.Columns[2].Caption:='客户';
          GrdSaleM.Columns[2].DataBinding;
          GrdSaleM.Columns[2].DataBinding.FieldName:='CustName';
          GrdSaleM.Columns[2].DataBinding.ValueType:='String';
          GrdSaleM.Columns[2].Width:=150;

          GrdSaleM.Columns[3].Caption:='应收金额';
          GrdSaleM.Columns[3].DataBinding;
          GrdSaleM.Columns[3].DataBinding.FieldName:='SaleMoney';
          GrdSaleM.Columns[3].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[4].Caption:='已收金额';
          GrdSaleM.Columns[4].DataBinding;
          GrdSaleM.Columns[4].DataBinding.FieldName:='FactMoney';
          GrdSaleM.Columns[4].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[5].Caption:='受让金额';
          GrdSaleM.Columns[5].DataBinding;
          GrdSaleM.Columns[5].DataBinding.FieldName:='CancelMoney';
          GrdSaleM.Columns[5].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[6].Caption:='欠款金额';
          GrdSaleM.Columns[6].DataBinding;
          GrdSaleM.Columns[6].DataBinding.FieldName:='ArrearMoney';
          GrdSaleM.Columns[6].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[7].Caption:='已付完';
          GrdSaleM.Columns[7].DataBinding;
          GrdSaleM.Columns[7].DataBinding.FieldName:='IFFinish';
          GrdSaleM.Columns[7].DataBinding.ValueType:='Boolean';
          GrdSaleM.Columns[7].Width:=60;

          GrdSaleM.Columns[8].Caption:='归属人';
          GrdSaleM.Columns[8].DataBinding;
          GrdSaleM.Columns[8].DataBinding.FieldName:='UserName_';
          GrdSaleM.Columns[8].DataBinding.ValueType:='String';

          GrdSaleM.Columns[9].Caption:='收款人';
          GrdSaleM.Columns[9].DataBinding;
          GrdSaleM.Columns[9].DataBinding.FieldName:='UpdateBy_';
          GrdSaleM.Columns[9].DataBinding.ValueType:='String';

          GrdSaleM.Columns[10].Caption:='收款日期';
          GrdSaleM.Columns[10].DataBinding;
          GrdSaleM.Columns[10].DataBinding.FieldName:='UpdateD_';
          GrdSaleM.Columns[10].DataBinding.ValueType:='Datetime';


end;

procedure TFrm_Pay.N2Click(Sender: TObject);
begin
  inherited;
  ShowSaleM;
end;

procedure TFrm_Pay.GrdSaleMCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ShowPayList;
end;

procedure TFrm_Pay.RBFinishClick(Sender: TObject);
begin
  inherited;
  showSaleM;
  ShowPayList;
end;

procedure TFrm_Pay.RBNotFinishClick(Sender: TObject);
begin
  inherited;
  showSaleM;
  ShowPayList;
end;

procedure TFrm_Pay.cxButton1Click(Sender: TObject);
begin
  inherited;
  showSaleM;
end;

procedure TFrm_Pay.N4Click(Sender: TObject);
begin
  inherited;
  IF SaveDlg.Execute Then
    ExportGridToExcel(SaveDlg.FileName ,CXGrid1);
end;

end.
