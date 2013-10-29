unit Contract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxPC, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxLookAndFeels, dxBar,
  dxBarExtItems, ImgList, ActnList, XPMenu, ADODB, bainaADOQuery, Menus,
  ExtCtrls, cxGridExportLink, ShellApi, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, cxLookAndFeelPainters,
  dxSkinscxPCPainter;

type
  TFrm_Contract = class(TBaseData_Frm)
    GrdContractM: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ContractSon: TcxPageControl;
    TabMessage: TcxTabSheet;
    TabActive: TcxTabSheet;
    TabSale: TcxTabSheet;
    TabFile: TcxTabSheet;
    TabHistory: TcxTabSheet;
    AdoContractM: TbainaADOQuery;
    DSContract: TDataSource;
    GrdActive: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    PopupMenu1: TPopupMenu;
    cxGrid3: TcxGrid;
    GrdHistory: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid4: TcxGrid;
    GrdFile: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    DSActive: TDataSource;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    DSFile: TDataSource;
    N11: TMenuItem;
    N12: TMenuItem;
    Splitter1: TSplitter;
    cxGrid5: TcxGrid;
    GrdSale: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    dlgSave1: TSaveDialog;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Query: TbainaADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actModifyExecute(Sender: TObject);
    procedure GrdContractMCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure TabFileShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ContractSonChange(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actrefurbishExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actAudiExecute(Sender: TObject);
    procedure actUnAudiExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure GrdContractMCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N7Click(Sender: TObject);
    procedure GrdActiveCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    Procedure ContractShowActive(IFFinish:Boolean);
    Procedure ContractShowSale;
    Procedure ContractShowMessage;
    Procedure ContractShowFile;
    Procedure ShowMenuitem(Active,ContractFile:Boolean);
  public
    { Public declarations }
    Procedure ShowContract;
  end;

var
  Frm_Contract: TFrm_Contract;

implementation

uses DataBase, PublicClass, NewContract, CustActive, FileCenter, MainFrm,
  Day;

{$R *.dfm}

procedure TFrm_Contract.FormCreate(Sender: TObject);
begin
  inherited;
  ShowContract;
  DatabaseModule.AdoContract.AllowCheckAcc := True;
end;

procedure TFrm_Contract.actAddExecute(Sender: TObject);
begin
  inherited;
  IF Self.Access.RAdd Then
    Begin
      ISAdd:=True;
      ISEdit:=False;
      PNContract:=2;
      Frm_NewContract:=TFrm_NewContract.Create(Self);
      Frm_NewContract.ShowModal;
      ShowContract;
    End
  Else
    Application.MessageBox('你没有新增记录的权限','提示',MB_OK+MB_Iconwarning);  
end;

procedure TFrm_Contract.actModifyExecute(Sender: TObject);
begin
  inherited;
  IF (DatabaseModule.AdoContract.ModifyAcc(DSContract.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.REdit) Then
    Begin
      Application.MessageBox('你没有修改此资料的权限.','提示',MB_OK+MB_Iconwarning);
      BTCancel.Click;
      Exit;
    End;
  IF DSContract.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
  Begin
    Application.MessageBox('合同已审核,不能再修改','提示',MB_OK+MB_IconWarning);
    Exit;
  End;
  ISAdd:=False;
  ISEdit:=True;
  PNContract:=2;
  Frm_NewContract:=TFrm_NewContract.Create(Self);
  Frm_NewContract.ShowModal;
  BTCancel.Click;
  ShowContract;
end;

procedure TFrm_Contract.ContractShowActive(IFFinish: Boolean);
Var
  I:Integer;
begin
  With DataBaseModule Do
    Begin
      AdoActive.Close;
      AdoActive.SQL.Clear;
      AdoActive.SQL.Add('Select ActiveNum,DeptID_,CustID,UserID,ProJNum,ContactName,ActiveName,ActiveText,ActiveType,ActivePlace,ActiveOption,ActiveMode,ActiveBeginDate,ActiveEndDate,ActiveBeginTime,ActiveEndTime,IFFinish');
      AdoActive.SQL.Add(',IFWarn,StartWarn,ActiveMemo,WarnBeginDate,WarnEndDate,WarnBeginTime,WarnEndTime,IFAllDay,CreateBy_,CreateD_,BelongID,UpdateBy_,UpdateD_');
      AdoActive.SQL.Add('From CustActive Where ProjNum=:ProJNum And IFFinish=:IFFinish');
      AdoActive.Parameters.ParamByName('ProJNum').Value:=DSContract.DataSet.fieldbyname('ContractID').AsInteger;
      AdoActive.Parameters.ParamByName('IFFInish').Value:=IFFinish;
      AdoActive.Prepared;
      AdoActive.Open;
    End;

  IF GrdActive.ColumnCount=0 Then
  Begin
  //GrdActive.OptionsView.ScrollBars:=SSNone;
    FOR I:=0 TO DataBaseModule.AdoActive.FieldCount - 22 Do
      Begin
        GrdActive.CreateColumn;
        GrdHistory.CreateColumn;
        GrdActive.Columns[I].Name:='ActiveColumns'+IntToStr(I);
        GrdHistory.Columns[I].Name:='History'+IntToStr(I);
        GrdActive.Columns[I].Width:=100;
        GrdHistory.Columns[I].Width:=100;
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

          GrdActive.Columns[3].Caption:='活动场所';
          GrdActive.Columns[3].DataBinding;
          GrdActive.Columns[3].DataBinding.FieldName:='ActivePlace';
          GrdActive.Columns[3].DataBinding.ValueType:='String';

          GrdActive.Columns[4].Caption:='活动方式';
          GrdActive.Columns[4].DataBinding;
          GrdActive.Columns[4].DataBinding.FieldName:='ActiveMode';
          GrdActive.Columns[4].DataBinding.ValueType:='String';

          GrdActive.Columns[5].Caption:='活动内容';
          GrdActive.Columns[5].DataBinding;
          GrdActive.Columns[5].DataBinding.FieldName:='Activetext';
          GrdActive.Columns[5].DataBinding.ValueType:='String';

          GrdActive.Columns[6].Caption:='是否完成';
          GrdActive.Columns[6].DataBinding;
          GrdActive.Columns[6].DataBinding.FieldName:='IFFinish';
          GrdActive.Columns[6].DataBinding.ValueType:='Boolean';
          GrdActive.Columns[6].Width:=60;

          GrdActive.Columns[7].Caption:='开始日期';
          GrdActive.Columns[7].DataBinding;
          GrdActive.Columns[7].DataBinding.FieldName:='ActiveBeginDate';
          GrdActive.Columns[7].DataBinding.ValueType:='Datetime';

          GrdActive.Columns[8].Caption:='结束日期';
          GrdActive.Columns[8].DataBinding;
          GrdActive.Columns[8].DataBinding.FieldName:='ActiveEndDate';
          GrdActive.Columns[8].DataBinding.ValueType:='Datatime';
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

          GrdHistory.Columns[3].Caption:='活动场所';
          GrdHistory.Columns[3].DataBinding;
          GrdHistory.Columns[3].DataBinding.FieldName:='ActivePlace';
          GrdHistory.Columns[3].DataBinding.ValueType:='String';

          GrdHistory.Columns[3].Caption:='活动方式';
          GrdHistory.Columns[3].DataBinding;
          GrdHistory.Columns[3].DataBinding.FieldName:='ActiveMode';
          GrdHistory.Columns[3].DataBinding.ValueType:='String';

          GrdHistory.Columns[4].Caption:='活动内容';
          GrdHistory.Columns[4].DataBinding;
          GrdHistory.Columns[4].DataBinding.FieldName:='Activetext';
          GrdHistory.Columns[4].DataBinding.ValueType:='String';

          GrdHistory.Columns[5].Caption:='是否完成';
          GrdHistory.Columns[5].DataBinding;
          GrdHistory.Columns[5].DataBinding.FieldName:='IFFinish';
          GrdHistory.Columns[5].DataBinding.ValueType:='Boolean';
          GrdHistory.Columns[5].Width:=60;

          GrdHistory.Columns[6].Caption:='开始日期';
          GrdHistory.Columns[6].DataBinding;
          GrdHistory.Columns[6].DataBinding.FieldName:='ActiveBeginDate';
          GrdHistory.Columns[6].DataBinding.ValueType:='Datetime';

          GrdHistory.Columns[7].Caption:='结束日期';
          GrdHistory.Columns[7].DataBinding;
          GrdHistory.Columns[7].DataBinding.FieldName:='ActiveEndDate';
          GrdHistory.Columns[7].DataBinding.ValueType:='Datatime';
      //GrdActive.OptionsView.ScrollBars:=SSNone;
     End;
end;

procedure TFrm_Contract.ContractShowFile;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      ContractFile.Close;
      ContractFile.SQL.Clear;
      ContractFile.SQL.Add('Select a.FileIDM,a.custID,b.FileID,b.MyFileName,b.BelongID,b.DeptID_,b.UserID,b.CustID,b.FileType,b.ProJNum,b.FilePath,b.FileSelfID,b.CreateBy_,b.CreateD_,b.UpdateBy_,b.UpdateD_');
      ContractFile.SQL.Add(' From ContractFile a,FileCenter b Where a.ContractID=:ContractID And a.FileIDM=B.FileID');
      ContractFile.Parameters.ParamByName('ContractID').Value:=DSContract.DataSet.fieldByName('ContractID').AsInteger;
      ContractFile.Prepared;
      ContractFile.Open;
    End;

  IF GrdFile.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO DataBaseModule.ContractFile.FieldCount - 14 Do
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

end;

procedure TFrm_Contract.ContractShowMessage;
begin
  //
end;

procedure TFrm_Contract.ContractShowSale;
begin
  //
end;

procedure TFrm_Contract.GrdContractMCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF ContractSon.ActivePage=TabFile Then ContractShowFile;
  IF ContractSon.ActivePage=TabActive Then ContractShowActive(False)
  Else ContractShowActive(True);
  Contractson.PopupMenu:=Popupmenu1;
end;

procedure TFrm_Contract.N5Click(Sender: TObject);
begin
  inherited;
  IF Not DSContract.DataSet.IsEmpty Then
    Begin
      ISAdd:=True;
      ISEdit:=False;
      PNActive:=2;
      Frm_CustActive:=TFrm_CustActive.Create(Self);
      Frm_CustActive.cxTabSheet1.TabVisible:=True;
      Frm_CustActive.cxTabSheet2.TabVisible:=False;
      Frm_CustActive.ShowModal;
      ContractShowActive(False);
    End;
end;

procedure TFrm_Contract.N9Click(Sender: TObject);
begin
  inherited;
  IF Not (DSContract.DataSet.IsEmpty) Then
    Begin
      Frm_FileCenter:=TFrm_FileCenter.Create(Self);
      PNFile:=2;
      Frm_FileCenter.ShowModal;
      ConTractShowFile;
    End;
end;

procedure TFrm_Contract.TabFileShow(Sender: TObject);
begin
  inherited;
  ContractShowFile;
end;

procedure TFrm_Contract.N6Click(Sender: TObject);
begin
  inherited;

  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      IF (DatabaseModule.AdoContract.ModifyAcc(DSContract.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.REdit) Then
        Begin
          Application.MessageBox('你没有修改此资料的权限.','提示',MB_OK+MB_Iconwarning);
          BTCancel.Click;
          Exit;
        End
      Else
        Begin
          ISEdit:=True;
          ISAdd:=False;
          PNActive:=2;
          Frm_CustActive:=TFrm_CustActive.Create(Self);
          Frm_CustActive.cxTabSheet1.TabVisible:=True;
          Frm_CustActive.cxTabSheet2.TabVisible:=False;
          Frm_CustActive.ShowModal;
        End;
    End;
end;

procedure TFrm_Contract.N12Click(Sender: TObject);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      PNActive:=2;
      Frm_Day.cxScheduler1.CreateEventUsingDialog(False,False);
    End;  
end;

procedure TFrm_Contract.N10Click(Sender: TObject);
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
        shellexecute(handle,'open',pchar(Filename),'','',Sw_show)
      Else Application.MessageBox('网路有故障','提示',MB_OK+MB_Iconwarning);
    End;
end;

procedure TFrm_Contract.ShowMenuitem(Active, ContractFile : Boolean);
begin
  N5.Visible:=Active;
  N6.Visible:=Active;
  N7.Visible:=Active;
  N8.Visible:=Active;
  N11.Visible:=Active;
  N12.Visible:=Active;
  N9.Visible:=ContractFile;
  N10.Visible:=ContractFile;
end;

procedure TFrm_Contract.ContractSonChange(Sender: TObject);
begin
  inherited;
  IF ContractSon.ActivePage=TabActive Then
    Begin
      ShowMenuitem(True,False);
      ContractShowActive(False);
    End;
  IF ContractSon.ActivePage=TabFile Then
    Begin
      ShowMenuItem(False,True);
      ContractShowFile;
    End;
  IF ContractSon.ActivePage=TabHistory Then
    Begin
      ShowMenuitem(False,False);
      ContractShowActive(true);
    End;
end;

procedure TFrm_Contract.actDelExecute(Sender: TObject);
begin
  inherited;
  IF (DatabaseModule.AdoContract.DeleteAcc(DSContract.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.RDelete) Then
    Begin
      Application.MessageBox('你没有删除此资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End
  Else
    Begin
      IF Application.MessageBox('真的要删除此合同吗?','提示',MB_YESNO+MB_Iconwarning)=IDNO Then Exit
      Else DSContract.DataSet.Delete;
    End;
end;

procedure TFrm_Contract.ShowContract;
Var
  I:Integer;
begin
  inherited;
  With DatabaseModule DO
    Begin
      AdoContract.AliasName:='b';
      AdoContract.Close;
      AdoContract.SQL.Clear;
      AdoContract.SQL.Add('Select a.CustID As MCustID,a.CustName,b.ContractID,b.DeptID_,b.CustId,b.ContractNum,b.ContractTitle,b.ContractContent,b.WriteMan,b.WriteDate,b.ContractMan,b.ContractBeginDate');
      AdoContract.SQL.Add(',b.ContractEndDate,b.ContractMoney,b.ContractType,b.ContractExecute,b.IFCheck,b.CheckMan,b.CheckDate,b.CreateD_,b.CreateBy_,b.Updated_,b.UpdateBy_,b.BelongID');
      AdoContract.SQL.Add('From Customer a,Contract b where (B.BelongID=:BelongID ');
      if  AdoContract.AccSQL <> '' Then
      begin
        AdoContract.SQL.Add(' OR '+'('+AdoContract.AccSQL+')');
      END;
      AdoContract.SQL.Add(')');
      AdoContract.SQL.Add(' And b.CustID=a.CustID');
      AdoContract.Parameters.ParamByName('BelongID').Value:=dtclsData.UserID_;
      //showmessage(adocontract.SQL.Text);
      AdoContract.Open;
    End;
  if GrdContractM = nil then exit;
  IF GrdContractM.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  //GrdContract.OptionsView.ScrollBars:=SSNone;

  FOR I:=0 TO DSContract.DataSet.FieldCount - 11 Do
    Begin
      GrdContractM.CreateColumn;
      GrdContractM.Columns[I].Name:='ContractMColumns'+IntToStr(I);
      GrdContractM.Columns[I].Width:=100;
   End;
          GrdContractM.DataController.DataSource:=DSContract;
          GrdContractM.Columns[0].Caption:='合同编号';
          GrdContractM.Columns[0].DataBinding;
          GrdContractM.Columns[0].DataBinding.FieldName:='ContractNum';
          GrdContractM.Columns[0].DataBinding.ValueType:='String';

          GrdContractM.Columns[1].Caption:='客户名称';
          GrdContractM.Columns[1].DataBinding;
          GrdContractM.Columns[1].DataBinding.FieldName:='CustName';
          GrdContractM.Columns[1].DataBinding.ValueType:='String';

          GrdContractM.Columns[2].Caption:='合同名称';
          GrdContractM.Columns[2].DataBinding;
          GrdContractM.Columns[2].DataBinding.FieldName:='ContractTitle';
          GrdContractM.Columns[2].DataBinding.ValueType:='String';
          GrdContractM.Columns[2].Width:=150;

          GrdContractM.Columns[3].Caption:='签订方负责人';
          GrdContractM.Columns[3].DataBinding;
          GrdContractM.Columns[3].DataBinding.FieldName:='ContractMan';
          GrdContractM.Columns[3].DataBinding.ValueType:='String';

          GrdContractM.Columns[4].Caption:='签订日期';
          GrdContractM.Columns[4].DataBinding;
          GrdContractM.Columns[4].DataBinding.FieldName:='WriteDate';
          GrdContractM.Columns[4].DataBinding.ValueType:='DateTime';

          GrdContractM.Columns[5].Caption:='负责人';
          GrdContractM.Columns[5].DataBinding;
          GrdContractM.Columns[5].DataBinding.FieldName:='WriteMan';
          GrdContractM.Columns[5].DataBinding.ValueType:='String';

          GrdContractM.Columns[6].Caption:='是否审核';
          GrdContractM.Columns[6].DataBinding;
          GrdContractM.Columns[6].DataBinding.FieldName:='IFCheck';
          GrdContractM.Columns[6].DataBinding.ValueType:='Boolean';

          GrdContractM.Columns[7].Caption:='合同生效日期';
          GrdContractM.Columns[7].DataBinding;
          GrdContractM.Columns[7].DataBinding.FieldName:='ContractBeginDate';
          GrdContractM.Columns[7].DataBinding.ValueType:='DateTime';

          GrdContractM.Columns[8].Caption:='合同结束日期';
          GrdContractM.Columns[8].DataBinding;
          GrdContractM.Columns[8].DataBinding.FieldName:='ContractEndDate';
          GrdContractM.Columns[8].DataBinding.ValueType:='DateTime';

          GrdContractM.Columns[9].Caption:='合同内容';
          GrdContractM.Columns[9].DataBinding;
          GrdContractM.Columns[9].DataBinding.FieldName:='ContractContent';
          GrdContractM.Columns[9].DataBinding.ValueType:='String';

          GrdContractM.Columns[10].Caption:='合同类型';
          GrdContractM.Columns[10].DataBinding;
          GrdContractM.Columns[10].DataBinding.FieldName:='ContractType';
          GrdContractM.Columns[10].DataBinding.ValueType:='String';

          GrdContractM.Columns[11].Caption:='执行情况';
          GrdContractM.Columns[11].DataBinding;
          GrdContractM.Columns[11].DataBinding.FieldName:='ContractExecute';
          GrdContractM.Columns[11].DataBinding.ValueType:='String';

          GrdContractM.Columns[12].Caption:='审核人';
          GrdContractM.Columns[12].DataBinding;
          GrdContractM.Columns[12].DataBinding.FieldName:='CheckMan';
          GrdContractM.Columns[12].DataBinding.ValueType:='String';

          GrdContractM.Columns[13].Caption:='审核日期';
          GrdContractM.Columns[13].DataBinding;
          GrdContractM.Columns[13].DataBinding.FieldName:='CheckDate';
          GrdContractM.Columns[13].DataBinding.ValueType:='DataTime';

          GrdContractM.Columns[13].Caption:='审核日期';
          GrdContractM.Columns[13].DataBinding;
          GrdContractM.Columns[13].DataBinding.FieldName:='CheckDate';
          GrdContractM.Columns[13].DataBinding.ValueType:='DataTime';

       //GrdContract.OptionsView.ScrollBars:=SSBoth;

end;

procedure TFrm_Contract.actrefurbishExecute(Sender: TObject);
begin
  inherited;
  ShowContract;
end;

procedure TFrm_Contract.actExportExecute(Sender: TObject);
begin
  inherited;
  if dlgSave1.Execute then
  ExportGridToExcel(dlgSave1.FileName ,cxGrid1);
end;

procedure TFrm_Contract.actAudiExecute(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin

          IF AdoContract.IsEmpty Then Exit;
          IF (Not Self.Access.RCheck) Then
            Begin
              Application.MessageBox('你没有审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
              Exit;
            End;
          AdoContract.Check(DSContract.DataSet.FieldByname('ContractID').AsInteger,'ContractID');
        End

end;

procedure TFrm_Contract.actUnAudiExecute(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin

          IF AdoContract.IsEmpty Then Exit;
          IF (Not Self.Access.Runcheck) Then
            Begin
              Application.MessageBox('你没有反审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
              Exit;
            End;
          AdoContract.UnCheck(DSContract.DataSet.FieldByname('ContractID').AsInteger,'ContractID');
        End
end;

procedure TFrm_Contract.N1Click(Sender: TObject);
begin
  inherited;
  actAddExecute(ActAdd);
end;

procedure TFrm_Contract.N2Click(Sender: TObject);
begin
  inherited;
  actModifyExecute(actModify);
end;

procedure TFrm_Contract.N3Click(Sender: TObject);
begin
  inherited;
  actdelExecute(Actdel);
end;

procedure TFrm_Contract.N13Click(Sender: TObject);
begin
  inherited;
  actAudiExecute(actAudi);
end;

procedure TFrm_Contract.N14Click(Sender: TObject);
begin
  inherited;
  actunaudiExecute(actunAudi);
end;

procedure TFrm_Contract.N16Click(Sender: TObject);
begin
  inherited;
  actExportExecute(actExport);
end;

procedure TFrm_Contract.GrdContractMCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  IF DSContract.DataSet.IsEmpty Then Exit;
  ISBrowse:=True;
  ISAdd:=False;
  ISEdit:=False;
  PNContract:=2;
  Frm_NewContract:=TFrm_NewContract.Create(Self);
  Frm_NewContract.ShowModal;
end;

procedure TFrm_Contract.N7Click(Sender: TObject);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
      IF (DatabaseModule.AdoContract.DeleteAcc(DSContract.DataSet.fieldbyname('BelongID').Asinteger) = False) OR (Not Self.Access.RDelete) Then
        Begin
          Application.MessageBox('你没有删除此资料的权限.','提示',MB_OK+MB_Iconwarning);
          Exit;
        End
      Else
        Begin
          IF Application.MessageBox('确定要删除此活动记录吗?','提示',MB_YESNO+MB_Iconwarning)=IDNO Then Exit
          Else DSActive.DataSet.Delete;
        End;
    End;
end;

procedure TFrm_Contract.GrdActiveCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not (DSActive.DataSet.IsEmpty) Then
    Begin
          ISBrowse:=True;
          PNActive:=2;
          Frm_CustActive:=TFrm_CustActive.Create(Self);
          Frm_CustActive.cxTabSheet1.TabVisible:=True;
          Frm_CustActive.cxTabSheet2.TabVisible:=False;
          Frm_CustActive.ShowModal;
        End;
end;

end.
