unit SalePre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, Menus, cxLookAndFeelPainters, cxMemo,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cxLookAndFeels, dxBar, dxBarExtItems, cxClasses, ImgList, ActnList,
  XPMenu, DB, ADODB, bainaADOQuery, cxGraphics;

type
  TFrm_SalePre = class(TBaseData_Frm)
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    EdtName: TcxButtonEdit;
    EdtPrice: TcxTextEdit;
    EdtPreCount: TcxTextEdit;
    EdtMoney: TcxTextEdit;
    EdtPreDate: TcxDateEdit;
    EdtFinishdate: TcxDateEdit;
    EdtMemo: TcxMemo;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    LAdoProd: TbainaADOQuery;
    LDSProd: TDataSource;
    EdtPossible: TcxComboBox;
    procedure EdtNameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure EdtPricePropertiesChange(Sender: TObject);
    procedure EdtPreCountPropertiesChange(Sender: TObject);
    procedure EdtMoneyPropertiesChange(Sender: TObject);
    procedure EdtPriceExit(Sender: TObject);
    procedure EdtPreCountExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure CheckNumeric(Edt:TcxTextEdit);
    Procedure ShowSalePreRecord;
  public
    { Public declarations }
  end;

var
  Frm_SalePre: TFrm_SalePre;

implementation

uses Search, DataBase, PublicClass;

{$R *.dfm}

procedure TFrm_SalePre.EdtNameClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_SalePre.LDSProd;
  Frm_Search.GrdSearch.Columns[0].Caption:='²úÆ·Ãû³Æ';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='ProdName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_SalePre';
  Frm_search.ShowModal;
end;

procedure TFrm_SalePre.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('select ProdName,ProdoutPrice From Product');
  LAdoProd.Prepared;
  LAdoProd.Open;
  IF ISAdd=True Then
    Begin
      EdtName.Text:='';
      Edtprice.Text:='0';
      EdtPreCount.Text:='0';
      EdtMoney.Text:='0';
      EdtPossible.Text:='0';
      EdtPreDate.Date:=date;
      EdtFinishDate.Date:=Date;
      EdtMemo.Text:='';
    End;
  IF ISEdit=True Then ShowSalePreRecord;
  IF ISBrowse=True Then
    Begin
      ShowSalePreRecord;
      BtnSure.Enabled:=False;
    End;
end;

procedure TFrm_SalePre.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFrm_SalePre.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF (EdtName.Text='') OR (Edtprice.Text='') OR (EdtPrecount.Text='') Then Exit;
  With DatabaseModule Do
    Begin
      Dtclsdata.BeginTrans;
      Try
      IF ISAdd=True Then
        Begin
          AdoPre.Append;
          AdoPre.FieldByName('CustID').AsInteger:=AdoCust.FieldByName('CustID').AsInteger;
          AdoPre.FieldByName('DeptID_').AsInteger:=AdoCust.FieldByName('DeptID_').AsInteger;
          AdoPre.FieldByName('Product').AsString:=EdtName.Text;
          AdoPre.FieldByName('Price').AsInteger:=StrToInt(EdtPrice.Text);
          AdoPre.FieldByName('ForecastCount').AsInteger:=StrToInt(Edtprecount.Text);
          AdoPre.FieldByName('ForecastMoney').AsInteger:=StrToInt(EdtMoney.Text);
          AdoPre.FieldByName('Possible').AsString:=EdtPossible.Text;
          AdoPre.FieldByName('ForecastDate').AsDateTime:=EdtPredate.Date;
          AdoPre.FieldByName('Finishdate').AsDateTime:=EdtFinishdate.Date;
          AdoPre.FieldByName('Forecastmemo').AsString:=EdtMemo.Text;
          AdoPre.FieldByName('Createby_').AsInteger:=Dtclsdata.UserID_;
          AdoPre.FieldByName('CreateD_').AsDateTime:=Date;
          Adopre.FieldByName('BelongID').AsInteger:=AdoCust.FieldByName('BelongID').AsInteger;
          AdoPre.Post;
        End;
      IF ISEdit=True Then
        Begin
          AdoPre.Edit;
          AdoPre.FieldByName('Product').AsString:=EdtName.Text;
          AdoPre.FieldByName('Price').AsInteger:=StrToInt(EdtPrice.Text);
          AdoPre.FieldByName('ForecastCount').AsInteger:=StrToInt(Edtprecount.Text);
          AdoPre.FieldByName('ForecastMoney').AsInteger:=StrToInt(EdtMoney.Text);
          AdoPre.FieldByName('Possible').AsString:=EdtPossible.Text;
          AdoPre.FieldByName('ForecastDate').AsDateTime:=EdtPredate.Date;
          AdoPre.FieldByName('Finishdate').AsDateTime:=EdtFinishdate.Date;
          AdoPre.FieldByName('Forecastmemo').AsString:=EdtMemo.Text;
          AdoPre.FieldByName('UpdateBy_').AsInteger:=Dtclsdata.UserID_;
          AdoPre.FieldByName('UpdateD_').AsDateTime:=Date;
          AdoPre.Post;
        End;
      Dtclsdata.CommitTrans;
      BtnExit.Click;
      Except
        Dtclsdata.RollbackTrans;
        Raise;
      End;
    End;
end;

procedure TFrm_SalePre.CheckNumeric(Edt: TcxTextEdit);
begin
  Try
    StrToFloat(Edt.Text);
  Except
    Edt.Text:='0';
  End;
end;

procedure TFrm_SalePre.EdtPricePropertiesChange(Sender: TObject);
begin
  inherited;
  CheckNumeric(EdtPrice);

end;

procedure TFrm_SalePre.EdtPreCountPropertiesChange(Sender: TObject);
begin
  inherited;
  CheckNumeric(EdtPreCount);

end;

procedure TFrm_SalePre.EdtMoneyPropertiesChange(Sender: TObject);
begin
  inherited;
  CheckNumeric(EdtMoney);
end;

procedure TFrm_SalePre.EdtPriceExit(Sender: TObject);
begin
  inherited;
    EdtMoney.Text:=IntToStr(StrToInt(EdtPrice.Text)*StrToInt(EdtPreCount.Text));
end;

procedure TFrm_SalePre.EdtPreCountExit(Sender: TObject);
begin
  inherited;
    EdtMoney.Text:=IntToStr(StrToInt(EdtPrice.Text)*StrToInt(EdtPreCount.Text));
end;

procedure TFrm_SalePre.ShowSalePreRecord;
begin
  With DatabaseModule DO
        Begin
          EdtName.Text:=AdoPre.FieldByName('Product').AsString;
          EdtPrice.Text:=IntToStr(AdoPre.FieldBYName('Price').AsInteger);
          EdtPreCount.Text:=IntToStr(AdoPre.FieldByName('Forecastcount').AsInteger);
          EdtMoney.Text:=IntToStr(AdoPre.FieldByName('ForecastMoney').AsInteger);
          Edtpossible.Text:=AdoPre.FieldByName('Possible').AsString;
          EdtPredate.Date:=AdoPre.FieldByName('ForecastDate').AsDateTime;
          EdtFinishdate.Date:=AdoPre.FieldByName('FinishDate').AsDateTime;
          EdtMemo.Text:=AdoPre.FieldByName('ForecastMemo').AsString;
        End;
end;

procedure TFrm_SalePre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=False;
  Action:=CaFree;
end;

end.
