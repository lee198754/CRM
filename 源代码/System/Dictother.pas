unit Dictother;

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
  TFrm_Dictother = class(TBaseData_Frm)
    DSDictOther: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Query: TbainaADOQuery;
    GrdDict: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DictName: TcxTextEdit;
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
  Frm_Dictother: TFrm_Dictother;

implementation

uses DataBase, NewUser, NewCust, CustContact, CustActive, NewContract,
  Contract, NewProd, NewExpend,NewNote, PreWrite, BaseSet;

{$R *.dfm}



procedure TFrm_Dictother.BitBtn4Click(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFrm_Dictother.BitBtn5Click(Sender: TObject);
begin
  inherited;
  //IF Not BitBtn5.Visible Then Exit;
  IF FrmName='Frm_Pre' Then
    Begin
      IF DictDuty='联系方式' Then Frm_Pre.EdtMode.Text:=DSDictOther.DataSet.FieldByName('Context').AsString;
    End;
  IF FrmName='Frm_CustContact' Then
    Begin
      IF DictDuty='人物属性' Then Frm_CustContact.ContactValue.Text:=DSDictOther.DataSet.FieldByName('Context').AsString;
    End;
  IF DictDuty='费用类型' Then
    Begin
      IF FrmName='Frm_NewExpend' Then Frm_NewExpend.EdtType.Text:=DSDictOther.DataSet.FieldByName('Context').AsString;
      IF FrmName='Frm_CustActive' Then Frm_CustActive.ExpendType.Text:=DSDictOther.DataSet.FieldByName('Context').AsString;
    End;
  IF FrmName='Frm_NewContract' Then
    Begin
      IF DictDuty='合同类型' Then Frm_NewContract.EdtType.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='合同执行情况' Then Frm_NewContract.EdtExecute.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    End;
  IF FrmName='Frm_NewCode' Then
    Begin
      IF DictDuty='单位' Then Frm_NewCode.EdtUnit.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
      IF DictDuty='规格' Then Frm_NewCode.EdtSpec.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    End;
  IF DictDuty='职务' Then
  Begin
    IF FrmName='Frm_user' Then Frm_User.UserDuty.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    IF FrmName='Frm_CustContact' Then Frm_CustContact.ContactDuty.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    IF FrmName='Frm_NewNote' Then Frm_NewNote.EdtDuty.Text:=DSDictOther.DataSet.fieldByName('Context').AsString;
  End;
  IF DictDuty='部门' Then
  Begin
    If FrmName = 'Frm_NewNote' Then Frm_NewNote.EdtDpart.Text := DSDictOther.DataSet.fieldbyname('Context').AsString;
    IF FrmName = 'Frm_CustContact' Then Frm_CustContact.ContactDept.Text:=DSDictOther.DataSet.FieldByName('Context').AsString;
  End;
  IF DictDuty='活动场所' Then
    Begin
      IF FrmName='Frm_CustActive' Then Frm_CustActive.EdtPlace.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
      IF FrmName='Frm_Contract' Then Frm_CustActive.EdtPlace.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    End;
  IF DictDuty='活动方式' Then
    Begin
      IF FrmName='Frm_CustActive' Then Frm_CustActive.EdtMode.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
      IF FrmName='Frm_Contract' Then Frm_CustActive.EdtMode.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    End;

  Close();
end;

procedure TFrm_Dictother.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SureLong;
  IF DictName.Text='' Then Application.MessageBox('名称不能为空','提示',MB_OK+MB_IconWarning)
  Else
    Begin
      IF DSDictOther.DataSet.Locate('Context', DictName.Text, [loCaseInsensitive]) Then Exit;
      DSDictOther.DataSet.Append;
      DSDictOther.DataSet.FieldByName('PFieldNum').AsInteger:=0;
      DSDictOther.DataSet.FieldByName('FactTableName').AsString:=FTableName;
      DSDictOther.DataSet.FieldByName('FieldName').AsString:=DictDuty;
      DSDictOther.DataSet.FieldByName('Context').AsString:=DictName.Text;
      DSDictOther.DataSet.FieldByName('IFCust').AsBoolean:=Boolean(0);
      DSDictOther.DataSet.FieldByName('ProtectLimit').AsInteger:=0;
      DSDictOther.DataSet.Post;
    End;
  DictName.Text:='';
  DictName.SetFocus;  
end;

procedure TFrm_Dictother.BitBtn2Click(Sender: TObject);
Var
  LSqlText:String;
begin
  inherited;
  LSqlText:='';
  SureLong;
  IF DictName.Text='' Then Application.MessageBox('名称不能为空','提示',MB_OK+MB_IconWarning)
  Else
    Begin
      IF DSDictOther.DataSet.Locate('Context',DictName.Text, [loCaseInsensitive]) Then Exit
      Else
        Begin 
          DatabaseModule.dtclsData.BeginTrans;
          Try
            DSDictOther.DataSet.Edit;
            DSDictOther.DataSet.FieldByName('Context').AsString:=DictName.Text;
            DSDictOther.DataSet.Post;

            DatabaseModule.dtclsData.CommitTrans;  
          Except
            DatabaseModule.dtclsData.RollbackTrans;
            Raise;
          End;
        End;
    End;
  DictName.Text:='';
  DictName.SetFocus;
end;

procedure TFrm_Dictother.BitBtn3Click(Sender: TObject);
begin
  inherited;
  IF DSDictOther.DataSet.IsEmpty Then Exit
  Else
    Begin
      IF Application.MessageBox('是否要删除该记录?','询问',MB_YESNO+MB_IconWarning)=IDYES Then
        Begin
          DSDictOther.DataSet.Delete;
        End;
    End;
end;

procedure TFrm_Dictother.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FTableName:='';
  DictDuty:='';
  DictIFCust:=0;
  FrmName:='';
  Frm_Dictother:=Nil;
  Action:=CAFree;
end;

procedure TFrm_Dictother.SureLong;
begin
  IF Length(DictName.Text)>20 Then
    Begin
      Application.MessageBox('字符输入长度超过定义长度','提示',MB_OK);
      Exit;
    End;
end;

procedure TFrm_Dictother.GrdDictCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF DSDictOther.DataSet.State = DSBrowse Then
    Begin
      FieldContext:=DSDictOther.DataSet.fieldbyname('Context').AsString;
      DictName.Text:=DSDictOther.DataSet.fieldbyname('Context').AsString;
    End;
end;

procedure TFrm_Dictother.GrdDictCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  BitBtn5.Click;
end;

procedure TFrm_Dictother.DictNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF DSDictOther.DataSet.Locate('Context', DictName.Text, [loPartialKey]) Then
    DictName.Style.Color:=CLRed
  Else DictName.Style.Color:=CLWhite;
end;

procedure TFrm_Dictother.FormShow(Sender: TObject);
Var
  i:Integer;
begin
  inherited;
  DSDictOther.DataSet.FieldByName('FactTableName').Visible:=False;
  i := 0;
  DSDictOther.DataSet.FieldByName('IFDefault').Visible:=False;

  IF GrdDict.ColumnCount<>0 Then Exit
  Else
  Begin
    FOR i:=0 TO DSDictOther.DataSet.FieldCount - 8 Do
    Begin
    GrdDict.CreateColumn;
    GrdDict.Columns[i].Name:='SaleMColumns'+IntToStr(i);
    End;
    GrdDict.DataController.DataSource:=DSDictOther;
    GrdDict.Columns[0].Caption:=DictDuty;
    GrdDict.Columns[0].DataBinding;
    GrdDict.Columns[0].DataBinding.FieldName:='Context';
    GrdDict.Columns[0].DataBinding.ValueType:='String';
    GrdDict.Columns[0].Width:=150;
  End;
end;

end.
