unit SaleReceipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, ADODB, QRCtrls, StdCtrls, Grids, DBGrids;

type
  TRep_SaleReceipt = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRExpr1: TQRExpr;
    QRShape10: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape11: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rep_SaleReceipt: TRep_SaleReceipt;

implementation

uses DataBase, NewSale, PublicClass;

{$R *.dfm}

procedure TRep_SaleReceipt.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('Select a.SaleID,a.SaleMemo,a.SaleDate,a.SaleNum,a.SaleMoney,a.CreateBy_,a.MakeMan,a.CheckMan,a.SaleMemo,');
  ADOQuery1.SQL.Add('b.CustName,b.CustAddress From SaleMaste a,Customer b Where a.SaleID=:SaleID And a.CustID=b.CustID');
  ADOQuery1.Parameters.ParamByName('SaleID').Value:=Frm_SaleMake.EdtSaleID.Text;
  ADOQuery1.Prepared;
  ADOQuery1.Open;
  

  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('Select SaleID,ProdName,ProdSpec,FactPrice,ProdUnit,SaleCount,SaleAgio,SaleTotal From SaleDetail Where SaleID=:SaleID');
  ADOQuery2.Parameters.ParamByName('SaleID').Value:=Frm_SaleMake.EdtSaleID.Text;
  ADOQuery2.Prepared;
  ADOQuery2.Open;
end;

end.
