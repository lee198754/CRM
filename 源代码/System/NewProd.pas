unit NewProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxControls, cxContainer, cxEdit, cxLabel,
  cxMemo, cxMaskEdit, cxButtonEdit, cxTextEdit, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, DB, ADODB, bainaADOQuery,
  ExtCtrls, ExtDlgs, Jpeg;

type
  TFrm_NewCode = class(TBaseData_Frm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    EdtCode: TcxTextEdit;
    EdtUnit: TcxButtonEdit;
    cxLabel9: TcxLabel;
    EdtType: TcxTextEdit;
    Edtcount: TcxTextEdit;
    EdtPrice: TcxTextEdit;
    EdtSalePrice: TcxTextEdit;
    EdtMemo: TcxMemo;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    Query: TbainaADOQuery;
    EdtName: TcxButtonEdit;
    LAdoProd: TbainaADOQuery;
    LDSProd: TDataSource;
    EdtSpec: TcxButtonEdit;
    LAdoSpec: TbainaADOQuery;
    LDSSpec: TDataSource;
    Panel1: TPanel;
    Image1: TImage;
    cxLabel10: TcxLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure EdtUnitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure EdtcountPropertiesChange(Sender: TObject);
    procedure EdtPricePropertiesChange(Sender: TObject);
    procedure EdtSalePricePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdtSpecClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure ClearEdt;
    Procedure VerifyNumeric(Edt:TcxTextEdit);
  public
    { Public declarations }
  end;

var
  Frm_NewCode: TFrm_NewCode;

implementation

uses DataBase, Dict, ProdCode, PublicClass, Search, Dictother;

{$R *.dfm}

procedure TFrm_NewCode.EdtUnitClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:='单位';
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:='单位';
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:='ProdUnit';
  Frm_Dictother.DictDuty:='单位';
  Frm_Dictother.DictIFCust:=0;
  Frm_Dictother.FrmName:='Frm_NewCode';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_NewCode.BtnSureClick(Sender: TObject);
Var
  IMGStream:TMemoryStream;
  ISImage:Boolean;
begin
  inherited;

  IF (EdtCode.Text='') OR (EdtName.Text='') OR (EdtUnit.Text='') OR (EdtSalePrice.Text='') Then
    Begin
      Application.MessageBox('产品编码、产品名称、产品售价和产品单位不能为空','提示',MB_OK+MB_IconWarning);
      Exit;
    End;
    IF Not (Image1.Picture.Graphic=Nil) Then
      Begin
        IMGStream:=TMemoryStream.Create;
        image1.Picture.Graphic.SaveToStream(IMGStream);
        IMGStream.Position:=0;
        ISImage:=True;
      End
    Else ISImage:=False;
      IF ISAdd=True Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('select ProdNum,ProdName From Product Where ProdNum=:prodNum');//OR ProdName=:ProdName');
          Query.Parameters.ParamByName('ProdNum').Value:=EdtCode.Text;
          //Query.Parameters.ParamByName('ProdName').Value:=EdtName.Text;
          Query.Prepared;
          Query.Open;
          IF Query.IsEmpty Then
          Begin
            With DatabaseModule DO
              Begin
                Dtclsdata.BeginTrans;
                Try
                  AdoProd.Append;
                  AdoProd.FieldByName('DeptID_').AsInteger:=Dtclsdata.DeptID_;
                  AdoProd.FieldByName('ProdNum').AsString:=EdtCode.Text;
                  AdoProd.FieldByName('ProdName').AsString:=EdtName.Text;
                  AdoProd.FieldByName('ProdType').AsString:=EdtType.Text;
                  AdoProd.FieldByName('ProdSpec').AsString:=EdtSpec.Text;
                  AdoProd.FieldByName('ProdUnit').AsString:=EdtUnit.Text;
                  IF EdtCount.Text='' Then AdoProd.FieldByName('ProdCount').AsFloat:=0
                  Else AdoProd.FieldByName('ProdCount').AsFloat:=StrToFloat(EdtCount.Text);
                  IF EdtPrice.Text='' Then AdoProd.FieldByName('Price').AsFloat:=0
                  Else AdoProd.FieldByName('Price').AsFloat:=StrToFloat(EdtPrice.Text);
                  AdoProd.FieldByName('ProdOutPrice').AsFloat:=StrToFloat(EdtSaleprice.Text);
                  AdoProd.FieldByName('Prodmemo').AsString:=EdtMemo.Text;
                  IF ISImage=True Then
                    TBlobfield(AdoProd.FieldByName('ProdImage')).LoadFromStream(IMGStream);
                  //TBlobField(AdoProd.FieldByName('ProdImage')).Assign(image1.Picture.Graphic);
                  AdoProd.FieldByName('ProdSelfID').AsString:=Frm_ProdCode.AdoProdType.fieldByName('ProdSelfID').AsString;
                  AdoProd.FieldByName('BelongID').AsInteger:=Dtclsdata.UserID_;
                  AdoProd.FieldByName('CreateD_').AsDateTime:=Date;
                  AdoProd.FieldByName('CreateBY_').AsInteger:=Dtclsdata.UserID_;
                  AdoProd.Post;
                  DtclsData.CommitTrans;
                  IMGStream.Free;
                  ClearEdt;
                Except
                  DtclsData.RollbackTrans;
                  IMGStream.Free;
                  Raise;
                End;
              End;
          End
          Else Application.MessageBox('产品编号重复','提示',MB_OK+MB_IconWarning);
        End;
      IF ISEdit=True Then
        Begin
          {IF (EdtName.Text=DatabaseModule.AdoProd.FieldByName('ProdName').AsString) And (EdtCode.Text=DatabaseModule.AdoProd.FieldByName('ProdNum').AsString) Then
            Begin
              With DatabaseModule Do
                Begin
                  Dtclsdata.BeginTrans;
                  Try
                    AdoProd.Edit;
                    AdoProd.FieldByName('ProdNum').AsString:=EdtCode.Text;
                    AdoProd.FieldByName('ProdName').AsString:=EdtName.Text;
                    AdoProd.FieldByName('ProdType').AsString:=EdtType.Text;
                    AdoProd.FieldByName('ProdSpec').AsString:=EdtSpec.Text;
                    AdoProd.FieldByName('ProdUnit').AsString:=EdtUnit.Text;
                    IF EdtCount.Text='' Then AdoProd.FieldByName('ProdCount').AsFloat:=0
                    Else AdoProd.FieldByName('ProdCount').AsFloat:=StrToFloat(EdtCount.Text);
                    IF EdtPrice.Text='' Then AdoProd.FieldByName('Price').AsFloat:=0
                    Else AdoProd.FieldByName('Price').AsFloat:=StrToFloat(EdtPrice.Text);
                    AdoProd.FieldByName('ProdOutPrice').AsFloat:=StrToFloat(EdtSaleprice.Text);
                    AdoProd.FieldByName('Prodmemo').AsString:=EdtMemo.Text;
                    AdoProd.FieldByName('UpdateD_').AsDateTime:=Date;
                    AdoProd.FieldByName('UpdateBY_').AsInteger:=Dtclsdata.UserID_;
                    AdoProd.Post;
                    DtclsData.CommitTrans;
                    BtnExit.Click;
                  Except
                    DtclsData.RollbackTrans;
                    Raise;
                  End;
                End;
            End
          Else
            Begin
              IF (EdtName.Text<>DatabaseModule.AdoProd.FieldByName('ProdName').AsString) And (EdtCode.Text<>DatabaseModule.AdoProd.FieldByName('ProdNum').AsString) Then
                Begin
                  Query.Close;
                  Query.SQL.Clear;
                  Query.SQL.Add('Select ProdName From Product where ProdNum=:ProdNum OR ProdName=:ProdName');
                  Query.Parameters.ParamByName('ProdNum').Value:=EdtCode.Text;
                  Query.Parameters.ParamByName('ProdName').Value:=EdtName.Text;
                  Query.Prepared;
                  Query.Open;
                  IF Not Query.IsEmpty Then
                    Begin
                      Application.MessageBox('产品名称或编码重复','提示',MB_OK+MB_Iconwarning);
                      Exit;
                    End;
                End
              Else
                Begin
                  IF (EdtName.Text<>DatabaseModule.AdoProd.FieldByName('ProdName').AsString) Then
                    Begin
                      Query.Close;
                      Query.SQL.Clear;
                      Query.SQL.Add('Select ProdName From Product where ProdName=:ProdName');
                      Query.Parameters.ParamByName('ProdName').Value:=EdtName.Text;
                      Query.Prepared;
                      Query.Open;
                      IF Not Query.IsEmpty Then
                        Begin
                          Application.MessageBox('产品名称重复','提示',MB_OK+MB_Iconwarning);
                          Exit;
                        End;
                    End
                  Else
                    Begin
                      Query.Close;
                      Query.SQL.Clear;
                      Query.SQL.Add('Select ProdName From Product where ProdNum=:ProdNum');
                      Query.Parameters.ParamByName('ProdNum').Value:=EdtCode.Text;
                      Query.Prepared;
                      Query.Open;
                      IF Not Query.IsEmpty Then
                        Begin
                          Application.MessageBox('产品编码重复','提示',MB_OK+MB_Iconwarning);
                          Exit;
                        End;
                    End;
                End;
            End;}

              IF (EdtCode.Text<>DatabaseModule.AdoProd.FieldByName('ProdNum').AsString) Then
                Begin
                  Query.Close;
                  Query.SQL.Clear;
                  Query.SQL.Add('Select ProdName From Product where ProdNum=:ProdNum');
                  Query.Parameters.ParamByName('ProdNum').Value:=EdtCode.Text;
                  Query.Prepared;
                  Query.Open;
                  IF Not Query.IsEmpty Then
                    Begin
                      Application.MessageBox('产品编码重复','提示',MB_OK+MB_Iconwarning);
                      Exit;
                    End;
                End;
                      With DatabaseModule Do
                        Begin
                          Dtclsdata.BeginTrans;
                          Try
                            AdoProd.Edit;
                            AdoProd.FieldByName('ProdNum').AsString:=EdtCode.Text;
                            AdoProd.FieldByName('ProdName').AsString:=EdtName.Text;
                            AdoProd.FieldByName('ProdType').AsString:=EdtType.Text;
                            AdoProd.FieldByName('ProdSpec').AsString:=EdtSpec.Text;
                            AdoProd.FieldByName('ProdUnit').AsString:=EdtUnit.Text;
                            IF EdtCount.Text='' Then AdoProd.FieldByName('ProdCount').AsFloat:=0
                            Else AdoProd.FieldByName('ProdCount').AsFloat:=StrToFloat(EdtCount.Text);
                            IF EdtPrice.Text='' Then AdoProd.FieldByName('Price').AsFloat:=0
                            Else AdoProd.FieldByName('Price').AsFloat:=StrToFloat(EdtPrice.Text);
                            AdoProd.FieldByName('ProdOutPrice').AsFloat:=StrToFloat(EdtSaleprice.Text);
                            AdoProd.FieldByName('Prodmemo').AsString:=EdtMemo.Text;
                            //TBlobField(AdoProd.FieldByName('ProdImage')).Assign(image1.Picture.Graphic);
                            IF ISImage=True Then
                              TBlobfield(AdoProd.FieldByName('ProdImage')).LoadFromStream(IMGStream);
                            AdoProd.FieldByName('UpdateD_').AsDateTime:=Date;
                            AdoProd.FieldByName('UpdateBY_').AsInteger:=Dtclsdata.UserID_;
                            AdoProd.Post;
                            DtclsData.CommitTrans;
                            IMGStream.Free;
                            BtnExit.Click;
                          Except
                            DtclsData.RollbackTrans;
                            IMGStream.Free;
                            Raise;
                          End;
                        End;
        End;
end;

procedure TFrm_NewCode.ClearEdt;
begin
  EdtCode.Text:='';
      EdtName.Text:='';
      EdtType.Text:='';
      EdtSpec.Text:='';
      EdtCount.Text:='';
      EdtUnit.Text:='';
      EdtPrice.Text:='';
      EdtSalePrice.Text:='';
      EdtMemo.Text:='';
end;

procedure TFrm_NewCode.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_NewCode.VerifyNumeric(Edt: TcxTextEdit);
begin
  Try
    StrToFloat(Edt.Text);
  Except
    Edt.Text:='0';
  End;
end;

procedure TFrm_NewCode.EdtcountPropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtCount.Text='' Then Exit;
  Try
    StrToFloat(EdtCount.Text);
  Except
    Edtcount.Text:='0';
  End;
  //VerifyNumeric(EdtPrice);
end;

procedure TFrm_NewCode.EdtPricePropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtPrice.Text='' Then Exit;
  Try
    StrToFloat(EdtPrice.Text);
  Except
    EdtPrice.Text:='0';
  End;
end;

procedure TFrm_NewCode.EdtSalePricePropertiesChange(Sender: TObject);
begin
  inherited;
  IF EdtSalePrice.Text='' Then Exit;
  Try
    StrToFloat(EdtSalePrice.Text);
  Except
    EdtSalePrice.Text:='0';
  End;
end;

procedure TFrm_NewCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=False;
  Action:=CaFree;
end;

procedure TFrm_NewCode.EdtNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=LDSProd;
  Frm_Search.GrdSearch.Columns[0].Caption:='产品名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='ProdName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_NewCode';
  Frm_search.ShowModal;
end;

procedure TFrm_NewCode.EdtSpecClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:='规格';
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:='规格';
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:='ProdSpec';
  Frm_Dictother.DictDuty:='规格';
  Frm_Dictother.DictIFCust:=0;
  Frm_Dictother.FrmName:='Frm_NewCode';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_NewCode.N1Click(Sender: TObject);
begin
  inherited;
  IF OpenDialog1.Execute Then
    Begin
      Image1.Picture.LoadFromFile(OpenDialog1.FileName);
    End;
end;

procedure TFrm_NewCode.FormShow(Sender: TObject);
var
  TempStream:TMemoryStream;
  TempImage:TJpegImage;
begin
  inherited;

          LAdoProd.Close;
          LAdoProd.SQL.Clear;
          LAdoProd.SQL.Add('Select DISTINCT ProdName');
          LAdoProd.SQL.Add(' From Product Where ProdSelfID=:ProdSelfID');
          LAdoProd.Parameters.ParamByName('ProdSelfID').Value:=Frm_ProdCode.AdoProdType.fieldByName('ProdSelfID').AsString;
          LAdoProd.Prepared;
          LAdoProd.Open;

          LAdoSpec.Close;
          LAdoSpec.SQL.Clear;
          LAdoSpec.SQL.Add('Select DISTINCT ProdSpec From Product');
          LAdoSpec.Prepared;
          LAdoSpec.Open;

  IF ISAdd=True Then
    Begin
      ClearEdt;
    End;
  IF (ISEdit=True) OR (ISBrowse=True) Then
    Begin
      IF ISBrowse=True Then btnSure.Visible:=False;
      IF Not DatabaseModule.AdoProd.FieldByName('ProdImage').IsNull Then
        Begin
          TempStream:=TMemoryStream.Create;
          TempImage:=TJpegImage.Create;

          TBlobField(DatabaseModule.AdoProd.FieldByName('ProdImage')).SaveToStream(tempstream);
          TempStream.Position:=0;
          TempImage.LoadFromStream(TempStream);
          Image1.Picture.Graphic:=TempImage;
          TempStream.Free;
          TempImage.Free;
        End;
      With Databasemodule Do
        Begin
          EdtCode.Text:= AdoProd.FieldByname('ProdNum').AsString;
          EdtName.Text:=AdoProd.FieldByName('ProdName').AsString;
          EdtType.Text:=AdoProd.FieldByName('ProdType').AsString;
          EdtSpec.Text:=AdoProd.FieldByName('ProdSpec').AsString;
          EdtCount.Text:=FloatToStr(AdoProd.FieldByName('ProdCount').AsFloat);
          EdtUnit.Text:=AdoProd.FieldByName('ProdUnit').AsString;
          IF ISBrowse=True Then
            Begin
              EdtPrice.Visible:=False;
              CXLabel5.Visible:=False;
            End;  
          EdtPrice.Text:=FloatToStr(AdoProd.FieldByName('Price').AsFloat);
          EdtSalePrice.Text:=FloatToStr(AdoProd.FieldByName('ProdOutPrice').AsFloat);
          EdtMemo.Text:=AdoProd.FieldByName('ProdMemo').AsString;
        End;

    End;
  End;

end.
