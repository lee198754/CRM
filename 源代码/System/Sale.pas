unit Sale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxBar, cxLookAndFeels,
  dxBarExtItems, ImgList, ActnList, XPMenu, ADODB, bainaADOQuery, Menus,
  StdCtrls, cxRadioGroup, cxLookAndFeelPainters, cxButtons, cxLabel,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridExportLink;

type
  TFrm_SaleManage = class(TBaseData_Frm)
    GrdSaleM: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Splitter1: TSplitter;
    GrdSaleD: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DSSaleM: TDataSource;
    LDSSaleD: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    query: TbainaADOQuery;
    Panel1: TPanel;
    FDate: TcxDateEdit;
    EDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    RBCheck: TcxRadioButton;
    RBNotCheck: TcxRadioButton;
    SaveDlg: TSaveDialog;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure GrdSaleMCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure GrdSaleMCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure RBNotCheckClick(Sender: TObject);
    procedure RBCheckClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure GrdSaleMColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure GrdSaleMCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure GrdSaleDColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
  private
    { Private declarations }
    Procedure ShowSaleD;
    Procedure ShowSale;
  public
    { Public declarations }
  end;

var
  Frm_SaleManage: TFrm_SaleManage;

implementation

uses DataBase, NewSale, PublicClass, ReportFrom;

{$R *.dfm}

procedure TFrm_SaleManage.FormCreate(Sender: TObject);
begin
  inherited;
  ShowSale;
  ShowSaleD;
  DatabaseModule.AdoSale.AllowCheckAcc := True;
end;

procedure TFrm_SaleManage.ShowSaleD;
Var
  I:Integer;
begin
  With DatabaseModule DO
    Begin
      AdoSaleList.Close;
      AdoSaleList.SQL.Clear;
      AdoSaleList.SQL.Add('Select ProdSelfID,DeptID_,SaleID,ProdID,ProdName,ProdType,ProdSpec,ProdUnit,SaleCount,SalePrice,FactPrice,SaleAgio,');
      AdoSaleList.SQL.Add('NoPay,SaleTotal,LMainCost,LOtherCost,SaleType,SaleBB,CreateBY_,CreateD_,BelongID,UpdateBy_,UpdateD_,SaleListMemo');
      AdoSaleList.SQL.Add('From SaleDetail Where SaleID=:SaleID');
      AdoSaleList.Parameters.ParamByName('SaleID').Value:=DSSaleM.DataSet.FieldByName('SaleID').AsString;
      AdoSaleList.Open;
      
    End;

  IF GrdSaleD.ColumnCount<>0 Then Exit;

  FOR I:=0 TO LDSSaleD.DataSet.FieldCount -14  Do
    Begin
      GrdSaleD.CreateColumn;
      GrdSaleD.Columns[I].Name:='SaleDColumns'+IntToStr(I);
   End;
          GrdSaleD.DataController.DataSource:=LDSSaleD;
          GrdSaleD.Columns[0].Caption:='商品名称';
          GrdSaleD.Columns[0].DataBinding;
          GrdSaleD.Columns[0].DataBinding.FieldName:='ProdName';
          GrdSaleD.Columns[0].DataBinding.ValueType:='String';
          GrdSaleD.Columns[0].Width:=150;

          GrdSaleD.Columns[1].Caption:='规格型号';
          GrdSaleD.Columns[1].DataBinding;
          GrdSaleD.Columns[1].DataBinding.FieldName:='ProdType';
          GrdSaleD.Columns[1].DataBinding.ValueType:='String';

          GrdSaleD.Columns[2].Caption:='销售价格';
          GrdSaleD.Columns[2].DataBinding;
          GrdSaleD.Columns[2].DataBinding.FieldName:='SalePrice';
          GrdSaleD.Columns[2].DataBinding.ValueType:='Float';

          GrdSaleD.Columns[3].Caption:='实际售格';
          GrdSaleD.Columns[3].DataBinding;
          GrdSaleD.Columns[3].DataBinding.FieldName:='SalePrice';
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

procedure TFrm_SaleManage.N1Click(Sender: TObject);
begin
  inherited;

  Frm_SaleMake:=TFrm_SaleMake.Create(Self);
  Frm_SaleMake.LISAdd:=True;
  Frm_SaleMake.LISEdit:=False;
  Frm_SaleMake.ShowModal;
  ShowSale;
  DSSaleM.DataSet.Last;
  ShowSaleD;
end;

procedure TFrm_SaleManage.N2Click(Sender: TObject);
Var
  RecordNo:TBookMark;
begin
  inherited;
  IF DSSaleM.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
    Begin
      Application.MessageBox('单据已审核,不能修改.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF (DatabaseModule.AdoSale.ModifyAcc(DSSaleM.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.REdit) Then
    Begin
      Application.MessageBox('你没有修改此资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  RecordNo:=DSSaleM.DataSet.GetBookmark;
  Frm_SaleMake:=TFrm_SaleMake.Create(Self);
  Frm_SaleMake.LISAdd:=False;
  Frm_SaleMake.LISEdit:=True;
  Frm_SaleMake.ShowModal;
  DSSaleM.DataSet.GotoBookmark(RecordNo);
  ShowSaleD;
  DSSaleM.DataSet.FreeBookmark(RecordNo);
  
end;

procedure TFrm_SaleManage.N3Click(Sender: TObject);
Var
  I:Integer;
  LSaleID:String;
begin
  inherited;
  IF DSSaleM.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
    Begin
      Application.MessageBox('单据已审核,不能删除.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF (DatabaseModule.AdoSale.DeleteAcc(DSSaleM.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.RDelete) Then
    Begin
      Application.MessageBox('你没有删除此资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End
  Else
    Begin
      IF Application.MessageBox('确认要删除此销售单吗?','提示',MB_YESNO+MB_Iconwarning)=IDNo Then Exit
      Else
        Begin
          //删除销售单同时删除销售明细，并更新客户欠款表。
          With DatabaseModule Do
            Begin
              LSaleID:=AdoSale.FieldByName('SaleID').AsString;
              DtclsData.BeginTrans;
              Try
                AdoSaleList.First;
                FOR I:=1 TO AdoSaleList.RecordCount DO
                  Begin
                    AdoSaleList.Delete;
                    AdoSaleList.Next;
                  End;
                AdoSaleList.UpdateBatch;
                Query.Close;
                Query.SQL.Clear;
                Query.SQL.Add('delete SaleMaste Where SaleID=:SaleID');
                Query.Parameters.ParamByName('SaleID').Value:=LSaleID;
                Query.Prepared;
                Query.ExecSQL;
                Dtclsdata.CommitTrans;
                ShowSale;
                DSSaleM.DataSet.Last;
                ShowSaleD;
              Except
                Dtclsdata.RollbackTrans;
                Raise;
              End;
            End;
        End;
    End;
end;

procedure TFrm_SaleManage.ShowSale;
Var
  I:Integer;
  CustColumn:TcxGridDBColumn;
begin
  inherited;
  With DatabaseModule DO
    Begin
      AdoSale.AliasName:='a';
      AdoSale.Close;
      AdoSale.SQL.Clear;
      AdoSale.SQL.Add('Select a.SaleMID,a.DeptID_,a.SaleID,a.SaleNum,a.CustID,a.SCustName,a.SaleMoney,a.FactMoney,a.CancelMoney,');
      AdoSale.SQL.Add('a.Maincost,a.OtherCost,a.Commission,a.Baddebt,a.SaleTax,a.SaleProfit,a.ReceiptType,a.SaleType,a.SaleMemo,a.SaleDate,a.MakeMan,');
      AdoSale.SQL.Add('a.IFCheck,a.CheckMan,a.CheckDate,a.IFFinish,a.IFCancel,a.CancelMan,a.CancelDate,a.CreateBy_,a.CreateD_,a.BelongID,a.UpdateBy_,a.UpdateD_,');
      AdoSale.SQL.Add('b.UserName_ From SaleMaste a,Users_ b Where (a.BelongID=:BelongID');
      if  AdoSale.AccSQL <> '' Then
      begin
        AdoSale.SQL.Add(' OR '+AdoSale.AccSQL);
      END;
      AdoSale.SQL.Add(')');
      AdoSale.SQl.Add(' And a.IFCheck=:IFCheck And  a.BelongID=b.UserID_');
      IF (FDate.Text<>'') And (EDate.Text<>'') Then
        Begin
          AdoSale.SQL.Add(' And a.CreateD_>=:BFDate And a.CreateD_<=:BEDate');
          AdoSale.Parameters.ParamByName('BFDate').Value:=FDate.Text;
          AdoSale.Parameters.ParamByName('BEDate').Value:=EDate.Text;
        End;
      IF RBNotCheck.Checked Then AdoSale.Parameters.ParamByName('IFCheck').Value:=Boolean(0);
      IF RBCheck.Checked Then AdoSale.Parameters.ParamByName('IFCheck').Value:=Boolean(1);

      AdoSale.Parameters.ParamByName('BelongID').Value:=dtclsData.UserID_;
      AdoSale.Open;

    End;

  IF GrdSaleM.ColumnCount<>0 Then Exit;

  FOR I:=0 TO DSSaleM.DataSet.FieldCount - 8 Do
    Begin
      GrdSaleM.CreateColumn;
      GrdSaleM.Columns[I].Name:='SaleMColumns'+IntToStr(I);
   End;
          GrdSaleM.DataController.DataSource:=DSSaleM;
          GrdSaleM.Columns[0].Caption:='客户名称';
          GrdSaleM.Columns[0].DataBinding;
          GrdSaleM.Columns[0].DataBinding.FieldName:='SCustName';
          GrdSaleM.Columns[0].DataBinding.ValueType:='String';
          GrdSaleM.Columns[0].Width:=150;

          GrdSaleM.Columns[1].Caption:='销售单号';
          GrdSaleM.Columns[1].DataBinding;
          GrdSaleM.Columns[1].DataBinding.FieldName:='SaleID';
          GrdSaleM.Columns[1].DataBinding.ValueType:='String';

          GrdSaleM.Columns[2].Caption:='销售日期';
          GrdSaleM.Columns[2].DataBinding;
          GrdSaleM.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdSaleM.Columns[2].DataBinding.ValueType:='Datetiem';

          GrdSaleM.Columns[3].Caption:='票据号';
          GrdSaleM.Columns[3].DataBinding;
          GrdSaleM.Columns[3].DataBinding.FieldName:='SaleNum';
          GrdSaleM.Columns[3].DataBinding.ValueType:='String';

          GrdSaleM.Columns[4].Caption:='销售日期';
          GrdSaleM.Columns[4].DataBinding;
          GrdSaleM.Columns[4].DataBinding.FieldName:='CreateD_';
          GrdSaleM.Columns[4].DataBinding.ValueType:='Datetiem';

          GrdSaleM.Columns[5].Caption:='归属人';
          GrdSaleM.Columns[5].DataBinding;
          GrdSaleM.Columns[5].DataBinding.FieldName:='UserName_';
          GrdSaleM.Columns[5].DataBinding.ValueType:='String';

          GrdSaleM.Columns[6].Caption:='应收金额';
          GrdSaleM.Columns[6].DataBinding;
          GrdSaleM.Columns[6].DataBinding.FieldName:='SaleMoney';
          GrdSaleM.Columns[6].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[7].Caption:='已收金额';
          GrdSaleM.Columns[7].DataBinding;
          GrdSaleM.Columns[7].DataBinding.FieldName:='FactMoney';
          GrdSaleM.Columns[7].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[8].Caption:='受让金额';
          GrdSaleM.Columns[8].DataBinding;
          GrdSaleM.Columns[8].DataBinding.FieldName:='CancelMoney';
          GrdSaleM.Columns[8].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[9].Caption:='直接成本';
          GrdSaleM.Columns[9].DataBinding;
          GrdSaleM.Columns[9].DataBinding.FieldName:='MainCost';
          GrdSaleM.Columns[9].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[10].Caption:='零星成本';
          GrdSaleM.Columns[10].DataBinding;
          GrdSaleM.Columns[10].DataBinding.FieldName:='OtherCost';
          GrdSaleM.Columns[10].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[11].Caption:='佣金';
          GrdSaleM.Columns[11].DataBinding;
          GrdSaleM.Columns[11].DataBinding.FieldName:='Commission';
          GrdSaleM.Columns[11].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[12].Caption:='坏帐';
          GrdSaleM.Columns[12].DataBinding;
          GrdSaleM.Columns[12].DataBinding.FieldName:='Baddebt';
          GrdSaleM.Columns[12].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[13].Caption:='税金';
          GrdSaleM.Columns[13].DataBinding;
          GrdSaleM.Columns[13].DataBinding.FieldName:='SaleTax';
          GrdSaleM.Columns[13].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[14].Caption:='毛利';
          GrdSaleM.Columns[14].DataBinding;
          GrdSaleM.Columns[14].DataBinding.FieldName:='SaleProfit';
          GrdSaleM.Columns[14].DataBinding.ValueType:='Float';

          GrdSaleM.Columns[15].Caption:='单据类别';
          GrdSaleM.Columns[15].DataBinding;
          GrdSaleM.Columns[15].DataBinding.FieldName:='ReceiptType';
          GrdSaleM.Columns[15].DataBinding.ValueType:='String';

          GrdSaleM.Columns[16].Caption:='是否审核';
          GrdSaleM.Columns[16].DataBinding;
          GrdSaleM.Columns[16].DataBinding.FieldName:='IFCheck';
          GrdSaleM.Columns[16].DataBinding.ValueType:='Boolean';
          GrdSaleM.Columns[16].Width:=80;

          GrdSaleM.Columns[17].Caption:='审核人';
          GrdSaleM.Columns[17].DataBinding;
          GrdSaleM.Columns[17].DataBinding.FieldName:='CheckMan';
          GrdSaleM.Columns[17].DataBinding.ValueType:='String';

          GrdSaleM.Columns[18].Caption:='审核日期';
          GrdSaleM.Columns[18].DataBinding;
          GrdSaleM.Columns[18].DataBinding.FieldName:='CheckDate';
          GrdSaleM.Columns[18].DataBinding.ValueType:='Datetiem';

          GrdSaleM.Columns[19].Caption:='制单人';
          GrdSaleM.Columns[19].DataBinding;
          GrdSaleM.Columns[19].DataBinding.FieldName:='CreateBy_';
          GrdSaleM.Columns[19].DataBinding.ValueType:='String';

          GrdSaleM.Columns[20].Caption:='制单日期';
          GrdSaleM.Columns[20].DataBinding;
          GrdSaleM.Columns[20].DataBinding.FieldName:='CreateD_';
          GrdSaleM.Columns[20].DataBinding.ValueType:='Datetiem';

          GrdSaleM.Columns[21].Caption:='修改人';
          GrdSaleM.Columns[21].DataBinding;
          GrdSaleM.Columns[21].DataBinding.FieldName:='UpdateBy_';
          GrdSaleM.Columns[21].DataBinding.ValueType:='String';

          GrdSaleM.Columns[22].Caption:='修改日期';
          GrdSaleM.Columns[22].DataBinding;
          GrdSaleM.Columns[22].DataBinding.FieldName:='UpdateD_';
          GrdSaleM.Columns[22].DataBinding.ValueType:='Datetiem';

          GrdSaleM.Columns[23].Caption:='销售日期';
          GrdSaleM.Columns[23].DataBinding;
          GrdSaleM.Columns[23].DataBinding.FieldName:='SaleDate';
          GrdSaleM.Columns[23].DataBinding.ValueType:='Datetiem';

          GrdSaleM.Columns[24].Caption:='制单人';
          GrdSaleM.Columns[24].DataBinding;
          GrdSaleM.Columns[24].DataBinding.FieldName:='MakeMan';
          GrdSaleM.Columns[24].DataBinding.ValueType:='String';

          GrdSaleM.Columns[25].Caption:='备注';
          GrdSaleM.Columns[25].DataBinding;
          GrdSaleM.Columns[25].DataBinding.FieldName:='SaleMemo';
          GrdSaleM.Columns[25].DataBinding.ValueType:='String';



   FOR I:=6 TO 14 Do
     Begin
       with TcxGridDBTableSummaryItem(
         GrdSaleM.DataController.Summary.FooterSummaryItems.Add) do
         begin
           CustColumn:=GrdSaleM.Columns[I];
           CustColumn.DataBinding.FieldName :=
           GrdSaleM.DataController.DataSet.Fields[I].FieldName;
           Column  :=  CustColumn;
           DisplayText:='销售总额';
           FieldName :=  CustColumn.DataBinding.FieldName;
           //Format  :=  '#,##0.00';
           Kind  :=  skSum;
         end;
     End;
     
end;

procedure TFrm_SaleManage.GrdSaleMCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ShowSaleD;
end;

procedure TFrm_SaleManage.N5Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
    Begin
      IF AdoSale.IsEmpty Then Exit;
      IF (Not Self.Access.RCheck) Then
        Begin
          Application.MessageBox('你没有审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
      AdoSale.Check(DSSaleM.DataSet.FieldByname('SaleMID').AsInteger,'SaleMID');
     { DSSaleM.Edit;
      DSSaleM.DataSet.FieldByName('IFCheck').AsBoolean:=Boolean(1);
      DSSaleM.DataSet.FieldByName('CheckMan').AsString:=DtclsData.UserName_;
      DSSaleM.DataSet.FieldByName('CheckDate').AsDateTime:=Date;
      DSSaleM.DataSet.Post; }
    End;
end;

procedure TFrm_SaleManage.N6Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
    Begin
      IF AdoSale.IsEmpty Then Exit
      Else
        Begin
          IF AdoSale.FieldByName('IFFInish').AsBoolean=Boolean(1) Then Application.MessageBox('该单已完成付款,不能反审核','提示',MB_OK+MB_Iconwarning)
          Else
            Begin
              //AdoSale.Edit;
              //AdoSale.FieldByName('IFCheck').AsBoolean:=Boolean(0);
              //AdoSale.Post;
              IF AdoSale.IsEmpty Then Exit;
            IF (Not Self.Access.RUnCheck) Then
              Begin
                Application.MessageBox('你没有反审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
                Exit;
              End;
              AdoSale.UnCheck(DSSaleM.DataSet.FieldByname('SaleMID').AsInteger,'SaleMID');
            End;
        End;
    End;
end;

procedure TFrm_SaleManage.GrdSaleMCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF DSSaleM.DataSet.IsEmpty Then Exit;
  Frm_SaleMake:=TFrm_SaleMake.Create(Self);
  Frm_SaleMake.LISEdit:=True;
  Frm_SaleMake.BtnSure.Enabled:=False;
  Frm_SaleMake.ShowModal;
end;

procedure TFrm_SaleManage.FormShow(Sender: TObject);
begin
  inherited;
  GrdSaleM.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'ini\Sale.ini');
  GrdSaleD.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'ini\SaleList.ini');
  Self.LoadReport(PopupMenu1);
  Self.AddReportdataSet(DataBaseModule.AdoSale);
  Self.AddReportdataSet(DataBaseModule.AdoSaleList);
end;

procedure TFrm_SaleManage.RBNotCheckClick(Sender: TObject);
begin
  inherited;
  ShowSale;
  ShowSaleD;
end;

procedure TFrm_SaleManage.RBCheckClick(Sender: TObject);
begin
  inherited;
  ShowSale;
  ShowSaleD;
end;

procedure TFrm_SaleManage.cxButton1Click(Sender: TObject);
begin
  inherited;
  ShowSale;
end;

procedure TFrm_SaleManage.N8Click(Sender: TObject);
begin
  inherited;
  IF SaveDlg.Execute Then
    ExportGridToExcel(SaveDlg.FileName ,CXGrid1);
end;

procedure TFrm_SaleManage.N9Click(Sender: TObject);
begin
  inherited;
  ShowSale;
end;

procedure TFrm_SaleManage.GrdSaleMColumnSizeChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
  GrdSaleM.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\Sale.ini');
end;

procedure TFrm_SaleManage.GrdSaleMCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  GrdSaleM.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\Sale.ini');
end;

procedure TFrm_SaleManage.GrdSaleDColumnSizeChanged(
  Sender: TcxGridTableView; AColumn: TcxGridColumn);
begin
  inherited;
  GrdSaleD.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\SaleList.ini');
end;

end.
