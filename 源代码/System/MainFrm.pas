unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, Menus, ExtCtrls, dxNavBar, ComCtrls, ToolWin,
  dxNavBarCollns, cxClasses, dxNavBarBase, DB, ADODB, DataClass, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxDropDownEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, DBCtrls, Grids, DBGrids, bainaADOQuery, dxtree, dxdbtree,
  dxBar, cxLookAndFeels, cxPC, cxTreeView,
  cxContainer, cxLabel, ActnList,BaseDataFrom, XPMenu, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerDateNavigator, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerDBStorage,
  XPStyleActnCtrls, ActnMan, ActnCtrls, ActnMenus, ImgList, AppEvnts,
  cxSplitter, WinSkinData,SkinEQGrid, WinSkinStore, IniFiles,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxNavBar2Painter, dxSkinscxPCPainter,
  cxSchedulerHolidays, cxSchedulerGanttView, dxSkinscxScheduler3Painter;

  const
  WM_ChildFormClosed = WM_USER + $0001;
  WM_lmz = WM_USER + $0002 ;

type
  TMain_Frm = class(TBase_Frm)
    NavBar: TdxNavBar;
    NBCustomer: TdxNavBarGroup;
    NBSale: TdxNavBarGroup;
    NBService: TdxNavBarGroup;
    NBOffice: TdxNavBarGroup;
    NBSystem: TdxNavBarGroup;
    NBINewCust: TdxNavBarItem;
    NBICustManager: TdxNavBarItem;
    NBIContract: TdxNavBarItem;
    NBIProdCode: TdxNavBarItem;
    NBISaleManage: TdxNavBarItem;
    NBIPay: TdxNavBarItem;
    NBIExpend: TdxNavBarItem;
    NBICount: TdxNavBarItem;
    NBIPreService: TdxNavBarItem;
    NBIServiceing: TdxNavBarItem;
    NBIDay: TdxNavBarItem;
    NBIFileCenter: TdxNavBarItem;
    NBIBulletin: TdxNavBarItem;
    NBIEmail: TdxNavBarItem;
    NBIDict: TdxNavBarItem;
    NBIUser: TdxNavBarItem;
    NBIPassword: TdxNavBarItem;
    NBIRight: TdxNavBarItem;
    NBIOption: TdxNavBarItem;
    NBIMove: TdxNavBarItem;
    StatusBar1: TStatusBar;
    CoolBar1: TCoolBar;
    TBar: TToolBar;
    Mainmenu: TMainMenu;
    MSystem: TMenuItem;
    M_Frm_Dict: TMenuItem;
    M_Frm_User: TMenuItem;
    M_Frm_Password: TMenuItem;
    M_Frm_Right: TMenuItem;
    M_Frm_Option: TMenuItem;
    M_Frm_Move: TMenuItem;
    MCustomer: TMenuItem;
    M_Frm_CustManager: TMenuItem;
    M_Frm_Contract: TMenuItem;
    MSale: TMenuItem;
    M_Frm_ProdCode: TMenuItem;
    M_Frm_SaleManage: TMenuItem;
    M_Frm_Pay: TMenuItem;
    M_Frm_Expend: TMenuItem;
    M_Frm_Active: TMenuItem;
    M_Frm_Count: TMenuItem;
    MService: TMenuItem;
    M_Frm_PreService: TMenuItem;
    M_Frm_Select: TMenuItem;
    M_Frm_Serviceing: TMenuItem;
    MOffice: TMenuItem;
    M_Frm_Day: TMenuItem;
    M_Frm_FileCenter: TMenuItem;
    M_Frm_Bulletin: TMenuItem;
    M_Frm_Email: TMenuItem;
    M_Frm_Note: TMenuItem;
    MHelp: TMenuItem;
    M_Frm_HelpTools: TMenuItem;
    cxLookAndFeelController1: TcxLookAndFeelController;
    PopupMenu1: TPopupMenu;
    actlst1: TActionList;
    actDict: TAction;
    actUser: TAction;
    actPassword: TAction;
    actRight: TAction;
    actNewCust: TAction;
    actCustManager: TAction;
    DSWarn: TDataSource;
    Timer1: TTimer;
    actFileCenter: TAction;
    actProdcode: TAction;
    actContract: TAction;
    actExpend: TAction;
    actPreservice: TAction;
    actServiceing: TAction;
    actSelect: TAction;
    actBulletin: TAction;
    actDay: TAction;
    Storage: TcxSchedulerDBStorage;
    cxScheduler1: TcxScheduler;
    actsale: TAction;
    M_Frm_FArrearage: TMenuItem;
    M_Frm_Receive: TMenuItem;
    N1: TMenuItem;
    actFArrearage: TAction;
    actPReceive: TAction;
    actPay: TAction;
    actMove: TAction;
    M_Frm_ChangeUser: TMenuItem;
    actChange: TAction;
    actNote: TAction;
    actCount: TAction;
    skndt1: TSkinData;
    actmail: TAction;
    actabort: TAction;
    actSysSet: TAction;
    ImageList1: TImageList;
    M_Frm_SoundManager: TMenuItem;
    actTelphone: TAction;
    NBISounD: TdxNavBarItem;
    N2: TMenuItem;
    M_Frm_Style: TMenuItem;
    ImageList2: TImageList;
    //M_Frm_BaseSet: TMenuItem;
    N3: TMenuItem;
    M_Frm_BaseSet: TMenuItem;
    M_Frm_Supply: TMenuItem;
    ActSupply: TAction;
    N4: TMenuItem;
    NBISupply: TdxNavBarItem;
    cxPageControl1: TcxPageControl;
    M_Frm_abort: TMenuItem;
    NBCustomerControl: TdxNavBarGroupControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NBCustomerExpanded(Sender: TObject);
    procedure NBSaleExpanded(Sender: TObject);
    procedure NBServiceExpanded(Sender: TObject);
    procedure NBOfficeExpanded(Sender: TObject);
    procedure NBSystemExpanded(Sender: TObject);
    procedure actDictExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure actmailExecute(Sender: TObject);
    procedure actabortExecute(Sender: TObject);
    procedure actSysSetExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M_Frm_StyleClick(Sender: TObject);
    procedure M_Frm_BaseSetClick(Sender: TObject);
    procedure cxPageControl1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    procedure MenuItemClick(Sender: TObject);
    Procedure RefreshActive;
    Procedure CheckRight;
    Procedure RepeatWindow;
  public
     procedure ChildFormClosed(var msg: TMessage); message WM_LMZ;
    { Public declarations }
  end;

var
  Main_Frm: TMain_Frm;

implementation

Uses NewUser, LoginFrm, DataBase, Password, Right, Dict, Customer, NewCust, PublicClass,
  Warn, FileCenter, AddUserGrp, ProdCode, Contract, Expend, PreService,
  Select, Bulletin, Day, Sale, CustChange, FArrearage, PReceive, Pay, Note,
  Count,about,Sysset, EMailFrm, SoundMager, Style, Supply, BaseSet;

{$R *.dfm}



procedure TMain_Frm.FormCreate(Sender: TObject);
var
  StyleIni:TiniFile;
begin
  inherited;
  Styleini:=TiniFile.Create(ExtractFilePath(Application.ExeName)+'style.ini');
  Case StrToInt(Styleini.ReadString('option','style','')) OF
  1:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\mxskin28.skn';
  2:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\office2003.skn';
  3:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\mxskin24.skn';
  End;
  Styleini.Free;

  Skndt1.Active := True;
  Login_Frm := TLogin_Frm.Create(Self);
  with Login_Frm Do
  begin
    ShowModal;
  End;
  RepeatWindow;
end;

procedure TMain_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I:integer;
begin
  inherited;
  {FOR I:=PopupMenu1.Items.Count-1 DownTO 0 DO
    Begin
      MenuItemClick(PopupMenu1.Items.Items[I]);
    ENd;}
  Application.Terminate;
end;

procedure TMain_Frm.NBCustomerExpanded(Sender: TObject);
begin
  inherited;
  {NBSale.Expanded:=False;
  NBService.Expanded:=False;
  NBOffice.Expanded:=False;
  NBSystem.Expanded:=False;}
end;

procedure TMain_Frm.NBSaleExpanded(Sender: TObject);
begin
  inherited;
  {NBCustomer.Expanded:=False;
  NBService.Expanded:=False;
  NBOffice.Expanded:=False;
  NBSystem.Expanded:=False;}
end;

procedure TMain_Frm.NBServiceExpanded(Sender: TObject);
begin
  inherited;
  {NBCustomer.Expanded:=False;
  NBSale.Expanded:=False;
  NBOffice.Expanded:=False;
  NBSystem.Expanded:=False;}
end;

procedure TMain_Frm.NBOfficeExpanded(Sender: TObject);
begin
  inherited;
  {NBCustomer.Expanded:=False;
  NBSale.Expanded:=False;
  NBService.Expanded:=False;
  NBSystem.Expanded:=False;}
end;

procedure TMain_Frm.NBSystemExpanded(Sender: TObject);
begin
  inherited;
  {NBCustomer.Expanded:=False;
  NBSale.Expanded:=False;
  NBService.Expanded:=False;
  NBOffice.Expanded:=False;}
end;

procedure TMain_Frm.actDictExecute(Sender: TObject);
var
  tabname:String;
  M:Integer;
  StyleIni:TiniFile;
function ExistsTab(Tabname:String):Boolean;
var
  i:Integer;
begin
  Result := False;
  for i := 0 To cxPageControl1.PageCount -1 Do
  Begin
    if cxPageControl1.Pages[i].Name = Tabname Then
    Begin
       cxPageControl1.ActivePage := cxPageControl1.Pages[i];
       Result := True;
    End;
  End;
end;
begin
  if Sender = actDict Then  //密码修改
  Begin
    Frm_Password := TFrm_Password.Create(Self);
    Frm_Password.ComboDept.Enabled:=False;
    Frm_Password.ComboUser.Visible:=False;
    Frm_Password.EdtUser.Text:=DatabaseModule.dtclsData.UserName_;
    Frm_Password.BitBtn2.Enabled:=False;
    Frm_Password.ShowModal;
  End else if Sender = actUser Then //用户管理
  begin
    tabname := 'User';
    if ExistsTab(tabname) Then Exit;
    with TCxTabsheet.Create(cxPageControl1) do
    begin
      Name:=tabname;
      if ExistsTab(Name) Then exit;
      Caption:=TAction(Sender).Caption;
      PageControl:= cxPageControl1;
      CxPageControl1.ActivePage:=cxPageControl1.Pages[cxPageControl1.PageCount-1];
      Frm_User := TFrm_User.Create(CxPageControl1.ActivePage);
      Frm_User.Parent:= CxPageControl1.ActivePage;
      Frm_User.Show;

      PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
    end;
  end else if Sender = actPassword Then //恢复默认密码
  begin
    Frm_Password := TFrm_Password.Create(Self);
    Frm_Password.EdtUser.Visible:=False;
    Frm_Password.OldPassword.Enabled:=False;
    Frm_Password.FNewPassword.Enabled:=False;
    Frm_Password.SNewPassword.Enabled:=False;
    Frm_Password.BitBtn1.Enabled:=False;
    Frm_Password.ShowModal;
  end else if Sender = actRight Then //权限管理
  begin
    Frm_Right := TFrm_Right.Create(Self);
    Frm_Right.ShowModal;
  end else if Sender = actNewCust Then //新建客户
  begin
    Frm_NewCust := TFrm_NewCust.Create(Self);
    Frm_NewCust.CustNum.text:='';
    Frm_NewCust.CustName.Text:='';
    Frm_NewCust.CustZip.Text:='';
    Frm_NewCust.CustCountry.Text:='';
    Frm_NewCust.CustProv.Text:='';
    Frm_NewCust.CustCity.Text:='';
    Frm_NewCust.CustRegion.Text:='';
    Frm_NewCust.CustWeb.Text:='';
    Frm_NewCust.CustAdd.Text:='';
    Frm_NewCust.CustRate.Text:='';
    Frm_NewCust.CustSource.Text:='';
    Frm_NewCust.CustType.Text:='';
    Frm_NewCust.CustTrade.Text:='';
    Frm_NewCust.CustState.Text:='';
    Frm_NewCust.CustCredit.Text:='';
    Frm_NewCust.CustMemo.Text:='';
    Frm_NewCust.ShowModal;
  end else if Sender =actCustManager Then //客户管理
  begin
    tabname := 'Cust';
    if  ExistsTab(tabname) Then Exit;
    with TCxTabSheet.Create(CxPageControl1) do
    begin
      Name:= tabname;
      Caption:=TAction(Sender).Caption;
      PageControl:=CxPageControl1;
      CxPageControl1.ActivePage:=cxPageControl1.Pages[cxPageControl1.PageCount-1];
      Frm_CustManager := TFrm_CustManager.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoCust);
      Frm_CustManager.Parent:= CxPageControl1.ActivePage;
      Frm_CustManager.Show;
      Frm_CustManager.Panel3.Color := skinstyle.Color;
      Frm_CustManager.Color := skinstyle.Color;
      PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
    end;
  End Else IF Sender = ActFileCenter Then  //文件中心
    Begin
      TabName:='FileCenter';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_FileCenter:=TFrm_FileCenter.Create(CxPageControl1.ActivePage);
        Frm_FileCenter.Parent:=CxPageControl1.ActivePage;
        PNFile:=0;
        Frm_FileCenter.BorderStyle:=BSNone;
        Frm_FileCenter.WindowState:=WSMaximized;
        Frm_FileCenter.Align:=ALClient;
        Frm_FileCenter.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = ActProdcode Then  //产品代码
    Begin
      TabName:='prodcode';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Prodcode:=TFrm_Prodcode.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoProd);
        Frm_Prodcode.Parent:=CxPageControl1.ActivePage;
        Frm_Prodcode.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = ActContract Then  //合同管理
    Begin
      TabName:='Contract';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Contract:=TFrm_Contract.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoContract);
        Frm_Contract.Parent:=CxPageControl1.ActivePage;
        Frm_Contract.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = ActExpend Then  //费用管理
    Begin
      TabName:='Expend';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Expend:=TFrm_Expend.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoExpend);
        Frm_Expend.Parent:=CxPageControl1.ActivePage;
        Frm_Expend.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = actPreservice Then  //维护预约
    Begin
      TabName:='Preservice';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        //Frm_PreService:=TFrm_PreService.Create(CxPageControl1.ActivePage);
        Frm_PreService:=TFrm_Preservice.Createnew(CxPageControl1.ActivePage,DatabaseModule.AdoPreService);
        Frm_PreService.Parent:=CxPageControl1.ActivePage;
        Frm_Preservice.LPreService:=True;
        Frm_preservice.LProceService:=False;
        Frm_PreService.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = actserviceing Then  //维护实施
    Begin
      TabName:='serviceing';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_PreService:=TFrm_PreService.Create(CxPageControl1.ActivePage);
        Frm_PreService.Parent:=CxPageControl1.ActivePage;
        Frm_Preservice.LPreService:=False;
        Frm_preservice.LProceService:=True;
        Frm_PreService.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End else if Sender = actSelect Then //人员安排
    begin
      Frm_Select := TFrm_Select.Create(Self);
      Frm_Select.ShowModal;
    End Else IF Sender = actBulletin Then  //公告板
    Begin
      TabName:='Bulletin';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Bulletin:=TFrm_Bulletin.Create(CxPageControl1.ActivePage);
        Frm_Bulletin.Parent:=CxPageControl1.ActivePage;
        Frm_Bulletin.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = actDay Then  //日程安排
    Begin
      TabName:='Day';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Day:=TFrm_Day.Create(CxPageControl1.ActivePage);
        Frm_Day.Parent:=CxPageControl1.ActivePage;
        Frm_Day.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = actsale Then  //销售管理
    Begin
      TabName:='SaleManager';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_SaleManage:=TFrm_SaleManage.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoSale);
        Frm_SaleManage.Parent:=CxPageControl1.ActivePage;
        Frm_SaleManage.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = actMove Then  //客户资料变更
    Begin
      Frm_Move := TFrm_Move.Create(Self);
      Frm_Move.ShowModal;
    End Else IF Sender = actFArrearage Then
    Begin
      Frm_FArrearage:=TFrm_FArrearage.Create(Self);
      Frm_FArrearage.ShowModal;
    End Else IF Sender = actPReceive Then
    Begin
      Frm_Receive:=TFrm_Receive.Create(Self);
      Frm_Receive.ShowModal;
    End Else IF Sender = ActPay Then  //收款管理
    Begin
      TabName:='Pay';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Pay:=TFrm_Pay.Create(CxPageControl1.ActivePage);
        Frm_Pay.Parent:=CxPageControl1.ActivePage;
        Frm_Pay.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = ActChange Then //切换用户
    Begin
      for M := cxPageControl1.PageCount -1  DOWNTo 0  Do
        Begin
          TBaseData_Frm(cxPageControl1.Pages[M].Components[0]).Close;
          Frm_Pay:=Nil;
          Frm_Contract:=Nil;
          Frm_Expend:=Nil;
          Frm_Bulletin:=Nil;
        End;
        //------------lpj2013.09.16-------------
        for M := PopupMenu1.Items.Count -1 downTo 0 Do
             PopupMenu1.Items[M].Free;

        Self.Hide;
        Login_Frm := TLogin_Frm.Create(Self);
        with Login_Frm Do
        begin
          ShowModal;
        End;
        Self.Show;
        //------------------------------------------
        RepeatWindow;

    End Else IF Sender = ActNote Then  //通讯录
    Begin
      TabName:='Note';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Note:=TFrm_Note.Create(CxPageControl1.ActivePage);
        Frm_Note.Parent:=CxPageControl1.ActivePage;
        Frm_Note.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End Else IF Sender = ActCount Then  //统计分析
    Begin
      TabName:='Count';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_Count:=TFrm_Count.Create(CxPageControl1.ActivePage);
        Frm_Count.Parent:=CxPageControl1.ActivePage;
        Frm_Count.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End ELSE IF Sender = actTelphone Then  // 语音管理
    Begin
      TabName:='SoundManager';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        Frm_SoundManager:=TFrm_SoundManager.Create(CxPageControl1.ActivePage);
        Frm_SoundManager.Parent:=CxPageControl1.ActivePage;
        Frm_SoundManager.BorderStyle:=BSNone;
        Frm_SoundManager.WindowState:=WSMaximized;
        Frm_SoundManager.Align:=ALClient;
        Frm_SoundManager.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End ELSE IF Sender = actMail Then  // 邮件管理
    Begin
      TabName:='Mail';
      IF ExistsTab(TabName) Then Exit;
      With TCxTabSheet.Create(CxPageControl1) DO
      Begin
        Name:=TabName;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=CxPageControl1.Pages[CxPageControl1.pagecount-1];
        EMail_Frm:=TEMail_Frm.Create(CxPageControl1.ActivePage);
        EMail_Frm.Parent:=CxPageControl1.ActivePage;
        EMail_Frm.Show;

        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End;
    End else if Sender =actSupply Then //供应商管理
    begin
      tabname := 'Supply';
      if  ExistsTab(tabname) Then Exit;
      with TCxTabSheet.Create(CxPageControl1) do
      begin
        Name:= tabname;
        Caption:=TAction(Sender).Caption;
        PageControl:=CxPageControl1;
        CxPageControl1.ActivePage:=cxPageControl1.Pages[cxPageControl1.PageCount-1];
        Frm_Supply := TFrm_Supply.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoSupply);
        Frm_Supply.Parent:= CxPageControl1.ActivePage;
        Frm_Supply.Show;
        //Frm_Supply.Panel3.Color := skinstyle.Color;
        //Frm_Supply.Color := skinstyle.Color;
        PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+TAction(Sender).Caption;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
        PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
      End
    End;
    Styleini:=TiniFile.Create(ExtractFilePath(Application.ExeName)+'style.ini');
    Case StrToInt(Styleini.ReadString('option','style','')) OF
    1:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\mxskin28.skn';
    2:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\office2003.skn';
    3:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\mxskin24.skn';
    End;
    Styleini.Free;

end;

procedure TMain_Frm.MenuItemClick(Sender: TObject);
var
  i,t:Integer;
  tabname:String;
begin
  //鼠标双击关闭
  if cxPageControl1.PageCount = 0 Then Exit;
  tabname := Copy(TMenuItem(Sender).Name,4,Length(TMenuItem(Sender).Name) -3);
  for i := cxPageControl1.PageCount -1  DOWNTo 0  Do
  Begin
     if (cxPageControl1.Pages[i].Name = tabname)  and
        (cxPageControl1.Pages[i].ComponentCount >0)
     Then begin
        TBaseData_Frm(cxPageControl1.Pages[i].Components[0]).Close;
        IF TabName='Pay' Then Frm_Pay:=Nil;
        IF TabName='Contract' Then Frm_Contract:=Nil;
        IF TabName='Expend' Then Frm_Expend:=Nil;
        IF TabName='Bulletin' Then Frm_Bulletin:=Nil;
        IF TabName='SaleManager' Then Frm_SaleManage:=Nil;
        IF TabName='Pay' Then Frm_Pay:=Nil;
        //------------lpj2013.09.12-------------
        for t := PopupMenu1.Items.Count -1 downTo 0 Do
          if PopupMenu1.Items[t].Name = TMenuItem(Sender).Name Then
          begin
             PopupMenu1.Items[t].Free;
             exit;
          end;
        //------------------------------------------
     End;
  End;

end;

procedure TMain_Frm.RefreshActive;
begin
  
   With DataBaseModule Do
    Begin
      AdoDay.Close;
      AdoDay.SQL.Clear;
      AdoDay.SQL.Add('Select DayID,CustID,ActiveID,CustName,ContactName,DayType,ActualFinish,ActualStart,DayStart,DayFinish,');
      AdoDay.SQL.Add('DayOption,DayCaption,DayLocate,DayMessage,Reminderdate,ReminderMinutes,DayState,DayLabelColor,CreateBy_,CreateD_,BelongID');
      AdoDay.SQL.Add('From Day_ Where BelongID=:BelongID');
      AdoDay.Parameters.ParamByName('BelongID').Value:=Dtclsdata.UserID_;
      AdoDay.Prepared;
      AdoDay.Open;
    End;

  Storage.FieldNames.ActualStart:= 'ActualStart';
  Storage.FieldNames.ActualFinish:= 'ActualFinish';
  Storage.FieldNames.Caption:='DayCaption';
  Storage.FieldNames.EventType:='DayType';
  Storage.FieldNames.Finish:='DayFinish';
  Storage.FieldNames.ID:= 'DayID';
  Storage.FieldNames.Start:='DayStart';
  Storage.FieldNames.Message:='DayMessage';
  Storage.FieldNames.Options:='DayOption';
  Storage.FieldNames.Location:='DayLocate';
  Storage.FieldNames.LabelColor:='DayLabelColor';
  Storage.FieldNames.State:= 'DayState';
  Storage.FieldNames.ReminderMinutesBeforeStart:='ReminderMinutes';
  Storage.FieldNames.ReminderDate:='Reminderdate';
  Storage.CustomFields.ItemByFieldName('CustID').FieldName:='CustID';
  Storage.CustomFields.ItemByFieldName('CustName').FieldName:='CustName';
  Storage.CustomFields.ItemByFieldName('Contactname').FieldName:='Contactname';
  Storage.CustomFields.ItemByFieldName('CreateBy_').FieldName:='CreateBy_';
  Storage.CustomFields.ItemByFieldName('CreateD_').FieldName:='CreateD_';
  Storage.CustomFields.ItemByFieldName('BelongID').FieldName:='BelongID';
end;

procedure TMain_Frm.FormActivate(Sender: TObject);
begin
  inherited;
  {RefreshActive;
  StatusBar1.Panels[0].Text:='当前用户:'+DatabaseModule.dtclsData.UserName_;}
  
end;

procedure TMain_Frm.cxPageControl1Change(Sender: TObject);
begin
  inherited;
  IF (Frm_Pay<>Nil) And (Assigned(Frm_Pay)) Then Frm_Pay.N2.Click;
  IF (Frm_Expend<>Nil) And (Assigned(Frm_Expend)) Then Frm_Expend.N8.Click;
  IF (Frm_Contract<>Nil) And (Assigned(Frm_Contract)) Then Frm_Contract.actrefurbishExecute(self);
  IF (Frm_Bulletin<>Nil) And (Assigned(Frm_Bulletin)) Then Frm_Bulletin.N5.Click;
  IF (Frm_SaleManage<>Nil) And (Assigned(Frm_SaleManage)) Then Frm_SaleManage.N9.Click;
  IF (Frm_Pay<>Nil) And (Assigned(Frm_Pay)) Then Frm_Pay.N2.Click;
end;

procedure TMain_Frm.CheckRight;
var
  i,t,Hidecount:Integer;
  Frmname,MenuItemName:String;
begin
  //重画菜单和工具栏
  FOR I:=0 TO MainMenu.Items.Count - 1 DO
    Begin
      MainMenu.Items.Items[I].Visible:=True;
      FOR T:=0 To mainMenu.Items.Items[i].Count - 1 DO
        Begin
          //inMenu.Items.Items[i].Items[t].Visible := True;
          mainMenu.Items.Items[i].Items[t].Visible := mainMenu.Items.Items[i].Items[t].Visible;
        End;
    End;
  FOR i := 0 To  NavBar.Groups.Count -1 do
    Begin
      NavBar.Groups.Items[I].Visible:=True;
      FOR t := 0 To NavBar.Groups.Items[i].LinkCount -1 Do
        Begin
          NavBar.Groups.Items[i].Links[t].Item.Visible := True;
        End;
    End;
  M_Frm_Select.Visible:=False;
  //M_Frm_SoundManager.Visible:=False;
  M_Frm_Note.Visible:=False;
  M_Frm_Active.Visible:=False;
  //处理权限 (菜单)
  for i:= 0 To Mainmenu.Items.Count -1 Do
  begin
     Hidecount := 0;
     for t := 0 To mainMenu.Items.Items[i].Count -1 Do
     Begin
        MenuItemName := mainMenu.Items.Items[i].Items[t].Name;
        if Pos('Frm_',MenuItemName) > 0 Then
        Begin
            Frmname := Copy(MenuItemName,
              Pos('Frm_',MenuItemName),
              Length(MenuItemName) - Pos('Frm_',MenuItemName) + 1);
            if DataBase.DataBaseModule.dtclsData.AccByFromName(Frmname) <= 0 Then
            begin
              mainMenu.Items.Items[i].Items[t].Visible := False;
              Hidecount := Hidecount +1;
            end;
        End;
     end;
     if Hidecount = mainMenu.Items.Items[i].Count Then
       mainMenu.Items.Items[i].Visible := False;
  end;
  
  //处理权限(工具栏)
  for i := 0 To  NavBar.Groups.Count -1 do
  begin
    HideCount := 0 ;
    for t := 0 To NavBar.Groups.Items[i].LinkCount -1 Do
    Begin
      MenuItemName :=NavBar.Groups.Items[i].Links[t].Item.Name;
      if Pos('NBI',MenuItemName) > 0 Then
        Begin
            Frmname := Copy(MenuItemName,
              Pos('NBI',MenuItemName)+3,
              Length(MenuItemName) - Pos('NBI',MenuItemName) +1);
            Frmname := 'Frm_'+Frmname;
            if DataBase.DataBaseModule.dtclsData.AccByFromName(Frmname) <= 0 Then
            begin
              NavBar.Groups.Items[i].Links[t].Item.Visible := False;
              Hidecount := Hidecount +1;
            end;
        End;
    End;
    if Hidecount = NavBar.Groups.Items[i].LinkCount Then
       NavBar.Groups.Items[i].Visible := False;
  end;
end;

procedure TMain_Frm.actmailExecute(Sender: TObject);
begin
  inherited;
  {EMail_Frm := TEMail_Frm.Create(Self);
  EMail_Frm.Showmodal;}
end;

procedure TMain_Frm.actabortExecute(Sender: TObject);
begin
  inherited;
  Frm_About := TFrm_About.create(Self);
  Frm_About.Showmodal;
end;

procedure TMain_Frm.actSysSetExecute(Sender: TObject);
begin
  inherited;
  Frm_SysSet := TFrm_SysSet.Create(Self);
  Frm_SysSet.Showmodal;
end;

procedure TMain_Frm.RepeatWindow;
var
  i,t,Hidecount:Integer;
  Frmname,MenuItemName:String;
  StyleIni:TiniFile;
begin

  Styleini:=TiniFile.Create(ExtractFilePath(Application.ExeName)+'style.ini');
  Case StrToInt(Styleini.ReadString('option','style','')) OF
  1:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\mxskin28.skn';
  2:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\office2003.skn';
  3:Skndt1.SkinFile:=ExtractFilePath(Application.ExeName)+'Style\mxskin24.skn';
  End;
  Styleini.Free;
  InitStyle(skndt1);
  navbar.DefaultStyles.GroupBackground.BackColor := skinstyle.Color;
  navbar.DefaultStyles.GroupHeader.BackColor := skinstyle.Color;
  navbar.DefaultStyles.Background.BackColor :=  skinstyle.Color;
  CheckRight;
  RefreshActive;
  StatusBar1.Panels[0].Text:='当前用户:'+DatabaseModule.dtclsData.UserName_;
  actDictExecute(actBulletin);
end;

procedure TMain_Frm.FormShow(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
    Begin
      AdoShareSet.Close;
      AdoShareSet.SQL.Clear;
      AdoShareSet.SQL.Add('Select SharePath,ShareUser,SharePwd,ShareIP,DecDigit,CreateBy_,CreateD_,UpdateBy_,UpdateD_ From Shareset ');
      AdoShareSet.Prepared;
      AdoShareSet.Open;
      IF AdoShareSet.IsEmpty Then DecDigit:=0
      Else DecDigit:=AdoShareSet.FieldByName('DecDigit').AsInteger;
    End;
end;

procedure TMain_Frm.ChildFormClosed(var msg: TMessage);
var
  tabname:String;
  M:Integer;
function ExistsTab(Tabname:String):Boolean;
var
  i:Integer;
begin
  Result := False;
  for i := 0 To cxPageControl1.PageCount -1 Do
  Begin
    if cxPageControl1.Pages[i].Name = Tabname Then
    Begin
       cxPageControl1.ActivePage := cxPageControl1.Pages[i];
       Result := True;
    End;
  End;
end;
begin
  if msg.Msg = WM_lmz then
  begin
    tabname := 'Cust';
    if  ExistsTab(tabname) Then Exit;
    with TCxTabSheet.Create(CxPageControl1) do
    begin
      Name:= tabname;
      Caption:='客户管理';
      PageControl:=CxPageControl1;
      CxPageControl1.ActivePage:=cxPageControl1.Pages[cxPageControl1.PageCount-1];
      Frm_CustManager := TFrm_CustManager.CreateNew(CxPageControl1.ActivePage,DatabaseModule.AdoCust);
      Frm_CustManager.Parent:= CxPageControl1.ActivePage;
      Frm_CustManager.Show;
      Frm_CustManager.Panel3.Color := skinstyle.Color;
      Frm_CustManager.Color := skinstyle.Color;
      PopupMenu1.Items.Add(TMenuItem.Create(PopupMenu1));
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Caption :='关闭'+'客户管理';
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].Name := 'pop'+ tabname;
      PopupMenu1.Items.Items[PopupMenu1.Items.Count -1 ].OnClick := MenuItemClick;
    end;
    End;
end;

procedure TMain_Frm.M_Frm_StyleClick(Sender: TObject);
begin
  inherited;
  Frm_Style:=TFrm_Style.Create(Self);
  Frm_Style.ShowModal;
  RepeatWindow;
end;

procedure TMain_Frm.M_Frm_BaseSetClick(Sender: TObject);
begin
  inherited;
  Frm_BaseSet:=TFrm_BaseSet.Create(Self);
  Frm_BaseSet.ShowModal;
end;


//------------lpj2013.09.12 去掉PopupMenu属性PopupMenu1-------------
procedure TMain_Frm.cxPageControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pt: TPoint;
begin
  inherited;
  if Button = mbRight then
  begin
    GetCursorPos(pt);
    PopupMenu1.Popup(pt.x,pt.y);
  end;
end;
//--------------------------------------------------

end.
