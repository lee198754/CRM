unit ProdCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  ComCtrls, dxtree, dxdbtree, StdCtrls, cxButtons, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ADODB, cxSplitter,
  WinSkinData, Buttons, Jpeg, Mask, DBCtrls, Inifiles;

type
  TFrm_Product = class(TForm)
    cxSplitter1: TcxSplitter;
    AdoQuery: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOConnection2: TADOConnection;
    LAdoProd: TADOQuery;
    DSQuery: TDataSource;
    dlgSave1: TSaveDialog;
    Panel2: TPanel;
    Panel3: TPanel;
    TVProdType: TdxDBTreeView;
    LAdoType: TADOQuery;
    LDSType: TDataSource;
    LDSProd: TDataSource;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    GrdProd: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    PB: TProgressBar;
    AdoType: TADOQuery;
    StatusBar1: TStatusBar;
    SkinData1: TSkinData;
    SpeedButton2: TSpeedButton;
    Panel5: TPanel;
    Image1: TImage;
    Panel6: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    Label8: TLabel;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    cxSplitter2: TcxSplitter;
    procedure TVProdTypeChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure GrdProdCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure GrdProdCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure GrdProdColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
    Procedure ShowProduct;
    Procedure RefreshTree;
    Function UncrypKey(Src:String; Key:String):string;
  public
    { Public declarations }
  end;

var
  Frm_Product: TFrm_Product;

implementation

{$R *.dfm}

procedure TFrm_Product.TVProdTypeChange(Sender: TObject; Node: TTreeNode);
begin
  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('Select ProdNum,ProdName,ProdType,ProdSelfID,ProdSpec,ProdUnit,Price,Prodoutprice,ProdCount,ProdMemo,ProdImage,BelongID,DeptID_,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
  LAdoProd.SQL.Add(' From Product Where ProdSelfID=:ProdSelfID Order by ProdName');
  LAdoProd.Parameters.ParamByName('ProdSelfID').Value:=LAdoType.fieldByName('ProdSelfID').AsString;
  LAdoProd.Prepared;
  LAdoProd.Open;
  ShowProduct;
  
end;

procedure TFrm_Product.FormCreate(Sender: TObject);
Var
  ConnectStr:String;
begin
  ConnectStr:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ExtractFilePath(Paramstr(0))+'ProdData\ProdData.mdb;Persist Security Info=False';
  AdoConnection2.ConnectionString:=ConnectStr;
  RefreshTree;
end;

procedure TFrm_Product.ShowProduct;
var
  I:Integer;
begin
  IF LAdoProd.State=DSBrowse Then
    Begin
      
      IF GrdProd.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
      GrdProd.OptionsView.ScrollBars:=SSNone;
      FOR I:=0 TO LAdoProd.FieldCount - 12 Do
        Begin
          GrdProd.CreateColumn;
          GrdProd.Columns[I].Name:='FileColumns'+IntToStr(I);
        End;
          GrdProd.DataController.DataSource:=LDSProd;
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

          GrdProd.Columns[4].Caption:='销售价';
          GrdProd.Columns[4].DataBinding;
          GrdProd.Columns[4].DataBinding.FieldName:='ProdOutPrice';
          GrdProd.Columns[4].DataBinding.ValueType:='Float';

          GrdProd.Columns[5].Caption:='数量';
          GrdProd.Columns[5].DataBinding;
          GrdProd.Columns[5].DataBinding.FieldName:='ProdCount';
          GrdProd.Columns[5].DataBinding.ValueType:='Float';

       GrdProd.OptionsView.ScrollBars:=SSBoth; 
    End;

end;

procedure TFrm_Product.RefreshTree;
begin
  LAdoType.Close;
  LAdoType.SQL.Clear;
  LAdoType.SQL.Add('Select DeptID_,ParentID,ProdSelfID,ProdType,CreateD_,CreateBY_,BelongID,UpdateD_,UPdateBY_ From ProductType Order by Parentid');
  LAdoType.Prepared;
  LAdoType.Open;

  TVProdType.ParentField:='ParentID';
  TVProdType.KeyField:='ProdSelfID';
  TVProdType.ListField:='ProdType';
end;

procedure TFrm_Product.SpeedButton1Click(Sender: TObject);
var
  inifile:TIniFile;
  msql:String;
  SQLText,TempPath:String;
  I:Integer;
begin
  {TempPath:=ExtractFilePath(Application.ExeName)+'ProdData.mdb';
  SQLText:='Insert Into OPENROWSET('+'''Microsoft.Jet.OLEDB.4.0'''+','+''''+TempPath+''''+';'+'''admin'''+';'+''''+''''+','+' Product) '+
           'select * FROM Product';;
  showmessage(sqltext);}
  inifile := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Dataset.ini');
  if AdoConnection1.Connected Then AdoConnection1.Close;
  try
    AdoConnection1.ConnectionString := UncrypKey(inifile.ReadString('DataSet','ConnectionString',''),'Tushiqi');
    AdoConnection1.Connected:=True;
  Except
    Application.MessageBox('无法连接到服务器,请检查网络是否连通,服务器是否开启.','提示',MB_OK+MB_Iconwarning);
    Exit;
  end;
  Panel4.Visible:=True;
  AdoType.Close;
  AdoType.SQL.Clear;
  AdoType.SQL.Add('Select * from ProductType');
  AdoType.Prepared;
  AdoType.Open;

  AdoQuery.Close;
  AdoQuery.SQL.Clear;
  AdoQuery.SQL.Add('Select * from Product');
  AdoQuery.Prepared;
  AdoQuery.Open;

  PB.Max:=AdoQuery.RecordCount+AdoType.RecordCount;

  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('Delete From Product');
  LAdoProd.Prepared;
  LAdoProd.ExecSQL;

  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('Select * from Product');
  LAdoProd.Prepared;
  LAdoProd.Open;

  AdoQuery.First;
  FOR I:=1 TO Adoquery.RecordCount DO
    Begin
      LAdoProd.Append;
      LAdoProd.FieldByName('ProdID').AsInteger:=AdoQuery.FieldByName('ProdID').AsInteger;
      LAdoProd.FieldByName('DeptID_').AsInteger:=AdoQuery.FieldByName('DeptID_').AsInteger;
      LAdoProd.FieldByName('ProdSelfID').AsString:=AdoQuery.FieldByName('ProdSelfID').AsString;
      LAdoProd.FieldByName('ProdType').AsString:=AdoQuery.FieldByName('ProdType').AsString;
      LAdoProd.FieldByName('ProdNum').AsString:=AdoQuery.FieldByName('ProdNum').AsString;
      LAdoProd.FieldByName('ProdName').AsString:=AdoQuery.FieldByName('ProdName').AsString;
      LAdoProd.FieldByName('ProdSpec').AsString:=AdoQuery.FieldByName('ProdSpec').AsString;
      LAdoProd.FieldByName('ProdUnit').AsString:=AdoQuery.FieldByName('ProdUnit').AsString;
      LAdoProd.FieldByName('Prodoutprice').AsFloat:=AdoQuery.FieldByName('Prodoutprice').AsFloat;
      LAdoProd.FieldByName('ProdCount').AsFloat:=AdoQuery.FieldByName('ProdCount').AsFloat;
      LAdoProd.FieldByName('ProdMemo').AsString:=AdoQuery.FieldByName('ProdMemo').AsString;
      LAdoProd.FieldByName('CreateBy_').AsInteger:=AdoQuery.FieldByName('CreateBy_').AsInteger;
      LAdoProd.FieldByName('CreateD_').AsDateTime:=AdoQuery.FieldByName('CreateD_').AsDateTime;
      LAdoProd.FieldByName('BelongID').AsInteger:=AdoQuery.FieldByName('BelongID').AsInteger;
      LAdoProd.FieldByName('UpdateBy_').AsInteger:=AdoQuery.FieldByName('UpdateBy_').AsInteger;
      LAdoProd.FieldByName('UpdateD_').AsDateTime:=AdoQuery.FieldByName('UpdateD_').AsDateTime;
      LAdoProd.FieldByName('ProdImage').AsVariant:=AdoQuery.FieldByName('ProdImage').AsVariant;
      LAdoProd.Post;
      AdoQuery.Next;
      PB.Position:=PB.Position+1;
    End;



  LAdoType.Close;
  LAdoType.SQL.Clear;
  LAdoType.SQL.Add('Delete From ProductType');
  LAdoType.Prepared;
  LAdoType.ExecSQL;

  LAdoType.Close;
  LAdoType.SQL.Clear;
  LAdoType.SQL.Add('Select * from ProductType');
  LAdoType.Prepared;
  LAdoType.Open;

  AdoQuery.First;
  FOR I:=1 TO AdoType.RecordCount DO
    Begin
      LAdoType.Append;
      LAdoType.FieldByName('ProdTyeID').AsInteger:=AdoType.FieldByName('ProdTyeID').AsInteger;
      LAdoType.FieldByName('DeptID_').AsInteger:=AdoType.FieldByName('DeptID_').AsInteger;
      LAdoType.FieldByName('ProdSelfID').AsString:=AdoType.FieldByName('ProdSelfID').AsString;
      LAdoType.FieldByName('ParentID').AsString:=AdoType.FieldByName('ParentID').AsString;
      LAdoType.FieldByName('ProdType').AsString:=AdoType.FieldByName('ProdType').AsString;
      LAdoType.FieldByName('CreateBy_').AsInteger:=AdoType.FieldByName('CreateBy_').AsInteger;
      LAdoType.FieldByName('CreateD_').AsDateTime:=AdoType.FieldByName('CreateD_').AsDateTime;
      LAdoType.FieldByName('BelongID').AsInteger:=AdoType.FieldByName('BelongID').AsInteger;
      LAdoType.FieldByName('UpdateBy_').AsInteger:=AdoType.FieldByName('UpdateBy_').AsInteger;
      LAdoType.FieldByName('UpdateD_').AsDateTime:=AdoType.FieldByName('UpdateD_').AsDateTime;
      LAdoType.Post;
      AdoType.Next;
      PB.Position:=PB.Position+1
    End;
  Panel4.Visible:=False;
  PB.Position:=0;  
  Application.MessageBox('数据库更新完成','提示',MB_OK+MB_Iconinformation);


  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('Select * from Product');
  LAdoProd.Prepared;
  LAdoProd.Open;
  RefreshTree;
end;

procedure TFrm_Product.SpeedButton2Click(Sender: TObject);
begin
  LAdoProd.Close;
  LAdoProd.SQL.Clear;
  LAdoProd.SQL.Add('Select ProdNum,ProdName,ProdType,ProdSelfID,ProdSpec,ProdUnit,Price,Prodoutprice,ProdCount,ProdMemo,ProdImage,BelongID,DeptID_,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
  LAdoProd.SQL.Add(' From Product');
  LAdoProd.Prepared;
  LAdoProd.Open;
  ShowProduct;
end;

procedure TFrm_Product.GrdProdCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
var
  TempStream:TMemoryStream;
  TempImage:TJpegImage;
begin
  IF Not LAdoProd.FieldByName('ProdImage').IsNull Then
        Begin
          TempStream:=TMemoryStream.Create;
          TempImage:=TJpegImage.Create;

          TBlobField(LAdoProd.FieldByName('ProdImage')).SaveToStream(tempstream);
          TempStream.Position:=0;
          TempImage.LoadFromStream(TempStream);
          Image1.Picture.Graphic:=TempImage;
          TempStream.Free;
          TempImage.Free;
        End;
end;


procedure TFrm_Product.GrdProdCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  GrdProd.StoreToIniFile(ExtractFilePath(Application.ExeName)+'Product.ini');
end;

procedure TFrm_Product.GrdProdColumnSizeChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  GrdProd.StoreToIniFile(ExtractFilePath(Application.ExeName)+'Product.ini');
end;

procedure TFrm_Product.FormShow(Sender: TObject);
begin
  GrdProd.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'Product.ini');
end;

Function TFrm_Product.UncrypKey(Src:String; Key:String):string;
var
  idx   :integer;   
  KeyLen   :Integer;   
  KeyPos   :Integer;   
  offset   :Integer;   
  dest   :string;   
  SrcPos   :Integer;   
  SrcAsc   :Integer;   
  TmpSrcAsc   :Integer;   
  Range   :Integer;   

begin
  if Src = '' Then 
  Begin
    Result := '';
    Exit;
  End;
  KeyLen:=Length(Key);   
  if   KeyLen   =   0   then   key:='Think   Space';   
  KeyPos:=0;   
  SrcPos:=0;   
  SrcAsc:=0;   
  Range:=256;   
  offset:=StrToInt('$'+   copy(src,1,2));   
  SrcPos:=3;   
  repeat   
  SrcAsc:=StrToInt('$'+   copy(src,SrcPos,2));   
  if   KeyPos   <   KeyLen   Then   KeyPos   :=   KeyPos   +   1   else   KeyPos   :=   1;   
  TmpSrcAsc   :=   SrcAsc   xor   Ord(Key[KeyPos]);   
  if   TmpSrcAsc   <=   offset   then   
  TmpSrcAsc   :=   255   +   TmpSrcAsc   -   offset   
  else   
  TmpSrcAsc   :=   TmpSrcAsc   -   offset;   
  dest   :=   dest   +   chr(TmpSrcAsc);   
  offset:=srcAsc;   
  SrcPos:=SrcPos   +   2;   
  until   SrcPos   >=   Length(Src);   
  Result:=Dest;   
end;

end.
