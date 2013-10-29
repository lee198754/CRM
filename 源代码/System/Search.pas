unit Search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeels, dxBar, dxBarExtItems, ImgList,
  ActnList, XPMenu, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ADODB, bainaADOQuery, cxPC;

type
  TFrm_Search = class(TBaseData_Frm)
    GrdSearch: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    BtnExit: TcxButton;
    AdoUser: TbainaADOQuery;
    DSUser: TDataSource;
    cxpgcntrl1: TcxPageControl;
    cxtbsht1: TcxTabSheet;
    BtnSure: TcxButton;
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FrmName:String;
  end;

var
  Frm_Search: TFrm_Search;

implementation

uses DataBase, CustContact, NewContract, NewExpend, SalePre, PublicClass,
  Select, PreWrite, EventEditForm, NewSale, CustChange, FArrearage,
  PReceive, CustActive, NewProd;

{$R *.dfm}

procedure TFrm_Search.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_Search.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF FrmName='Frm_NewCode' Then
    Begin
      IF GrdSearch.Columns[0].Caption='产品名称' Then Frm_NewCode.EdtName.Text:=Frm_NewCode.LAdoProd.FieldByName('ProdName').AsString;
      
    End;
  IF FrmName='Frm_Receive' Then Frm_Receive.EdtCust.Text:= Frm_Receive.LAdoCust.FieldByName('CustName').AsString;
  IF FrmName='Frm_FArrearage' Then Frm_FArrearage.EdtCust.Text:= Frm_FArrearage.LAdoCust.FieldByName('CustName').AsString;
  IF FrmName='Frm_Move' Then
    Begin
      IF GrdSearch.Columns[0].Caption='原用户名称' Then Frm_Move.EdtUserO.Text:=Frm_Move.LAdoUser.FieldByName('UserName_').AsString;
      IF GrdSearch.Columns[0].Caption='新用户名称' Then Frm_Move.EdtUserN.Text:=Frm_Move.LAdoUser.FieldByName('UserName_').AsString;
    End;
  IF FrmName='Frm_SaleMake' Then
    Begin
      IF GrdSearch.Columns[0].Caption='客户名称' Then Frm_SaleMake.EdtCust.Text:= Frm_SaleMake.LAdoCust.FieldByName('CustName').AsString;
      IF GrdSearch.Columns[0].Caption='归属人' Then Frm_SaleMake.EdtUser.Text:= Frm_SaleMake.LAdoUser.FieldByName('UserName_').AsString;
    End;
  IF FrmName='Frm_Pre' Then
    Begin
      Frm_Pre.EdtCust.Text:=Frm_Pre.LAdoCust.FieldByName('CustName').AsString;
      Frm_Pre.EdtAdd.Text:=Frm_Pre.LAdoCust.FieldByName('CustAddress').AsString;
    End;
  IF FrmName='Frm_Select' Then Frm_Select.EdtMain.Text:=Frm_Select.LAdoUser.FieldByName('UserName_').AsString;
  IF FrmName='Frm_NewContract' Then
    Begin
      IF PNContract=1 Then
        Begin
          IF GrdSearch.Columns[0].Caption='客户名称' Then Frm_NewContract.EdtCust.Text:=DatabaseModule.AdoCust.fieldbyname('CustName').AsString;
          IF GrdSearch.Columns[0].Caption='客户联系人' Then Frm_NewContract.EdtContact.Text:=Frm_NewContract.AdoContact.fieldbyname('ContactName').AsString;
        End;
      IF PNContract=2 Then
        Begin
          IF GrdSearch.Columns[0].Caption='客户名称' Then Frm_NewContract.EdtCust.Text:=Frm_NewContract.AdoCust.fieldbyname('CustName').AsString;
          IF GrdSearch.Columns[0].Caption='客户联系人' Then Frm_NewContract.EdtContact.Text:=Frm_NewContract.AdoContact.fieldbyname('ContactName').AsString;
        End;
      IF GrdSearch.Columns[0].Caption='名称' Then Frm_NewContract.EdtMan.Text:=AdoUser.fieldbyname('UserName_').AsString;
    End;
  IF FrmName='Frm_NewExpend' Then
    Begin
      IF GrdSearch.Columns[0].Caption='客户名称' Then Frm_NewExpend.EdtName.Text:=Frm_NewExpend.LAdoCust.fieldbyname('CustName').AsString;
      IF GrdSearch.Columns[0].Caption='名称' Then Frm_NewExpend.EdtMan.Text:=Frm_NewExpend.LAdoUser.fieldbyname('UserName_').AsString;
    End;
  IF FrmName='Frm_CustActive' Then
    Begin
      IF GrdSearch.Columns[0].Caption='名称' Then Frm_CustActive.ExpendMan.Text:=Frm_CustActive.LAdoUser.fieldbyname('UserName_').AsString;
    End;
  IF FrmName='Frm_SalePre' Then
    Begin
      Frm_SalePre.EdtName.Text:=Frm_SalePre.LAdoProd.FieldByName('ProdName').AsString;
      Frm_SalePre.Edtprice.Text:=IntToStr(Frm_SalePre.LAdoProd.FieldByName('ProdOutPrice').AsInteger);
    End;

  Close();
end;

procedure TFrm_Search.FormShow(Sender: TObject);
begin
  inherited;
  GrdSearch.Columns[0].Width:=300;
end;

procedure TFrm_Search.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
