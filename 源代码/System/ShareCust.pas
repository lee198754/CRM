unit ShareCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBar, cxLookAndFeels, dxBarExtItems, ImgList,
  ActnList, XPMenu, Buttons, StdCtrls, ADODB, bainaADOQuery, cxContainer,
  DBCtrls,  cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, cxLookAndFeelPainters, dxSkinscxPCPainter;

type
  TFrm_ShareCust = class(TBaseData_Frm)
    UserDBTableView1: TcxGridDBTableView;
    UserLevel1: TcxGridLevel;
    User: TcxGrid;
    ShareUserDBTableView1: TcxGridDBTableView;
    ShareUserLevel1: TcxGridLevel;
    ShareUser: TcxGrid;
    BtnSure: TBitBtn;
    BtnExit: TBitBtn;
    DSShareCust: TDataSource;
    LAdoUser: TbainaADOQuery;
    LDSUser: TDataSource;
    LAdoDept: TbainaADOQuery;
    LDSDept: TDataSource;
    UserDBTableView1Column1: TcxGridDBColumn;
    CBXDeptName: TcxLookupComboBox;
    Label1: TLabel;
    ShareUserDBTableView1Column1: TcxGridDBColumn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    LUserTemp: TbainaADOQuery;
    LDSUserTemp: TDataSource;
    Memo1: TMemo;
    Label2: TLabel;
    Query: TbainaADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ShareCust: TFrm_ShareCust;

implementation

uses DataBase;

{$R *.dfm}

procedure TFrm_ShareCust.FormCreate(Sender: TObject);

begin
  inherited;
  LAdoDept.Close;
  LAdoDept.SQL.Clear;
  LAdoDept.SQL.Add('select DeptID_,DeptName_ From DepartMent_');
  LAdoDept.Prepared;
  LAdoDept.Open;
  LUserTemp.Close;
  LUserTemp.SQL.Clear;
  LUserTemp.SQL.Add('Select UserID,UserName From UserTemp');
  LUserTemp.Prepared;
  LUserTemp.Open;


end;

procedure TFrm_ShareCust.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

procedure TFrm_ShareCust.cxLookupComboBox1PropertiesChange(
  Sender: TObject);
begin
  inherited;
  if (CBXDeptName.Text <> '') and (LAdoDept.Locate('DeptName_',CBXDeptName.Text,[])) Then
  begin
    LAdoUser.Close;
    lAdoUser.SQL.Clear;
    LAdoUser.SQL.Add('Select UserID_,DeptID_,UserName_ From Users_ Where DeptID_=:DeptID');
    LAdoUser.Parameters.ParamByName('DeptID').Value:=LAdoDept.FieldByName('DeptID_').Value;
    LAdoUser.Prepared;
    LAdoUser.Open;
  End;
end;

procedure TFrm_ShareCust.BitBtn3Click(Sender: TObject);
begin
  inherited;
  IF LAdoUser.IsEmpty Then Exit;
  IF LUserTemp.Locate('UserID',LAdoUser.FieldByName('UserID_').AsInteger,[loCaseInsensitive]) Then Exit;
  LUserTemp.Append;
  LUserTemp.FieldByName('UserID').AsInteger:=LAdoUser.FieldByName('UserID_').AsInteger;
  LUserTemp.FieldByName('UserName').AsString:=LAdoUser.FieldByName('UserName_').AsString;
  LUserTemp.Prepared;
  LUserTemp.Post;
end;

procedure TFrm_ShareCust.BitBtn4Click(Sender: TObject);
begin
  inherited;
  IF LUserTemp.IsEmpty Then Exit;
  LUserTemp.Delete;
end;

procedure TFrm_ShareCust.BtnSureClick(Sender: TObject);
Var
  I:Integer;
  str: string;
begin
  inherited;
  IF LUserTemp.IsEmpty Then
  begin
    BtnExit.Click;
    Exit;
  end;
//-----------lpj2013.09.13add -----------------
  IF LUserTemp.IsEmpty Then
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('delete from ShareCust where CustID=:CustID and BelongID=:BelongID');
    Query.Parameters.ParamByName('CustID').Value:=DatabaseModule.AdoCust.FieldByName('CustID').Value;
    Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    Query.Prepared;
    Query.ExecSQL;
    Application.MessageBox('共享客户设置成功','系统提示',MB_OK+MB_Iconinformation);
    BtnExit.Click;
    Exit;
  end else
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('delete from ShareCust where CustID=:CustID and BelongID=:BelongID and ShareUserID not in (:ShareUserID)');
    for i := 1 to LUserTemp.RecordCount do
    begin
      str:=','+IntToStr(LUserTemp.FieldByName('UserID').Value);
    end;
    str := copy(str,2,Length(str));
    Query.Parameters.ParamByName('ShareUserID').Value := str;
    Query.Parameters.ParamByName('CustID').Value:=DatabaseModule.AdoCust.FieldByName('CustID').Value;
    Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    Query.Prepared;
    Query.ExecSQL;
  end;
//------------------------------------------------

  LUserTemp.First;
  FOR I:=1 TO LUserTemp.RecordCount DO
    Begin
      Query.Close;
//-----------lpj2013.09.13add -----------------
      Query.SQL.Clear;
      //Query.SQL.Add('if not exists(select 1 from ShareCust where CustID=:Cust and ShareUserID=:ShareUser)');
      Query.SQL.Add('select 1 from ShareCust where CustID=:Cust and ShareUserID=:ShareUser');
      Query.Parameters.ParamByName('Cust').Value:=DatabaseModule.AdoCust.FieldByName('CustID').Value;
      Query.Parameters.ParamByName('ShareUser').Value:=LUserTemp.FieldByName('UserID').Value;
      Query.Prepared;
      Query.Open;
      if Query.RecordCount >0 then
      begin
        Query.FieldByName('Memo').AsString:=Memo1.Text;
        Query.Post;
        Continue;
      end;
//------------------------------------------------

      Query.SQL.Clear;
      Query.SQL.Add(' insert into ShareCust (CustID,ShareUserID,ShareUserName,BelongID,CreateBy_,CreateD_,Memo)');
      Query.SQL.Add(' Values (:CustID,:ShareUserID,:ShareUserName,:BelongID,:CreateBy_,:CreateD_,:Memo)');
      //showmessage(query.SQL.Text);
      Query.Parameters.ParamByName('CustID').Value:=DatabaseModule.AdoCust.FieldByName('CustID').Value;
      Query.Parameters.ParamByName('ShareUserID').Value:=LUserTemp.FieldByName('UserID').Value;
      Query.Parameters.ParamByName('ShareUserName').Value:=LUserTemp.FieldByName('UserName').Value;
      Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
      Query.Parameters.ParamByName('CreateBy_').Value:=DatabaseModule.dtclsData.UserName_;
      Query.Parameters.ParamByName('CreateD_').Value:=Date;
      Query.Parameters.ParamByName('Memo').Value:=Memo1.Text;
      Query.Prepared;
      Query.ExecSQL;
      LuserTemp.Next;

    End;

  Application.MessageBox('共享客户设置成功','系统提示',MB_OK+MB_Iconinformation);
  BtnExit.Click;
end;

procedure TFrm_ShareCust.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

//--------------add lpj2013.09.13 -------------------------
procedure TFrm_ShareCust.FormShow(Sender: TObject);
begin
  inherited;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select ShareUserID UserID,ShareUserName UserName From ShareCust where CustID=:CustID and BelongID=:BelongID order by ShareUserID');
  Query.Parameters.ParamByName('CustID').Value:=DatabaseModule.AdoCust.FieldByName('CustID').Value;
  Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
  Query.Prepared;
  Query.Open;
  if Query.RecordCount > 0 then
  begin
    Query.First;
    while not Query.Eof do
    begin
      LUserTemp.Append;
      LUserTemp.FieldByName('UserID').AsInteger:=Query.FieldByName('UserID').AsInteger;
      LUserTemp.FieldByName('UserName').AsString:=Query.FieldByName('UserName').AsString;
      LUserTemp.Prepared;
      LUserTemp.Post;
      Query.Next;
    end;
  end;
end;
//---------------------------------------------------

end.
