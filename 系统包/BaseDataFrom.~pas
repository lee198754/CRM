unit BaseDataFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, XPMenu, dxBar, dxBarExtItems, cxClasses, ActnList,
  ImgList,bainaADOQuery, cxLookAndFeels,DataClass,cxPC,FindDataFrom,DB
  ,ReportFrom, frxClass, frxDBSet,cxGridCustomView,cxGridCustomTableView
  ,cxGraphics,cxGridDBTableView,Menus,SkinEQGrid,CXGrid,ExtCtrls,DBChart,
  dxSkinsCore, dxSkinsdxBarPainter, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TBaseData_Frm = class(TBase_Frm)
    actlst1: TActionList;
    actAdd: TAction;
    actDel: TAction;
    actModify: TAction;
    actundo: TAction;
    actSave: TAction;
    actrefurbish: TAction;
    actSearch: TAction;
    actprint: TAction;
    actAudi: TAction;
    actUnAudi: TAction;
    actExport: TAction;
    actExit: TAction;
    imList: TImageList;
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
    BTAdd: TdxBarLargeButton;
    BTDelete: TdxBarLargeButton;
    BTEdit: TdxBarLargeButton;
    BTCancel: TdxBarLargeButton;
    BTSave: TdxBarLargeButton;
    BTFind: TdxBarLargeButton;
    BTRefresh: TdxBarLargeButton;
    BTExport: TdxBarLargeButton;
    BTCheck: TdxBarLargeButton;
    BTuncheck: TdxBarLargeButton;
    BTExit: TdxBarLargeButton;
    cxLookAndFeelController1: TcxLookAndFeelController;
    dxbrlrgbtn1: TdxBarLargeButton;
    dxbrpmn1: TdxBarPopupMenu;
    dxbrlrgbtn2: TdxBarLargeButton;
    procedure actExitExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actundoExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actModifyExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actrefurbishExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actprintExecute(Sender: TObject);
    procedure actAudiExecute(Sender: TObject);
    procedure actUnAudiExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
  private
    fMainQuery:TbainaADOQuery;
    Acc:TAccRecord; //按钮权限
    fFindData_Frm: TFindData_Frm;
    fReport_Frm:TReport_Frm;
    ReportdataSet :Array Of TbainaADOQuery;
    ReportMen:TPopupMenu;
    procedure SetMainQuery(Value:TbainaADOQuery);
    function  SetButtonState(Action:TAction):Boolean;
    procedure ReportClick(Sender: TObject);
    procedure ReportMenuItemClick(Sender: TObject);
  protected
    procedure DoClose(var Action: TCloseAction);override;
    function LoadReport:Boolean;overload;
    function LoadReport(Menu:TpopUpMenu): Boolean;overload;
  public
    procedure DoShow;override;
    function AddField(FieldName,Fieldcaption:String
        ;FieldType:TFieldType;FieldLen:Integer):Boolean;
    function AddDefaultField1(FieldName,Fieldcaption:String
        ;FieldType:TFieldType;FieldLen:Integer):Boolean;
    function AddDefaultField2(FieldName,Fieldcaption:String
        ;FieldType:TFieldType;FieldLen:Integer):Boolean;
    function AddReportdataSet(DataSet:TbainaADOQuery):Boolean;
    constructor Create(AOwner: TComponent); override;
    constructor Createnew(AOwner: TComponent;MainQuery:TbainaADOQuery);
    destructor Destroy; override;

    property Access:TAccRecord read Acc;
  published
    property MainQuery :TbainaADOQuery read fMainQuery write SetMainQuery;
  end;

var
  BaseData_Frm: TBaseData_Frm;

implementation

{$R *.dfm}

{ TBaseData_Frm }

constructor TBaseData_Frm.Create(AOwner: TComponent);
var
  i:integer;
begin
  inherited Create(AOwner);
  ReportMen := TPopupMenu.Create(AOwner);
  for i := 0 To ComponentCount -1 Do
  Begin
    if Components[i] is TcxGrid Then
       DoSkinControl(TCxGrid(Components[i]))
    else if Components[i] is TcxPageControl Then
       DoSkinControl(TcxPageControl(Components[i]))
    else if Components[i] is Tpanel Then
       Tpanel(Components[i]).Color := skinstyle.Color
    else if Components[i] is TDBChart Then
       TDBChart(Components[i]).Color := skinstyle.Color;
  End;
end;

destructor TBaseData_Frm.Destroy;
begin
  inherited;
end;

procedure TBaseData_Frm.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TBaseData_Frm.SetMainQuery(Value: TbainaADOQuery);
begin
  fMainQuery := Value;
end;

procedure TBaseData_Frm.DoShow;
var
  formname:String;
begin
  inherited  DoShow;
  //设置窗体按钮权限
 Acc := TAccRecord.Create;
 if fMainQuery = nil Then
 begin
   actAdd.Enabled := False;
   actDel.Enabled := False;
   actModify.Enabled := False;
   actundo.Enabled := False;
   actSave.Enabled := False;
   actrefurbish.Enabled := False;
   actSearch.Enabled := False;
   actprint.Enabled := False;
   actAudi.Enabled := False;
   actUnAudi.Enabled := False;
   actExport.Enabled := False;
   actExit.Enabled := True;
   Exit;
 end;
 formname := Copy(Self.ClassName,2,length(Self.ClassName) -1);
 Acc := TDataClass(fMainQuery.Connection).GetAccByFromName(formname);

 if Acc = nil Then
 begin
   ShowMessage('窗体名称"'+Self.ClassName+'"没有注册!');
   close;
 End;

 actAdd.Enabled     :=  Acc.RAdd;
 actDel.Enabled     :=  Acc.RDelete;
 actModify.Enabled  :=  Acc.REdit;
 actundo.Enabled    :=  Acc.RAdd or Acc.REdit;
 actSave.Enabled    :=  Acc.RAdd or Acc.REdit;
 actrefurbish.Enabled := True;
 actSearch.Enabled    := True;
 actprint.Enabled   :=  Acc.RPrint;
 actAudi.Enabled    :=  Acc.RCheck;
 actUnAudi.Enabled  :=  Acc.Runcheck;
 actExport.Enabled  :=  Acc.RExportExcel;
 actExit.Enabled    :=  True;

 //取报表
 LoadReport;
 SetButtonState(actundo);

end;

procedure TBaseData_Frm.DoClose(var Action: TCloseAction);
begin
  inherited;
  
end;

{
  用于设置按钮属性
}
function TBaseData_Frm.SetButtonState(Action: TAction): Boolean;
begin
  if Action = ActAdd Then  //新增
  begin
     ActAdd.Enabled       := False and Acc.RAdd;
     actDel.Enabled       := False and Acc.RDelete;
     actModify.Enabled    := False and Acc.REdit;
     actundo.Enabled      := True  and (Acc.RAdd or Acc.REdit);
     actSave.Enabled      := True  and (Acc.RAdd or Acc.REdit);
     actrefurbish.Enabled := False;
     actSearch.Enabled    := False;
     actprint.Enabled     := False and Acc.RPrint;
     actAudi.Enabled      := False and Acc.RCheck;
     actUnAudi.Enabled    := False and Acc.Runcheck;
     actExport.Enabled    := False and Acc.RExportExcel;
  end else if Action = actDel Then  //删除
  begin
  end else if  Action = ActModify Then //修改
  begin
     ActAdd.Enabled       := False and Acc.RAdd;
     actDel.Enabled       := False and Acc.RDelete;
     actModify.Enabled    := False and Acc.REdit;
     actundo.Enabled      := True and (Acc.RAdd or Acc.REdit);
     actSave.Enabled      := True and (Acc.RAdd or Acc.REdit);
     actrefurbish.Enabled := False;
     actSearch.Enabled    := False;
     actprint.Enabled     := False and Acc.RPrint;
     actAudi.Enabled      := False and Acc.RCheck;
     actUnAudi.Enabled    := False and Acc.Runcheck;
     actExport.Enabled    := False and Acc.Runcheck;
  end else if Action = actundo  Then// 取消
  begin
     ActAdd.Enabled       := True and Acc.RAdd;
     actDel.Enabled       := True and Acc.RDelete;
     actModify.Enabled    := True and Acc.REdit;
     actundo.Enabled      := False and (Acc.RAdd or Acc.REdit);
     actSave.Enabled      := False and (Acc.RAdd or Acc.REdit);
     actrefurbish.Enabled := True;
     actSearch.Enabled    := True;
     actprint.Enabled     := True and Acc.RPrint;
     actAudi.Enabled      := True and Acc.RCheck;
     actUnAudi.Enabled    := True and Acc.Runcheck;
     actExport.Enabled    := True and Acc.RExportExcel;
  end else if  Action = actSave Then //保存
  begin
     ActAdd.Enabled       := True and Acc.RAdd;
     actDel.Enabled       := True and Acc.RDelete;
     actModify.Enabled    := True and Acc.REdit;
     actundo.Enabled      := False and (Acc.RAdd or Acc.REdit);
     actSave.Enabled      := False and (Acc.RAdd or Acc.REdit);
     actrefurbish.Enabled := True;
     actSearch.Enabled    := True;
     actprint.Enabled     := True and Acc.RPrint;
     actAudi.Enabled      := True and Acc.RCheck;
     actUnAudi.Enabled    := True and Acc.Runcheck;
     actExport.Enabled    := True and Acc.RExportExcel;
  end;
end;

procedure TBaseData_Frm.actAddExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

constructor TBaseData_Frm.Createnew(AOwner: TComponent;
  MainQuery: TbainaADOQuery);
begin
  Create(AOwner);
  Self.fMainQuery := MainQuery;
end;

procedure TBaseData_Frm.actundoExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actDelExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actModifyExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actSaveExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actrefurbishExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actSearchExecute(Sender: TObject);
begin
  inherited;
  With TFindData_Frm.Create(Self) Do
  Begin
    if ShowModal = mrok Then
    Begin
    End;
  End;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actprintExecute(Sender: TObject);
begin
  inherited;
  if fMainQuery = nil Then Exit;
  AddReportdataSet(fMainQuery);
  with TReport_Frm.Create(Self,fMainQuery.Connection,ReportdataSet) Do
  Begin
    Showmodal;
  End;
  if ReportMen <> nil Then Self.LoadReport(ReportMen);
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actAudiExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actUnAudiExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

procedure TBaseData_Frm.actExportExecute(Sender: TObject);
begin
  inherited;
  SetButtonState(TAction(Sender));
end;

{
增加查询条件
}
function TBaseData_Frm.AddField(FieldName, Fieldcaption: String;
  FieldType: TFieldType; FieldLen: Integer): Boolean;
begin
  fFindData_Frm.AddField(FieldName,Fieldcaption,FieldType,FieldLen);
end;

{
增加第一个查询条件默认值
}
function TBaseData_Frm.AddDefaultField1(FieldName, Fieldcaption: String;
  FieldType: TFieldType; FieldLen: Integer): Boolean;
begin
  fFindData_Frm.AddDefaultField1(FieldName,Fieldcaption,FieldType,FieldLen);
end;

{
增加第二个查询条件默认值
}
function TBaseData_Frm.AddDefaultField2(FieldName, Fieldcaption: String;
  FieldType: TFieldType; FieldLen: Integer): Boolean;
begin
  fFindData_Frm.AddDefaultField2(FieldName,Fieldcaption,FieldType,FieldLen);
end;

{
增加报表所需数据
}
function TBaseData_Frm.AddReportdataSet(DataSet: TbainaADOQuery): Boolean;
var
  i:integer;
  function isrepeat(DataSet:TbainaADOQuery):Boolean ;
  var
    t:integer;
  Begin
    Result := False;
    if high(ReportdataSet) < 0 Then Exit;
    for t := low(ReportdataSet) to high(ReportdataSet) do
    begin
      if  ReportdataSet[t] = DataSet Then
      Begin
        Result := True;
        Exit;
      End;
    end;
  End;
begin
  if isrepeat(DataSet) Then Exit;
  i := high(ReportdataSet)+1;
  if i < 0 Then i := 0;
  SetLength(ReportdataSet,i+1);
  ReportdataSet[i] := TbainaADOQuery.Create(nil);
  ReportdataSet[i] := DataSet;
end;

{
  装载报表
}
function TBaseData_Frm.LoadReport: Boolean;
var
  frmname,msql:String;
  dxbar:TdxBarLargeButton;
begin
  if fMainQuery = nil Then Exit;
  frmname := Self.ClassName;
  msql := 'Select * from Report Where ModuName = ''' +frmname +'''';
  dxbrpmn1.ItemLinks.Clear;
  with TDataClass(fMainQuery.Connection).Query(msql) Do
  Begin
    while Not Eof Do
    Begin
      dxbar := TdxBarLargeButton.Create(Self);
      dxbar.Caption := FieldByName('RpName').AsString;
      dxbar.OnClick := ReportClick;
      dxbrpmn1.ItemLinks.Add;
      Next;
    End;
  End;
end;

procedure TBaseData_Frm.ReportClick(Sender: TObject);
var
  Rpname,frmname:String;
  Stream:TStream;
  i:Integer;
begin
  if fMainQuery = nil Then Exit;
  frmname := Self.ClassName;
  Rpname  := TdxBarLargeButton(Sender).Caption;
  if fMainQuery = nil Then Exit;
  //AddReportdataSet(fMainQuery);
  with TReport_Frm.Create(Self,fMainQuery.Connection,ReportdataSet) Do
  Begin
    ShowReport(Rpname);
  End;
end;


procedure TBaseData_Frm.ReportMenuItemClick(Sender: TObject);
var
  Rpname,frmname:String;
  Stream:TStream;
  i:Integer;
begin
  if fMainQuery = nil Then Exit;
  frmname := Self.ClassName;
  Rpname  := TMenuItem(Sender).Caption;
  Rpname :=Copy(Rpname,2,Length(Rpname)-1);
  //if pos('&',RpName) > 0 Then
    //Rpname := Copy(RpName,1,pos('&',RpName)-1);
  if fMainQuery = nil Then Exit;
  AddReportdataSet(fMainQuery);
  with TReport_Frm.Create(Self,fMainQuery.Connection,ReportdataSet) Do
  Begin
    ShowReport(Rpname);
  End;
end;

function TBaseData_Frm.LoadReport(Menu: TpopUpMenu): Boolean;
var
  frmname,msql:String;
  MenuItem:TMenuItem;
  function existsMenuItem(ID:Integer):Boolean;
  var
    i:Integer;
  begin
    Result := False;
    for i:= 0 To Menu.Items.Count -1 Do
    Begin
      if Menu.Items[i].Tag = id Then
      Begin
        Result := True;
        exit;
      End;
    End;
  end;

  function DropAllReportItem:Boolean;
  var
    i:Integer;
  begin
    Result := False;
    for i:=Menu.Items.Count -1  downTo  0 Do
    Begin
      if Menu.Items[i].Tag >= 1000 Then
      Begin
         Menu.Items[i].Free;
      End;
    End;
    Result := True;
  end;
begin
  if fMainQuery = nil Then Exit;
  frmname := Self.ClassName;
  msql := 'Select * from Report Where ModuName = ''' +frmname +'''';
  ReportMen := Menu;
  DropAllReportItem;
  if not existsMenuItem(1099) Then
  Begin
    MenuItem := TMenuItem.Create(Menu);
    MenuItem.Action := actprint;
    MenuItem.Tag := 1099;
    MenuItem.Caption := '编辑报表';
    Menu.Items.Add(MenuItem);
  End;
  with TDataClass(fMainQuery.Connection).Query(msql) Do
  Begin
    while Not Eof Do
    Begin
      if Not existsMenuItem(1000+FieldByName('RpId').AsInteger) Then
      Begin
        MenuItem := TMenuItem.Create(Menu);
        MenuItem.Caption := FieldByName('RpName').AsString;
        MenuItem.Tag := 1000+FieldByName('RpId').AsInteger;
        MenuItem.OnClick := ReportMenuItemClick;
        Menu.Items.Add(MenuItem);
      End;
      Next;
    End;
  End;
end;

end.
