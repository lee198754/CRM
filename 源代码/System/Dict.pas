unit Dict;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, StdCtrls, Buttons, ComCtrls, ADODB,
  bainaADOQuery, DBGrids, Grids;

type
  TFrm_Dict = class(TBaseData_Frm)
    DSDict: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DictName: TcxTextEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Query: TbainaADOQuery;
    GrdDict: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    EdtLimit: TcxTextEdit;
    Label1: TLabel;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GrdDictCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GrdDictCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DictNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FieldContext:String;
    Procedure SureLong;

  public
    { Public declarations }
    FTableName:String;
    DictDuty,FrmName:String;
    DictIFCust:Integer;
    PFieldNum:Integer;
  end;

var
  Frm_Dict: TFrm_Dict;

implementation

uses DataBase, NewUser, NewCust, CustContact, CustActive, NewContract,
  Contract, NewProd, NewExpend,NewNote, PreWrite, BaseSet;

{$R *.dfm}



procedure TFrm_Dict.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFrm_Dict.BitBtn5Click(Sender: TObject);
begin
  inherited;
  //IF Not BitBtn5.Visible Then Exit;
  IF FrmName='Frm_Pre' Then
    Begin
      IF DictDuty='联系方式' Then Frm_Pre.EdtMode.Text:=DSDict.DataSet.FieldByName('Context').AsString;
    End;
  IF FrmName='Frm_CustContact' Then
    Begin
      IF DictDuty='人物属性' Then Frm_CustContact.ContactValue.Text:=DSDict.DataSet.FieldByName('Context').AsString;
    End;
  IF DictDuty='费用类型' Then
    Begin
      IF FrmName='Frm_NewExpend' Then Frm_NewExpend.EdtType.Text:=DSDict.DataSet.FieldByName('Context').AsString;
      IF FrmName='Frm_CustActive' Then Frm_CustActive.ExpendType.Text:=DSDict.DataSet.FieldByName('Context').AsString;
    End;
  IF FrmName='Frm_NewContract' Then
    Begin
      IF DictDuty='合同类型' Then Frm_NewContract.EdtType.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='合同执行情况' Then Frm_NewContract.EdtExecute.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    End;
  IF FrmName='Frm_NewCode' Then
    Begin
      IF DictDuty='单位' Then Frm_NewCode.EdtUnit.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='规格' Then Frm_NewCode.EdtSpec.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    End;
  IF DictDuty='职务' Then
  Begin
    IF FrmName='Frm_user' Then Frm_User.UserDuty.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    IF FrmName='Frm_CustContact' Then Frm_CustContact.ContactDuty.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    IF FrmName='Frm_NewNote' Then Frm_NewNote.EdtDuty.Text:=DSDict.DataSet.fieldByName('Context').AsString;
  End;
  IF DictDuty='部门' Then
  Begin
    if FrmName = 'Frm_user' Then  Frm_CustContact.ContactDept.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    If FrmName = 'Frm_NewNote' Then Frm_NewNote.EdtDpart.Text := DSDict.DataSet.fieldbyname('Context').AsString;
    IF FrmName = 'Frm_CustContact' Then Frm_CustContact.ContactDept.Text:=DSDict.DataSet.FieldByName('Context').AsString;
  End;
  IF DictDuty='活动场所' Then
    Begin
      IF FrmName='Frm_CustActive' Then Frm_CustActive.EdtPlace.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF FrmName='Frm_Contract' Then Frm_CustActive.EdtPlace.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    End;
  IF DictDuty='活动方式' Then
    Begin
      IF FrmName='Frm_CustActive' Then Frm_CustActive.EdtMode.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF FrmName='Frm_Contract' Then Frm_CustActive.EdtMode.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    End;
  IF FrmName='Frm_CustActive' Then
    Begin
      IF DictDuty='客户等级' Then Frm_CustActive.CustRate.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='客户状态' Then Frm_CustActive.CustState.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='信用额度' Then Frm_CustActive.CustCredit.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    End;
  IF FrmName='Frm_NewCust' Then
    Begin
      IF DictDuty='客户等级' Then Frm_NewCust.CustRate.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='客户性质' Then Frm_NewCust.CustKind.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='客户来源' Then Frm_NewCust.CustSource.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='客户性质' Then Frm_NewCust.CustKind.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='客户类型' Then
        Begin
          Frm_NewCust.CustType.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
          Frm_NewCust.LProtectLimit:=DSDict.DataSet.FieldByName('ProtectLimit').AsInteger;
        End;
      IF DictDuty='客户行业' Then Frm_NewCust.CustTrade.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='客户状态' Then Frm_NewCust.CustState.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='信用额度' Then Frm_NewCust.CustCredit.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='国家' Then Frm_NewCust.CustCountry.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='省份' Then Frm_NewCust.CustProv.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='城市' Then Frm_NewCust.CustCity.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='区域' Then Frm_NewCust.CustRegion.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
    End;
  Close();
end;

procedure TFrm_Dict.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SureLong;
  IF DictName.Text='' Then Application.MessageBox('名称不能为空','提示',MB_OK+MB_IconWarning)
  Else
    Begin
      IF DSDict.DataSet.Locate('Context', DictName.Text, [loCaseInsensitive]) Then Exit;
      DSDict.DataSet.Append;
      IF (DictDuty='省份') OR (DictDuty='城市') OR (DictDuty='区域') Then
        DSDict.DataSet.FieldByName('PFieldNum').AsInteger:=PFieldNum
      Else DSDict.DataSet.FieldByName('PFieldNum').AsInteger:=0;
      DSDIct.DataSet.FieldByName('FactTableName').AsString:=FTableName;
      DSDict.DataSet.FieldByName('FieldName').AsString:=DictDuty;
      DSDict.DataSet.FieldByName('Context').AsString:=DictName.Text;
      DSDict.DataSet.FieldByName('IFCust').AsBoolean:=Boolean(DictIFCust);
      IF DictDuty='客户类型' Then
        DSDict.DataSet.FieldByName('ProtectLimit').AsInteger:=StrToInt(EdtLimit.Text)
      Else DSDict.DataSet.FieldByName('ProtectLimit').AsInteger:=0;  
      DSDict.DataSet.Post;
    End;
  DictName.Text:='';
  EdtLimit.Text:='0';
  DictName.SetFocus;  
end;

procedure TFrm_Dict.BitBtn2Click(Sender: TObject);
Var
  LSqlText:String;
begin
  inherited;
  LSqlText:='';
  SureLong;
  IF DictName.Text='' Then Application.MessageBox('名称不能为空','提示',MB_OK+MB_IconWarning)
  Else
    Begin
      IF DSDict.DataSet.Locate('Context;ProtectLimit', VarArrayOf([DictName.Text,EdtLimit.Text]), [loCaseInsensitive]) Then Exit
      Else
        Begin 
          DatabaseModule.dtclsData.BeginTrans;
          Try
            //GrdDict.Enabled:=False;
            DSDict.DataSet.Edit;
            DSDict.DataSet.FieldByName('Context').AsString:=DictName.Text;
            DSDict.DataSet.FieldByName('ProtectLimit').AsInteger:=StrToInt(EdtLimit.Text);
            DSDict.DataSet.Post;
            //GrdDict.Enabled:=True;


            IF DSDict.DataSet.FieldByName('IFCust').AsBoolean=Boolean(1) Then
              Begin
                LSqlText:='Update Customer Set'+' '+DSDict.DataSet.FieldByName('FactTableName').AsString+' '+'='''+
                           DSDict.DataSet.FieldByName('Context').AsString+''''+'  '+'Where'+' '+DSDict.DataSet.FieldByName('FactTableName').AsString+' '+'='''+FieldContext+'''';
                Query.Close;
                Query.SQL.Clear;
                Query.SQL.Add(LSqlText);
                Query.Prepared;
                Query.ExecSQL;
              End;
            DatabaseModule.dtclsData.CommitTrans;  
          Except
            DatabaseModule.dtclsData.RollbackTrans;
            Raise;
          End;
        End;
    End;
  DictName.Text:='';
  EdtLimit.Text:='0';
  DictName.SetFocus;
end;

procedure TFrm_Dict.BitBtn3Click(Sender: TObject);
Var
  LSqlText:String;
begin
  inherited;
  LSqlText:='';
  IF DSDict.DataSet.IsEmpty Then Exit
  Else
    Begin
      IF DSDict.DataSet.FieldByName('IFCust').AsBoolean=Boolean(1) Then
        Begin
          LSqlText:='Select * from Customer where'+'  '+DSDict.DataSet.FieldByName('FactTableName').AsString+' '+'='''+FieldContext+'''';
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add(LSqlText);
          Query.Prepared;

          Query.Open;

          IF Query.IsEmpty Then
            Begin
              IF Application.MessageBox('是否要删除该记录?','询问',MB_YESNO+MB_IconWarning)=IDYES Then
                Begin
                  DSDict.DataSet.Delete;
                End;
            End
          Else
            Application.MessageBox('该分类下有记录存在,不能删除','警告',MB_OK+MB_Iconwarning);
        End
      Else
        Begin
           IF Application.MessageBox('是否要删除该记录?','询问',MB_YESNO+MB_IconWarning)=IDYES Then
            Begin
              DSDict.DataSet.Delete;
            End;
        End;
    End;
end;

procedure TFrm_Dict.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //DatabaseModule.AdoDict.Close;
  FTableName:='';
  DictDuty:='';
  DictIFCust:=0;
  FrmName:='';
  Frm_Dict:=Nil;
  Action:=CAFree;
end;

procedure TFrm_Dict.SureLong;
begin
  IF Length(DictName.Text)>20 Then
    Begin
      Application.MessageBox('字符输入长度超过定义长度','提示',MB_OK);
      Exit;
    End;
end;

procedure TFrm_Dict.GrdDictCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF DSDict.DataSet.State = DSBrowse Then
    Begin
      FieldContext:=DSDict.DataSet.fieldbyname('Context').AsString;
      DictName.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
      EdtLimit.Text:=IntToStr(DSDict.DataSet.FieldByName('ProtectLimit').AsInteger);
    End;
end;

procedure TFrm_Dict.GrdDictCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF FrmName='Frm_BaseSet' Then
    Begin
      IF DictDuty='国家' Then
        Begin
          Frm_BaseSet.CustCountry.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
          Close();
        End;
      IF DictDuty='省份' Then
        Begin
          Frm_BaseSet.CustProv.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
          Close();
        End;
      IF DictDuty='城市' Then
        Begin
          Frm_BaseSet.CustCity.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
          Close();
        End;
      IF DictDuty='区域' Then
        Begin
          Frm_BaseSet.CustRegion.Text:=DSDict.DataSet.fieldbyname('Context').AsString;
          Close();
        End;
    End
  Else
    BitBtn5.Click;
end;

procedure TFrm_Dict.DictNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF DSDict.DataSet.Locate('Context', DictName.Text, [loPartialKey]) Then
    DictName.Style.Color:=CLRed
  Else DictName.Style.Color:=CLWhite;
end;

procedure TFrm_Dict.FormShow(Sender: TObject);
Var
  i:Integer;
begin
  inherited;
  DSDict.DataSet.FieldByName('FactTableName').Visible:=False;
  i := 0;
  DSDict.DataSet.FieldByName('IFDefault').Visible:=False;
  IF (DictDuty='客户类型') And (FrmName='Frm_BaseSet') Then
    Begin
      DSDict.DataSet.FieldByName('ProtectLimit').Visible:=True;
    End
  Else
    DSDict.DataSet.FieldByName('ProtectLimit').Visible:=False;
  IF GrdDict.ColumnCount<>0 Then Exit;
  IF (DictDuty='客户类型') And (FrmName='Frm_BaseSet') Then
  Begin
  FOR i:=0 TO DSDict.DataSet.FieldCount - 7 Do
  Begin
    GrdDict.CreateColumn;
    GrdDict.Columns[i].Name:='SaleMColumns'+IntToStr(i);
  End;
  GrdDict.DataController.DataSource:=DSDict;
  GrdDict.Columns[0].Caption:=DictDuty;
  GrdDict.Columns[0].DataBinding;
  GrdDict.Columns[0].DataBinding.FieldName:='Context';
  GrdDict.Columns[0].DataBinding.ValueType:='String';
  GrdDict.Columns[0].Width:=150;
  GrdDict.Columns[1].Caption:='保护期限';
  GrdDict.Columns[1].DataBinding;
  GrdDict.Columns[1].DataBinding.FieldName:='ProtectLimit';
  GrdDict.Columns[1].DataBinding.ValueType:='Integer';
  GrdDict.Columns[1].Width:=60;
  End
  Else
  Begin
    FOR i:=0 TO DSDict.DataSet.FieldCount - 8 Do
    Begin
    GrdDict.CreateColumn;
    GrdDict.Columns[i].Name:='SaleMColumns'+IntToStr(i);
    End;
    GrdDict.DataController.DataSource:=DSDict;
    GrdDict.Columns[0].Caption:=DictDuty;
    GrdDict.Columns[0].DataBinding;
    GrdDict.Columns[0].DataBinding.FieldName:='Context';
    GrdDict.Columns[0].DataBinding.ValueType:='String';
    GrdDict.Columns[0].Width:=150;
  End;
end;

end.
