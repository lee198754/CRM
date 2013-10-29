unit NewSale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxLabel,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBar,
  cxLookAndFeels, dxBarExtItems, ImgList, ActnList, XPMenu, cxTextEdit,
  cxMemo, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ADODB,
  bainaADOQuery, cxDropDownEdit, cxCalendar, cxMaskEdit, cxButtonEdit, cxPC;

type
  TFrm_SaleMake = class(TBaseData_Frm)
    LAdoUser: TbainaADOQuery;
    LAdoCust: TbainaADOQuery;
    LDSCust: TDataSource;
    LDSUser: TDataSource;
    DSSaleList: TDataSource;
    Query: TbainaADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    cxGrid1: TcxGrid;
    GrdSaleD: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BtnExit: TcxButton;
    BtnSure: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    EdtCust: TcxButtonEdit;
    EdtDate: TcxDateEdit;
    EdtMemo: TcxMemo;
    EdtSaleID: TcxTextEdit;
    EdtSaleMoney: TcxTextEdit;
    EdtSaleNum: TcxTextEdit;
    EdtUser: TcxButtonEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    EdtMainCost: TcxTextEdit;
    EdtOtherCost: TcxTextEdit;
    EdtCommission: TcxTextEdit;
    EdtBadDebt: TcxTextEdit;
    EdtTax: TcxTextEdit;
    EdtProfit: TcxTextEdit;
    EdtReceiptType: TcxButtonEdit;
    cxButton2: TcxButton;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    EdtMakeMan: TcxTextEdit;
    EdtCheckMan: TcxTextEdit;
    procedure BtnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCustClick(Sender: TObject);
    procedure EdtUserClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdtReceiptTypeClick(Sender: TObject);
    procedure EdtSaleMoneyPropertiesChange(Sender: TObject);
    procedure EdtMainCostPropertiesChange(Sender: TObject);
    procedure EdtOtherCostPropertiesChange(Sender: TObject);
    procedure EdtCommissionPropertiesChange(Sender: TObject);
    procedure EdtBadDebtPropertiesChange(Sender: TObject);
    procedure EdtTaxPropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure OpenCust;
    Procedure OpenUser;
    Procedure NewSaleID(UserID:Integer);
    Procedure ShowSaleList;
    Procedure CountProfit;
  public
    { Public declarations }
    LISAdd,LISEdit:Boolean;
  end;

var
  Frm_SaleMake: TFrm_SaleMake;

implementation

uses Sale, PublicClass, DataBase, Search, NewsaleList, Dict, SaleReceipt,
  Dictother;

{$R *.dfm}

Var
  LUserID,LCustID,LDeptID:Integer;

procedure TFrm_SaleMake.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_SaleMake.FormCreate(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  IF ISAdd=True Then Exit; 
  IF GrdSaleD.ColumnCount<>0 Then Exit;

  FOR I:=0 TO DSSaleList.DataSet.FieldCount - 14 Do
    Begin
      GrdSaleD.CreateColumn;
      GrdSaleD.Columns[I].Name:='SaleDColumns'+IntToStr(I);
   End;
          GrdSaleD.DataController.DataSource:=DSSaleList;
          GrdSaleD.Columns[0].Caption:='商品名称';
          GrdSaleD.Columns[0].DataBinding;
          GrdSaleD.Columns[0].DataBinding.FieldName:='ProdName';
          GrdSaleD.Columns[0].DataBinding.ValueType:='String';
          GrdSaleD.Columns[0].Width:=150;

          GrdSaleD.Columns[1].Caption:='规格型号';
          GrdSaleD.Columns[1].DataBinding;
          GrdSaleD.Columns[1].DataBinding.FieldName:='ProdSpec';
          GrdSaleD.Columns[1].DataBinding.ValueType:='String';

          GrdSaleD.Columns[2].Caption:='销售价格';
          GrdSaleD.Columns[2].DataBinding;
          GrdSaleD.Columns[2].DataBinding.FieldName:='SalePrice';
          GrdSaleD.Columns[2].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[3].Caption:='数量';
          GrdSaleD.Columns[3].DataBinding;
          GrdSaleD.Columns[3].DataBinding.FieldName:='SaleCount';
          GrdSaleD.Columns[3].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[4].Caption:='单位';
          GrdSaleD.Columns[4].DataBinding;
          GrdSaleD.Columns[4].DataBinding.FieldName:='ProdUnit';
          GrdSaleD.Columns[4].DataBinding.ValueType:='String';

          GrdSaleD.Columns[5].Caption:='折扣';
          GrdSaleD.Columns[5].DataBinding;
          GrdSaleD.Columns[5].DataBinding.FieldName:='SaleAgio';
          GrdSaleD.Columns[5].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[6].Caption:='总额';
          GrdSaleD.Columns[6].DataBinding;
          GrdSaleD.Columns[6].DataBinding.FieldName:='SaleTotal';
          GrdSaleD.Columns[6].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[7].Caption:='直接成本';
          GrdSaleD.Columns[7].DataBinding;
          GrdSaleD.Columns[7].DataBinding.FieldName:='LMainCost';
          GrdSaleD.Columns[7].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[8].Caption:='零星成本';
          GrdSaleD.Columns[8].DataBinding;
          GrdSaleD.Columns[8].DataBinding.FieldName:='LOtherCost';
          GrdSaleD.Columns[8].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[9].Caption:='备注';
          GrdSaleD.Columns[9].DataBinding;
          GrdSaleD.Columns[9].DataBinding.FieldName:='SaleListMemo';
          GrdSaleD.Columns[9].DataBinding.ValueType:='String';
end;

procedure TFrm_SaleMake.OpenCust;
begin
  LAdoCust.Close;
  LAdoCust.SQL.Clear;
  LAdoCust.SQL.Add('Select CustID,CustName From Customer');
  LAdoCust.Prepared;
  LAdoCust.Open;
end;

procedure TFrm_SaleMake.OpenUser;
begin
  LAdoUser.Close;
  LAdoUser.SQL.Clear;
  LAdoUser.SQL.Add('Select a.UserID_,a.USerName_,b.DeptID_ From Users_ a,DepartMent_ b Where a.DeptID_=B.DeptID_');
  LAdoUser.Prepared;
  LAdoUser.Open;
end;

procedure TFrm_SaleMake.EdtCustClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_SaleMake.LDSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_SaleMake';
  Frm_search.ShowModal;
end;

procedure TFrm_SaleMake.EdtUserClick(Sender: TObject);
Var
  OldUserName,NewUserName:String;
begin
  inherited;
  OldUserName:=EdtUser.Text;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_SaleMake.LDSUser;
  Frm_Search.GrdSearch.Columns[0].Caption:='归属人';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='UserName_';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_SaleMake';
  Frm_search.ShowModal;
  NewUserName:=EdtUser.Text;
  IF OldUserName=NewUserName Then Exit
  Else
    Begin
      IF EdtUser.Text='' Then Exit
      Else
        LUserID:=LAdoUser.FieldByName('UserID_').AsInteger;
        LDeptID:=LAdoUser.FieldByName('DeptID_').AsInteger;
        NewSaleID(LUserID);
    End;

end;

procedure TFrm_SaleMake.NewSaleID(UserID:Integer);
var
  I:Integer;
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select SaleID From SaleMaste Where BelongID=:BeLongID');
  Query.Parameters.ParamByName('BelongID').Value:=UserID;
  Query.Prepared;
  Query.Open;
  IF Query.IsEmpty Then
    Begin
      //With Databasemodule.dtclsData DO
        Begin
          I:=Length(IntToStr(UserID));
          Case I OF
          1:EdtSaleID.Text:=IntToStr(UserID)+'000'+'10000001';
          2:EdtSaleID.Text:=IntToStr(UserID)+'00'+'10000001';
          3:EdtSaleID.Text:=IntToStr(UserID)+'0'+'10000001';
          4:EdtSaleID.Text:=IntToStr(UserID)+'10000001';
          End;
        End;
    End
  Else
    Begin
      Query.Last;
      EdtSaleID.Text:=FloatToStr(Query.fieldbyname('SaleID').AsFloat+1);
    End;
end;

procedure TFrm_SaleMake.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LISAdd:=False;
  LISEdit:=False;
  Action:=CaFree;
end;

procedure TFrm_SaleMake.N1Click(Sender: TObject);
begin
  inherited;
  ISAdd:=True;
  ISEdit:=False;
  Frm_NewSaleList:=TFrm_NewSaleList.Create(Self);
  Frm_NewSaleList.ShowModal;
end;

procedure TFrm_SaleMake.N3Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin
      IF AdoSaleList.IsEmpty Then Exit;
      EdtSaleMoney.Text:=FloatToStr(StrToFloat(EdtSaleMoney.Text)-AdoSaleList.FieldByName('SaleTotal').AsFloat);
      AdoSaleList.Delete;
    End;
end;

procedure TFrm_SaleMake.N2Click(Sender: TObject);
begin
  inherited;
  IF DSSaleList.DataSet.IsEmpty Then Exit;
  ISAdd:=False;
  ISEdit:=True;
  Frm_NewSaleList:=TFrm_NewSaleList.Create(Self);
  Frm_NewSaleList.ShowModal;
end;

procedure TFrm_SaleMake.BtnSureClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  IF (EdtCust.Text='') OR (EdtUser.Text='') Then Exit;
  With DatabaseModule Do
    Begin
      IF AdoSaleList.IsEmpty Then Exit;
      IF LISAdd=True Then
        Begin
          Dtclsdata.BeginTrans;
          Try
            AdoSale.Append;
            AdoSale.FieldByName('DeptID_').AsInteger:=LDeptID;
            AdoSale.FieldByName('SaleID').AsString:=EdtSaleID.Text;
            AdoSale.FieldByName('SaleNum').AsString:=EdtSaleNum.Text;
            AdoSale.FieldByName('CustID').AsInteger:=LAdoCust.FieldByName('CustID').AsInteger;
            AdoSale.FieldByName('SCustName').AsString:=LAdoCust.FieldByName('CustName').AsString;
            AdoSale.FieldByName('SaleMoney').AsFloat:=StrToFloat(EdtSaleMoney.Text);
            AdoSale.FieldByName('FactMoney').AsFloat:=0;
            AdoSale.FieldByName('CancelMoney').AsFloat:=0;
            AdoSale.FieldByName('SaleMemo').AsString:=EdtMemo.Text;
            AdoSale.FieldByName('IFCheck').AsBoolean:=Boolean(0);
            AdoSale.FieldByName('IFCancel').AsBoolean:=Boolean(0);
            AdoSale.FieldByName('IFFinish').AsBoolean:=Boolean(0);
            Adosale.FieldByName('CreateBy_').AsString:=Dtclsdata.UserName_;
            AdoSale.FieldByName('CreateD_').AsDateTime:=Date;
            AdoSale.FieldByName('BelongID').AsInteger:=LUserID;
            AdoSale.FieldByName('ReceiptType').AsString:=EdtReceiptType.Text;
            AdoSale.FieldByName('MainCost').AsFloat:=StrToFloat(EdtMainCost.Text);
            AdoSale.FieldByName('OtherCost').AsFloat:=StrToFloat(EdtOtherCost.Text);
            AdoSale.FieldByName('Commission').AsFloat:=StrToFloat(EdtCommission.Text);
            AdoSale.FieldByName('Baddebt').AsFloat:=StrToFloat(EdtBaddebt.Text);
            AdoSale.FieldByName('SaleTax').AsFloat:=StrToFloat(EdtTax.Text);
            AdoSale.FieldByName('SaleProfit').AsFloat:=StrToFloat(EdtProfit.Text);
            AdoSale.FieldByName('SaleDate').AsDateTime:=Edtdate.Date;
            AdoSale.Post;
            AdoSaleList.First;

            FOR I:=1 TO AdoSalelist.RecordCount Do
              Begin
                AdoSaleList.Edit;
                AdoSaleList.FieldByName('BelongID').AsInteger:=LUserID;
                AdoSaleList.FieldByName('SaleID').AsString:=EdtSaleID.Text;
                AdoSaleList.Next;
              End;
            AdoSaleList.UpdateBatch;
            //更新客户欠款表
            
            Dtclsdata.CommitTrans;
            //BtnExit.Click;
          Except
            Dtclsdata.RollbackTrans;
            Raise;
          End;
        End;
      IF LISEdit=True Then
        Begin
          Dtclsdata.BeginTrans;
          Try
            AdoSale.Edit;
            AdoSale.FieldByName('DeptID_').AsInteger:=LDeptID;
            AdoSale.FieldByName('SaleNum').AsString:=EdtSaleNum.Text;
            AdoSale.FieldByName('CustID').AsInteger:=LAdoCust.FieldByName('CustID').AsInteger;
            AdoSale.FieldByName('SCustName').AsString:=LAdoCust.FieldByName('CustName').AsString;
            AdoSale.FieldByName('SaleMoney').AsFloat:=StrToFloat(EdtSaleMoney.Text);
            AdoSale.FieldByName('FactMoney').AsFloat:=0;
            AdoSale.FieldByName('SaleMemo').AsString:=EdtMemo.Text;
            Adosale.FieldByName('UpdateBy_').AsString:=Dtclsdata.UserName_;
            AdoSale.FieldByName('UpdateD_').AsDateTime:=Date;
            AdoSale.FieldByName('BelongID').AsInteger:=LUserID;
            AdoSale.FieldByName('MainCost').AsFloat:=StrToFloat(EdtMainCost.Text);
            AdoSale.FieldByName('OtherCost').AsFloat:=StrToFloat(EdtOtherCost.Text);
            AdoSale.FieldByName('Commission').AsFloat:=StrToFloat(EdtCommission.Text);
            AdoSale.FieldByName('Baddebt').AsFloat:=StrToFloat(EdtBaddebt.Text);
            AdoSale.FieldByName('SaleTax').AsFloat:=StrToFloat(EdtTax.Text);
            AdoSale.FieldByName('SaleProfit').AsFloat:=StrToFloat(EdtProfit.Text);
            //AdoSale.FieldByName('SaleDate').AsDateTime:=Edtdate.Date;
            AdoSale.Post;

            AdoSaleList.First;

            FOR I:=1 TO AdoSalelist.RecordCount Do
              Begin
                AdoSaleList.Edit;
                AdoSaleList.FieldByName('BelongID').AsInteger:=LUserID;
                AdoSaleList.Next;
              End;
            AdoSaleList.UpdateBatch;
             //更新客户欠款表

            Dtclsdata.CommitTrans;
            //BtnExit.Click;
          Except
            Dtclsdata.RollbackTrans;
            Raise;
          End;
        End;
    End;
end;

procedure TFrm_SaleMake.ShowSaleList;
Var
  I:Integer;
begin
  inherited;
  IF LISAdd=True Then
    Begin
      With DatabaseModule DO
      Begin
      AdoSaleList.Close;
      AdoSaleList.SQL.Clear;
      AdoSaleList.SQL.Add('Select ProdSelfID,DeptID_,SaleID,ProdID,ProdName,ProdType,ProdSpec,ProdUnit,SaleCount,SalePrice,FactPrice,SaleAgio,');
      AdoSaleList.SQL.Add('NoPay,SaleTotal,LMainCost,LOtherCost,SaleType,SaleBB,CreateBY_,CreateD_,BelongID,UpdateBy_,UpdateD_,SaleListMemo');
      AdoSaleList.SQL.Add('From SaleDetail Where SaleID=:SaleID');
      AdoSaleList.Parameters.ParamByName('SaleID').Value:=EdtSaleNum.Text;
      AdoSaleList.Open;

      End;
    End;
  IF GrdSaleD.ColumnCount<>0 Then Exit;

  FOR I:=0 TO DSSaleList.DataSet.FieldCount - 14 Do
    Begin
      GrdSaleD.CreateColumn;
      GrdSaleD.Columns[I].Name:='SaleDColumns'+IntToStr(I);
   End;
          GrdSaleD.DataController.DataSource:=DSSaleList;
          GrdSaleD.Columns[0].Caption:='商品名称';
          GrdSaleD.Columns[0].DataBinding;
          GrdSaleD.Columns[0].DataBinding.FieldName:='ProdName';
          GrdSaleD.Columns[0].DataBinding.ValueType:='String';
          GrdSaleD.Columns[0].Width:=150;

          GrdSaleD.Columns[1].Caption:='规格型号';
          GrdSaleD.Columns[1].DataBinding;
          GrdSaleD.Columns[1].DataBinding.FieldName:='ProdSpec';
          GrdSaleD.Columns[1].DataBinding.ValueType:='String';

          GrdSaleD.Columns[2].Caption:='实际价格';
          GrdSaleD.Columns[2].DataBinding;
          GrdSaleD.Columns[2].DataBinding.FieldName:='SalePrice';
          GrdSaleD.Columns[2].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[3].Caption:='销售价格';
          GrdSaleD.Columns[3].DataBinding;
          GrdSaleD.Columns[3].DataBinding.FieldName:='FactPrice';
          GrdSaleD.Columns[3].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[4].Caption:='数量';
          GrdSaleD.Columns[4].DataBinding;
          GrdSaleD.Columns[4].DataBinding.FieldName:='SaleCount';
          GrdSaleD.Columns[4].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[5].Caption:='单位';
          GrdSaleD.Columns[5].DataBinding;
          GrdSaleD.Columns[5].DataBinding.FieldName:='ProdUnit';
          GrdSaleD.Columns[5].DataBinding.ValueType:='String';

          GrdSaleD.Columns[6].Caption:='折扣';
          GrdSaleD.Columns[6].DataBinding;
          GrdSaleD.Columns[6].DataBinding.FieldName:='SaleAgio';
          GrdSaleD.Columns[6].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[7].Caption:='总额';
          GrdSaleD.Columns[7].DataBinding;
          GrdSaleD.Columns[7].DataBinding.FieldName:='SaleTotal';
          GrdSaleD.Columns[7].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[8].Caption:='直接成本';
          GrdSaleD.Columns[8].DataBinding;
          GrdSaleD.Columns[8].DataBinding.FieldName:='LMainCost';
          GrdSaleD.Columns[8].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[9].Caption:='零星成本';
          GrdSaleD.Columns[9].DataBinding;
          GrdSaleD.Columns[9].DataBinding.FieldName:='LOtherCost';
          GrdSaleD.Columns[9].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[10].Caption:='备注';
          GrdSaleD.Columns[10].DataBinding;
          GrdSaleD.Columns[10].DataBinding.FieldName:='SaleListMemo';
          GrdSaleD.Columns[10].DataBinding.ValueType:='String';
end;

procedure TFrm_SaleMake.FormShow(Sender: TObject);
begin
  inherited;
  OpenCust;
  OpenUser;
  With DatabaseModule Do
    Begin
      IF LISAdd=True Then
        Begin
          EdtReceiptType.Text:='';
          EdtCust.Text:='';
          EdtSaleNum.Text:='';
          EdtMemo.Text:='';
          EdtSaleMoney.Text:='0';
          EdtMainCost.Text:='0';
          EdtOtherCost.Text:='0';
          EdtCommission.Text:='0';
          EdtBaddebt.Text:='0';
          EdtTax.Text:='0';
          EdtProfit.Text:='0';
          EdtDate.Date:=Date;
          EdtDate.Date:=Date;
          EdtMakeMan.Text:=DatabaseModule.dtclsData.UserName_;
          EdtUser.Text:=DatabaseModule.dtclsData.UserName_;
          LUserID:=dtclsData.UserID_;
          LDeptID:=Dtclsdata.DeptID_;

          NewSaleID(DatabaseModule.dtclsData.UserID_);
          ShowSaleList;
        End;

      IF LISEdit=True Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserName_ From Users_ where UserID_=:UserID');
          Query.Parameters.ParamByName('UserID').Value:=AdoSale.FieldByName('BelongID').AsInteger;
          Query.Prepared;
          Query.Open;
          LUserID:=AdoSale.FieldByName('BelongID').AsInteger;
          LDeptID:=AdoSale.FieldByName('DeptID_').AsInteger;
          EdtCust.Text:=AdoSale.FieldByName('SCustName').AsString;
          EdtDate.Date:=AdoSale.FieldByName('CreateD_').AsDateTime;
          EdtSaleID.Text:=AdoSale.FieldByName('SaleID').AsString;
          EdtSaleNum.Text:=AdoSale.FieldByName('SaleNum').AsString;
          EdtMemo.Text:=AdoSale.FieldByName('SaleMemo').AsString;
          EdtSaleMoney.Text:=FloatToStr(AdoSale.FieldByName('SaleMoney').AsFloat);
          EdtUser.Text:=Query.FieldByName('UserName_').AsString;
          EdtMainCost.Text:=FloatToStr(AdoSale.FieldByName('MainCost').AsFloat);
          EdtOtherCost.Text:=FloatToStr(AdoSale.FieldByName('OtherCost').AsFloat);
          EdtCommission.Text:=FloatToStr(AdoSale.FieldByName('Commission').AsFloat);
          EdtBaddebt.Text:=FloatToStr(AdoSale.FieldByName('Baddebt').AsFloat);
          EdtTax.Text:=FloatToStr(AdoSale.FieldByName('SaleTax').AsFloat);
          EdtProfit.Text:=FloatToStr(AdoSale.FieldByName('SaleProfit').AsFloat);
          EdtReceiptType.Text:=AdoSale.FieldByName('ReceiptType').AsString;
          EdtMakeman.Text:=AdoSale.FieldByName('MakeMan').AsString;
          EdtCheckMan.Text:=AdoSale.fieldByName('CheckMan').AsString;
          EdtDate.Date:=AdoSale.FieldByName('SaleDate').AsDateTime;
        End;

    End;
end;

procedure TFrm_SaleMake.CountProfit;
begin
  EdtProfit.Text:=FloatToStr(StrToFloat(EdtSaleMoney.Text)-StrToFloat(EdtMainCost.Text)-StrToFloat(EdtOtherCost.Text)-StrToFloat(EdtCommission.Text)-StrToFloat(EdtBaddebt.Text)-StrToFloat(EdtTax.Text));
end;

procedure TFrm_SaleMake.FormActivate(Sender: TObject);
begin
  inherited;
  CountProfit;
end;

procedure TFrm_SaleMake.EdtReceiptTypeClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:='单据类别';
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:='单据类别';
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:='ReceiptType';
  Frm_Dictother.DictDuty:='单据类别';
  Frm_Dictother.DictIFCust:=0;
  Frm_Dictother.FrmName:='Frm_SaleMake';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_SaleMake.EdtSaleMoneyPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtSaleMoney.Text='0' Then Exit
  Else CountProfit;
end;

procedure TFrm_SaleMake.EdtMainCostPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtMainCost.Text='0' Then Exit
  Else CountProfit;
end;

procedure TFrm_SaleMake.EdtOtherCostPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtOtherCost.Text='0' Then Exit
  Else CountProfit;
end;

procedure TFrm_SaleMake.EdtCommissionPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtCommission.Text='0' Then Exit
  Else CountProfit;
end;

procedure TFrm_SaleMake.EdtBadDebtPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtBadDebt.Text='0' Then Exit
  Else CountProfit;
end;

procedure TFrm_SaleMake.EdtTaxPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtTax.Text='0' Then
  Else CountProfit;
end;

procedure TFrm_SaleMake.cxButton2Click(Sender: TObject);
begin
  inherited;
  Rep_SaleReceipt:=TRep_SaleReceipt.Create(Self);
  Rep_SaleReceipt.QRLabel19.Caption:='人民币大写:'+NTOC(Rep_SaleReceipt.AdoQuery1.FieldByName('SaleMoney').AsFloat);
  Rep_SaleReceipt.QuickRep1.Preview;

end;

end.
