unit NewContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxMemo, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxGraphics, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxButtonEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, DB,
  ADODB, bainaADOQuery;

type
  TFrm_NewContract = class(TBaseData_Frm)
    EdtNum: TcxTextEdit;
    cxLabel1: TcxLabel;
    EdtName: TcxTextEdit;
    cxLabel2: TcxLabel;
    EdtContent: TcxMemo;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    EdtMoney: TcxTextEdit;
    EdtType: TcxButtonEdit;
    EdtExecute: TcxButtonEdit;
    EdtBeginDate: TcxDateEdit;
    EdtDate: TcxDateEdit;
    EdtEndDate: TcxDateEdit;
    EdtCust: TcxButtonEdit;
    EdtContact: TcxButtonEdit;
    cxLabel13: TcxLabel;
    BtnSave: TcxButton;
    BtnExit: TcxButton;
    DSCust: TDataSource;
    DSContact: TDataSource;
    DSContract: TDataSource;
    EdtMan: TcxButtonEdit;
    AdoCust: TbainaADOQuery;
    AdoContact: TbainaADOQuery;
    Query: TbainaADOQuery;
    procedure EdtCustClick(Sender: TObject);
    procedure EdtContactClick(Sender: TObject);
    procedure EdtTypeClick(Sender: TObject);
    procedure EdtExecuteClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtManClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtMoneyPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    Procedure GetContractRecord;
  public
    { Public declarations }
    ContractOption:integer;//1：客户管理，2：合同管理
  end;

var
  Frm_NewContract: TFrm_NewContract;

implementation

uses Search, DataBase, Dictother, PublicClass, Customer, Contract, Supply;

{$R *.dfm}

procedure TFrm_NewContract.EdtCustClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_NewContract.DSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_NewContract';
  Frm_search.ShowModal;
end;

procedure TFrm_NewContract.EdtContactClick(Sender: TObject);
begin
  inherited;
  IF EdtCust.Text='' Then Exit;
  AdoContact.Close;
  AdoContact.SQL.Clear;
  AdoContact.SQL.Add('Select ContactName From Contact Where CustID=:CustID');
  IF PNContract=1 Then
    AdoContact.Parameters.ParamByName('CustID').Value:=DatabaseModule.AdoCust.FieldByName('CustID').AsInteger;
  IF PNContract=2 Then
    AdoContact.Parameters.ParamByName('CustID').Value:=AdoCust.FieldByName('CustID').AsInteger;
  AdoContact.Prepared;
  AdoContact.Open;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=DSContact;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户联系人';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='ContactName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_NewContract';
  Frm_search.ShowModal;
end;

procedure TFrm_NewContract.EdtTypeClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
     Begin
       AdoDictOther.Close;
       AdoDictOther.SQL.Clear;
       AdoDictOther.SQL.Add('Select * from DictOther where FieldName=:FieldName');
       AdoDictOther.Parameters.ParamByName('FieldName').Value:='合同类型';
       AdoDictOther.Prepared;
       AdoDictOther.Open;

       AdoDictOther.FieldByName('DictID').Visible:=False;
       AdoDictOther.FieldByName('FieldName').Visible:=False;
       AdoDictOther.FieldByName('IFCust').Visible:=False;
       AdoDictOther.FieldByName('Context').DisplayLabel:='合同类型';
     End;
  Frm_DictOther:=TFrm_DictOther.Create(Self);
  Frm_DictOther.FTableName:='ContractType';
  Frm_DictOther.DictDuty:='合同类型';
  Frm_DictOther.DictIFCust:=0;
  Frm_DictOther.FrmName:='Frm_NewContract';
  Frm_DictOther.ShowModal;
end;

procedure TFrm_NewContract.EdtExecuteClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from DictOther where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:='合同执行情况';
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:='合同执行情况';
     End;
  Frm_DictOther:=TFrm_DictOther.Create(Self);
  Frm_DictOther.FTableName:='ContractExecute';
  Frm_DictOther.DictDuty:='合同执行情况';
  Frm_DictOther.DictIFCust:=0;
  Frm_DictOther.FrmName:='Frm_NewContract';
  Frm_DictOther.ShowModal;
end;

procedure TFrm_NewContract.BtnSaveClick(Sender: TObject);
begin
  inherited;
  IF (EdtName.Text='') OR (EdtDate.Text='') Then
    Begin
      Application.MessageBox('合同名称和签订日期不能为空','提示',MB_OK+MB_IconWarning);
      Exit;
    End;
  With DatabaseModule DO
    Begin
      IF ISAdd=True Then
        Begin
          AdoContract.Append;
          AdoContract.FieldByName('DeptID_').AsInteger:=DtClsData.DeptID_;
          IF PNContract=1 Then
            Begin
              AdoContract.FieldByName('CustID').AsInteger:=AdoCust.fieldbyname('CustID').AsInteger;
              AdoContract.FieldByName('ContractOption').AsBoolean:=Boolean(1);
            End;
          IF PNContract=2 Then
            Begin
              AdoContract.FieldByName('ContractOption').AsBoolean:=DSCust.DataSet.FieldByName('CustClass').AsBoolean;

              AdoContract.FieldByName('CustID').AsInteger:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
            End;
          IF PNContract=5 Then
            Begin
              AdoContract.FieldByName('CustID').AsInteger:=AdoSupply.fieldbyname('CustID').AsInteger;
              AdoContract.FieldByName('ContractOption').AsBoolean:=Boolean(0);
            End;
          AdoContract.FieldByName('ContractNum').AsString:=EdtNum.Text;
          AdoContract.FieldByName('ContractTitle').AsString:=EdtName.Text;
          AdoContract.FieldByName('ContractContent').AsString:=EdtContent.Text;
          AdoContract.FieldByName('WriteMan').AsString:=EdtMan.Text;
          AdoContract.FieldByName('WriteDate').AsDateTime:=EdtDate.Date;
          AdoContract.FieldByName('ContractMan').AsString:=EdtContact.Text;
          IF EdtBeginDate.Text='' Then AdoContract.FieldByName('ContractBeginDate').Value:=Null
          Else AdoContract.FieldByName('ContractBeginDate').AsDateTime:=EdtBeginDate.Date;
          IF EdtEndDate.Text='' Then AdoContract.FieldByName('ContractEndDate').Value:=Null
          Else AdoContract.FieldByName('ContractEndDate').AsDateTime:=EdtEndDate.Date;
          AdoContract.FieldByName('ContractMoney').AsInteger:=StrToInt(EdtMoney.Text);
          AdoContract.FieldByName('ContractType').AsString:=EdtType.Text;
          AdoContract.FieldByName('ContractExecute').AsString:=EdtExecute.Text;
          AdoContract.FieldByName('IFCheck').AsBoolean:=Boolean(0);
          AdoContract.FieldByName('CreateD_').AsDateTime:=Date;
          AdoContract.FieldByName('CreateBy_').AsInteger:=DtClsData.UserID_;
          AdoContract.FieldByName('BelongID').AsInteger:=DtClsData.UserID_;
          AdoContract.Post;
        End;
      IF ISEdit=True Then
        Begin
          AdoContract.Edit;
          //AdoContract.FieldByName('DeptID').AsInteger:=DtClsData.DeptID_;
          AdoContract.FieldByName('CustID').AsInteger:=DSCust.DataSet.fieldbyname('CustID').AsInteger;
          AdoContract.FieldByName('ContractNum').AsString:=EdtNum.Text;
          AdoContract.FieldByName('ContractTitle').AsString:=EdtName.Text;
          AdoContract.FieldByName('ContractContent').AsString:=EdtContent.Text;
          AdoContract.FieldByName('WriteMan').AsString:=EdtMan.Text;
          AdoContract.FieldByName('WriteDate').AsDateTime:=EdtDate.Date;
          AdoContract.FieldByName('ContractMan').AsString:=EdtContact.Text;
          IF EdtBeginDate.Text='' Then AdoContract.FieldByName('ContractBeginDate').Value:=Null
          Else AdoContract.FieldByName('ContractBeginDate').AsDateTime:=EdtBeginDate.Date;
          IF EdtEndDate.Text='' Then AdoContract.FieldByName('ContractEndDate').Value:=Null
          Else AdoContract.FieldByName('ContractEndDate').AsDateTime:=EdtEndDate.Date;
          AdoContract.FieldByName('ContractMoney').AsInteger:=StrToInt(EdtMoney.Text);
          AdoContract.FieldByName('ContractType').AsString:=EdtType.Text;
          AdoContract.FieldByName('ContractExecute').AsString:=EdtExecute.Text;
          AdoContract.FieldByName('IFCheck').AsBoolean:=Boolean(0);
          AdoContract.FieldByName('UpdateD_').AsDateTime:=Date;
          AdoContract.FieldByName('UpdateBy_').AsInteger:=DtClsData.UserID_;
          AdoContract.Post;
        End;
      BtnExit.Click;  
    End;
end;

procedure TFrm_NewContract.FormCreate(Sender: TObject);
begin
  inherited;
  AdoCust.Close;
  AdoCust.SQL.Clear;
  AdoCust.SQL.Add('Select CustID,CustName,CustClass From Customer');
  AdoCust.Prepared;
  AdoCust.Open;
  IF ISAdd=True Then
    Begin
      EdtName.Text:='';
      EdtNum.Text:='';
      Case PNContract OF
      1:Begin
          EdtCust.Text:=Frm_CustManager.DSCust.DataSet.fieldbyname('CustName').AsString;
        End;
      2:Begin
          EdtCust.Text:='';
        End;
      5:Begin
          EdtCust.Text:=Frm_Supply.DSCust.DataSet.fieldbyname('CustName').AsString;
        End;
      End;
      EdtContact.Text:='';
      EdtMoney.Text:='0';
      EdtDate.text:='';
      EdtType.Text:='';
      EdtExecute.Text:='';
      EdtBeginDate.Text:='';
      EdtEndDate.Text:='';
      EdtMan.Text:='';
      EdtContent.Text:='';
    End;
  IF ISEdit=True Then GetContractRecord;
  IF ISBrowse=True Then
    Begin
      GetContractRecord;
      BtnSave.Visible:=False;
    End;
end;

procedure TFrm_NewContract.EdtManClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';

  Frm_Search.GrdSearch.Columns[0].Caption:='名称';

  Frm_Search.AdoUser.Close;
  Frm_Search.AdoUser.SQL.Clear;
  Frm_Search.AdoUser.SQL.Add('Select UserName_ From Users_');
  Frm_Search.AdoUser.Prepared;
  Frm_Search.AdoUser.Open;

  Frm_Search.GrdSearch.DataController.DataSource:=Frm_Search.DSUser;
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='UserName_';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_NewContract';
  Frm_search.ShowModal;
end;

procedure TFrm_NewContract.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_NewContract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISBrowse:=False;
  ISAdd:=False;
  ISEdit:=False;
  PNContract:=0;
  Action:=CaFree;
end;

procedure TFrm_NewContract.EdtMoneyPropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtMoney.Text);
  Except
    EdtMoney.Text:='0';
  End;
end;

procedure TFrm_NewContract.GetContractRecord;
begin
      EdtName.Text:=DSContract.DataSet.fieldbyname('ContractTitle').AsString;
      EdtNum.Text:=DSContract.DataSet.fieldbyname('ContractNum').AsString;
      Case PNContract OF
      1: EdtCust.Text:=Frm_CustManager.DSCust.DataSet.fieldbyname('CustName').AsString;
      2: EdtCust.Text:=DSContract.DataSet.fieldbyname('CustName').AsString;
      5: EdtCust.Text:=Frm_Supply.DSCust.DataSet.fieldbyname('CustName').AsString;
      End;
      EdtContact.Text:=DSContract.DataSet.fieldbyname('ContractMan').AsString;
      EdtMoney.Text:=IntToStr(DScontract.DataSet.fieldbyname('ContractMoney').AsInteger);
      EdtDate.Date:=DSContract.DataSet.fieldbyname('WriteDate').AsDateTime;
      EdtType.Text:=DSContract.DataSet.fieldbyname('ContractType').AsString;
      EdtExecute.Text:=DSContract.DataSet.fieldbyname('ContractExecute').AsString;
      EdtBeginDate.Date:=DSContract.DataSet.fieldbyname('ContractBeginDate').AsDateTime;
      EdtEndDate.Date:=DSContract.DataSet.fieldbyname('ContractEndDate').AsDateTime;
      EdtContent.Text:=DSContract.DataSet.Fieldbyname('ContractContent').AsString;
      EdtMan.Text:=DSContract.DataSet.fieldbyname('WriteMan').AsString;
end;

end.
