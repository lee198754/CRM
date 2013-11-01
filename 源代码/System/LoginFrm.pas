unit LoginFrm;

interface                     

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxGraphics, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons,DataBase, DB, ADODB, bainaADOQuery, XPMenu,
  dxGDIPlusClasses, Buttons, ShellAPI, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, Sockets;

type
  TLogin_Frm = class(TBase_Frm)
    bndqryDepartment: TbainaADOQuery;
    dsdepartment: TDataSource;
    dsUsers: TDataSource;
    bndqryUser: TbainaADOQuery;
    Panel1: TPanel;
    img1: TImage;
    btn2: TSpeedButton;
    btn1: TSpeedButton;
    btn3: TSpeedButton;
    cxtxtdtpwd: TcxTextEdit;
    cbbDept: TcxLookupComboBox;
    cbbUserCode: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbbDeptPropertiesChange(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure cxtxtdtpwdKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login_Frm: TLogin_Frm;

implementation

uses MainFrm,publicclass;

{$R *.dfm}

procedure TLogin_Frm.FormCreate(Sender: TObject);
begin
  inherited;
  bndqryDepartment.Active := True;
  bndqryUser.Active := True;
  SetLoginLogo(img1);
  ShellExecute(0, 'OPEN', PChar('RegSvr32.exe'), PChar('/s TMNC_OCX.ocx'),
               PChar(ExtractFilePath(Application.ExeName)+'\ocx\'), SW_HIDE);
  IF Not DirectoryExists(ExtractFilePath(Application.ExeName)+'temp') Then
    Begin
      ForceDirectories(ExtractFilePath(Application.ExeName)+'temp');
    End
end;

procedure TLogin_Frm.cbbDeptPropertiesChange(Sender: TObject);
begin
  inherited;
  if (cbbDept.Text <> '') and (bndqryDepartment.Locate('DeptName_',cbbDept.Text,[])) Then
  begin
    bndqryUser.Filtered := False;
    bndqryUser.Filter   := 'DeptID_='+bndqryDepartment.FieldByname('DeptID_').AsString;
    bndqryUser.Filtered := True;
  end else
     bndqryUser.Filtered := False;
end;

procedure TLogin_Frm.btn2Click(Sender: TObject);
var
  ADO_Rec: TADOQuery;
begin
  inherited;

   if cbbUserCode.Text = '' Then
  begin
    ShowMessage('请选择用户名称!');
    Exit;
  End;

  if not DataBaseModule.dtclsData.CheckUser(cbbUserCode.Text,cxtxtdtpwd.Text) Then
  begin
    ShowMessage('用户名称或者密码不正确,请重新录入!');
    cxtxtdtpwd.SetFocus;
    Exit;
  End;


//--------------------lpj2013.09.13add------------------------------------
  ADO_Rec := DataBaseModule.dtclsData.Query('Select Count(*)  Total From Customer');
  if Assigned(ADO_Rec) and (ADO_Rec.FieldByName('Total').AsInteger-5 < c_ALLOWCOUNT) then
  begin
    if not DataBaseModule.IsCheckAdd then
    begin
      if ADO_Rec.RecordCount <= c_ALLOWCOUNT then
        Application.MessageBox(PChar('现在客户数为 '+IntToStr(ADO_Rec.RecordCount-5)+' 条 ,如果超过 '+IntToStr(c_ALLOWCOUNT)+' 条,则需要插入加密狗才能继续添加客户!'),'提示',MB_OK+MB_Iconwarning)
      else
        Application.MessageBox(PChar('现在客户数已经大于等于 '+IntToStr(c_ALLOWCOUNT)+' ,如需要继续添加客户请插入加密狗!'),'提示',MB_OK+MB_Iconwarning);
    end;
  end;
//------------------------------------------------------------------------------

  Close;
end;

procedure TLogin_Frm.btn1Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TLogin_Frm.btn3Click(Sender: TObject);
begin
  inherited;
  DataBaseModule.dtclsData.ConnectionSet;
  bndqryDepartment.Active := True;
  bndqryUser.Active := True;
end;

procedure TLogin_Frm.cxtxtdtpwdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF Key=13 Then Btn2.Click;
end;

procedure TLogin_Frm.FormShow(Sender: TObject);
var
  Tmp:String;
begin
  inherited;
  Tmp:=ExtractFilePath(Application.ExeName)+'\ini';
  if not DirectoryExists(Tmp) then
    CreateDir(Tmp);
end;

end.
