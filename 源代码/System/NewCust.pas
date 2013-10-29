unit NewCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, ExtCtrls, cxPC, cxControls, cxMaskEdit,
  cxButtonEdit, cxLabel, cxContainer, cxEdit, cxTextEdit, cxMemo, DB,
  ADODB, bainaADOQuery, cxDropDownEdit, cxCalendar, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, cxHyperLinkEdit,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxSkinscxPCPainter;

type
  TFrm_NewCust = class(TBaseData_Frm)
    NewCust: TbainaADOQuery;
    Query: TbainaADOQuery;
    LAdoArrearage: TbainaADOQuery;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    LAdoDict: TbainaADOQuery;
    cxButton1: TcxButton;
    CustNum: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    CustName: TcxTextEdit;
    CustCountry: TcxButtonEdit;
    CustProv: TcxButtonEdit;
    CustCity: TcxButtonEdit;
    CustZip: TcxTextEdit;
    CustAdd: TcxTextEdit;
    CustRegion: TcxButtonEdit;
    CustNextDate: TcxDateEdit;
    CustLastDate: TcxDateEdit;
    cxLabel14: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel19: TcxLabel;
    CustPhone: TcxTextEdit;
    cxLabel13: TcxLabel;
    CustRate: TcxButtonEdit;
    cxLabel11: TcxLabel;
    CustSource: TcxButtonEdit;
    CustTrade: TcxButtonEdit;
    cxLabel12: TcxLabel;
    CustType: TcxButtonEdit;
    cxLabel10: TcxLabel;
    cxLabel17: TcxLabel;
    CustState: TcxButtonEdit;
    cxLabel15: TcxLabel;
    CustCredit: TcxButtonEdit;
    cxLabel18: TcxLabel;
    CustMemo: TcxMemo;
    CustWeb: TcxHyperLinkEdit;
    GrdSame: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    LDSSame: TDataSource;
    cxLabel20: TcxLabel;
    CustKind: TcxButtonEdit;
    cxLabel21: TcxLabel;
    CustPY: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure CustRateClick(Sender: TObject);
    procedure CustSourceClick(Sender: TObject);
    procedure CustTypeClick(Sender: TObject);
    procedure CustTradeClick(Sender: TObject);
    procedure CustStateClick(Sender: TObject);
    procedure CustCreditClick(Sender: TObject);
    procedure CustCountryClick(Sender: TObject);
    procedure CustProvClick(Sender: TObject);
    procedure CustCityClick(Sender: TObject);
    procedure CustRegionClick(Sender: TObject);
    procedure actundoExecute(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure CustKindClick(Sender: TObject);
    procedure CustNamePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    DictFieldNum,DictFieldCountryID,DictFieldProvID,DictFieldCityID:Integer;
    Procedure AddDict(FTableName,LFieldName:String;LIFCust:Integer);
    Procedure EdtReadColor(Readonly:Boolean;Color:TColor);
    Procedure ClearEdt;
    Procedure NewCustRecord;
    Procedure SaveCustRecord;
    Procedure ModifyCustRecord;

    Procedure GetValue(BTEdt:TcxButtonEdit;FValue:String);
  public
    { Public declarations }
    LProtectLimit:Integer;
    Procedure ShowCustRecord;
  end;

var
  Frm_NewCust: TFrm_NewCust;

implementation

uses DataBase, Dict, PublicClass, Search, NewExpend,uCheckKey,
  {lpj2013.09.13}Customer;

{$R *.dfm}
Var
  OldCustName:String;


{ TFrm_NewCust }

procedure TFrm_NewCust.EdtReadColor(Readonly: Boolean; Color: TColor);
begin
  //CustNum.Properties.ReadOnly:=Readonly;
  CustName.Properties.ReadOnly:=Readonly;
  CustPhone.Properties.ReadOnly:=ReadOnly;
  CustZip.Properties.ReadOnly:=Readonly;
  CustCountry.Properties.ReadOnly:=Readonly;
  CustProv.Properties.ReadOnly:=Readonly;
  CustCity.Properties.ReadOnly:=Readonly;
  CustRegion.Properties.ReadOnly:=Readonly;
  CustWeb.Properties.ReadOnly:=Readonly;
  CustAdd.Properties.ReadOnly:=Readonly;
  CustRate.Properties.ReadOnly:=Readonly;
  CustSource.Properties.ReadOnly:=Readonly;
  CustType.Properties.ReadOnly:=Readonly;
  CustTrade.Properties.ReadOnly:=Readonly;
  CustState.Properties.ReadOnly:=Readonly;
  CustCredit.Properties.ReadOnly:=Readonly;
  CustMemo.Properties.ReadOnly:=Readonly;
  CustNextDate.Properties.ReadOnly:=Readonly;
  CustLastDate.Properties.ReadOnly:=Readonly;
  CustKind.Properties.ReadOnly:=Readonly;

  CustName.Style.Color:=Color;
  CustPhone.Style.Color:=Color;
  CustZip.Style.Color:=Color;
  CustCountry.Style.Color:=Color;
  CustProv.Style.Color:=Color;
  CustCity.Style.Color:=Color;
  CustRegion.Style.Color:=Color;
  CustWeb.Style.Color:=Color;
  CustAdd.Style.Color:=Color;
  CustRate.Style.Color:=Color;
  CustSource.Style.Color:=Color;
  CustType.Style.Color:=Color;
  CustTrade.Style.Color:=Color;
  CustState.Style.Color:=Color;
  CustCredit.Style.Color:=Color;
  CustKind.Style.Color:=Color;
  CustMemo.Style.Color:=Color;
  CustNextDate.Style.Color:=Color;
  CustLastDate.Style.Color:=Color;

  IF Not ISCust Then
    Begin
      CxLabel1.Caption:='供应商编号:';
      CxLabel2.Caption:='供应商名称:';
      CxLabel20.Caption:='相似供应商:';
      CxLabel13.Caption:='供应商等级:';
      CxLabel10.Caption:='供应商类型:';
      CxLabel17.Caption:='供应商状态:';
      CxLabel11.Caption:='供应商性质:';
      CxLabel12.Caption:='供应商行业:';
      CxLabel21.Caption:='供应商来源';
      CxLabel15.Visible:=False;
      CustCredit.Visible:=False;
    End;
end;

procedure TFrm_NewCust.FormCreate(Sender: TObject);
begin
  inherited;
  IF ISBrowse=True Then
    Begin
      EdtReadColor(True,ClBtnFace);
      ShowCustRecord;
      BtnSure.Visible:=False;
      cxButton1.Visible:=False;
    End;
  IF ISAdd=True Then
    Begin
      NewCustRecord;
      LAdoDict.Close;
      LAdoDict.SQL.Clear;
      LAdoDict.SQL.Add('Select DictID,FactTableName,Context,IFDefault,ProtectLimit From Dict Where IFCust='+'1');
      LAdoDict.Prepared;
      LAdoDict.Open;
      GetValue(CustCountry,'CustCountry');
      GetValue(CustProv,'CustProvince');
      GetValue(CustCity,'CustCity');
      GetValue(CustRate,'CustRate');
      GetValue(CustSource,'CustSource');
      GetValue(CustTrade,'CustTrade');
      GetValue(CustType,'CustType');
      GetValue(CustState,'CustState');
      GetValue(CustCredit,'CustCredit');
      GetValue(CustKind,'CustKind');
    End;
  IF ISEdit=True Then
    Begin
      ShowCustRecord;
      ModifyCustRecord;
    End;
end;

procedure TFrm_NewCust.AddDict(FTableName,LFieldName: String; LIFCust: Integer);
begin

  With DatabaseModule DO
     Begin
       AdoDict.Close;
       AdoDict.SQL.Clear;
       AdoDict.SQL.Add('Select DictID,PFieldNum,FactTableName,FieldName,Context,IFCust,IFDefault,ProtectLimit from Dict where FieldName=:FieldName');
       IF (FTableName='CustProvince') Then
         Begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('Select DictID From Dict Where Context='''+CustCountry.Text+'''');
           Query.Prepared;
           Query.Open;
           DictFieldCountryID:=Query.FieldByName('DictID').AsInteger;
           DictFieldNum:=DictFieldCountryID;
           AdoDict.SQL.Add(' And PFieldNum=:PFieldNum');
           AdoDict.Parameters.ParamByName('PFieldNum').Value:=DictFieldCountryID;
         End;
       IF (FTableName='CustCity') Then
         Begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('Select DictID From Dict Where Context='''+CustProv.Text+'''');
           Query.Prepared;
           Query.Open;
           DictFieldProvID:=Query.FieldByName('DictID').AsInteger;
           DictFieldNum:=DictFieldProvID;
           AdoDict.SQL.Add(' And PFieldNum=:PFieldNum');
           AdoDict.Parameters.ParamByName('PFieldNum').Value:=DictFieldProvID;
         End;
       IF (FTableName='CustRegion') Then
         Begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('Select DictID From Dict Where Context='''+CustCity.Text+'''');
           Query.Prepared;
           Query.Open;
           DictFieldCityID:=Query.FieldByName('DictID').AsInteger;
           DictFieldNum:=DictFieldCityID;
           AdoDict.SQL.Add(' And PFieldNum=:PFieldNum');
           AdoDict.Parameters.ParamByName('PFieldNum').Value:=DictFieldCityID;
         End;

       AdoDict.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDict.Prepared;
       AdoDict.Open;

       //AdoDict.FieldByName('DictID').Visible:=False;
       //AdoDict.FieldByName('FieldName').Visible:=False;
       //AdoDict.FieldByName('FactTableName').Visible:=False;
       //AdoDict.FieldByName('IFCust').Visible:=False;
       AdoDict.FieldByName('Context').DisplayLabel:=LFieldName;
     End;
  Frm_Dict:=TFrm_Dict.Create(Self);
  Frm_Dict.FrmName:='Frm_NewCust';
  Frm_Dict.FTableName:=FTableName;
  Frm_Dict.PFieldNum:=DictFieldNum;
  Frm_Dict.DictDuty:=LFieldName;
  Frm_Dict.DictIFCust:=LIFCust;
  Frm_Dict.BitBtn1.Visible:=False;
  Frm_Dict.BitBtn2.Visible:=False;
  Frm_Dict.BitBtn3.Visible:=False;
  Frm_Dict.DictName.Visible:=False;
  Frm_Dict.ShowModal;
end;

procedure TFrm_NewCust.CustRateClick(Sender: TObject);
begin
  inherited;
  IF CustRate.Properties.ReadOnly=True Then Exit
  Else AddDict('CustRate','客户等级',1);
end;

procedure TFrm_NewCust.CustSourceClick(Sender: TObject);
begin
  inherited;
  IF CustSource.Properties.ReadOnly=True Then Exit
  Else AddDict('CustSource','客户来源',1);
end;

procedure TFrm_NewCust.CustTypeClick(Sender: TObject);
begin
  inherited;
  IF CustType.Properties.ReadOnly=True Then Exit
  Else AddDict('CustType','客户类型',1);
end;

procedure TFrm_NewCust.CustTradeClick(Sender: TObject);
begin
  inherited;
  IF CustTrade.Properties.ReadOnly=True Then Exit
  Else AddDict('CustTrade','客户行业',1);
end;

procedure TFrm_NewCust.CustStateClick(Sender: TObject);
begin
  inherited;
  IF CustState.Properties.ReadOnly=True Then Exit
  Else AddDict('CustState','客户状态',1);
end;

procedure TFrm_NewCust.CustCreditClick(Sender: TObject);
begin
  inherited;
  IF CustCredit.Properties.ReadOnly=True Then Exit
  Else AddDict('CustCredit','信用额度',1);
end;

procedure TFrm_NewCust.CustCountryClick(Sender: TObject);
begin
  inherited;
  IF CustCountry.Properties.ReadOnly=True Then Exit
  Else AddDict('CustCountry','国家',1);
end;

procedure TFrm_NewCust.CustProvClick(Sender: TObject);
begin
  inherited;
  IF (CustProv.Properties.ReadOnly=True) OR (CustCountry.Text='') Then Exit
  Else AddDict('CustProvince','省份',1);
end;

procedure TFrm_NewCust.CustCityClick(Sender: TObject);
begin
  inherited;
  IF (CustCity.Properties.ReadOnly=True) OR (CustProv.Text='') Then Exit
  Else AddDict('CustCity','城市',1);
end;

procedure TFrm_NewCust.CustRegionClick(Sender: TObject);
begin
  inherited;
  IF (CustRegion.Properties.ReadOnly=True) OR (CustCity.Text='') Then Exit
  Else AddDict('CustRegion','区域',1);
end;

procedure TFrm_NewCust.actundoExecute(Sender: TObject);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  EdtReadColor(True,ClBtnFace);
end;

procedure TFrm_NewCust.ClearEdt;
begin
  //CustNum.Text:='';
  CustName.Text:='';
  CustPhone.Text:='';
  CustZip.Text:='';
  CustCountry.Text:='';
  CustProv.Text:='';
  CustCity.Text:='';
  CustRegion.Text:='';
  CustWeb.Text:='';
  CustNextdate.Date:=Date;
  CustLastDate.Date:=Date;
  CustAdd.Text:='';
  CustRate.Text:='';
  CustSource.Text:='';
  CustType.Text:='';
  CustTrade.Text:='';
  CustState.Text:='';
  CustCredit.Text:='0';
  CustMemo.Text:='';
  CustKind.Text:='';
end;

procedure TFrm_NewCust.NewCustRecord;
var
  I:Integer;
  NameHead,CustName:String;
begin
  ClearEdt;
  EdtReadColor(False,ClWhite);
  ISAdd:=True;
  ISEdit:=False;
  IF ISCust Then NameHead:='KH'
  Else NameHead:='GYS';
  NewCust.Close;
  NewCust.SQL.Clear;
  NewCust.SQL.Add('Select Top 1 DeptID_,CustNum,CustName,CustPhone,CustPostCard,CustAddress,CustHomePage,CustCountry,CustProvince,CustCity');
  NewCust.SQL.Add(',CustRegion,CustRate,CustState,CustType,CustSource,CustTrade,CustCredit,CustMemo,CreateD_,CustNextDate,CustLastDate,CreateBy_,BelongID');
  NewCust.SQL.Add(' from Customer where CustClass=:CustClass And BelongID=:BelongID Order by CustNum Desc');
  NewCust.Parameters.ParamByName('BelongID').Value:=Databasemodule.dtclsData.UserID_;
  NewCust.Parameters.ParamByName('CustClass').Value:=Boolean(ISCust);
  NewCust.Prepared;
  NewCust.Open;

  IF NewCust.IsEmpty Then
    Begin
      With Databasemodule.dtclsData DO
        Begin
          I:=Length(IntToStr(UserID_));
          Case I OF
          1:CustNum.Text:=NameHead+IntToStr(UserID_)+'000'+'100001';
          2:CustNum.Text:=NameHead+IntToStr(UserID_)+'00'+'100001';
          3:CustNum.Text:=NameHead+IntToStr(UserID_)+'0'+'100001';
          4:CustNum.Text:=NameHead+IntToStr(UserID_)+'100001';
          End;
        End;
    End
  Else
    Begin
      NewCust.Last;
      CustName:= NewCust.fieldbyname('CustNum').AsString;
      CustNum.Text:=NameHead+FloatToStr(StrToFloat(Copy(CustName,Length(NameHead)+1,Length(CustName)-Length(NameHead)))+1);
    End;
    
end;

procedure TFrm_NewCust.SaveCustRecord;
begin
  if not DataBaseModule.IsCheckAdd then
  begin
    Application.MessageBox(PChar('现在客户数已经大于等于 '+IntToStr(c_ALLOWCOUNT)+' ,如需要继续添加客户请插入加密狗!'),'提示',MB_OK+MB_Iconwarning);
    Exit;
  end;

  IF ISAdd=True Then
    Begin
      With DatabaseModule Do
      Begin
        dtclsData.BeginTrans;
        Try

          IF ISCust Then
            Begin
              AdoCust.Append;
              AdoCust.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
              AdoCust.FieldByName('CustNum').AsString:=CustNum.Text;
              AdoCust.FieldByName('CustName').AsString:=CustName.Text;
              AdoCust.FieldByName('SZPY').AsString:=CustPY.Text;
              AdoCust.FieldByName('CustClass').AsBoolean:=Boolean(1);
              AdoCust.FieldByName('CustPhone').AsString:=CustPhone.Text;
              AdoCust.FieldByName('CustPostCard').AsString:=CustZip.Text;
              AdoCust.FieldByName('CustAddress').AsString:=CustAdd.Text;
              AdoCust.FieldByName('CustHomePage').AsString:=CustWeb.Text;
              AdoCust.FieldByName('CustCountry').AsString:=CustCountry.Text;
              AdoCust.FieldByName('CustProvince').AsString:=CustProv.Text;
              AdoCust.FieldByName('CustCity').AsString:=CustCity.Text;
              AdoCust.FieldByName('CustRegion').AsString:=CustRegion.Text;
              AdoCust.FieldByName('CustRate').AsString:=CustRate.Text;
              AdoCust.FieldByName('CustState').AsString:=CustState.Text;
              AdoCust.FieldByName('CustType').AsString:=CustType.Text;
              AdoCust.FieldByName('CustSource').AsString:=CustSource.Text;
              AdoCust.FieldByName('CustTrade').AsString:=CustTrade.Text;
              AdoCust.FieldByName('CustCredit').AsString:=CustCredit.Text;
              AdoCust.FieldByName('CustKind').AsString:=CustKind.Text;
              AdoCust.FieldByName('CustMemo').AsString:=CustMemo.Text;
              AdoCust.FieldByName('CreateD_').AsDateTime:=Now;
              IF CustNextDate.Text='' Then AdoCust.FieldByName('CustNextDate').Value:=Null
              Else AdoCust.FieldByName('CustNextDate').AsDateTime:=CustNextDate.Date;
              IF CustLastDate.Text='' Then AdoCust.FieldByName('CustLastDate').Value:=Null
              Else AdoCust.FieldByName('CustLastDate').AsDateTime:=CustLastDate.Date;
              AdoCust.FieldByName('CreateBy_').AsString:=DtclsData.UserName_;
              AdoCust.FieldByName('BelongID').AsInteger:=dtclsData.UserID_;
              AdoCust.Post;

              Begin
                LAdoArrearage.Close;
                LAdoArrearage.SQL.Clear;
                LAdoArrearage.SQL.Add('Insert Into FirstArrear(DeptID_,CustNum,ArrearMoney,PreMoney,BelongID,CreateBy_,CreateD_)');
                LAdoArrearage.SQL.Add(' values(:DeptID,:CustNum,:ArrearMoney,:PreMoney,:BelongID,:CreateBy,:CreateD)');
                LAdoArrearage.Parameters.ParamByName('DeptID').Value:=dtclsData.DeptID_;
                LAdoArrearage.Parameters.ParamByName('CustNum').Value:=CustNum.Text;
                LAdoArrearage.Parameters.ParamByName('ArrearMoney').Value:=0;
                LAdoArrearage.Parameters.ParamByName('PreMoney').Value:=0;
                LAdoArrearage.Parameters.ParamByName('BelongID').Value:=DtclsData.UserID_;
                LAdoArrearage.Parameters.ParamByName('CreateBy').Value:=DtclsData.UserName_;
                LAdoArrearage.Parameters.ParamByName('CreateD').Value:=Date;
                LAdoArrearage.Prepared;
                LAdoArrearage.ExecSQL;
              End;
              
            End
          Else
            Begin
              AdoSupply.Append;
              AdoSupply.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
              AdoSupply.FieldByName('CustNum').AsString:=CustNum.Text;
              AdoSupply.FieldByName('CustName').AsString:=CustName.Text;
              AdoSupply.FieldByName('Szpy').AsString:=CustPY.Text;
              AdoSupply.FieldByName('CustClass').AsBoolean:=Boolean(0);
              AdoSupply.FieldByName('CustPhone').AsString:=CustPhone.Text;
              AdoSupply.FieldByName('CustPostCard').AsString:=CustZip.Text;
              AdoSupply.FieldByName('CustAddress').AsString:=CustAdd.Text;
              AdoSupply.FieldByName('CustHomePage').AsString:=CustWeb.Text;
              AdoSupply.FieldByName('CustCountry').AsString:=CustCountry.Text;
              AdoSupply.FieldByName('CustProvince').AsString:=CustProv.Text;
              AdoSupply.FieldByName('CustCity').AsString:=CustCity.Text;
              AdoSupply.FieldByName('CustRegion').AsString:=CustRegion.Text;
              AdoSupply.FieldByName('CustRate').AsString:=CustRate.Text;
              AdoSupply.FieldByName('CustState').AsString:=CustState.Text;
              AdoSupply.FieldByName('CustType').AsString:=CustType.Text;
              AdoSupply.FieldByName('CustSource').AsString:=CustSource.Text;
              AdoSupply.FieldByName('CustTrade').AsString:=CustTrade.Text;
              AdoSupply.FieldByName('CustCredit').AsString:=CustCredit.Text;
              AdoSupply.FieldByName('CustKind').AsString:=CustKind.Text;
              AdoSupply.FieldByName('CustMemo').AsString:=CustMemo.Text;
              AdoSupply.FieldByName('CreateD_').AsDateTime:=Now;
              IF CustNextDate.Text='' Then AdoSupply.FieldByName('CustNextDate').Value:=Null
              Else AdoSupply.FieldByName('CustNextDate').AsDateTime:=CustNextDate.Date;
              IF CustLastDate.Text='' Then AdoSupply.FieldByName('CustLastDate').Value:=Null
              Else AdoSupply.FieldByName('CustLastDate').AsDateTime:=CustLastDate.Date;
              AdoSupply.FieldByName('CreateBy_').AsString:=DtclsData.UserName_;
              AdoSupply.FieldByName('BelongID').AsInteger:=dtclsData.UserID_;
              AdoSupply.Post;
            End;




          dtclsData.CommitTrans;
          NewCustRecord;
          //lpj2013.09.13
          Frm_CustManager.TreeViewChange(Frm_CustManager.Treeview,Frm_CustManager.Treeview.Selected);
        Except
          dtclsData.RollbackTrans;
          Raise;
        End;
      End;
    End;
  IF ISEdit=True Then
    Begin
      With DatabaseModule Do
        Begin
          dtclsData.BeginTrans;
          Try
            IF ISCust Then
              Begin
                AdoCust.Edit;
                AdoCust.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
                AdoCust.FieldByName('CustName').AsString:=CustName.Text;
                AdoCust.FieldByName('Szpy').AsString:=CustPY.Text;
                AdoCust.FieldByName('CustPhone').AsString:=CustPhone.Text;
                AdoCust.FieldByName('CustPostCard').AsString:=CustZip.Text;
                AdoCust.FieldByName('CustAddress').AsString:=CustAdd.Text;
                AdoCust.FieldByName('CustHomePage').AsString:=CustWeb.Text;
                AdoCust.FieldByName('CustCountry').AsString:=CustCountry.Text;
                AdoCust.FieldByName('CustProvince').AsString:=CustProv.Text;
                AdoCust.FieldByName('CustCity').AsString:=CustCity.Text;
                AdoCust.FieldByName('CustRegion').AsString:=CustRegion.Text;
                AdoCust.FieldByName('CustRate').AsString:=CustRate.Text;
                AdoCust.FieldByName('CustState').AsString:=CustState.Text;
                AdoCust.FieldByName('CustType').AsString:=CustType.Text;
                AdoCust.FieldByName('CustSource').AsString:=CustSource.Text;
                AdoCust.FieldByName('CustTrade').AsString:=CustTrade.Text;
                AdoCust.FieldByName('CustCredit').AsString:=CustCredit.Text;
                AdoCust.FieldByName('CustKind').AsString:=CustKind.Text;
                AdoCust.FieldByName('CustMemo').AsString:=CustMemo.Text;
                AdoCust.FieldByName('UpdateD_').AsDateTime:=Now;
                IF CustNextDate.Text='' Then AdoCust.FieldByName('CustNextDate').Value:=Null
                Else AdoCust.FieldByName('CustNextDate').AsDateTime:=CustNextDate.Date;
                IF CustLastDate.Text='' Then AdoCust.FieldByName('CustLastDate').Value:=Null
                Else AdoCust.FieldByName('CustLastDate').AsDateTime:=CustLastDate.Date;
                AdoCust.FieldByName('UpdateBy_').AsString:=dtclsData.UserName_;
                AdoCust.Post;
              End
            Else
              Begin
                AdoSupply.Edit;
                AdoSupply.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
                AdoSupply.FieldByName('CustName').AsString:=CustName.Text;
                AdoSupply.FieldByName('Szpy').AsString:=CustPY.Text;
                AdoSupply.FieldByName('CustPhone').AsString:=CustPhone.Text;
                AdoSupply.FieldByName('CustPostCard').AsString:=CustZip.Text;
                AdoSupply.FieldByName('CustAddress').AsString:=CustAdd.Text;
                AdoSupply.FieldByName('CustHomePage').AsString:=CustWeb.Text;
                AdoSupply.FieldByName('CustCountry').AsString:=CustCountry.Text;
                AdoSupply.FieldByName('CustProvince').AsString:=CustProv.Text;
                AdoSupply.FieldByName('CustCity').AsString:=CustCity.Text;
                AdoSupply.FieldByName('CustRegion').AsString:=CustRegion.Text;
                AdoSupply.FieldByName('CustRate').AsString:=CustRate.Text;
                AdoSupply.FieldByName('CustState').AsString:=CustState.Text;
                AdoSupply.FieldByName('CustType').AsString:=CustType.Text;
                AdoSupply.FieldByName('CustSource').AsString:=CustSource.Text;
                AdoSupply.FieldByName('CustTrade').AsString:=CustTrade.Text;
                AdoSupply.FieldByName('CustCredit').AsString:=CustCredit.Text;
                AdoSupply.FieldByName('CustMemo').AsString:=CustMemo.Text;
                AdoSupply.FieldByName('CustKind').AsString:=CustKind.Text;
                AdoSupply.FieldByName('UpdateD_').AsDateTime:=Now;
                IF CustNextDate.Text='' Then AdoSupply.FieldByName('CustNextDate').Value:=Null
                Else AdoSupply.FieldByName('CustNextDate').AsDateTime:=CustNextDate.Date;
                IF CustLastDate.Text='' Then AdoSupply.FieldByName('CustLastDate').Value:=Null
                Else AdoSupply.FieldByName('CustLastDate').AsDateTime:=CustLastDate.Date;
                AdoSupply.FieldByName('UpdateBy_').AsString:=dtclsData.UserName_;
                AdoSupply.Post;
              End;
            dtclsData.CommitTrans;
            BtnExit.Click;
          Except
            dtclsData.RollbackTrans;
            Raise;
          End;
        End;
    End;
  {
  EdtReadColor(True,ClBtnFace);}
end;

procedure TFrm_NewCust.BtnExitClick(Sender: TObject);
begin
  inherited;  
  Close;
end;

procedure TFrm_NewCust.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF CustName.Text='' Then Application.MessageBox('客户名称不能为空','提示',MB_OK+MB_Iconwarning)
  Else
    Begin
      IF (ISAdd= True) OR ((ISEdit=True) And (OldCustName<>CustName.Text)) Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select CustName From Customer where CustName=:CustName');
          Query.Parameters.ParamByName('CustName').Value:=CustName.Text;
          Query.Prepared;
          Query.Open;
          IF Query.IsEmpty Then
            Begin
              SaveCustRecord;
              BtnExit.Click;
            End
          Else Application.MessageBox('客户名称重复','提示',MB_OK+MB_Iconwarning);
        End
      Else
        Begin
          SaveCustRecord;
        End;
   End;
end;

procedure TFrm_NewCust.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISBrowse:=False;
  ISAdd:=False;
  ISEdit:=False;
  ISCust:=False;
  Frm_newCust:=Nil;
  Action:=CaFree;
end;

procedure TFrm_NewCust.ModifyCustRecord;
begin
  {NewCust.Close;
  NewCust.SQL.Clear;
  NewCust.SQL.Add('Select DeptID_,CustNum,CustName,CustPostCard,CustAddress,CustHomePage,CustCountry,CustProvince,CustCity');
  NewCust.SQL.Add(',CustRegion,CustRate,CustState,CustType,CustSource,CustTrade,CustCredit,CustMemo,CreateD_,CustNextDate,CustLastDate,CreateBy_,BelongID,UpdateD_,UpdateBy_');
  NewCust.SQL.Add(' from Customer where CustNum=:CustNum');
  NewCust.Parameters.ParamByName('CustNum').Value:=CustNum.Text;
  NewCust.Prepared;
  NewCust.Open;}
  ISAdd:=False;
  ISEdit:=True;
  EdtReadColor(False,ClWhite);
end;

procedure TFrm_NewCust.ShowCustRecord;
begin
  With DatabaseModule Do
    Begin
      IF ISCust Then
        Begin
          CustNum.text:=AdoCust.fieldbyname('CustNum').AsString;
          CustName.Text:=AdoCust.fieldbyname('CustName').AsString;
          CustPhone.Text:= AdoCust.FieldByName('CustPhone').AsString;
          CustZip.Text:=AdoCust.fieldbyname('CustPostCard').AsString;
          CustCountry.Text:=AdoCust.fieldbyname('CustCountry').AsString;
          CustProv.Text:=AdoCust.fieldbyname('CustProvince').AsString;
          CustCity.Text:=AdoCust.fieldbyname('CustCity').AsString;
          CustRegion.Text:=AdoCust.fieldbyname('CustRegion').AsString;
          CustWeb.Text:=AdoCust.fieldbyname('CustHomePage').AsString;
          CustAdd.Text:=AdoCust.fieldbyname('CustAddress').AsString;
          CustRate.Text:=AdoCust.fieldbyname('CustRate').AsString;
          CustSource.Text:=AdoCust.fieldbyname('CustSource').AsString;
          CustType.Text:=AdoCust.fieldbyname('CustType').AsString;
          CustTrade.Text:=AdoCust.fieldbyname('CustTrade').AsString;
          CustState.Text:=AdoCust.fieldbyname('CustState').AsString;
          CustCredit.Text:=AdoCust.fieldbyname('CustCredit').AsString;
          CustMemo.Text:=AdoCust.fieldbyname('CustMemo').AsString;
          Custpy.Text:=AdoCust.FieldByName('Szpy').AsString;
          CustKind.Text:=AdoCust.FieldByName('CustKind').AsString;
          CustNextDate.Date:=AdoCust.fieldbyname('CustNextDate').AsDateTime;
          CustLastDate.Date:=AdoCust.fieldbyname('CustLastDate').AsDateTime;
          OldCustName:= AdoCust.fieldbyname('CustName').AsString;
        End
      Else Begin
        CustNum.text:=AdoSupply.fieldbyname('CustNum').AsString;
        CustName.Text:=AdoSupply.fieldbyname('CustName').AsString;
        CustPhone.Text:= AdoSupply.FieldByName('CustPhone').AsString;
        CustZip.Text:=AdoSupply.fieldbyname('CustPostCard').AsString;
        CustCountry.Text:=AdoSupply.fieldbyname('CustCountry').AsString;
        CustProv.Text:=AdoSupply.fieldbyname('CustProvince').AsString;
        CustCity.Text:=AdoSupply.fieldbyname('CustCity').AsString;
        CustRegion.Text:=AdoSupply.fieldbyname('CustRegion').AsString;
        CustWeb.Text:=AdoSupply.fieldbyname('CustHomePage').AsString;
        CustAdd.Text:=AdoSupply.fieldbyname('CustAddress').AsString;
        CustRate.Text:=AdoSupply.fieldbyname('CustRate').AsString;
        CustSource.Text:=AdoSupply.fieldbyname('CustSource').AsString;
        CustType.Text:=AdoSupply.fieldbyname('CustType').AsString;
        CustTrade.Text:=AdoSupply.fieldbyname('CustTrade').AsString;
        CustState.Text:=AdoSupply.fieldbyname('CustState').AsString;
        CustCredit.Text:=AdoSupply.fieldbyname('CustCredit').AsString;
        CustMemo.Text:=AdoSupply.fieldbyname('CustMemo').AsString;
        Custpy.Text:=AdoSupply.FieldByName('Szpy').AsString;
        CustKind.Text:=AdoSupply.FieldByName('CustKind').AsString;
        CustNextDate.Date:=AdoSupply.fieldbyname('CustNextDate').AsDateTime;
        CustLastDate.Date:=AdoSupply.fieldbyname('CustLastDate').AsDateTime;
        OldCustName:= AdoSupply.fieldbyname('CustName').AsString;
      End;
    End;
end;

procedure TFrm_NewCust.cxButton1Click(Sender: TObject);
begin
  inherited;

  IF CustName.Text='' Then Application.MessageBox('客户名称不能为空','提示',MB_OK+MB_Iconwarning)
  Else
    Begin
      IF (ISAdd= True) OR ((ISEdit=True) And (OldCustName<>CustName.Text)) Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select CustName From Customer where CustName=:CustName');
          Query.Parameters.ParamByName('CustName').Value:=CustName.Text;
          Query.Prepared;
          Query.Open;
          IF Query.IsEmpty Then
            Begin
              SaveCustRecord;
              CustName.SetFocus;
              LDSSame.DataSet.Close;
            End
          Else Application.MessageBox('客户名称重复','提示',MB_OK+MB_Iconwarning);
        End
      Else
        Begin
          SaveCustRecord;
        End;
   End;
end;

procedure TFrm_NewCust.GetValue(BTEdt: TcxButtonEdit; FValue: String);
begin
  LAdoDict.Filtered:=False;
  LAdoDict.Filter:='FactTableName='+' '+ QuotedStr(FValue)+' '+'And'+' '+'IFDefault='+' '+QuotedStr('1');
  LAdoDict.Filtered:=True;
  BtEdt.Text:=LAdoDict.FieldByName('Context').AsString;
end;

procedure TFrm_NewCust.CustKindClick(Sender: TObject);
begin
  inherited;
  IF CustKind.Properties.ReadOnly=True Then Exit
  Else AddDict('CustKind','客户性质',1);
end;

procedure TFrm_NewCust.CustNamePropertiesChange(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  CustPY.Text:=Uppercase(GetPY(CustName.Text));
  IF Length(CustName.Text)>4 Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select CustName From Customer Where CustClass=:CustClass And  CustName Like '+'''%'+CustName.Text+'%''');
      IF ISCust Then
        Query.Parameters.ParamByName('CustClass').Value:=Boolean(1)
      Else Query.Parameters.ParamByName('CustClass').Value:=Boolean(0);
      Query.Prepared;
      Query.Open;
      IF Not Query.IsEmpty Then
        Begin
          IF GrdSame.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
          FOR I:=0 TO LDSSame.DataSet.FieldCount - 1 Do
            Begin
              GrdSame.CreateColumn;
              GrdSame.Columns[I].Name:='SameColumns'+IntToStr(I);
            End;
          GrdSame.DataController.DataSource:=LDSSame;
          GrdSame.Columns[0].Caption:='客户名称';
          GrdSame.Columns[0].DataBinding;
          GrdSame.Columns[0].DataBinding.FieldName:='CustName';
          GrdSame.Columns[0].DataBinding.ValueType:='String';
        End;
    End;
end;



end.
