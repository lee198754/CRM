unit Supply;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DateUtils, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, DB, StdCtrls, Buttons, ADODB, bainaADOQuery,
  ComCtrls, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxContainer, cxTreeView, Grids, DBGrids,
  cxEdit, cxLabel, ExtCtrls, cxFilter, cxData, cxDataStorage, cxDBData,
  cxPC, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxStatusBar, Menus, ShellApi,
  cxRadioGroup , cxGridExportLink, frxClass, frxDBSet, cxSplitter, cxMemo,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxBlobEdit,
  cxLookAndFeelPainters, cxButtons, cxHyperLinkEdit, dxdbtree, dxtree,
  OleCtrls, TMNC_OCX_TLB, MPlayer, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxSkinscxPCPainter ;

type
  TFrm_Supply = class(TBaseData_Frm)
    Panel1: TPanel;
    TreeView: TcxTreeView;
    PopupMenu1: TPopupMenu;
    Panel3: TPanel;
    CustSon: TcxPageControl;
    TabContact: TcxTabSheet;
    TabActive: TcxTabSheet;
    TabExpend: TcxTabSheet;
    TabSale: TcxTabSheet;
    TabContract: TcxTabSheet;
    TabSalePre: TcxTabSheet;
    TabFile: TcxTabSheet;
    TabHistory: TcxTabSheet;
    GrdContact: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DSCust: TDataSource;
    DSContact: TDataSource;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    GrdActive: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    DSActive: TDataSource;
    cxGrid4: TcxGrid;
    GrdHistory: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid5: TcxGrid;
    GrdExpend: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGrid6: TcxGrid;
    GrdSale: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGrid7: TcxGrid;
    GrdContract: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGrid8: TcxGrid;
    GrdPre: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    cxGrid9: TcxGrid;
    GrdFile: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    DSExpend: TDataSource;
    DSSale: TDataSource;
    DSContract: TDataSource;
    DSPre: TDataSource;
    DSFile: TDataSource;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N15: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Query: TbainaADOQuery;
    N19: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    dlgSave1: TSaveDialog;
    LAdoExpend: TbainaADOQuery;
    lbl1: TLabel;
    cxSplitter1: TcxSplitter;
    cxSplitter2: TcxSplitter;
    LAdoSale: TbainaADOQuery;
    LAdoCust: TbainaADOQuery;
    N26: TMenuItem;
    N27: TMenuItem;
    N29: TMenuItem;
    TabService: TcxTabSheet;
    LAdoService: TbainaADOQuery;
    LDSService: TDataSource;
    GrdService: TcxGridDBTableView;
    cxGrid10Level1: TcxGridLevel;
    cxGrid10: TcxGrid;
    cxtbsht1: TcxTabSheet;
    cxgrdbtblvwGrid11DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid11Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    bndqryTelQry: TbainaADOQuery;
    ds1: TDataSource;
    cxgrdbclmnGrid11DBTableView1FLocalNum: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1FRemoteNum: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1FDTStart: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1FLong: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1FIO: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1FFile: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1CustName: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1CustPhone: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1ContactName: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1ContactWorkPhone: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1ContactFamilyphone: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1ContactMobile: TcxGridDBColumn;
    cxgrdbclmnGrid11DBTableView1way: TcxGridDBColumn;
    DSDict: TDataSource;
    AdoRegion: TbainaADOQuery;
    Panel2: TPanel;
    Label1: TLabel;
    cbb1: TComboBox;
    mp1: TMediaPlayer;
    TrackBar1: TTrackBar;
    Panel4: TPanel;
    TMNC_OCXX1: TTMNC_OCXX;
    btn3: TcxButton;
    cxButton1: TcxButton;
    btn4: TcxButton;
    tmr1: TTimer;
    N30: TMenuItem;
    cxGrid1: TcxGrid;
    GrdCust: TcxGridDBTableView;
    GrdCustColumn1: TcxGridDBColumn;
    GrdCustColumn2: TcxGridDBColumn;
    GrdCustColumn3: TcxGridDBColumn;
    GrdCustColumn4: TcxGridDBColumn;
    GrdCustColumn5: TcxGridDBColumn;
    GrdCustColumn6: TcxGridDBColumn;
    GrdCustColumn7: TcxGridDBColumn;
    GrdCustColumn8: TcxGridDBColumn;
    GrdCustColumn9: TcxGridDBColumn;
    GrdCustColumn10: TcxGridDBColumn;
    GrdCustColumn11: TcxGridDBColumn;
    GrdCustColumn12: TcxGridDBColumn;
    GrdCustColumn13: TcxGridDBColumn;
    GrdCustColumn14: TcxGridDBColumn;
    GrdCustColumn15: TcxGridDBColumn;
    GrdCustColumn16: TcxGridDBColumn;
    GrdCustColumn17: TcxGridDBColumn;
    GrdCustColumn18: TcxGridDBColumn;
    GrdCustColumn19: TcxGridDBColumn;
    GrdCustColumn20: TcxGridDBColumn;
    GrdCustColumn21: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    RBShareCust: TcxRadioButton;
    RBMyCust: TcxRadioButton;
    GrdCustColumn22: TcxGridDBColumn;
    GrdCustColumn23: TcxGridDBColumn;
    GrdCustColumn24: TcxGridDBColumn;
    N31: TMenuItem;
    Panel5: TPanel;
    ProdFind: TcxTextEdit;
    cxButton2: TcxButton;
    GrdCustColumn25: TcxGridDBColumn;
    SupplyFind: TcxTextEdit;
    cxButton3: TcxButton;
    N32: TMenuItem;
    N33: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure GrdCustCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure RBMyCustClick(Sender: TObject);
    procedure RBShareCustClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure CustSonChange(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure GrdCustCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GrdContactCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N27Click(Sender: TObject);
    procedure GrdActiveCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GrdContractCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GrdExpendCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GrdPreCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure GrdServiceCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure TreeViewClick(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure tmr1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure cxgrdbtblvwGrid11DBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure TMNC_OCXX1Connect(ASender: TObject; const sHost: WideString);
    procedure TMNC_OCXX1DisConnect(ASender: TObject;
      const sHost: WideString);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ProdFindKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure SupplyFindKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure N33Click(Sender: TObject);
  private
    { Private declarations }
    Function GetFieldList:TStringList;
    Function GetRegionList:TStringList;
    Procedure showContact;
    Procedure ShowActive(IFFinish:Boolean);
    Procedure ShowContract;
    Procedure ShowExpend;
    Procedure ShowSale;
    Procedure ShowSalePre;
    Procedure ShowFile;
    Procedure ShowService;
    Procedure showMenuitem(Expend, SalePre, CustContact,Active,Contract,FileCenter:Boolean);
    Procedure SetupTree;
    Function CheckEditRight:Boolean;
    Function CheckDeleteRight:Boolean;
    procedure refreshtel ;
    Procedure SetupRegion;
  public
    { Public declarations }
    CustBeginDate,CustEndDate:String;
  end;

var
  Frm_Supply: TFrm_Supply;

implementation

uses DataBase, PublicClass, Dict, NewCust, CustContact, CustActive,
  MainFrm, Warn, NewContract, FileCenter, NewExpend, SalePre, ImportData,
  Day, Default, ReportFrom, ServiceRecord, SelectDate, SoundMager,
  LineSelect;

{$R *.dfm}
Var
  FieldList:TStringList;
  LSqlCust:Boolean;

{ TFrm_CustManager }

function TFrm_Supply.GetFieldList: TStringList;
begin
  FieldList.Clear;
  FieldList.Add(DatabaseModule.AdoDict.FieldByName('FieldName').AsString);
  FieldList.Add(DatabaseModule.AdoDict.FieldByName('Context').AsString);
  Result:=FieldList;
end;

procedure TFrm_Supply.N4Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          Frm_CustContact:=TFrm_CustContact.Create(Self);
          Frm_CustContact.BTNAdd.Click;
          Frm_CustContact.Tag:=1;
          ISCust:=False;
          Frm_CustContact.ShowModal;
        End;  
    End;
end;

procedure TFrm_Supply.N5Click(Sender: TObject);
begin
  inherited;
  IF Not (DSContact.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          Frm_CustContact:=TFrm_CustContact.Create(Self);
          Frm_CustContact.BTNEdit.Click;
          Frm_CustContact.Tag:=1;
          ISCust:=False;
          Frm_CustContact.ShowModal;
        End;
    End;
end;

procedure TFrm_Supply.N6Click(Sender: TObject);
begin
  inherited;

  IF Not (DSContact.DataSet.IsEmpty) Then
    Begin
      IF DatabaseModule.AdoContact.DeleteAcc(DSContact.DataSet.fieldbyname('BelongID').AsInteger)= True Then
        Begin
          IF Application.MessageBox('是否要删除该联系人','询问',MB_YESNO+MB_IconQuestion)=IDYES Then
            DSContact.DataSet.Delete;
        End
      Else
        Application.MessageBox('没有权限删除该资料','警告',MB_OK+MB_IconWarning);  
    End;
end;



procedure TFrm_Supply.GrdCustCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);

begin
  inherited;
  IF CustSon.ActivePage=TabContact Then ShowContact;
  IF CustSon.ActivePage=TabActive Then ShowActive(False)
  Else ShowActive(True);
  IF CustSon.ActivePage=TabContract Then ShowContract;
  IF CustSon.ActivePage=TabExpend Then ShowExpend;
  IF CustSon.ActivePage=TabSale Then ShowSale;
  IF CustSon.ActivePage=TabSalePre Then ShowSalePre;
  IF CustSon.ActivePage=TabFile Then ShowFile;
  IF CustSon.ActivePage=TabService Then ShowService;
  if CustSon.ActivePage = cxtbsht1 then refreshtel ;
  IF Assigned(Frm_NewCust) Then Frm_NewCust.ShowCustRecord;

  CustSon.PopupMenu:=PopupMenu1;
end;

procedure TFrm_Supply.showContact;
Var
  I:Integer;
begin
  inherited;
  With DatabaseModule.AdoContact DO
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select ContactName,ContactValue,DepartMent,ContactSex,ContactDuty,ContactBirthday,Contactworkphone,ContactFax,');
      SQL.Add('contactFamilyphone,ContactMobile,ContactICQ,ContactEmail,ContactAddress,ContactMemo,CustID,CreateD_,CreateBy_,Updated_,UpdateBy_,BelongID');
      //SQL.Add('From Contact where CustID_= ' + inttostr(DSCust.DataSet.fieldbyname('CustID').AsInteger));
      SQL.Add('From Contact where CustID=:CustID');
      Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
      Open;
    End;

  IF GrdContact.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdContact.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO DataBaseModule.AdoContact.FieldCount - 7 Do
    Begin
      GrdContact.CreateColumn;
      GrdContact.Columns[I].Name:='ContactColumns'+IntToStr(I);
   End;
          GrdContact.DataController.DataSource:=DSContact;
          GrdContact.Columns[0].Caption:='联系人名';
          GrdContact.Columns[0].DataBinding;
          GrdContact.Columns[0].DataBinding.FieldName:='ContactName';
          GrdContact.Columns[0].DataBinding.ValueType:='String';

          GrdContact.Columns[1].Caption:='人物属性';
          GrdContact.Columns[1].DataBinding;
          GrdContact.Columns[1].DataBinding.FieldName:='ContactValue';
          GrdContact.Columns[1].DataBinding.ValueType:='String';

          GrdContact.Columns[2].Caption:='工作电话';
          GrdContact.Columns[2].DataBinding;
          GrdContact.Columns[2].DataBinding.FieldName:='Contactworkphone';
          GrdContact.Columns[2].DataBinding.ValueType:='String';

          GrdContact.Columns[3].Caption:='传真';
          GrdContact.Columns[3].DataBinding;
          GrdContact.Columns[3].DataBinding.FieldName:='ContactFax';
          GrdContact.Columns[3].DataBinding.ValueType:='String';

          GrdContact.Columns[4].Caption:='直线电话';
          GrdContact.Columns[4].DataBinding;
          GrdContact.Columns[4].DataBinding.FieldName:='contactFamilyphone';
          GrdContact.Columns[4].DataBinding.ValueType:='String';

          GrdContact.Columns[5].Caption:='手机';
          GrdContact.Columns[5].DataBinding;
          GrdContact.Columns[5].DataBinding.FieldName:='ContactMobile';
          GrdContact.Columns[5].DataBinding.ValueType:='String';

          GrdContact.Columns[6].Caption:='邮箱';
          GrdContact.Columns[6].DataBinding;
          GrdContact.Columns[6].DataBinding.FieldName:='ContactEmail';
          GrdContact.Columns[6].DataBinding.ValueType:='String';

          GrdContact.Columns[7].Caption:='地址';
          GrdContact.Columns[7].DataBinding;
          GrdContact.Columns[7].DataBinding.FieldName:='ContactAddress';
          GrdContact.Columns[7].DataBinding.ValueType:='String';

          GrdContact.Columns[8].Caption:='部门';
          GrdContact.Columns[8].DataBinding;
          GrdContact.Columns[8].DataBinding.FieldName:='DepartMent';
          GrdContact.Columns[8].DataBinding.ValueType:='String';

          GrdContact.Columns[9].Caption:='性别';
          GrdContact.Columns[9].DataBinding;
          GrdContact.Columns[9].DataBinding.FieldName:='ContactSex';
          GrdContact.Columns[9].DataBinding.ValueType:='String';

          GrdContact.Columns[10].Caption:='职务';
          GrdContact.Columns[10].DataBinding;
          GrdContact.Columns[10].DataBinding.FieldName:='ContactDuty';
          GrdContact.Columns[10].DataBinding.ValueType:='String';

          GrdContact.Columns[11].Caption:='生日';
          GrdContact.Columns[11].DataBinding;
          GrdContact.Columns[11].DataBinding.FieldName:='ContactBirthday';
          GrdContact.Columns[11].DataBinding.ValueType:='String';

          GrdContact.Columns[12].Caption:='QQ';
          GrdContact.Columns[12].DataBinding;
          GrdContact.Columns[12].DataBinding.FieldName:='ContactICQ';
          GrdContact.Columns[12].DataBinding.ValueType:='String';

          GrdContact.Columns[13].Caption:='客户ID';
          GrdContact.Columns[13].DataBinding;
          GrdContact.Columns[13].DataBinding.FieldName:='CustID';
          GrdContact.Columns[13].DataBinding.ValueType:='Float';
       GrdContact.OptionsView.ScrollBars:=SSBoth;

end;

procedure TFrm_Supply.N9Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          ISAdd:=True;
          ISEdit:=False;
          PNActive:=5;
          Frm_CustActive:=TFrm_CustActive.Create(Self);
          Frm_CustActive.cxTabSheet1.TabVisible:=True;
          Frm_CustActive.cxTabSheet2.TabVisible:=False;
          Frm_CustActive.ShowModal;
          ShowActive(False);
        End;  
    End;
end;

procedure TFrm_Supply.N10Click(Sender: TObject);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          ISEdit:=True;
          ISAdd:=False;
          PNActive:=5;
          Frm_CustActive:=TFrm_CustActive.Create(Self);
          Frm_CustActive.cxTabSheet1.TabVisible:=True;
          Frm_CustActive.cxTabSheet2.TabVisible:=False;
          Frm_CustActive.ShowModal;
        End;
    End;
end;

procedure TFrm_Supply.ShowActive(IFFinish:Boolean);
Var
  I:Integer;
begin
  inherited;
  With DataBaseModule Do
    Begin
      AdoActive.Close;
      AdoActive.SQL.Clear;
      AdoActive.SQL.Add('Select ActiveNum,DeptID_,CustID,UserID,ProJNum,ContactName,ActiveName,ActiveText,ActiveType,ActivePlace,ActiveMode,ActiveOption,ActiveBeginDate,ActiveEndDate,ActiveBeginTime,ActiveEndTime,IFFinish');
      AdoActive.SQL.Add(',IFWarn,StartWarn,ActiveMemo,WarnBeginDate,WarnEndDate,WarnBeginTime,WarnEndTime,IFAllDay,CreateBy_,CreateD_,BelongID,UpdateBy_,UpdateD_');
      AdoActive.SQL.Add('From CustActive Where ActiveOption=:ActiveOption And CustID=:CustID And IFFinish=:IFFinish');
      AdoActive.Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
      AdoActive.Parameters.ParamByName('IFFInish').Value:=IFFinish;
      AdoActive.Parameters.ParamByName('ActiveOption').Value:=5;
      AdoActive.Prepared;
      AdoActive.Open;
    End;

  IF GrdActive.ColumnCount=0 Then
  Begin
  //GrdActive.OptionsView.ScrollBars:=SSNone;
    FOR I:=0 TO DataBaseModule.AdoActive.FieldCount - 20 Do
      Begin
        GrdActive.CreateColumn;
        GrdHistory.CreateColumn;
        GrdActive.Columns[I].Name:='ActiveColumns'+IntToStr(I);
        GrdHistory.Columns[I].Name:='History'+IntToStr(I);
     End;
   End;
   IF IFFinish=False Then
     Begin
          GrdActive.DataController.DataSource:=DSActive;
          GrdActive.Columns[0].Caption:='主题';
          GrdActive.Columns[0].DataBinding;
          GrdActive.Columns[0].DataBinding.FieldName:='ActiveName';
          GrdActive.Columns[0].DataBinding.ValueType:='String';

          GrdActive.Columns[1].Caption:='联系人名';
          GrdActive.Columns[1].DataBinding;
          GrdActive.Columns[1].DataBinding.FieldName:='ContactName';
          GrdActive.Columns[1].DataBinding.ValueType:='String';

          GrdActive.Columns[2].Caption:='活动类型';
          GrdActive.Columns[2].DataBinding;
          GrdActive.Columns[2].DataBinding.FieldName:='ActiveType';
          GrdActive.Columns[2].DataBinding.ValueType:='String';

          GrdActive.Columns[3].Caption:='活动方式';
          GrdActive.Columns[3].DataBinding;
          GrdActive.Columns[3].DataBinding.FieldName:='ActiveMode';
          GrdActive.Columns[3].DataBinding.ValueType:='String';

          GrdActive.Columns[4].Caption:='活动场所';
          GrdActive.Columns[4].DataBinding;
          GrdActive.Columns[4].DataBinding.FieldName:='ActivePlace';
          GrdActive.Columns[4].DataBinding.ValueType:='String';

          GrdActive.Columns[5].Caption:='活动内容';
          GrdActive.Columns[5].DataBinding;
          GrdActive.Columns[5].DataBinding.FieldName:='Activetext';
          GrdActive.Columns[5].DataBinding.ValueType:='String';
          GrdActive.Columns[5].Width:=100;

          GrdActive.Columns[6].Caption:='是否完成';
          GrdActive.Columns[6].DataBinding;
          GrdActive.Columns[6].DataBinding.FieldName:='IFFinish';
          GrdActive.Columns[6].DataBinding.ValueType:='Boolean';
          GrdActive.Columns[6].Width:=60;

          GrdActive.Columns[7].Caption:='开始日期';
          GrdActive.Columns[7].DataBinding;
          GrdActive.Columns[7].DataBinding.FieldName:='ActiveBeginDate';
          GrdActive.Columns[7].DataBinding.ValueType:='Datetime';

          GrdActive.Columns[8].Caption:='开始时间';
          GrdActive.Columns[8].DataBinding;
          GrdActive.Columns[8].DataBinding.FieldName:='ActiveBeginTime';
          GrdActive.Columns[8].DataBinding.ValueType:='Datetime';

          GrdActive.Columns[9].Caption:='结束日期';
          GrdActive.Columns[9].DataBinding;
          GrdActive.Columns[9].DataBinding.FieldName:='ActiveEndDate';
          GrdActive.Columns[9].DataBinding.ValueType:='Datatime';

          GrdActive.Columns[10].Caption:='结束时间';
          GrdActive.Columns[10].DataBinding;
          GrdActive.Columns[10].DataBinding.FieldName:='ActiveEndTime';
          GrdActive.Columns[10].DataBinding.ValueType:='Datatime';
      //GrdActive.OptionsView.ScrollBars:=SSNone;
     End
   Else
     Begin
          GrdHistory.DataController.DataSource:=DSActive;
          GrdHistory.Columns[0].Caption:='主题';
          GrdHistory.Columns[0].DataBinding;
          GrdHistory.Columns[0].DataBinding.FieldName:='ActiveName';
          GrdHistory.Columns[0].DataBinding.ValueType:='String';

          GrdHistory.Columns[1].Caption:='联系人名';
          GrdHistory.Columns[1].DataBinding;
          GrdHistory.Columns[1].DataBinding.FieldName:='ContactName';
          GrdHistory.Columns[1].DataBinding.ValueType:='String';

          GrdHistory.Columns[2].Caption:='活动类型';
          GrdHistory.Columns[2].DataBinding;
          GrdHistory.Columns[2].DataBinding.FieldName:='ActiveType';
          GrdHistory.Columns[2].DataBinding.ValueType:='String';

          GrdHistory.Columns[3].Caption:='活动方式';
          GrdHistory.Columns[3].DataBinding;
          GrdHistory.Columns[3].DataBinding.FieldName:='ActiveMode';
          GrdHistory.Columns[3].DataBinding.ValueType:='String';

          GrdHistory.Columns[4].Caption:='活动场所';
          GrdHistory.Columns[4].DataBinding;
          GrdHistory.Columns[4].DataBinding.FieldName:='ActivePlace';
          GrdHistory.Columns[4].DataBinding.ValueType:='String';

          GrdHistory.Columns[5].Caption:='活动内容';
          GrdHistory.Columns[5].DataBinding;
          GrdHistory.Columns[5].DataBinding.FieldName:='Activetext';
          GrdHistory.Columns[5].DataBinding.ValueType:='String';
          GrdHistory.Columns[5].Width:=100;

          GrdHistory.Columns[6].Caption:='是否完成';
          GrdHistory.Columns[6].DataBinding;
          GrdHistory.Columns[6].DataBinding.FieldName:='IFFinish';
          GrdHistory.Columns[6].DataBinding.ValueType:='Boolean';
          GrdHistory.Columns[6].Width:=60;

          GrdHistory.Columns[7].Caption:='开始日期';
          GrdHistory.Columns[7].DataBinding;
          GrdHistory.Columns[7].DataBinding.FieldName:='ActiveBeginDate';
          GrdHistory.Columns[7].DataBinding.ValueType:='Datetime';

          GrdHistory.Columns[8].Caption:='结束日期';
          GrdHistory.Columns[8].DataBinding;
          GrdHistory.Columns[8].DataBinding.FieldName:='ActiveEndDate';
          GrdHistory.Columns[8].DataBinding.ValueType:='Datatime';
      //GrdActive.OptionsView.ScrollBars:=SSNone;
     End;
end;

procedure TFrm_Supply.ShowContract;
Var
  I:Integer;
begin
  inherited;
  With DatabaseModule.AdoContract DO
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select DeptID_,CustId,ContractNum,ContractTitle,ContractContent,WriteMan,WriteDate,ContractMan,ContractBeginDate');
      SQL.Add(',ContractEndDate,ContractMoney,ContractType,ContractExecute,IFCheck,CheckMan,CheckDate,CreateD_,CreateBy_,Updated_,UpdateBy_,BelongID');
      SQL.Add('From Contract where CustID=:CustID');
      I:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
      Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
      Open;
    End;

  IF GrdContract.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdContract.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO DataBaseModule.AdoContract.FieldCount - 8 Do
    Begin
      GrdContract.CreateColumn;
      GrdContract.Columns[I].Name:='ContractColumns'+IntToStr(I);
   End;
          GrdContract.DataController.DataSource:=DSContract;
          GrdContract.Columns[0].Caption:='合同编号';
          GrdContract.Columns[0].DataBinding;
          GrdContract.Columns[0].DataBinding.FieldName:='ContractNum';
          GrdContract.Columns[0].DataBinding.ValueType:='String';

          GrdContract.Columns[1].Caption:='合同名称';
          GrdContract.Columns[1].DataBinding;
          GrdContract.Columns[1].DataBinding.FieldName:='ContractTitle';
          GrdContract.Columns[1].DataBinding.ValueType:='String';
          GrdContract.Columns[1].Width:=150;

          GrdContract.Columns[2].Caption:='签订方负责人';
          GrdContract.Columns[2].DataBinding;
          GrdContract.Columns[2].DataBinding.FieldName:='ContractMan';
          GrdContract.Columns[2].DataBinding.ValueType:='String';

          GrdContract.Columns[3].Caption:='签订日期';
          GrdContract.Columns[3].DataBinding;
          GrdContract.Columns[3].DataBinding.FieldName:='WriteDate';
          GrdContract.Columns[3].DataBinding.ValueType:='DateTime';

          GrdContract.Columns[4].Caption:='负责人';
          GrdContract.Columns[4].DataBinding;
          GrdContract.Columns[4].DataBinding.FieldName:='WriteMan';
          GrdContract.Columns[4].DataBinding.ValueType:='String';

          GrdContract.Columns[5].Caption:='合同生效日期';
          GrdContract.Columns[5].DataBinding;
          GrdContract.Columns[5].DataBinding.FieldName:='ContractBeginDate';
          GrdContract.Columns[5].DataBinding.ValueType:='DateTime';

          GrdContract.Columns[6].Caption:='合同结束日期';
          GrdContract.Columns[6].DataBinding;
          GrdContract.Columns[6].DataBinding.FieldName:='ContractEndDate';
          GrdContract.Columns[6].DataBinding.ValueType:='DateTime';

          GrdContract.Columns[7].Caption:='合同内容';
          GrdContract.Columns[7].DataBinding;
          GrdContract.Columns[7].DataBinding.FieldName:='ContractContent';
          GrdContract.Columns[7].DataBinding.ValueType:='String';

          GrdContract.Columns[8].Caption:='合同类型';
          GrdContract.Columns[8].DataBinding;
          GrdContract.Columns[8].DataBinding.FieldName:='ContractType';
          GrdContract.Columns[8].DataBinding.ValueType:='String';

          GrdContract.Columns[9].Caption:='执行情况';
          GrdContract.Columns[9].DataBinding;
          GrdContract.Columns[9].DataBinding.FieldName:='ContractExecute';
          GrdContract.Columns[9].DataBinding.ValueType:='String';

          GrdContract.Columns[10].Caption:='是否审核';
          GrdContract.Columns[10].DataBinding;
          GrdContract.Columns[10].DataBinding.FieldName:='IFCheck';
          GrdContract.Columns[10].DataBinding.ValueType:='Boolean';
          GrdContract.Columns[10].Width:=60;

          GrdContract.Columns[11].Caption:='审核人';
          GrdContract.Columns[11].DataBinding;
          GrdContract.Columns[11].DataBinding.FieldName:='CheckMan';
          GrdContract.Columns[11].DataBinding.ValueType:='String';

          GrdContract.Columns[12].Caption:='审核日期';
          GrdContract.Columns[12].DataBinding;
          GrdContract.Columns[12].DataBinding.FieldName:='CheckDate';
          GrdContract.Columns[12].DataBinding.ValueType:='DataTime';

       GrdContract.OptionsView.ScrollBars:=SSBoth;

end;

procedure TFrm_Supply.ShowExpend;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      AdoExpend.Close;
      AdoExpend.SQL.Clear;
      AdoExpend.SQL.Add('Select a.CustName,B.ActiveNum,B.DeptID_,b.CustID,b.ExpendType,b.ExpendOption,b.ExpendMoney,B.ExpendDate,b.ExpendMemo,b.CreateBy_,b.CreateD_,B.UpdateBY_,B.UpdateD_,B.BelongID,B.CheckMan,B.CheckDate,B.IFCheck,C.UserName_');
      AdoExpend.SQL.Add(' From Customer a,Expend b,Users_ C Where B.ExpendOption=:ExpendOption And b.CustID=:CustID And a.CustID=B.CustID And B.BelongID=C.UserID_');
      AdoExpend.Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldByName('CustID').AsInteger;
      AdoExpend.Parameters.ParamByName('ExpendOption').Value:=5;
      AdoExpend.Prepared;
      AdoExpend.Open;
    End;

  IF GrdExpend.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdExpend.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO DSExpend.DataSet.FieldCount - 12 Do
    Begin
      GrdExpend.CreateColumn;
      GrdExpend.Columns[I].Name:='ExpendColumns'+IntToStr(I);
   End;
          GrdExpend.DataController.DataSource:=DSExpend;
          GrdExpend.Columns[0].Caption:='费用类型';
          GrdExpend.Columns[0].DataBinding;
          GrdExpend.Columns[0].DataBinding.FieldName:='ExpendType';
          GrdExpend.Columns[0].DataBinding.ValueType:='String';

          GrdExpend.Columns[1].Caption:='费用金额';
          GrdExpend.Columns[1].DataBinding;
          GrdExpend.Columns[1].DataBinding.FieldName:='ExpendMoney';
          GrdExpend.Columns[1].DataBinding.ValueType:='Float';
          GrdExpend.Columns[1].Width:=150;

          GrdExpend.Columns[2].Caption:='发生日期';
          GrdExpend.Columns[2].DataBinding;
          GrdExpend.Columns[2].DataBinding.FieldName:='ExpendDate';
          GrdExpend.Columns[2].DataBinding.ValueType:='Datetime';

          GrdExpend.Columns[3].Caption:='业务归属';
          GrdExpend.Columns[3].DataBinding;
          GrdExpend.Columns[3].DataBinding.FieldName:='UserName_';
          GrdExpend.Columns[3].DataBinding.ValueType:='String';

          GrdExpend.Columns[4].Caption:='是否审核';
          GrdExpend.Columns[4].DataBinding;
          GrdExpend.Columns[4].DataBinding.FieldName:='IFCheck';
          GrdExpend.Columns[4].DataBinding.ValueType:='Boolean';
          GrdExpend.Columns[4].Width:=60;

          GrdExpend.Columns[5].Caption:='审核人';
          GrdExpend.Columns[5].DataBinding;
          GrdExpend.Columns[5].DataBinding.FieldName:='CheckMan';
          GrdExpend.Columns[5].DataBinding.ValueType:='String';

          GrdExpend.Columns[6].Caption:='审核日期';
          GrdExpend.Columns[6].DataBinding;
          GrdExpend.Columns[6].DataBinding.FieldName:='CheckDate';
          GrdExpend.Columns[6].DataBinding.ValueType:='Datetime';
       GrdExpend.OptionsView.ScrollBars:=SSBoth;
end;

procedure TFrm_Supply.ShowFile;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      CustFile.Close;
      CustFile.SQL.Clear;
      CustFile.SQL.Add('Select a.FileIDM,a.custID,b.FileID,b.MyFileName,b.BelongID,b.DeptID_,b.UserID,b.CustID,b.FileType,b.ProJNum,b.FilePath,b.FileSelfID,b.CreateBy_,b.CreateD_,b.UpdateBy_,b.UpdateD_');
      CustFile.SQL.Add(' From SupplyFile a,FileCenter b Where a.CustID=:CustID And a.FileIDM=B.FileID');
      CustFile.Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldByName('CustID').AsInteger;
      CustFile.Prepared;
      CustFile.Open;
    End;

  IF GrdFile.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdFile.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO DataBaseModule.CustFile.FieldCount - 14 Do
    Begin
      GrdFile.CreateColumn;
      GrdFile.Columns[I].Name:='FileColumns'+IntToStr(I);
   End;
          GrdFile.DataController.DataSource:=DSFile;
          GrdFile.Columns[0].Caption:='文件名称';
          GrdFile.Columns[0].DataBinding;
          GrdFile.Columns[0].DataBinding.FieldName:='MYFileName';
          GrdFile.Columns[0].DataBinding.ValueType:='String';

          GrdFile.Columns[1].Caption:='文件类型';
          GrdFile.Columns[1].DataBinding;
          GrdFile.Columns[1].DataBinding.FieldName:='FileType';
          GrdFile.Columns[1].DataBinding.ValueType:='String';
          GrdFile.Columns[1].Width:=150;

          GrdFile.Columns[2].Caption:='创建日期';
          GrdFile.Columns[2].DataBinding;
          GrdFile.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdFile.Columns[2].DataBinding.ValueType:='Datetime';

       GrdFile.OptionsView.ScrollBars:=SSBoth;

end;

procedure TFrm_Supply.ShowSale;
Var
  I:Integer;
begin

      LAdoSale.Close;
      LAdoSale.SQL.Clear;
      LAdoSale.SQL.Add(' Select a.CustID,b.PurchaseID,b.PurchaseNum,d.Username_,b.IFCheck,b.IFFinish,c.ProdName,c.PurchaseCount,c.PurchaseAgio,c.PurchaseTotal');
      LAdoSale.SQL.Add(' From Customer a,PurchaseMain b,PurchaseDetail c,Users_ d ');
      LAdoSale.SQL.Add(' Where A.CustID=:CustID And A.CustID=B.SupplyID And B.PurchaseID=C.PurchaseID And B.BelongID=D.UserID_ ');
      LAdoSale.Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldByName('CustID').AsInteger;
      LAdoSale.Prepared;
      LAdoSale.Open;


  IF GrdSale.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LAdoSale.FieldCount - 2 Do
    Begin
      GrdSale.CreateColumn;
      GrdSale.Columns[I].Name:='SaleColumns'+IntToStr(I);
   End;
          GrdSale.DataController.DataSource:=DSSale;
          GrdSale.Columns[0].Caption:='采购单号';
          GrdSale.Columns[0].DataBinding;
          GrdSale.Columns[0].DataBinding.FieldName:='PurchaseID';
          GrdSale.Columns[0].DataBinding.ValueType:='String';

          GrdSale.Columns[1].Caption:='原始票据号';
          GrdSale.Columns[1].DataBinding;
          GrdSale.Columns[1].DataBinding.FieldName:='PurchaseNum';
          GrdSale.Columns[1].DataBinding.ValueType:='String';

          GrdSale.Columns[2].Caption:='归属人';
          GrdSale.Columns[2].DataBinding;
          GrdSale.Columns[2].DataBinding.FieldName:='UserName_';
          GrdSale.Columns[2].DataBinding.ValueType:='String';

          GrdSale.Columns[3].Caption:='是否审核';
          GrdSale.Columns[3].DataBinding;
          GrdSale.Columns[3].DataBinding.FieldName:='IFCheck';
          GrdSale.Columns[3].DataBinding.ValueType:='Boolean';
          GrdSale.Columns[3].Width:=60;

          GrdSale.Columns[4].Caption:='是否付完';
          GrdSale.Columns[4].DataBinding;
          GrdSale.Columns[4].DataBinding.FieldName:='IFFinish';
          GrdSale.Columns[4].DataBinding.ValueType:='Boolean';
          GrdSale.Columns[4].Width:=60;

          GrdSale.Columns[5].Caption:='产品名称';
          GrdSale.Columns[5].DataBinding;
          GrdSale.Columns[5].DataBinding.FieldName:='ProdName';
          GrdSale.Columns[5].DataBinding.ValueType:='String';

          GrdSale.Columns[6].Caption:='销售数量';
          GrdSale.Columns[6].DataBinding;
          GrdSale.Columns[6].DataBinding.FieldName:='PurchaseCount';
          GrdSale.Columns[6].DataBinding.ValueType:='Float';

          GrdSale.Columns[7].Caption:='销售折扣';
          GrdSale.Columns[7].DataBinding;
          GrdSale.Columns[7].DataBinding.FieldName:='PurchaseAgio';
          GrdSale.Columns[7].DataBinding.ValueType:='Float';

          GrdSale.Columns[8].Caption:='销售合计';
          GrdSale.Columns[8].DataBinding;
          GrdSale.Columns[8].DataBinding.FieldName:='PurchaseTotal';
          GrdSale.Columns[8].DataBinding.ValueType:='Float';

  ShowMenuItem(False,False,False,False,False,False);
end;

procedure TFrm_Supply.ShowSalePre;
Var
  I:Integer;
begin
  inherited;
  With DatabaseModule.AdoPre DO
    Begin
      Close;
      SQL.Clear;
      SQL.Add('Select DeptID_,CustID,Product,Price,ForecastCount,ForecastMoney,Forecastdate,FinishDate,Possible,ForecastMemo,CreateBY_,CreateD_,BelongID,UpdateBY_,UPdateD_');
      SQL.Add('From SaleForecast where CustID=:CustID');
      Parameters.ParamByName('CustID').Value:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
      Open;
    End;

  IF GrdPre.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdPre.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO DataBaseModule.AdoPre.FieldCount - 8 Do
    Begin
      GrdPre.CreateColumn;
      GrdPre.Columns[I].Name:='PreColumns'+IntToStr(I);
   End;
          GrdPre.DataController.DataSource:=DSPre;
          GrdPre.Columns[0].Caption:='产品名称';
          GrdPre.Columns[0].DataBinding;
          GrdPre.Columns[0].DataBinding.FieldName:='Product';
          GrdPre.Columns[0].DataBinding.ValueType:='String';

          GrdPre.Columns[1].Caption:='单价';
          GrdPre.Columns[1].DataBinding;
          GrdPre.Columns[1].DataBinding.FieldName:='Price';
          GrdPre.Columns[1].DataBinding.ValueType:='Float';

          GrdPre.Columns[2].Caption:='预测数量';
          GrdPre.Columns[2].DataBinding;
          GrdPre.Columns[2].DataBinding.FieldName:='ForeCastCount';
          GrdPre.Columns[2].DataBinding.ValueType:='Float';

          GrdPre.Columns[3].Caption:='预测金额';
          GrdPre.Columns[3].DataBinding;
          GrdPre.Columns[3].DataBinding.FieldName:='ForecastMoney';
          GrdPre.Columns[3].DataBinding.ValueType:='Float';

          GrdPre.Columns[4].Caption:='预测日期';
          GrdPre.Columns[4].DataBinding;
          GrdPre.Columns[4].DataBinding.FieldName:='Forecastdate';
          GrdPre.Columns[4].DataBinding.ValueType:='Datetime';

          GrdPre.Columns[5].Caption:='完成日期';
          GrdPre.Columns[5].DataBinding;
          GrdPre.Columns[5].DataBinding.FieldName:='FinishDate';
          GrdPre.Columns[5].DataBinding.ValueType:='Datetime';

          GrdPre.Columns[6].Caption:='可能性';
          GrdPre.Columns[6].DataBinding;
          GrdPre.Columns[6].DataBinding.FieldName:='Possible';
          GrdPre.Columns[6].DataBinding.ValueType:='String';
          GrdPre.Columns[6].Width:=60;

          GrdPre.Columns[7].Caption:='备注';
          GrdPre.Columns[7].DataBinding;
          GrdPre.Columns[7].DataBinding.FieldName:='ForecastMemo';
          GrdPre.Columns[7].DataBinding.ValueType:='String';

       GrdPre.OptionsView.ScrollBars:=SSBoth;

end;

procedure TFrm_Supply.N14Click(Sender: TObject);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      PNActive:=1;
      Frm_Day.cxScheduler1.CreateEventUsingDialog(False,False);
    End;
end;

procedure TFrm_Supply.N16Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          ISAdd:=True;
          ISEdit:=False;
          PNContract:=5;
          Frm_NewContract:=TFrm_NewContract.Create(Self);
          Frm_NewContract.ContractOption:=1;
          Frm_NewContract.ShowModal;
        End;
    End;
end;

procedure TFrm_Supply.N17Click(Sender: TObject);
begin
  inherited;
  IF Not (DSContract.DataSet.IsEmpty) Then
  Begin
    IF CheckEditRight Then
      Begin
        IF DSContract.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
          Begin
            Application.MessageBox('合同已审核,不能再修改','提示',MB_OK+MB_IconWarning);
            Exit;
          End;
        ISAdd:=False;
        ISEdit:=True;
        PNContract:=5;
        Frm_NewContract:=TFrm_NewContract.Create(Self);
        Frm_NewContract.ShowModal;
      End;
  End;
end;

procedure TFrm_Supply.N21Click(Sender: TObject);
Var
  FileName,ShareFilePath,SharePwd,ShareUSer:String;
begin
  inherited;
  IF Not (DSFile.DataSet.IsEmpty) Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select UserName_ From Users_ Where UserID_=:UserID');
      Query.Parameters.ParamByName('UserID').Value:=DSFile.DataSet.FieldByName('BelongID').AsInteger;
      Query.Prepared;
      Query.Open;
      ShareUser:= DataBaseModule.AdoShareSet.FieldByName('ShareUser').AsString;
      SharePwd:= DataBaseModule.AdoShareSet.FieldByName('SharePwd').AsString;
      ShareFilePath:= DataBaseModule.AdoShareSet.FieldByName('SharePath').AsString+'\'+Query.FieldByName('UserName_').AsString;
      WinExec(PChar('net use '+ShareFilePath+' /user:'+ShareUser+' '+Sharepwd), SW_HIDE);
      FileName:=ShareFilePath+'\'+DSFile.DataSet.fieldbyname('MyFilename').AsString;
      IF FileExists(FileName) Then
        Begin
          IF (DSFile.DataSet.FieldByName('BelongID').AsInteger=DatabaseModule.dtclsData.UserID_) Then
            Begin
              shellexecute(handle,'open',pchar(Filename),'','',Sw_show);
            End
          Else
            Begin
              CopyFile(PChar(FileName),PChar(ExtractFilePath(Application.ExeName)+'\'+DSFile.DataSet.FieldByName('MyFileName').AsString),False);
              shellexecute(handle,'open',pchar(ExtractFilePath(Application.ExeName)+'\'+DSFile.DataSet.FieldByName('MyFileName').AsString),'','',Sw_show);
            End;
        End
      Else Application.MessageBox('网路有故障','提示',MB_OK+MB_Iconwarning);
    End;
end;

procedure TFrm_Supply.N20Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      Frm_FileCenter:=TFrm_FileCenter.Create(Self);
      PNFile:=5;
      Frm_FileCenter.ShowModal;
      ShowFile;
    End;
end;

procedure TFrm_Supply.showMenuitem(Expend, SalePre, CustContact, Active,
  Contract, FileCenter: Boolean);
begin
  N1.Visible:=Expend;
  N2.Visible:=Expend;
  N3.Visible:=Expend;
  N4.Visible:=CustContact;
  N5.Visible:=CustContact;
  N6.Visible:=CustContact;
  N9.Visible:=Active;
  N10.Visible:=Active;
  N11.Visible:=Active;
  N12.Visible:=Active;
  N13.Visible:=Active;
  N14.Visible:=Active;
  N16.Visible:=Contract;
  N17.Visible:=Contract;
  N18.Visible:=Contract;
  N20.Visible:=FileCenter;
  N21.Visible:=FileCenter;
  N19.Visible:=SalePre;
  N22.Visible:=SalePre;
  N23.Visible:=SalePre;
end;

procedure TFrm_Supply.N7Click(Sender: TObject);
begin
  inherited;
  IF Self.Access.RAdd Then
    Begin
      ISAdd:=True;
      ISEdit:=False;
      ISCust:=False;
      Frm_NewCust := TFrm_NewCust.Create(Self);
      Frm_NewCust.ShowModal;
      SetupTree;
      TreeViewChange(Treeview,Treeview.Selected);
      DSCust.DataSet.Last;
      IF CustSon.ActivePage=TabContact Then ShowContact
      Else CustSon.ActivePage:=TabContact;
    End
  Else
    Application.MessageBox('你没有新增记录的权限','提示',MB_OK+MB_Iconwarning);
end;

procedure TFrm_Supply.N8Click(Sender: TObject);
begin
  inherited;
  IF DSCust.DataSet.IsEmpty Then Exit;
  IF (DatabaseModule.adosupply.ModifyAcc(DSCust.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.REdit) Then
    Begin
      Application.MessageBox('你没有修改此资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  ISAdd:=False;
  ISEdit:=True;
  ISCust:=False;
  Frm_NewCust := TFrm_NewCust.Create(Self);
  Frm_NewCust.ShowModal;
end;  

procedure TFrm_Supply.N13Click(Sender: TObject);
begin
  inherited;

  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      IF Application.MessageBox('请确认该活动是否完成','提示',MB_YESNO+MB_IconQuestion)=IDNo Then Exit;
      DSActive.DataSet.Edit;
      DSActive.DataSet.FieldByName('IFFinish').AsBoolean:=Boolean(1);
      DSActive.DataSet.FieldByName('ActiveEndDate').AsDateTime:=Date;
      DSActive.DataSet.Post;
      DSCust.DataSet.Edit;
      DSCust.DataSet.FieldByName('CustLastDate').AsDateTime:=Date;
      DSCust.DataSet.Post;
      ShowActive(False);
    End;
end;

procedure TFrm_Supply.N1Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          ISAdd:=True;
          ISEdit:=False;
          PNExpend:=5;
          Frm_NewExpend:=TFrm_NewExpend.Create(Self);
          Frm_NewExpend.ShowModal;
          ShowExpend;
        End;  
    End;
end;

procedure TFrm_Supply.N2Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF DSExpend.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
        Begin
          Application.MessageBox('费用已审核不能再编辑','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
      IF CheckEditRight Then
        Begin
          ISAdd:=False;
          ISEdit:=True;
          PNExpend:=5;
          Frm_NewExpend:=TFrm_NewExpend.Create(Self);
          Frm_NewExpend.ShowModal;
        End;
    End;
end;

procedure TFrm_Supply.N3Click(Sender: TObject);
begin
  inherited;
  IF Not (DSExpend.DataSet.IsEmpty) Then
    Begin
      IF DSExpend.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
        Begin
          Application.MessageBox('费用已审核不能删除','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
      IF CheckDeleteRight Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Delete Expend Where ExpendID=:ExpendID');
          Query.Parameters.ParamByName('ExpendID').Value:= DSExpend.DataSet.FieldByName('ExpendID').AsInteger;
          Query.Prepared;
          Query.ExecSQL;
          ShowExpend;
        End;
    End;
end;

procedure TFrm_Supply.RBMyCustClick(Sender: TObject);
begin
  inherited;
  LSqlCust:=False;
  TreeViewChange(TreeView,TreeView.Selected);
end;

procedure TFrm_Supply.RBShareCustClick(Sender: TObject);
begin
  inherited;
  LSqlCust:=False;
  TreeViewChange(TreeView,TreeView.Selected);
end;

procedure TFrm_Supply.N19Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          ISAdd:=True;
          ISEdit:=False;
          PNProd:=5;
          Frm_SalePre:=TFrm_SalePre.Create(Self);
          Frm_SalePre.ShowModal;
        End;  
    End;
end;

procedure TFrm_Supply.N15Click(Sender: TObject);
begin
  inherited;
  IF DSCust.DataSet.IsEmpty Then Exit;
  With DatabaseModule Do
    Begin
      IF (adosupply.DeleteAcc(adosupply.FieldByName('BelongID').AsInteger) = False) or (Not Self.Access.RDelete) Then
        Begin
          Application.MessageBox('你没有删除该资料的权限.','提示',MB_OK+MB_Iconwarning);
          Exit;
        End
      Else
        IF Application.MessageBox('真的要删除该客户资料吗?','提示',MB_YESNO+MB_Iconwarning)=IDNO Then Exit
        Else
          Begin
            LAdoCust.Close;
            LAdoCust.SQL.Clear;
            LAdoCust.SQL.Add('Delete Customer Where CustID=:CustID');
            LAdoCust.Parameters.ParamByName('CustID').Value:=DSCust.DataSet.FieldByName('CustID').AsInteger;
            LAdoCust.Prepared;
            LAdoCust.ExecSQL;
            TreeViewChange(TreeView,TreeView.Selected);
          End;
    End;
end;

procedure TFrm_Supply.N24Click(Sender: TObject);
begin
  inherited;
  IF Self.Access.RPrint then
    Begin
      if dlgSave1.Execute then
        ExportGridToExcel(dlgSave1.FileName ,cxGrid1);
    End
  Else ShowMessageA('你没有导出资料的权限');

end;

procedure TFrm_Supply.N25Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrm_ImportData,Frm_ImportData);
  Frm_ImportData.ShowModal ;
  SetupTree;
  TreeViewChange(TreeView,TreeView.Selected);
end;

procedure TFrm_Supply.N22Click(Sender: TObject);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
      IF CheckEditRight Then
        Begin
          ISAdd:=False;
          ISEdit:=True;
          PNProd:=5;
          Frm_SalePre:=TFrm_SalePre.Create(Self);
          Frm_SalePre.ShowModal;
        End;
    End;
end;

procedure TFrm_Supply.CustSonChange(Sender: TObject);
begin
  inherited;
  IF CustSon.ActivePage=TabContact Then
    Begin
      showMenuitem(False,False,True,False,False,False);
      ShowContact;
    End;
  IF CustSon.ActivePage=TabActive Then
    Begin
      showMenuitem(False,False,False,True,False,False);
      ShowActive(False);
    End;
  IF CustSon.ActivePage=TabExpend Then
    Begin
      showMenuitem(False,False,False,False,False,False);
      ShowExpend;
    End;
  IF CustSon.ActivePage=TabSale Then
    Begin
      showMenuitem(False,False,False,False,False,False);
      ShowSale;
    End;
  IF CustSon.ActivePage=TabContract Then
    Begin
      showMenuitem(False,False,False,False,True,False);
      ShowContract;
    End;
  IF CustSon.ActivePage=TabSalePre Then
    Begin
      showMenuitem(False,True,False,False,False,False);
      ShowSalePre;
    End;
  IF CustSon.ActivePage=TabFile Then
    Begin
      showMenuitem(False,False,False,False,False,True);
      ShowFile;
    End;
  IF CustSon.ActivePage=TabHistory Then
    Begin
      showMenuitem(False,False,False,False,False,False);
      ShowActive(True);
    End;
  IF CustSon.ActivePage=TabService Then
    Begin
      showMenuitem(False,False,False,False,False,False);
      ShowService;
    End;
  IF CustSon.ActivePage=cxtbsht1 Then
    Begin
      showMenuitem(False,False,False,False,False,False);
      refreshtel ;
    End;
end;

procedure TFrm_Supply.SetupTree;
var
  Node:TTreeNode;
begin
  FieldList:=TStringList.Create;
   With DatabaseModule Do
     Begin
       AdoDict.Close;
       AdoDict.SQL.Clear;
       AdoDict.SQL.Add('Select FieldName,Context From Dict where IFCust=:IFCust And Not FactTableName in (:CustCountry,:CustProvince,:CustCity,:CustRegion)');
       AdoDict.Parameters.ParamByName('CustCountry').Value:='CustCountry';
       AdoDict.Parameters.ParamByName('CustProvince').Value:='CustProvince';
       AdoDict.Parameters.ParamByName('CustCity').Value:='CustCity';
       AdoDict.Parameters.ParamByName('CustRegion').Value:='CustRegion';
       AdoDict.Parameters.ParamByName('IFCust').Value:=Boolean(1);
       AdoDict.Prepared;
       AdoDict.Open;

       Treeview.Items.BeginUpdate;
       AdoDict.First;
       While Not AdoDict.Eof  Do
         Begin
           TreeAddItem(Treeview,GetFieldList,AdoDict.GetBookmark,False);
           AdoDict.Next;
         End;
       FieldList.Clear;
       Treeview.AlphaSort;
       Treeview.Items.EndUpdate;
       IF Treeview.Items.Count <= 0 Then
          TreeViewChange(TreeView,nil);
       AdoFile.Open;
     End;
end;

procedure TFrm_Supply.N11Click(Sender: TObject);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      IF CheckDeleteRight Then
        Begin
          IF Application.MessageBox('确认要删除该活动记录吗?','提示',MB_YESNO+MB_Iconwarning)=IDYES Then
            Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Delete Expend Where ActiveNum=:ActiveNum');
              Query.Parameters.ParamByName('ActiveNum').Value:=DSActive.DataSet.FieldByName('ActiveNum').AsString;
              Query.Prepared;
              Query.ExecSQL;
              Query.Close;
              DSActive.DataSet.Delete;
            End;
        End
      Else
        Begin
          Application.MessageBox('你没有删除该资料的权限','提示',MB_OK+MB_Iconwarning);
        End;
    End;
end;

procedure TFrm_Supply.N18Click(Sender: TObject);
begin
  inherited;
  IF Not (DSContract.DataSet.IsEmpty) Then
    Begin
      IF CheckDeleteRight Then
        Begin
          IF DSContract.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
          Begin
            Application.MessageBox('合同已审核,不能删除','提示',MB_OK+MB_IconWarning);
            Exit;
          End;
          IF Application.MessageBox('确认要删除此合同吗?','提示',MB_YESNO+MB_Iconwarning)=IDNO Then Exit
          Else DSContract.DataSet.Delete;
        End;
    End;
end;

procedure TFrm_Supply.N23Click(Sender: TObject);
begin
  inherited;
  IF Not (DSPre.DataSet.IsEmpty) Then
    Begin
      IF CheckDeleteRight Then
        Begin
          IF Application.MessageBox('确认要删除该记录吗?','提示',MB_YESNO+MB_Iconwarning)=IDNO Then Exit
          Else DSPre.DataSet.Delete;
        End;
    End;
end;

Function TFrm_Supply.CheckDeleteRight:Boolean;
begin
  IF (DatabaseModule.adosupply.DeleteAcc(DsCust.DataSet.FieldByName('BelongID').AsInteger) = False) or (Not Self.Access.RDelete) Then
        Begin
          Application.MessageBox('你没有删除该资料的权限.','提示',MB_OK+MB_Iconwarning);
          Result:=False;
        End
      Else Result:=True;
end;

Function TFrm_Supply.CheckEditRight:Boolean;
begin
  IF (DatabaseModule.adosupply.ModifyAcc(DSCust.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.REdit) Then
    Begin
      Application.MessageBox('你没有新增或修改此资料的权限.','提示',MB_OK+MB_Iconwarning);
      Result:=False;
    End
  Else Result:=True;  
end;

procedure TFrm_Supply.GrdCustCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ISBrowse:=True;
  ISCust:=False;
  IF Frm_NewCust=Nil Then
    Begin
      Frm_NewCust:=TFrm_NewCust.Create(Self);
      Frm_NewCust.Show;
    End;
end;

procedure TFrm_Supply.GrdContactCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin
          ISBrowse:=True;
          Frm_CustContact:=TFrm_CustContact.Create(Self);
          Frm_CustContact.ShowModal;

    End;
end;

procedure TFrm_Supply.N27Click(Sender: TObject);
begin
  inherited;
  Frm_Default:=TFrm_Default.Create(Self);
  Frm_Default.ShowModal;
end;

procedure TFrm_Supply.GrdActiveCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
          ISBrowse:=True;
          ISEdit:=False;
          ISAdd:=False;
          PNActive:=5;
          Frm_CustActive:=TFrm_CustActive.Create(Self);
          Frm_CustActive.cxTabSheet1.TabVisible:=True;
          Frm_CustActive.cxTabSheet2.TabVisible:=False;
          Frm_CustActive.ShowModal;
    End;
end;

procedure TFrm_Supply.GrdContractCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not (DSContract.DataSet.IsEmpty) Then
  Begin
        ISBrowse:=True;
        ISAdd:=False;
        ISEdit:=False;
        PNContract:=5;
        Frm_NewContract:=TFrm_NewContract.Create(Self);
        Frm_NewContract.ShowModal;
  End;
end;

procedure TFrm_Supply.GrdExpendCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not DSExpend.DataSet.IsEmpty Then
    Begin
      ISBrowse:=True;
      PNExpend:=5;
      Frm_NewExpend:=TFrm_NewExpend.Create(Self);
      Frm_NewExpend.ShowModal;
    End;
end;

procedure TFrm_Supply.GrdPreCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not (DSCust.DataSet.IsEmpty) Then
    Begin

          ISBrowse:=True;
          Frm_SalePre:=TFrm_SalePre.Create(Self);
          Frm_SalePre.ShowModal;

    End;
end;

procedure TFrm_Supply.FormShow(Sender: TObject);
begin
  inherited;
  SetupTree;
  SetupRegion;
  CustSon.ActivePage:=TabContact;
  {Self.LoadReport(PopupMenu2);
  Self.AddReportdataSet(DataBaseModule.adosupply);
  Self.AddReportdataSet(DataBaseModule.AdoContact);
  Self.AddReportdataSet(DataBaseModule.AdoPre);}

end;

procedure TFrm_Supply.ShowService;
Var
  I:Integer;
begin
  LAdoService.Close;
  LAdoService.SQL.Clear;
  LAdoService.SQL.Add('Select a.CustID,a.ServiceID,a.ServiceNum,a.serviceQuestion,a.ContactMode,a.IFSelect,a.IFFinish,a.IFCheck,a.CheckMan,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,b.UserName_ From Service a,Users_ b Where CustID=:CustID And a.CreateBy_=b.UserID_');
  LAdoService.Parameters.ParamByName('CustID').Value:=DSCust.DataSet.FieldByName('CustID').AsInteger;
  LAdoService.Prepared;
  LAdoService.Open;
  IF GrdService.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO LAdoService.FieldCount - 4 Do
    Begin
      GrdService.CreateColumn;
      GrdService.Columns[I].Name:='ServiceColumns'+IntToStr(I);
   End;
          GrdService.DataController.DataSource:=LDSService;
          GrdService.Columns[0].Caption:='维护单号';
          GrdService.Columns[0].DataBinding;
          GrdService.Columns[0].DataBinding.FieldName:='ServiceNum';
          GrdService.Columns[0].DataBinding.ValueType:='String';
          GrdService.Columns[0].Width:=80;

          GrdService.Columns[1].Caption:='问题描述';
          GrdService.Columns[1].DataBinding;
          GrdService.Columns[1].DataBinding.FieldName:='ServiceQuestion';
          GrdService.Columns[1].DataBinding.ValueType:='String';
          GrdService.Columns[1].Width:=150;

          GrdService.Columns[2].Caption:='联系方式';
          GrdService.Columns[2].DataBinding;
          GrdService.Columns[2].DataBinding.FieldName:='ContactMode';
          GrdService.Columns[2].DataBinding.ValueType:='String';
          GrdService.Columns[2].Width:=80;

          GrdService.Columns[3].Caption:='是否安排';
          GrdService.Columns[3].DataBinding;
          GrdService.Columns[3].DataBinding.FieldName:='IFSelect';
          GrdService.Columns[3].DataBinding.ValueType:='Boolean';
          GrdService.Columns[3].Width:=60;

          GrdService.Columns[4].Caption:='是否完成';
          GrdService.Columns[4].DataBinding;
          GrdService.Columns[4].DataBinding.FieldName:='IFFinish';
          GrdService.Columns[4].DataBinding.ValueType:='Boolean';
          GrdService.Columns[4].Width:=60;

          GrdService.Columns[5].Caption:='是否审核';
          GrdService.Columns[5].DataBinding;
          GrdService.Columns[5].DataBinding.FieldName:='IFCheck';
          GrdService.Columns[5].DataBinding.ValueType:='Boolean';
          GrdService.Columns[5].Width:=60;

          GrdService.Columns[6].Caption:='审核人';
          GrdService.Columns[6].DataBinding;
          GrdService.Columns[6].DataBinding.FieldName:='CheckMan';
          GrdService.Columns[6].DataBinding.ValueType:='String';
          GrdService.Columns[6].Width:=80;

          GrdService.Columns[7].Caption:='建单日期';
          GrdService.Columns[7].DataBinding;
          GrdService.Columns[7].DataBinding.FieldName:='CreateD_';
          GrdService.Columns[7].DataBinding.ValueType:='Datatime';
          GrdService.Columns[7].Width:=100;

          GrdService.Columns[8].Caption:='建单人';
          GrdService.Columns[8].DataBinding;
          GrdService.Columns[8].DataBinding.FieldName:='UserName_';
          GrdService.Columns[8].DataBinding.ValueType:='String';
          GrdService.Columns[8].Width:=80;

          GrdService.Columns[9].Caption:='修改人';
          GrdService.Columns[9].DataBinding;
          GrdService.Columns[9].DataBinding.FieldName:='UpdateBy_';
          GrdService.Columns[9].DataBinding.ValueType:='String';
          GrdService.Columns[9].Width:=80;

          GrdService.Columns[10].Caption:='修改日期';
          GrdService.Columns[10].DataBinding;
          GrdService.Columns[10].DataBinding.FieldName:='UpdateD_';
          GrdService.Columns[10].DataBinding.ValueType:='Datatime';
          GrdService.Columns[10].Width:=100;

end;

procedure TFrm_Supply.GrdServiceCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF LAdoService.IsEmpty Then Exit;
  Frm_ServiceRecord:=TFrm_serviceRecord.Create(Self);
  Frm_ServiceRecord.ServiceID:=LAdoService.FieldByName('ServiceID').AsInteger;
  Frm_ServiceRecord.ShowModal;
end;

procedure TFrm_Supply.TreeViewClick(Sender: TObject);
begin
  inherited;
  Treeviewchange(Treeview,Treeview.Selected);
end;

procedure TFrm_Supply.refreshtel;
begin
  with bndqryTelQry do
  begin
    Close;
    Parameters.ParamByName('cm.CustID').Value := DSCust.DataSet.fieldbyname('CustID').Value;
    Open;
  end ;
  cbb1.Text:=DatabaseModule.AdoShareSet.FieldByName('ShareIP').AsString;
end;

procedure TFrm_Supply.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
Var
  LNode:TTreenode;
  I,NodeLen,DayCount:Integer;
  ISNumeric:Boolean;
  CustColumn:TcxGridDBColumn;
  AYear, AMonth, AWeekOfMonth, ADayOfWeek: Word;
  WeekFirstDay,WeekEndDay,MonthFirstDay,MonthEndDay:TDateTime;
begin
  inherited;
  DayCount:=0;
  ISCust:=False;
  If  Node = nil Then
    LNode := nil
  else
    LNode:=Node.Parent;
  IF LNode=Nil Then //取客户数据
    Begin

      With DatabaseModule Do
        Begin
          IF LSqlCust=True Then
            Begin
              AdoSupply.Filtered:=False;
            End
          Else Begin
          LSqlCust:=True;
          adosupply.AliasName:='a';
          adosupply.Close;
          adosupply.SQL.Clear;
          adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustClass,a.CustName,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
          adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
          if RBMyCust.Checked Then  adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID = :BelongID And a.BelongID=b.UserID_')
           else begin
            adosupply.SQL.Add(' From Customer a,Users_ b Where a.CustClass = :CustClass And a.BelongID <> :BelongID And a.BelongID=b.UserID_ ');
            if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
          end;
          adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
          adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
          //Showmessage(adosupply.SQL.text);
          adosupply.Prepared;
          adosupply.Open;
          adosupply.First;
          End;
        End;
     End
   Else
     Begin
        With DatabaseModule Do
        Begin

          //--------------------------------我的查寻
          IF LNode.Text='我的查寻' Then
            Begin
              DecodeDateMonthWeek(Date,AYear, AMonth, AWeekOfMonth, ADayOfWeek);
              Case ADayOFWeek OF
              1:Begin
                  WeekFirstDay:=Date;
                  WeekEndDay:=Date+7;
                End;
              2:Begin
                  WeekFirstDay:=Date-1;
                  WeekEndDay:=Date+6;
                End;
              3:Begin
                  WeekFirstDay:=Date-2;
                  WeekEndDay:=Date+5;
                End;
              4:Begin
                  WeekFirstDay:=Date-3;
                  WeekEndDay:=Date+4;
                End;
              5:Begin
                  WeekFirstDay:=Date-4;
                  WeekEndDay:=Date+3;
                End;
              6:Begin
                  WeekFirstDay:=Date-5;
                  WeekEndDay:=Date+2;
                End;
              7:Begin
                  WeekFirstDay:=Date-6;
                  WeekEndDay:=Date+1;
                End;
              End;
              Case AMonth OF
              1,3,5,7,8,10,12:Begin

                                MonthFirstDay:=StrToDatetime(IntToStr(AYear)+'-'+IntToStr(AMonth)+'-01');
                                MonthEndDay:=StrToDatetime(IntToStr(AYear)+'-'+IntToStr(AMonth)+'-31')+1;
                              End;
              4,6,9,11:Begin

                         MonthFirstDay:=StrToDatetime(IntToStr(AYear)+'-'+IntToStr(AMonth)+'-01');
                         MonthEndDay:=StrToDatetime(IntToStr(AYear)+'-'+IntToStr(AMonth)+'-30')+1;
                       End;
              Else
                Begin

                  MonthFirstDay:=StrToDatetime(IntToStr(AYear)+'-'+IntToStr(AMonth)+'-01');
                  MonthEndDay:=StrToDatetime(IntToStr(AYear)+'-'+IntToStr(AMonth)+'-28')+1;
                End;
              End;

              Case Treeview.Selected.Index OF
              0:Begin
                  //本月新登记的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID=:BelongID And a.BelongID=b.UserID_ And a.CreateD_>=:FirstCreateD And a.CreateD_<:EndCreateD');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID<>:BelongID And a.BelongID=b.UserID_ And a.CreateD_>=:FirstCreateD And a.CreateD_<:EndCreateD');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=MonthFirstDay;
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=MonthEndDay;
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              1:Begin
                  //本月需联系和客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b ');
                    adosupply.SQL.Add(' Where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:FirstCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b ');
                    adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:FirstCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=MonthFirstDay;
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=MonthEndDay;
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              2:Begin
                  //本月已联系和客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveEndDate>=:FirstCreateD And c.ActiveEndDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveEndDate>=:FirstCreateD And c.ActiveEndDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=MonthFirstDay;
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=MonthEndDay;
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              3:Begin
                  //本周新登记的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID=:BelongID And a.BelongID=b.UserID_ And a.CreateD_>=:FirstCreateD And a.CreateD_<:EndCreateD');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID<>:BelongID And  a.BelongID=b.UserID_ And a.CreateD_>=:FirstCreateD And a.CreateD_<:EndCreateD');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=WeekFirstDay;
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=WeekEndDay;
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              4:Begin
                  //本周需联系的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b ');
                    adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:FirstCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b ');
                    adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:FirstCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=WeekFirstDay;
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=WeekEndDay;
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              5:Begin
                  //本周已联系的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveEndDate>=:FirstCreateD And c.ActiveEndDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveEndDate>=:FirstCreateD And c.ActiveEndDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=WeekFirstDay;
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=WeekEndDay;
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              6:Begin
                  //今天新登记的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CreateD_>=:BeginCreateD And a.CreateD_<:EndCreateD And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CreateD_>=:BeginCreateD And a.CreateD_<:EndCreateD And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BeginCreateD').Value:=DateTimeToStr(Date);
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=DateTimeToStr(Date+1);
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              7:Begin
                  //今天需联系的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b ');
                    adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:FirstCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b ');
                    adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:FirstCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=DatetimeToStr(Date);
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=DatetimeToStr(Date+1);
                  adosupply.Prepared;

                  adosupply.Open;
                End;
              8:Begin
                  //今天已联系的客户
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveEndDate>=:FirstCreateD And c.ActiveEndDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveEndDate>=:FirstCreateD And c.ActiveEndDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('FirstCreateD').Value:=DateTimeToStr(Date);
                  adosupply.Parameters.ParamByName('EndCreateD').Value:=DateTimeToStr(Date+1);
                  adosupply.Prepared;
                  adosupply.Open;
                End;
              9:Begin
                  Try
                    DayCount:=StrToInt(InputBox('查找客户', '请输入天数', '30'));
                  Except
                    Application.MessageBox('输入天数不对','提示',MB_OK+MB_Iconwarning);
                    Exit;
                  End;
                  adosupply.AliasName:='a';
                  adosupply.Close;
                  adosupply.SQL.Clear;
                  adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                  adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                  if RBMyCust.Checked Then
                  begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustLastDate<:DayCount And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                  end else begin
                    adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustLastDate<:DayCount And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                    if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                  end;
                  adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                  adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                  adosupply.Parameters.ParamByName('DayCount').Value:=DateTimeToStr(Date-DayCount+1);
                  adosupply.Prepared;
                  adosupply.Open;
                End;
             10:Begin
                  Frm_SelectDate:=TFrm_SelectDate.Create(Self);
                  Frm_SelectDate.ShowModal;
                  IF (CustBeginDate='') And (CustEndDate='') Then Exit
                  Else
                    Begin
                      IF CustBeginDate='' Then
                        Begin
                          adosupply.AliasName:='a';
                          adosupply.Close;
                          adosupply.SQL.Clear;
                          adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                          adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                          if RBMyCust.Checked Then
                          begin
                            adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID=:BelongID And a.BelongID=b.UserID_ And a.CreateD_<:EndCreateD');
                          end else begin
                            adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID<>:BelongID And  a.BelongID=b.UserID_ And a.CreateD_<:EndCreateD');
                          if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                          end;
                          adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                          adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                          adosupply.Parameters.ParamByName('EndCreateD').Value:=CustEndDate;
                          adosupply.Prepared;
                          adosupply.Open;
                        End
                      Else
                        Begin
                          IF CustEndDate='' Then
                            Begin
                              adosupply.AliasName:='a';
                              adosupply.Close;
                              adosupply.SQL.Clear;
                              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                              if RBMyCust.Checked Then
                              begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID=:BelongID And a.BelongID=b.UserID_ And a.CreateD_>=:BeginCreateD');
                              end else begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID<>:BelongID And  a.BelongID=b.UserID_ And a.CreateD_>=:BeginCreateD');
                              if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                              end;
                              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('BeginCreateD').Value:=CustBeginDate;
                              adosupply.Prepared;
                              adosupply.Open;
                            End
                          Else
                            Begin
                              adosupply.AliasName:='a';
                              adosupply.Close;
                              adosupply.SQL.Clear;
                              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                              if RBMyCust.Checked Then
                              begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID=:BelongID And a.BelongID=b.UserID_ And a.CreateD_>=:FirstCreateD And a.CreateD_<:EndCreateD');
                              end else begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID<>:BelongID And  a.BelongID=b.UserID_ And a.CreateD_>=:FirstCreateD And a.CreateD_<:EndCreateD');
                              if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                              end;
                              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('FirstCreateD').Value:=CustBeginDate;
                              adosupply.Parameters.ParamByName('EndCreateD').Value:=CustEndDate;
                              adosupply.Prepared;
                              adosupply.Open;
                            End;
                        End;
                    End;
                End;
             11:Begin
                  Frm_SelectDate:=TFrm_SelectDate.Create(Self);
                  Frm_SelectDate.ShowModal;
                  IF (CustBeginDate='') And (CustEndDate='') Then Exit
                  Else
                    Begin
                      IF CustBeginDate='' Then
                        Begin
                          adosupply.AliasName:='a';
                          adosupply.Close;
                          adosupply.SQL.Clear;
                          adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                          adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                          if RBMyCust.Checked Then
                          begin
                            adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                          end else begin
                            adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                          if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                          end;
                          adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
                          adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                          adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                          adosupply.Parameters.ParamByName('EndCreateD').Value:=CustEndDate;
                          adosupply.Prepared;
                          adosupply.Open;
                        End
                      Else
                        Begin
                          IF CustEndDate='' Then
                            Begin
                              adosupply.AliasName:='a';
                              adosupply.Close;
                              adosupply.SQL.Clear;
                              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                              if RBMyCust.Checked Then
                              begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                              end else begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                              if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                              end;
                              adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                              adosupply.Parameters.ParamByName('BeginCreateD').Value:=CustBeginDate;
                              adosupply.Prepared;
                              adosupply.Open;
                            End
                          Else
                            Begin
                              adosupply.AliasName:='a';
                              adosupply.Close;
                              adosupply.SQL.Clear;
                              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                              if RBMyCust.Checked Then
                              begin
                                adosupply.SQL.Add(' From Customer a,Users_ b ');
                                adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                              end else begin
                                adosupply.SQL.Add(' From Customer a,Users_ b ');
                                adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                              if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                              end;
                              adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('BeginCreateD').Value:=CustBeginDate;
                              adosupply.Parameters.ParamByName('EndCreateD').Value:=CustEndDate;
                              adosupply.Prepared;
                              adosupply.Open;
                            End;
                        End;
                    End;
                End;
             12:Begin
                  Frm_SelectDate:=TFrm_SelectDate.Create(Self);
                  Frm_SelectDate.ShowModal;
                  IF (CustBeginDate='') And (CustEndDate='') Then Exit
                  Else
                    Begin
                      IF CustBeginDate='' Then
                        Begin
                          adosupply.AliasName:='a';
                          adosupply.Close;
                          adosupply.SQL.Clear;
                          adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                          adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                          if RBMyCust.Checked Then
                          begin
                            adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                          end else begin
                            adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                          if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                          end;
                          adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
                          adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                          adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                          adosupply.Parameters.ParamByName('EndCreateD').Value:=CustEndDate;
                          adosupply.Prepared;
                          adosupply.Open;
                        End
                      Else
                        Begin
                          IF CustEndDate='' Then
                            Begin
                              adosupply.AliasName:='a';
                              adosupply.Close;
                              adosupply.SQL.Clear;
                              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                              if RBMyCust.Checked Then
                              begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                              end else begin
                                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                              if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                              end;
                              adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
                              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('BeginCreateD').Value:=CustBeginDate;
                              adosupply.Prepared;
                              adosupply.Open;
                            End
                          Else
                            Begin
                              adosupply.AliasName:='a';
                              adosupply.Close;
                              adosupply.SQL.Clear;
                              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
                              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
                              if RBMyCust.Checked Then
                              begin
                                adosupply.SQL.Add(' From Customer a,Users_ b ');
                                adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID=:BelongID And a.BelongID=b.UserID_');
                              end else begin
                                adosupply.SQL.Add(' From Customer a,Users_ b ');
                                adosupply.SQL.Add(' where a.CustClass = :CustClass And a.CustID In (Select c.CustID From CustActive c Where c.IFFinish=:IFFinish And c.ActiveBeginDate>=:BeginCreateD And c.ActiveBeginDate<:EndCreateD) And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
                              if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
                              end;
                              adosupply.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
                              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
                              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
                              adosupply.Parameters.ParamByName('BeginCreateD').Value:=CustBeginDate;
                              adosupply.Parameters.ParamByName('EndCreateD').Value:=CustEndDate;
                              adosupply.Prepared;
                              adosupply.Open;
                            End;
                        End;
                    End;
                End;
              End;
              LSqlCust:=False;
            End
          //-------------------------------我的查寻
          Else
            Begin
              {adosupply.AliasName:='a';
              adosupply.Close;
              adosupply.SQL.Clear;
              adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
              adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
              if RBMyCust.Checked Then
              begin
                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID=:BelongID And a.BelongID=b.UserID_ And ((a.CustState=:CustState) OR (a.CustCountry=:CustCountry) OR (a.CustProvince=:CustProvince) OR (a.CustCity=:CustCity)');
                adosupply.SQL.Add(' OR (CustRegion=:CustRegion) OR (CustRate=:CustRate) OR (CustType=:CustType) OR (CustSource=:CustSource) OR (CustTrade=:CustTrade) OR (CustCredit=:CustCredit))');
              end else begin
                adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID<>:BelongID And  a.BelongID=b.UserID_ And ((a.CustState=:CustState) OR (a.CustCountry=:CustCountry) OR (a.CustProvince=:CustProvince) OR (a.CustCity=:CustCity)');
                adosupply.SQL.Add(' OR (a.CustRegion=:CustRegion) OR (a.CustRate=:CustRate) OR (a.CustType=:CustType) OR (a.CustSource=:CustSource) OR (a.CustTrade=:CustTrade) OR (a.CustCredit=:CustCredit))');
                if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
              end;
              //Showmessage(adosupply.SQL.Text);
              adosupply.Parameters.ParamByName('CustState').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustCountry').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustProvince').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustCity').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustRegion').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustRate').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustType').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustSource').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustTrade').Value:=Node.Text;
              adosupply.Parameters.ParamByName('CustCredit').Value:=Node.Text;
              //if cxRadioButton1.Checked Then
              adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
              adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
              adosupply.Prepared;
              adosupply.Open;}
              adosupply.Filtered:=False;
                  adosupply.Filter:='CustState= '+QuotedStr(Node.Text)+' OR '+
                                  'CustCountry= '+QuotedStr(Node.Text)+' OR '+
                                  'CustProvince= '+QuotedStr(Node.Text)+' OR '+
                                  'CustCity= '+QuotedStr(Node.Text)+' OR '+
                                  'CustRegion= '+QuotedStr(Node.Text)+' OR '+
                                  'CustRate= '+QuotedStr(Node.Text)+' OR '+
                                  'CustType= '+QuotedStr(Node.Text)+' OR '+
                                  'CustSource= '+QuotedStr(Node.Text)+' OR '+
                                  'CustTrade= '+QuotedStr(Node.Text)+' OR '+
                                  'CustCredit= '+QuotedStr(Node.Text);
                  adosupply.Filtered:=True;
            End;
        End;
     End;

     With DatabaseModule Do
       Begin
         IF adosupply.IsEmpty Then AdoContact.Close
         Else
           Begin
             CustSon.ActivePage:=TabContact;
             ShowContact;
             {adosupply.Last;

             ShowContract;//同时更新各子表
             ShowExpend;
             ShowSale;
             ShowSalePre;
             ShowFile;
             IF CustSon.ActivePage=TabActive Then ShowActive(False)
             Else ShowActive(False); }
           End;
       End;
          {IF GrdCust.ColumnCount<>0 Then Exit;//GrdCust.ClearItems;
          GrdCust.OptionsView.ScrollBars:=SSNone;
          FOR I:=0 TO DataBaseModule.adosupply.FieldCount - 7 Do
            Begin
              GrdCust.CreateColumn;
              GrdCust.Columns[I].Name:='CColumns'+IntToStr(I);
              GrdCust.Columns[I].Width:=80;
            End;

          GrdCust.DataController.DataSource:=DSCust;
          GrdCust.Columns[0].Caption:='归属人';
          GrdCust.Columns[0].DataBinding;
          GrdCust.Columns[0].DataBinding.FieldName:='UserName_';
          GrdCust.Columns[0].DataBinding.ValueType:='String';
          //GrdCust.Columns[0].Width:=55;

          GrdCust.Columns[1].Caption:='客户编号';
          GrdCust.Columns[1].DataBinding;
          GrdCust.Columns[1].DataBinding.FieldName:='CustNum';
          GrdCust.Columns[1].DataBinding.ValueType:='Float';

          GrdCust.Columns[2].Caption:='客户名称';
          GrdCust.Columns[2].DataBinding;
          GrdCust.Columns[2].DataBinding.FieldName:='CustName';
          GrdCust.Columns[2].DataBinding.ValueType:='String';
          //GrdCust.Columns[2].Width:=200;

          GrdCust.Columns[3].Caption:='客户电话';
          GrdCust.Columns[3].DataBinding;
          GrdCust.Columns[3].DataBinding.FieldName:='CustPhone';
          GrdCust.Columns[3].DataBinding.ValueType:='String';
          //GrdCust.Columns[3].Width:=200;

          GrdCust.Columns[4].Caption:='地址';
          GrdCust.Columns[4].DataBinding;
          GrdCust.Columns[4].DataBinding.FieldName:='CustAddress';
          GrdCust.Columns[4].DataBinding.ValueType:='String';
          //GrdCust.Columns[4].Width:=150;

          GrdCust.Columns[5].Caption:='网址';
          GrdCust.Columns[5].DataBinding;
          GrdCust.Columns[5].DataBinding.FieldName:='CustHomePage';
          GrdCust.Columns[5].DataBinding.ValueType:='String';

          GrdCust.Columns[6].Caption:='下次联系时间';
          GrdCust.Columns[6].DataBinding;
          GrdCust.Columns[6].DataBinding.FieldName:='CustNextDate';
          GrdCust.Columns[6].DataBinding.ValueType:='Datetime';

          GrdCust.Columns[7].Caption:='最后联系时间';
          GrdCust.Columns[7].DataBinding;
          GrdCust.Columns[7].DataBinding.FieldName:='CustLastDate';
          GrdCust.Columns[7].DataBinding.ValueType:='Datetime';

          GrdCust.Columns[8].Caption:='国家';
          GrdCust.Columns[8].DataBinding;
          GrdCust.Columns[8].DataBinding.FieldName:='CustCountry';
          GrdCust.Columns[8].DataBinding.ValueType:='String';

          GrdCust.Columns[9].Caption:='省份';
          GrdCust.Columns[9].DataBinding;
          GrdCust.Columns[9].DataBinding.FieldName:='CustProvince';
          GrdCust.Columns[9].DataBinding.ValueType:='String';

          GrdCust.Columns[10].Caption:='城市';
          GrdCust.Columns[10].DataBinding;
          GrdCust.Columns[10].DataBinding.FieldName:='CustCity';
          GrdCust.Columns[10].DataBinding.ValueType:='String';

          GrdCust.Columns[11].Caption:='镇区';
          GrdCust.Columns[11].DataBinding;
          GrdCust.Columns[11].DataBinding.FieldName:='CustRegion';
          GrdCust.Columns[11].DataBinding.ValueType:='String';

          GrdCust.Columns[12].Caption:='客户等级';
          GrdCust.Columns[12].DataBinding;
          GrdCust.Columns[12].DataBinding.FieldName:='CustRate';
          GrdCust.Columns[12].DataBinding.ValueType:='String';

          GrdCust.Columns[13].Caption:='客户状态';
          GrdCust.Columns[13].DataBinding;
          GrdCust.Columns[13].DataBinding.FieldName:='CustState';
          GrdCust.Columns[13].DataBinding.ValueType:='String';

          GrdCust.Columns[14].Caption:='客户类型';
          GrdCust.Columns[14].DataBinding;
          GrdCust.Columns[14].DataBinding.FieldName:='CustType';
          GrdCust.Columns[14].DataBinding.ValueType:='String';

          GrdCust.Columns[15].Caption:='客户来源';
          GrdCust.Columns[15].DataBinding;
          GrdCust.Columns[15].DataBinding.FieldName:='CustSource';
          GrdCust.Columns[15].DataBinding.ValueType:='String';

          GrdCust.Columns[16].Caption:='行业类型';
          GrdCust.Columns[16].DataBinding;
          GrdCust.Columns[16].DataBinding.FieldName:='CustTrade';
          GrdCust.Columns[16].DataBinding.ValueType:='String';

          GrdCust.Columns[17].Caption:='信用额度';
          GrdCust.Columns[17].DataBinding;
          GrdCust.Columns[17].DataBinding.FieldName:='CustCredit';
          GrdCust.Columns[17].DataBinding.ValueType:='Float';

          GrdCust.Columns[18].Caption:='邮编';
          GrdCust.Columns[18].DataBinding;
          GrdCust.Columns[18].DataBinding.FieldName:='CustPostCard';
          GrdCust.Columns[18].DataBinding.ValueType:='String';

          GrdCust.Columns[19].Caption:='备注';
          GrdCust.Columns[19].DataBinding;
          GrdCust.Columns[19].DataBinding.FieldName:='CustMemo';
          GrdCust.Columns[19].DataBinding.ValueType:='String';
          //GrdCust.Columns[19].Width:=200;


          GrdCust.Columns[20].Caption:='建立日期';
          GrdCust.Columns[20].DataBinding;
          GrdCust.Columns[20].DataBinding.FieldName:='CreateD_';
          GrdCust.Columns[20].DataBinding.ValueType:='Datetime';

          GrdCust.OptionsView.ScrollBars:=SSBoth;}
    {Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('Select HSelectLine from HideSelect Where BelongID=:BelongID And IFSelect=:IFSelect');
    Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    Query.Parameters.ParamByName('IFSelect').Value:=Boolean(0);
    Query.Prepared;
    Query.Open;
    FOR I:=1 TO Query.RecordCount Do
      Begin
        GrdCust.Columns[Query.FieldByName('HSelectLine').AsInteger].Visible:=False;
        Query.Next;
      End;

    with TcxGridDBTableSummaryItem(
           GrdCust.DataController.Summary.FooterSummaryItems.Add) do
       begin
         CustColumn:=GrdCust.Columns[1];
         CustColumn.DataBinding.FieldName :=
         GrdCust.DataController.DataSet.Fields[1].FieldName;
         Column  :=  CustColumn;
         DisplayText:='客户数';
         FieldName :=  CustColumn.DataBinding.FieldName;
         //Format  :=  '#,##0.00';
         Kind  :=  skCount;
       end;}
end;

procedure TFrm_Supply.SetupRegion;
Var
  I,PNum:integer;
begin
  FieldList:=TStringList.Create;
  With DatabaseModule Do
     Begin
       AdoDict.Close;
       AdoDict.SQL.Clear;
       AdoDict.SQL.Add('Select DictID,PFieldNum,FieldName,Context From Dict where IFCust=:IFCust');
       AdoDict.SQL.Add(' And FactTableName=:CustRegion');
       AdoDict.Parameters.ParamByName('CustRegion').Value:='CustRegion';
       AdoDict.Parameters.ParamByName('IFCust').Value:=Boolean(1);
       AdoDict.Prepared;
       AdoDict.Open;
     End;
  AdoRegion.Close;
  AdoRegion.SQL.Clear;
  AdoRegion.SQL.Add('Select CustCountry,CustProvince,CustCity,CustRegion,PNum From RegionCode');
  AdoRegion.Prepared;
  AdoRegion.Open;
  IF AdoRegion.IsEmpty Then
    Begin
      DSDict.DataSet.First;
      FOR I:=1 TO DSDict.DataSet.RecordCount DO
        Begin
          AdoRegion.Append;
          AdoRegion.FieldByName('CustRegion').AsString:=DSDict.DataSet.FieldByName('Context').AsString;
          AdoRegion.FieldByName('PNum').AsInteger:=DSDict.DataSet.FieldByName('PFieldNum').AsInteger;
          AdoRegion.Post;
          DSDict.DataSet.Next
        End;
    End;

  IF NOT AdoRegion.IsEmpty Then
    Begin
      PNUM:=0;
      AdoRegion.First;
      FOR I:=1 TO AdoRegion.RecordCount DO
        Begin
          IF Not (PNUM=AdoRegion.FieldByName('PNum').AsInteger) Then
            Begin
              PNUM:=AdoRegion.FieldByName('PNum').AsInteger;
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select DictID,PFieldNum,Context From Dict Where DICTID=:DICTID ');
              Query.Parameters.ParamByName('DICTID').Value:=PNUM;
              //Query.Parameters.ParamByName('CustRegion').Value:=AdoRegion.FieldByName('CustRegion').AsString;
              Query.Prepared;
              Query.Open;
            End;
          AdoRegion.Edit;
          AdoRegion.FieldByName('CustCity').AsString:=Query.FieldByName('Context').AsString;
          AdoRegion.FieldByName('PNUM').AsInteger:=Query.FieldByName('PFieldNum').AsInteger;
          AdoRegion.Post;
          AdoRegion.Next;
        End;

      AdoRegion.First;
      PNUM:=0;
      FOR I:=1 TO AdoRegion.RecordCount DO
        Begin
          IF Not (PNUM=AdoRegion.FieldByName('PNum').AsInteger) Then
            Begin
              PNUM:=AdoRegion.FieldByName('PNum').AsInteger;
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select DictID,PFieldNum,Context From Dict Where DICTID=:DICTID');
              Query.Parameters.ParamByName('DICTID').Value:=PNUM;
              
              Query.Prepared;
              Query.Open;
            End;
          AdoRegion.Edit;
          AdoRegion.FieldByName('CustProvince').AsString:=Query.FieldByName('Context').AsString;
          AdoRegion.FieldByName('PNUM').AsInteger:=Query.FieldByName('PFieldNum').AsInteger;
          AdoRegion.Post;
          AdoRegion.Next;
        End;

      AdoRegion.First;
      PNUM:=0;
      FOR I:=1 TO AdoRegion.RecordCount DO
        Begin
          IF Not (PNUM=AdoRegion.FieldByName('PNum').AsInteger) Then
            Begin
              PNUM:=AdoRegion.FieldByName('PNum').AsInteger;
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select DictID,PFieldNum,Context From Dict Where DICTID=:DICTID');
              Query.Parameters.ParamByName('DICTID').Value:=PNUM;
              Query.Prepared;
              Query.Open;
            End;
          AdoRegion.Edit;
          AdoRegion.FieldByName('CustCountry').AsString:=Query.FieldByName('Context').AsString;
          AdoRegion.FieldByName('PNUM').AsInteger:=Query.FieldByName('PFieldNum').AsInteger;
          AdoRegion.Post;
          AdoRegion.Next;
        End;
      Treeview.Items.BeginUpdate;
       AdoRegion.First;
       While Not AdoRegion.Eof  Do
         Begin
           TreeAddItem(Treeview,GetRegionList,AdoRegion.GetBookmark,False);
           AdoRegion.Next;
         End;
       FieldList.Clear;
       Treeview.AlphaSort;
       Treeview.Items.EndUpdate;
       IF Treeview.Items.Count <= 0 Then
          TreeViewChange(TreeView,nil);
       AdoRegion.Close;   
    End;
end;

function TFrm_Supply.GetRegionList: TStringList;
begin
  FieldList.Clear;
  FieldList.Add(AdoRegion.FieldByName('CustCountry').AsString);
  FieldList.Add(AdoRegion.FieldByName('CustProvince').AsString);
  FieldList.Add(AdoRegion.FieldByName('CustCity').AsString);
  FieldList.Add(AdoRegion.FieldByName('CustRegion').AsString);
  Result:=FieldList;
end;

procedure TFrm_Supply.tmr1Timer(Sender: TObject);
begin
  TrackBar1.Max := mp1.Length;
  SendMessage(TrackBar1.Handle,   WM_USER+5, 1, mp1.Position);
  if  mp1.Position = mp1.Length then
  begin
    TrackBar1.Position := 0 ;
    mp1.Stop;
    mp1.Open ;
  end ;
end;

procedure TFrm_Supply.TrackBar1Change(Sender: TObject);
begin
  if bndqryTelQry.fieldbyname('FFile').AsString <> ''then
  begin
    mp1.Position := TrackBar1.Position ;
    mp1.Play ;
  end ;
end;

procedure TFrm_Supply.cxgrdbtblvwGrid11DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if bndqryTelQry.fieldbyname('FFile').asstring <> '' then
  begin
    if  FileExists(ExtractFilePath(ParamStr(0))+'tempplay1.wav') then
    begin
      mp1.Close ;  // 关闭播放
      DeleteFile(ExtractFilePath(ParamStr(0))+'tempplay1.wav'); // 删除临时文件
    end ;
    TMNC_OCXX1.EC_DownLoadFileEx(cbb1.Text,bndqryTelQry.fieldbyname('FFile').asstring ,ExtractFilePath(ParamStr(0))+'tempplay1.wav'); // 下载系统
    mp1.FileName := ExtractFilePath(ParamStr(0))+'tempplay1.wav' ; // 指定路径
    mp1.Open ;   // 打开播放
    tmr1.Enabled := true ;
  end ;
end;
procedure TFrm_Supply.cxButton1Click(Sender: TObject);
begin
  inherited;
  refreshtel ;
end;

procedure TFrm_Supply.TMNC_OCXX1Connect(ASender: TObject;
  const sHost: WideString);
begin
  //inherited;
  Application.MessageBox('连接成功' ,'提示',MB_OK+MB_ICONINFORMATION);
  cbb1.Enabled := false ;
  btn4.Visible := false ;
end;

procedure TFrm_Supply.TMNC_OCXX1DisConnect(ASender: TObject;
  const sHost: WideString);
begin
  Application.MessageBox('连接失败' ,'提示',MB_OK+MB_ICONINFORMATION);
  cbb1.Enabled := true ;
end;

procedure TFrm_Supply.btn4Click(Sender: TObject);
begin
   if cbb1.Text <> '' then
   TMNC_OCXX1.EC_Connect(cbb1.Text);
end ;
procedure TFrm_Supply.btn3Click(Sender: TObject);
begin
  TMNC_OCXX1.EC_DisConnect;
  btn4.Visible := True ;
  cbb1.Enabled := True ;
end;
procedure TFrm_Supply.N30Click(Sender: TObject);
begin
  inherited;
  Frm_HideSelect:=TFrm_HideSelect.Create(Self);
  Frm_HideSelect.ShowModal;
end;

procedure TFrm_Supply.N31Click(Sender: TObject);
begin
  inherited;
  TreeViewChange(TreeView,TreeView.Selected);
end;

procedure TFrm_Supply.cxButton2Click(Sender: TObject);
begin
  inherited;
  IF ProdFind.Text<>'' Then
    Begin
      With DatabaseModule Do
        Begin
          AdoSupply.AliasName:='a';
          AdoSupply.Close;
          AdoSupply.SQL.Clear;
          AdoSupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustName,a.CustClass,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
          AdoSupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
          if RBMyCust.Checked Then
            begin
              AdoSupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From SaleForeCast c Where c.Product Like '+'''%'+ProdFind.Text+'%'''+' '+') And a.BelongID=:BelongID And a.BelongID=b.UserID_');
            end else begin
              AdoSupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.CustID In (Select c.CustID From SaleForeCase c Where c.Product Like '+'''%'+ProdFind.Text+'%'''+' '+') And a.BelongID<>:BelongID And a.BelongID=b.UserID_');
             if  AdoCust.AccSQL <> '' Then AdoCust.SQL.Add(' and '+'('+AdoCust.AccSQL+')');
            end;
          AdoSupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
          AdoSupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
          AdoSupply.Prepared;
          AdoSupply.Open;
        End;
    End;
end;

procedure TFrm_Supply.ProdFindKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF Key=13 Then cxButton2.Click;
end;

procedure TFrm_Supply.cxButton3Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
        Begin
          adosupply.AliasName:='a';
          adosupply.Close;
          adosupply.SQL.Clear;
          adosupply.SQL.Add('Select a.DeptID_,a.CustNum,a.szpy,a.CustKind,a.CustID,a.CustClass,a.CustName,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
          adosupply.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
          if RBMyCust.Checked Then  adosupply.SQL.Add(' From Customer a,Users_ b where a.CustClass = :CustClass And a.BelongID = :BelongID And a.BelongID=b.UserID_ And '+'((a.szpy Like '+'''%'+SupplyFind.Text+'%'''+') '+'OR'+' (a.CustName Like '+'''%'+SupplyFind.Text+'%'''+')) ')
           else begin
            adosupply.SQL.Add(' From Customer a,Users_ b Where a.CustClass = :CustClass And a.BelongID <> :BelongID And a.BelongID=b.UserID_ And '+'((a.szpy Like '+'''%'+SupplyFind.Text+'%'''+') '+'OR'+' (a.CustName Like '+'''%'+SupplyFind.Text+'%'''+')) ');
            if  adosupply.AccSQL <> '' Then adosupply.SQL.Add(' and '+'('+adosupply.AccSQL+')');
          end;
          adosupply.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
          adosupply.Parameters.ParamByName('CustClass').Value:=Boolean(0);
          //Showmessage(adosupply.SQL.text);
          adosupply.Prepared;
          adosupply.Open;
          adosupply.First;
        End;
end;

procedure TFrm_Supply.SupplyFindKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF Key=13 Then cxButton3.click;
end;

procedure TFrm_Supply.FormCreate(Sender: TObject);
begin
  inherited;
  LSqlCust:=False; //判断是否向服务器请求过客户数据
end;

procedure TFrm_Supply.N33Click(Sender: TObject);
var
  I:Integer;
begin
  inherited;
  With Databasemodule DO
    Begin
      AdoSupply.First;
      FOR I:=1 TO AdoSupply.RecordCount DO
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Update Customer set szpy=:szpy where CustID=:CustID');
          Query.Parameters.ParamByName('Szpy').Value:=Uppercase(GetPY(AdoSupply.FieldByName('CustName').AsString));
          Query.Parameters.ParamByName('CustID').Value:=AdoSupply.FieldByName('CustID').AsFloat;
          Query.Prepared;
          Query.ExecSQL;
          AdoSupply.Next;
        End;
      ShowmessageA('操作完成!');  
    End;
end;
end.
