unit SoundMager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeels, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, Menus,
  cxLookAndFeelPainters, ADODB, bainaADOQuery, StdCtrls, cxButtons,
  OleCtrls, TMNC_OCX_TLB, ComCtrls, MPlayer, BaseDataFrom, dxBar,
  dxBarExtItems, ImgList, ActnList, XPMenu;

type
    TFrm_SoundManager = class(TBaseData_Frm)
    pnl1: TPanel;
    Panel2: TPanel;
    lbl1: TLabel;
    cbb1: TComboBox;
    MediaPlayer1: TMediaPlayer;
    TrackBar1: TTrackBar;
    Panel3: TPanel;
    TMNC_OCXX1: TTMNC_OCXX;
    btn3: TcxButton;
    cxButton1: TcxButton;
    btn4: TcxButton;
    cxpgcntrl1: TcxPageControl;
    cxtbsht1: TcxTabSheet;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    bndqrySound: TbainaADOQuery;
    ds1: TDataSource;
    cxgrdbclmnGrid1DBTableView1FLocalNum: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1FRemoteNum: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1FDTStart: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1FLong: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1FIO: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1FFile: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1CustName: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1CustPhone: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1ContactName: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1ContactWorkPhone: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1ContactFamilyphone: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1ContactMobile: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1way: TcxGridDBColumn;
    Timer2: TTimer;
    TempQry: TADOQuery;
    LookQry: TADOQuery;
    CustQry: TADOQuery;
    CustQryIndexID: TBCDField;
    CustQryCustomerID: TStringField;
    CustQryCustomerName: TStringField;
    CustQryTelphone: TStringField;
    CustQryFax: TStringField;
    CustQryLinkMan: TStringField;
    CustQryaddress: TStringField;
    CustQryNet: TStringField;
    CustQryLocalNum: TStringField;
    CustQryCallInNum: TStringField;
    CustQryTelDataTime: TStringField;
    cxlkndflcntrlr1: TcxLookAndFeelController;
    procedure cxgrdbtblvwGrid1DBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure TMNC_OCXX1Connect(ASender: TObject; const sHost: WideString);
    procedure cxButton1Click(Sender: TObject);
    procedure TMNC_OCXX1CallIn(ASender: TObject; const LocalNum,
      CallInNum: WideString);
    procedure TMNC_OCXX1DisConnect(ASender: TObject;
      const sHost: WideString);
  private
    procedure refresound ;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SoundManager: TFrm_SoundManager;

implementation

uses ScreeUnt, DataBase, MainFrm;

{$R *.dfm}

{ TSoundManager }

procedure TFrm_SoundManager.refresound;
begin
  with bndqrySound do
  begin
    Close ;
    Open ;
  end ;
end;

procedure TFrm_SoundManager.cxgrdbtblvwGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if bndqrySound.fieldbyname('FFile').asstring <> '' then
  begin
    if  FileExists(ExtractFilePath(ParamStr(0))+'tempplay.wav') then
    begin
      MediaPlayer1.Close ;  // 关闭播放
      DeleteFile(ExtractFilePath(ParamStr(0))+'tempplay.wav'); // 删除临时文件
    end ;
    TMNC_OCXX1.EC_DownLoadFileEx(cbb1.Text,bndqrySound.fieldbyname('FFile').asstring ,ExtractFilePath(ParamStr(0))+'tempplay.wav'); // 下载系统
    MediaPlayer1.FileName := ExtractFilePath(ParamStr(0))+'tempplay.wav' ; // 指定路径
    MediaPlayer1.Open ;   // 打开播放
    Timer2.Enabled := true ;
  end ;
end;

procedure TFrm_SoundManager.Timer2Timer(Sender: TObject);
begin
  TrackBar1.Max := MediaPlayer1.Length;
  SendMessage(TrackBar1.Handle,   WM_USER+5, 1, MediaPlayer1.Position);
  if  MediaPlayer1.Position = MediaPlayer1.Length then
  begin
    TrackBar1.Position := 0 ;
    MediaPlayer1.Stop;
    MediaPlayer1.Open ;
  end ;
end;

procedure TFrm_SoundManager.TrackBar1Change(Sender: TObject);
begin
  if bndqrySound.fieldbyname('FFile').AsString <> ''then
  begin
    MediaPlayer1.Position := TrackBar1.Position ;
    MediaPlayer1.Play ;
  end ;
end;


procedure TFrm_SoundManager.FormShow(Sender: TObject);
begin
  refresound ;
  cbb1.Text:=DatabaseModule.AdoShareSet.FieldByName('ShareIP').AsString;
end;

procedure TFrm_SoundManager.btn4Click(Sender: TObject);
begin
   if cbb1.Text <> '' then
   TMNC_OCXX1.EC_Connect(cbb1.Text);
end;

procedure TFrm_SoundManager.btn3Click(Sender: TObject);
begin
  TMNC_OCXX1.EC_DisConnect;
  btn4.Visible := True ;
  cbb1.Enabled := True ;
end;

procedure TFrm_SoundManager.TMNC_OCXX1Connect(ASender: TObject;
  const sHost: WideString);
begin
  //inherited;
  Application.MessageBox('连接成功' ,'提示',MB_OK+MB_ICONINFORMATION);
  cbb1.Enabled := false ;
  btn4.Visible := false ;
end;
procedure TFrm_SoundManager.cxButton1Click(Sender: TObject);
begin
  refresound ;
end;

procedure TFrm_SoundManager.TMNC_OCXX1CallIn(ASender: TObject; const LocalNum,
  CallInNum: WideString);
begin
  TempQry.Close;
  TempQry.Parameters.ParamByName('UserID').Value := DataBaseModule.dtclsData.UserID_ ;
  TempQry.Parameters.ParamByName('TelNo').Value := LocalNum ;
  TempQry.Open ;
  if not TempQry.IsEmpty then
  begin
    LookQry.Close;
    LookQry.Parameters.ParamByName('Telphone').Value := CallInNum;
    LookQry.Parameters.ParamByName('Telphone1').Value := CallInNum;
    LookQry.Parameters.ParamByName('Telphone2').Value := CallInNum;
    LookQry.Parameters.ParamByName('Telphone3').Value := CallInNum;
    LookQry.Open;
    if not Assigned(ScreeFrm) then     // 判断是否创建
    begin
      ScreeFrm := TScreeFrm.Create(self);
      ScreeFrm.Show ;
      CustQry.Close ;
      CustQry.Open ;
      CustQry.Append ;
      CustQryLocalNum.Value := LocalNum ;  // 本地电话
      CustQryCallInNum.Value := CallInNum ; // 对方电话
      CustQryTelDataTime.Value := FormatDateTime('yyyy-mm-dd hh:mm:ss' ,now); // 呼入时间
      CustQryCustomerName.Value := LookQry.fieldbyname('CustName').AsString;  // 客户名称
      CustQryLinkMan.Value := LookQry.fieldbyname('ContactName').AsString;   // 联系人
      CustQryTelphone.Value :=  LookQry.fieldbyname('CustPhone').AsString;   // 联系电话
      CustQryaddress.Value := LookQry.fieldbyname('Custaddress').AsString;  //地址
    end else
    with ScreeFrm do
    begin
      CustQry.Open ;
      CustQry.Append ;
      CustQryLocalNum.Value := LocalNum ;  // 本地电话
      CustQryCallInNum.Value := CallInNum ; // 对方电话
      CustQryTelDataTime.Value := FormatDateTime('yyyy-mm-dd hh:mm:ss' ,now); // 呼入时间
      CustQryCustomerName.Value := LookQry.fieldbyname('CustName').AsString;  // 客户名称
      CustQryLinkMan.Value := LookQry.fieldbyname('ContactName').AsString;   // 联系人
      CustQryTelphone.Value :=  LookQry.fieldbyname('CustPhone').AsString;   // 联系电话
      CustQryaddress.Value := LookQry.fieldbyname('Custaddress').AsString;  //地址
    end ;
  end ;
end;

procedure TFrm_SoundManager.TMNC_OCXX1DisConnect(ASender: TObject;
  const sHost: WideString);
begin
  Application.MessageBox('连接失败' ,'提示',MB_OK+MB_ICONINFORMATION);
  cbb1.Enabled := true ;
end;
end.
