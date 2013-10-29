unit NewsaleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxLabel, Menus,
  cxLookAndFeelPainters, cxTextEdit, StdCtrls, cxButtons, ADODB,
  bainaADOQuery, cxPC, cxMemo;

type
  TFrm_NewSaleList = class(TBaseData_Frm)
    GrdProd: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    BtnAdd: TcxButton;
    BtnExit: TcxButton;
    EdtProdName: TcxTextEdit;
    EdtProdType: TcxTextEdit;
    EdtAmount: TcxTextEdit;
    EdtUnit: TcxTextEdit;
    EdtSalePrice: TcxTextEdit;
    EdtFactPrice: TcxTextEdit;
    EdtSaleAgio: TcxTextEdit;
    EdtSaleMoney: TcxTextEdit;
    LAdoProd: TbainaADOQuery;
    LDSProd: TDataSource;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    Query: TbainaADOQuery;
    cxpgcntrl1: TcxPageControl;
    cxtbsht1: TcxTabSheet;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    EdtMainCost: TcxTextEdit;
    EdtOtherCost: TcxTextEdit;
    cxMemo1: TcxMemo;
    cxLabel15: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure GrdProdCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EdtAmountPropertiesChange(Sender: TObject);
    procedure EdtFactPricePropertiesChange(Sender: TObject);
    procedure EdtSaleAgioPropertiesChange(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CaleMoney;
    Procedure ClearEdt;
    Procedure CheckEdit(Edt:TcxTextEdit);
    Procedure ShowProd;
  public
    { Public declarations }
  end;

var
  Frm_NewSaleList: TFrm_NewSaleList;

implementation

uses DataBase, NewSale, PublicClass;

{$R *.dfm}

Var
  SaleAmount,SaleMainCost,SaleOtherCost:Real;

procedure TFrm_NewSaleList.CaleMoney;
begin
  IF (EdtAmount.Text='') OR (EdtFactPrice.Text='') OR (EdtSaleAgio.Text='') Then Exit;
  EdtSaleMoney.Text:=FloatToStr(MyRound((StrToFloat(EdtAmount.Text)*StrToFloat(EdtFactPrice.Text)*(StrToFloat(EdtSaleAgio.Text)/100)),DecDigit));
  
end;

procedure TFrm_NewSaleList.CheckEdit(Edt: TcxTextEdit);
begin
  Try
    StrToFloat(Edt.Text);
  Except
    Edt.Text:='0';
    Raise;
  End;
end;

procedure TFrm_NewSaleList.FormCreate(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
   ShowProd;
   With DatabaseModule Do
     Begin
       IF ISAdd=True Then
         Begin
           //
         End;
       IF ISEdit=True Then
         Begin
           CxGrid1.Enabled:=False;
           SaleAmount:=AdoSaleList.FieldByName('SaleTotal').AsFloat;
           SaleMainCost:=AdoSaleList.FieldByName('LMainCost').AsFloat;
           SaleOtherCost:=AdoSaleList.FieldByName('LOtherCost').AsFloat;
           EdtProdName.Text:= AdoSaleList.FieldByName('ProdName').AsString;
           EdtAmount.Text:= FloatToStr(AdoSaleList.FieldByName('SaleCount').AsFloat);
           EdtUnit.Text:=AdoSaleList.FieldByName('ProdUnit').AsString;
           //EdtSalePrice.Text:=FloatToStr(AdoSaleList.FieldByName('SalePrice').AsFloat);
           EdtFactPrice.Text:=FloatToStr(AdoSaleList.FieldByName('FactPrice').AsFloat);
           EdtSaleAgio.Text:=FloatToStr(AdoSaleList.FieldByName('SaleAgio').AsFloat);
           EdtSaleMoney.Text:=FloatToStr(AdoSaleList.FieldByName('SaleTotal').AsFloat);
           EdtMainCost.Text:=FloatToStr(AdoSaleList.FieldByName('LMainCost').AsFloat);
           EdtOtherCost.Text:=FloatToStr(AdoSaleList.FieldByName('LOtherCost').AsFloat);
           CXMemo1.Lines.Add(AdoSaleList.FieldByName('SaleListMemo').AsString);
           IF LAdoProd.Locate('ProdName',EdtProdName.Text,[loPartialKey]) Then
             Begin
               EdtProdType.Text:=LAdoProd.FieldByName('ProdSelfName').AsString;
               EdtSalePrice.Text:=FloatToStr(LAdoProd.FieldByName('ProdOutPrice').AsFloat);
             End;
         End;
     End
end;

procedure TFrm_NewSaleList.GrdProdCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  EdtProdName.Text:=LAdoProd.FieldByName('ProdName').AsString;
  EdtProdType.Text:=LAdoProd.FieldByName('ProdSelfName').AsString;
  EdtAmount.Text:='1';
  EdtUnit.Text:=LAdoProd.FieldByName('ProdUnit').AsString;
  EdtSalePrice.Text:=FloatToStr(LAdoProd.FieldByName('ProdOutPrice').AsFloat);
  EdtFactPrice.Text:= FloatToStr(LAdoProd.FieldByName('ProdOutPrice').AsFloat);
  EdtSaleAgio.Text:='100';
  CaleMoney;
end;

procedure TFrm_NewSaleList.EdtAmountPropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtAmount.Text);
  Except
    EdtAmount.Text:='0';
  End;
  CaleMoney;
end;

procedure TFrm_NewSaleList.EdtFactPricePropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtFactPrice.Text);
  Except
    EdtFactPrice.Text:='0';
  End;
  CaleMoney;
end;

procedure TFrm_NewSaleList.EdtSaleAgioPropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtSaleAgio.Text);
  Except
    EdtSaleAgio.Text:='100';
  End;
  CaleMoney;
end;

procedure TFrm_NewSaleList.BtnAddClick(Sender: TObject);
begin
  inherited;
  IF (EdtProdName.Text='') OR (EdtProdType.Text='') Then Exit;
  With DatabaseModule DO
    Begin
      IF ISAdd=True Then
        Begin
          AdoSaleList.Append;
          AdoSaleList.FieldByName('DeptID_').AsInteger:=Dtclsdata.DeptID_;
          AdoSaleList.FieldByName('SaleID').AsString:=Frm_SaleMake.EdtSaleID.Text;
          AdoSaleList.FieldByName('ProdId').AsInteger:= LAdoProd.FieldByName('ProdID').AsInteger;
          AdoSaleList.FieldByName('ProdName').AsString:= EdtProdName.Text;
          AdoSaleList.FieldByName('ProdSelfID').AsString:=LAdoProd.FieldByName('ProdSelfID').AsString;
          AdoSaleList.FieldByName('ProdType').AsString:=LAdoProd.FieldByName('ProdType').AsString;
          AdoSaleList.FieldByName('ProdSpec').AsString:=LAdoProd.FieldByName('ProdSpec').AsString;
          AdoSaleList.FieldByName('ProdUnit').AsString:=LAdoProd.FieldByName('ProdUnit').AsString;
          AdoSaleList.FieldByName('SaleCount').AsFloat:=StrToFloat(EdtAmount.Text);
          AdoSaleList.FieldByName('SalePrice').AsFloat:=StrToFloat(EdtSalePrice.Text);
          AdoSaleList.FieldByName('FactPrice').AsFloat:=StrToFloat(EdtFactPrice.Text);
          AdoSaleList.FieldByName('SaleAgio').AsFloat:=StrToFloat(EdtSaleAgio.Text);
          AdoSaleList.FieldByName('SaleTotal').AsFloat:=StrToFloat(EdtSaleMoney.Text);
          AdoSaleList.FieldByName('CreateBy_').AsString:=Dtclsdata.UserName_;
          AdoSaleList.FieldByName('CreateD_').AsDateTime:=Date;
          AdoSaleList.FieldByName('LMainCost').AsFloat:= StrToFloat(EdtMainCost.Text);
          AdoSaleList.FieldByName('LOtherCost').AsFloat:=StrToFloat(EdtOtherCost.Text);
          AdoSaleList.FieldByName('SaleListMemo').AsString:=CXMemo1.Text;
          AdoSaleList.Post;
          Frm_SaleMake.EdtSaleMoney.Text:=FloatToStr(StrToFloat(Frm_SaleMake.EdtSaleMoney.Text)+StrToFloat(EdtSaleMoney.Text));
          Frm_SaleMake.EdtMainCost.Text:=FloatToStr(StrToFloat(Frm_SaleMake.EdtMainCost.Text)+StrToFloat(EdtMainCost.Text));
          Frm_SaleMake.EdtOtherCost.Text:=FloatToStr(StrToFloat(Frm_SaleMake.EdtOtherCost.Text)+StrToFloat(EdtOtherCost.Text));
          ClearEdt;
        End;

      IF ISEdit=True Then
        Begin
          AdoSaleList.Edit;
          AdoSaleList.FieldByName('SaleCount').AsFloat:=StrToFloat(EdtAmount.Text);
          AdoSaleList.FieldByName('FactPrice').AsFloat:=StrToFloat(EdtFactPrice.Text);
          AdoSaleList.FieldByName('SaleAgio').AsFloat:=StrToFloat(EdtSaleAgio.Text);
          AdoSaleList.FieldByName('SaleTotal').AsFloat:=StrToFloat(EdtSaleMoney.Text);
          AdoSaleList.FieldByName('UpdateBy_').AsString:=Dtclsdata.UserName_;
          AdoSaleList.FieldByName('UpdateD_').AsDateTime:=Date;
          AdoSaleList.FieldByName('LMainCost').AsFloat:= StrToFloat(EdtMainCost.Text);
          AdoSaleList.FieldByName('LOtherCost').AsFloat:=StrToFloat(EdtOtherCost.Text);
          AdoSaleList.FieldByName('SaleListMemo').AsString:=CXMemo1.Text;
          AdoSaleList.Post;
          Frm_SaleMake.EdtSaleMoney.Text:=FloatToStr(StrToFloat(Frm_SaleMake.EdtSaleMoney.Text)+StrToFloat(EdtSaleMoney.Text)-SaleAmount);
          Frm_SaleMake.EdtMainCost.Text:=FloatToStr(StrToFloat(Frm_SaleMake.EdtMainCost.Text)+StrToFloat(EdtMainCost.Text)-SaleMainCost);
          Frm_SaleMake.EdtOtherCost.Text:=FloatToStr(StrToFloat(Frm_SaleMake.EdtOtherCost.Text)+StrToFloat(EdtOtherCost.Text)-SaleOtherCost);
          BtnExit.Click;
        End;
    End;
end;

procedure TFrm_NewSaleList.ClearEdt;
begin
  EdtProdName.Text:='';
  EdtProdType.Text:='';
  EdtAmount.Text:='0';
  EdtUnit.Text:='';
  EdtSalePrice.Text:='0';
  EdtFactPrice.Text:='0';
  EdtSaleAgio.Text:='100';
  EdtMainCost.Text:='0';
  EdtOtherCost.Text:='0';
  CXMemo1.Clear;
end;

procedure TFrm_NewSaleList.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_NewSaleList.ShowProd;
Var
  I:Integer;
begin
  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('Select a.ProdType As ProdSelfName,b.ProdSelfID,b.prodID,b.ProdName,b.ProdType,b.ProdSpec,b.ProdCount,b.ProdUnit,b.ProdOutPrice');
  LAdoProd.SQL.Add(' From ProductType a,Product b where a.ProdSelfID=b.ProdSelfID');
  LAdoProd.Prepared;
  LAdoProd.Open;

  IF GrdProd.ColumnCount<>0 Then Exit;

  FOR I:=0 TO LDSProd.DataSet.FieldCount - 1 Do
    Begin
      GrdProd.CreateColumn;
      GrdProd.Columns[I].Name:='ProdColumns'+IntToStr(I);
   End;
          GrdProd.DataController.DataSource:=LDSProd;
          GrdProd.Columns[0].Caption:='商品类别';
          GrdProd.Columns[0].DataBinding;
          GrdProd.Columns[0].DataBinding.FieldName:='ProdSelfName';
          GrdProd.Columns[0].DataBinding.ValueType:='String';
          GrdProd.Columns[0].Width := 80;

          GrdProd.Columns[1].Caption:='商品名称';
          GrdProd.Columns[1].DataBinding;
          GrdProd.Columns[1].DataBinding.FieldName:='ProdName';
          GrdProd.Columns[1].DataBinding.ValueType:='String';
          GrdProd.Columns[1].Width:=120;

          GrdProd.Columns[2].Caption:='规格型号';
          GrdProd.Columns[2].DataBinding;
          GrdProd.Columns[2].DataBinding.FieldName:='ProdType';
          GrdProd.Columns[2].DataBinding.ValueType:='String';
          GrdProd.Columns[2].Width := 80;

          GrdProd.Columns[3].Caption:='单位';
          GrdProd.Columns[3].DataBinding;
          GrdProd.Columns[3].DataBinding.FieldName:='ProdUnit';
          GrdProd.Columns[3].DataBinding.ValueType:='String';
          GrdProd.Columns[3].Width := 60;

          GrdProd.Columns[4].Caption:='销售价格';
          GrdProd.Columns[4].DataBinding;
          GrdProd.Columns[4].DataBinding.FieldName:='ProdOutPrice';
          GrdProd.Columns[4].DataBinding.ValueType:='Float';
          GrdProd.Columns[4].Width := 50;

          GrdProd.Columns[5].Caption:='数量';
          GrdProd.Columns[5].DataBinding;
          GrdProd.Columns[5].DataBinding.FieldName:='SaleCount';
          GrdProd.Columns[5].DataBinding.ValueType:='Float';
          GrdProd.Columns[5].Width := 50;
end;

procedure TFrm_NewSaleList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
