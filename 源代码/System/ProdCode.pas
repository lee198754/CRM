unit ProdCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, dxtree, dxdbtree, ADODB,
  bainaADOQuery, Menus, cxLookAndFeelPainters, cxLabel, cxContainer,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxGridExportLink, cxSplitter;

type
  TFrm_ProdCode = class(TBaseData_Frm)
    GrdProd: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    AdoProdtype: TbainaADOQuery;
    DSProdCode: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    BtnSure: TcxButton;
    EdtType: TcxTextEdit;
    cxLabel1: TcxLabel;
    BtnExit: TcxButton;
    Query: TbainaADOQuery;
    DSProd: TDataSource;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    dlgSave1: TSaveDialog;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    TVProdType: TdxDBTreeView;
    Panel3: TPanel;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure GrdProdCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure GrdProdColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure TVProdTypeClick(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowProduct;
  public
    { Public declarations }
  end;

var
  Frm_ProdCode: TFrm_ProdCode;

implementation

uses DataBase, PublicClass, NewProd;

{$R *.dfm}

var
  Hasprice:Boolean ;

procedure TFrm_ProdCode.FormCreate(Sender: TObject);
begin
  inherited;

  AdoProdType.Close;
  AdoProdType.SQL.Clear;
  AdoProdType.SQL.Add('Select DeptID_,ParentID,ProdSelfID,ProdType,CreateD_,CreateBY_,BelongID,UpdateD_,UPdateBY_ From ProductType order by parentid');
  AdoProdType.Prepared;
  AdoProdType.Open;

  {TVProdType.ParentField:='ParentID';
  TVProdType.KeyField:='ProdSelfID';
  TVProdType.ListField:='ProdType'; }



  {With DatabaseModule Do
    Begin
          AdoProd.Close;
          AdoProd.SQL.Clear;
          AdoProd.SQL.Add('Select ProdNum,ProdName,ProdType,ProdSelfID,ProdSpec,ProdUnit,Price,Prodoutprice,ProdCount,ProdMemo,ProdImage,BelongID,DeptID_,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoProd.SQL.Add(' From Product Where ProdSelfID=:ProdSelfID Order by ProdName');
          AdoProd.Parameters.ParamByName('ProdSelfID').Value:=AdoProdType.fieldByName('ProdSelfID').AsInteger;
          AdoProd.Prepared;
          AdoProd.Open;
    End;}

end;

procedure TFrm_ProdCode.N1Click(Sender: TObject);
begin
  inherited;
  ISAdd:=True;
  Panel1.Visible:=True;
  TVProdType.Enabled:=False;
  CXGrid1.Enabled:=False;
  EdtType.Text:='';
  EdtType.SetFocus;
end;

procedure TFrm_ProdCode.N2Click(Sender: TObject);
begin
  inherited;
  IF TvProdType.Selected=Nil Then Exit;
  ISEdit:=True;
  Panel1.Visible:=True;
  TVProdType.Enabled:=False;
  CXGrid1.Enabled:=False;
  EdtType.Text:= AdoProdType.FieldByname('ProdType').AsString;
  EdtType.SetFocus;
end;

procedure TFrm_ProdCode.N3Click(Sender: TObject);
begin
  inherited;
  IF TVprodType.Selected=Nil Then Exit;
  IF TVProdType.Selected.HasChildren Then
    Begin
      Application.MessageBox('该分类下在子分类存在,不能删除','系统提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from Product Where ProdSelfID=:ProdSelfID');
      Query.Parameters.ParamByName('ProdSelfID').Value:=AdoProdType.FieldByName('ProdSelfID').AsString;
      Query.Prepared;
      Query.Open;

      IF Query.IsEmpty Then
        Begin
          AdoProdType.Delete;
          AdoProdType.Refresh;
        End
      Else
        Begin
          Application.MessageBox('该分类下有商品存在,不能删除.','警告',MB_OK+MB_IconWarning);
        End;
end;

procedure TFrm_ProdCode.BtnSureClick(Sender: TObject);
Var
  ParentID,SelfID:String;
  RecCount:Integer;
begin
  inherited;
  IF TVProdType.Items=Nil Then
    Begin
      AdoProdType.Append;
      AdoProdType.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
      AdoProdType.FieldByName('ParentID').AsString:='1';
      AdoProdType.FieldByName('ProdSelfID').AsString:='11';
      AdoProdType.FieldByName('ProdType').AsString:=EdtType.Text;
      AdoProdType.FieldByName('CreateD_').AsDateTime:=Date;
      AdoProdType.FieldByName('CreateBy_').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoProdType.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoProdType.Post;
      AdoProdType.Refresh;
      BtnExit.Click;
    End;
  ParentID:=AdoProdType.FieldByname('ProdSelfID').AsString;
  SelfID:=AdoProdType.FieldByname('ProdSelfID').AsString;
  IF Length(SelfID)=17 then
    Begin
      Application.MessageBox('分类不能超过5层','系统提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF ISAdd=True Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select Count(ParentID) As CP from ProductType Where ParentID=:ParentID');
      Query.Parameters.ParamByName('ParentID').Value:=ParentID;
      Query.Prepared;
      Query.Open;
      IF Query.FieldByName('CP').AsFloat=0 then Selfid:=SelfID+'001'
      Else
        Begin
          IF Query.FieldByName('CP').AsFloat=999 then
            Begin
              Application.MessageBox('分类项不能超过999个','系统提示',MB_OK+MB_Iconwarning);
              Exit;
            End
          else
            Begin
              RecCount:=Query.FieldByName('CP').AsInteger+1;
              case Length(IntToStr(RecCount)) OF
                1:SelfID:=SelfID+'00'+IntToStr(RecCount);
                2:SelfID:=SelfID+'0'+IntToStr(RecCount);
                3:SelfID:=SelfID+IntToStr(RecCount);
              end;
            End;
        End;
      Query.Close;

      AdoProdType.Append;
      AdoProdType.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
      AdoProdType.FieldByName('ParentID').AsString:=ParentID;
      AdoProdType.FieldByName('ProdSelfID').AsString:=SelfID;
      AdoProdType.FieldByName('ProdType').AsString:=EdtType.Text;
      AdoProdType.FieldByName('CreateD_').AsDateTime:=Date;
      AdoProdType.FieldByName('CreateBy_').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoProdType.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoProdType.Post;
    End;
  IF ISEdit=True Then
    Begin
      AdoProdType.Edit;
      AdoProdType.FieldByName('ProdType').AsString:=EdtType.Text;
      AdoProdType.FieldByName('UpdateD_').AsDateTime:=Date;
      AdoProdType.FieldByName('UpdateBy_').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoProdType.Post;

      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('update product set prodtype=:ProdType where prodselfid=:ProdSelfid');
      Query.SQL.Add('update saledetail set prodtype=:SProdtype where Prodselfid=:Sprodselfid');
      Query.Parameters.ParamByName('Prodtype').Value:=EdtType.Text;
      Query.Parameters.ParamByName('Sprodtype').Value:=EdtType.Text;
      Query.Parameters.ParamByName('ProdSelfid').Value:=SelfID;
      Query.Parameters.ParamByName('SProdselfid').Value:=SelfID;
      Query.Prepared;
      Query.ExecSQL;
    End;

  AdoProdType.Refresh;
  BtnExit.Click;
end;

procedure TFrm_ProdCode.BtnExitClick(Sender: TObject);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  Panel1.Visible:=False;
  TVProdType.Enabled:=True;
  CXGrid1.Enabled:=True;
end;

procedure TFrm_ProdCode.N4Click(Sender: TObject);
begin
  inherited;
  IF (Not Self.Access.RAdd) Then
    Begin
      Application.MessageBox('你没有新增权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF (TVProdType.Selected<>Nil) Then
    Begin
      ISAdd:=True;
      ISEdit:=False;
      Frm_Newcode:=TFrm_Newcode.Create(Self);
      Frm_NewCode.ShowModal;
    End
  Else Application.MessageBox('你没有新增权限或没有选择商品类别','提示',MB_OK+MB_Iconwarning);  
end;

procedure TFrm_ProdCode.N5Click(Sender: TObject);
begin
  inherited;
  IF DSProd.DataSet.IsEmpty Then Exit;
  IF (DatabaseModule.AdoProd.ModifyAcc(DSProd.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.REdit) Then
    Begin
      Application.MessageBox('你没有修改此资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;

  ISAdd:=False;
  ISEdit:=True;
  Frm_Newcode:=TFrm_Newcode.Create(Self);
  Frm_NewCode.ShowModal
end;

procedure TFrm_ProdCode.N6Click(Sender: TObject);
begin
  inherited;
  IF (DatabaseModule.AdoProd.DeleteAcc(DSProd.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.RDelete) Then
    Begin
      Application.MessageBox('你没有删除该资料的权限','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF DSProd.DataSet.IsEmpty Then Exit;
  IF Application.MessageBox('确认要删除该商品代码吗?','提示',MB_YESNO+MB_Iconwarning)=IDNO Then Exit
  Else DSProd.DataSet.Delete;
end;

procedure TFrm_ProdCode.N8Click(Sender: TObject);
begin
  inherited;
  if dlgSave1.Execute then
  ExportGridToExcel(dlgSave1.FileName ,cxGrid1);
end;

procedure TFrm_ProdCode.GrdProdCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF DSProd.DataSet.IsEmpty Then Exit;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=True;
  Frm_Newcode:=TFrm_Newcode.Create(Self);
  Frm_NewCode.ShowModal
end;

procedure TFrm_ProdCode.ShowProduct;
var
  I:Integer;
  
begin
  
  IF DatabaseModule.AdoProd.State=DSBrowse Then
    Begin
      
      IF GrdProd.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
      GrdProd.OptionsView.ScrollBars:=SSNone;
      FOR I:=0 TO DataBaseModule.AdoProd.FieldCount - 11 Do
        Begin
          GrdProd.CreateColumn;
          GrdProd.Columns[I].Name:='FileColumns'+IntToStr(I);
        End;
          GrdProd.DataController.DataSource:=DSProd;
          GrdProd.Columns[0].Caption:='产品编码';
          GrdProd.Columns[0].DataBinding;
          GrdProd.Columns[0].DataBinding.FieldName:='ProdNum';
          GrdProd.Columns[0].DataBinding.ValueType:='String';

          GrdProd.Columns[1].Caption:='产品名称';
          GrdProd.Columns[1].DataBinding;
          GrdProd.Columns[1].DataBinding.FieldName:='ProdName';
          GrdProd.Columns[1].DataBinding.ValueType:='String';
          GrdProd.Columns[1].Width:=150;

          GrdProd.Columns[2].Caption:='产品类型';
          GrdProd.Columns[2].DataBinding;
          GrdProd.Columns[2].DataBinding.FieldName:='ProdType';
          GrdProd.Columns[2].DataBinding.ValueType:='String';

          GrdProd.Columns[3].Caption:='产品规格';
          GrdProd.Columns[3].DataBinding;
          GrdProd.Columns[3].DataBinding.FieldName:='ProdSpec';
          GrdProd.Columns[3].DataBinding.ValueType:='String';

          GrdProd.Columns[4].Caption:='进货价';
          IF HasPrice Then
            Begin

              GrdProd.Columns[4].DataBinding;
              GrdProd.Columns[4].DataBinding.FieldName:='Price';
              GrdProd.Columns[4].DataBinding.ValueType:='Float';
            End;

          GrdProd.Columns[5].Caption:='销售价';
          GrdProd.Columns[5].DataBinding;
          GrdProd.Columns[5].DataBinding.FieldName:='ProdOutPrice';
          GrdProd.Columns[5].DataBinding.ValueType:='Float';

          GrdProd.Columns[6].Caption:='数量';
          GrdProd.Columns[6].DataBinding;
          GrdProd.Columns[6].DataBinding.FieldName:='ProdCount';
          GrdProd.Columns[6].DataBinding.ValueType:='Float';

       GrdProd.OptionsView.ScrollBars:=SSBoth; 
    End;
  GrdProd.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'ini\ProdCode.ini');
end;

procedure TFrm_ProdCode.cxButton1Click(Sender: TObject);
begin
  inherited;
  HasPrice:=Self.Access.REdit;
  With DatabaseModule Do
    Begin
          AdoProd.Close;
          AdoProd.SQL.Clear;
          AdoProd.SQL.Add('Select ProdNum,ProdName,ProdType,ProdSelfID,ProdSpec,ProdUnit,Price,Prodoutprice,ProdCount,ProdMemo,ProdImage,BelongID,DeptID_,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoProd.SQL.Add(' From Product');
          AdoProd.Prepared;
          AdoProd.Open;
    End;
  ShowProduct;
end;

procedure TFrm_ProdCode.GrdProdColumnSizeChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  GrdProd.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\Prodcode.ini');
end;

procedure TFrm_ProdCode.TVProdTypeClick(Sender: TObject);
begin
  inherited;
   HasPrice:=Self.Access.REdit;
   With DatabaseModule Do
    Begin
          AdoProd.Close;
          AdoProd.SQL.Clear;
          AdoProd.SQL.Add('Select ProdNum,ProdName,ProdType,ProdSelfID,ProdSpec,ProdUnit,Price,Prodoutprice,ProdCount,ProdMemo,ProdImage,BelongID,DeptID_,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoProd.SQL.Add(' From Product Where ProdSelfID=:ProdSelfID Order by ProdName');
          AdoProd.Parameters.ParamByName('ProdSelfID').Value:=AdoProdType.fieldByName('ProdSelfID').AsString;
          AdoProd.Prepared;
          AdoProd.Open;
    End;
  ShowProduct;
end;

end.
