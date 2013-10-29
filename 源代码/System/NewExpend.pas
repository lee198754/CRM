unit NewExpend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxMemo, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeels, dxBar, dxBarExtItems, cxClasses, ImgList, ActnList,
  XPMenu, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, DB, ADODB,
  bainaADOQuery, frxClass, frxDBSet, cxStyles;

type
  TFrm_NewExpend = class(TBaseData_Frm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    EdtName: TcxButtonEdit;
    EdtType: TcxButtonEdit;
    EdtMoney: TcxTextEdit;
    EdtDate: TcxDateEdit;
    EdtMemo: TcxMemo;
    cxLabel6: TcxLabel;
    EdtMan: TcxButtonEdit;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    Query: TbainaADOQuery;
    LAdoUser: TbainaADOQuery;
    LAdoCust: TbainaADOQuery;
    LDSCust: TDataSource;
    LDSUser: TDataSource;
    LAdoExpend: TbainaADOQuery;
    procedure EdtTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure EdtNameClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure EdtManClick(Sender: TObject);
    procedure EdtMoneyPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure ShowExpendRecord;
  public
    { Public declarations }
  end;

var
  Frm_NewExpend: TFrm_NewExpend;

implementation

uses DataBase, Dict, PublicClass, Search, Customer, Expend, PreService,
  Dictother;

{$R *.dfm}

procedure TFrm_NewExpend.EdtTypeClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
     Begin
       AdoDictOther.Close;
       AdoDictOther.SQL.Clear;
       AdoDictOther.SQL.Add('Select * from DictOther where FieldName=:FieldName');
       AdoDictOther.Parameters.ParamByName('FieldName').Value:='费用类型';
       AdoDictOther.Prepared;
       AdoDictOther.Open;

       AdoDictOther.FieldByName('DictID').Visible:=False;
       AdoDictOther.FieldByName('FieldName').Visible:=False;
       AdoDictOther.FieldByName('IFCust').Visible:=False;
       AdoDictOther.FieldByName('Context').DisplayLabel:='费用类型';
     End;
  Frm_DictOther:=TFrm_DictOther.Create(Self);
  Frm_DictOther.FTableName:='ExpendType';
  Frm_DictOther.DictDuty:='费用类型';
  Frm_DictOther.DictIFCust:=0;
  Frm_DictOther.FrmName:='Frm_NewExpend';
  Frm_DictOther.ShowModal;
end;

procedure TFrm_NewExpend.FormCreate(Sender: TObject);
begin
  inherited;
  IF ISAdd=True Then
    Begin

      IF PNExpend=1 Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserID_,UserName_ From Users_ Where UserID_=:UserID');
          Query.Parameters.ParamByName('UserID').Value:=DataBaseModule.AdoCust.FieldByName('BelongID').AsString;
          Query.Prepared;
          Query.Open;
          EdtName.Text:=DatabaseModule.AdoCust.FieldByName('CustName').AsString;
          EdtMan.Text:=Query.FieldByName('UserName_').AsString;
        End;
      IF PNExpend=2 Then
        Begin
          LAdoCust.Close;
          LAdoCust.SQL.Clear;
          LAdoCust.SQL.Add('Select CustID,CustName From Customer where BelongID=:BelongID');
          LAdoCust.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
          LAdoCust.Prepared;
          LAdoCust.Open;
          EdtName.Text:='';
        End;
      IF PNExpend=3 Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserID_,UserName_ From Users_ Where UserID_=:UserID');
          Query.Parameters.ParamByName('UserID').Value:=DataBaseModule.AdoPreService.FieldByName('BelongID').AsString;
          Query.Prepared;
          Query.Open;
          EdtName.Text:=DatabaseModule.AdoPreService.FieldByName('CustName').AsString;
          EdtMan.Text:=Query.FieldByName('UserName_').AsString;
        End;
      IF PNExpend=5 Then
        Begin
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select UserID_,UserName_ From Users_ Where UserID_=:UserID');
          Query.Parameters.ParamByName('UserID').Value:=DataBaseModule.AdoSupply.FieldByName('BelongID').AsString;
          Query.Prepared;
          Query.Open;
          EdtName.Text:=DatabaseModule.AdoCust.FieldByName('CustName').AsString;
          EdtMan.Text:=Query.FieldByName('UserName_').AsString;
        End;
      EdtType.Text:='';
      EdtMoney.Text:='0';
      EdtDate.Date:=Date;
      EdtMemo.Text:='';
    End;
  IF ISEdit=True Then
    Begin
      ShowExpendRecord;
    End;
  IF ISBrowse=True Then
    Begin
      ShowExpendRecord;
      BtnSure.Visible:=False;
    End;
end;

procedure TFrm_NewExpend.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF (EdtMan.Text='') Then
    Begin
      Application.MessageBox('费用发生人不能为空','提示',MB_OK+MB_IConWarning);
      Exit;
    End
  Else
    Begin
      IF (PNExpend=1) OR (PNExpend=3) Then
        Begin
          IF EdtName.Text='' Then
            Begin
              Application.MessageBox('客户名称不能为空','提示',MB_OK+MB_IConWarning);
              Exit;
            End;
        End;
    End;
  IF ISAdd=True Then
    Begin
      With DatabaseModule Do
        Begin
          DtClsData.BeginTrans;
          Try

          AdoExpend.Append;
          AdoExpend.FieldByName('DeptID_').AsInteger:=DtClsData.DeptID_;
          AdoExpend.FieldByName('ExpendType').AsString:=EdtType.Text;
          AdoExpend.FieldByName('ExpendMoney').AsFloat:=StrToFloat(EdtMoney.Text);
          AdoExpend.FieldByName('ExpendDate').AsDateTime:=EdtDate.Date;
          AdoExpend.FieldByName('ExpendMemo').AsString:=EdtMemo.Text;
          AdoExpend.FieldByName('IFCheck').AsBoolean:=Boolean(0);
          AdoExpend.FieldByName('CreateBy_').AsString:=DtclsData.UserName_;
          AdoExpend.FieldByName('CreateD_').AsDateTime:=Date;

          IF PNExpend=1 Then
            Begin

              AdoExpend.FieldByName('CustID').AsInteger:=AdoCust.FieldByName('CustID').AsInteger;
              AdoExpend.FieldByName('ExpendOption').AsInteger:=1;
              AdoExpend.FieldByName('BelongID').AsInteger:=Query.FieldByName('UserID_').AsInteger;
            End;
          IF PNExpend=2 Then
            Begin
              IF EdtName.Text<>'' Then
                Begin
                  AdoExpend.FieldByName('CustID').AsInteger:=LAdoCust.FieldByName('CustID').AsInteger;
                  AdoExpend.FieldByName('ExpendOption').AsInteger:=1;
                End
              Else
                AdoExpend.FieldByName('ExpendOption').AsInteger:=0;
              AdoExpend.FieldByName('BelongID').AsInteger:=LAdoUser.FieldByName('UserID_').AsInteger;
            End;
          IF PNExpend=3 Then
            Begin
              AdoExpend.FieldByName('CustID').AsInteger:=AdoPreService.FieldByName('CustID').AsInteger;
              AdoExpend.FieldByName('ExpendOption').AsInteger:=2;
              AdoExpend.FieldByName('ServiceID').AsInteger:= AdoPreService.FieldByName('ServiceID').AsInteger;
              AdoExpend.FieldByName('BelongID').AsInteger:=Query.FieldByName('UserID_').AsInteger;
            End;

          IF PNExpend=5 Then
            Begin

              AdoExpend.FieldByName('CustID').AsInteger:=AdoSupply.FieldByName('CustID').AsInteger;
              AdoExpend.FieldByName('ExpendOption').AsInteger:=5;
              AdoExpend.FieldByName('BelongID').AsInteger:=Query.FieldByName('UserID_').AsInteger;
            End;

          AdoExpend.Post;
          DtclsData.CommitTrans;

          Except
            DtclsData.RollbackTrans;
            Raise;
          End;
        End;
    End;
  IF ISEdit=True Then
    Begin
      With DatabaseModule Do
        Begin
          DtclsData.BeginTrans;
          Try
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('Update Expend Set ExpendType=:ExpendType,ExpendMoney=:ExpendMoney,ExpendDate=:ExpendDate,ExpendMemo=:ExpendMemo,UpdateBy_=:UpdateBy,UpdateD_=:UpdateD');
            Query.SQL.Add(' Where ExpendID=:ExpendID');
            Query.Parameters.ParamByName('ExpendType').Value:= EdtType.Text;
            Query.Parameters.ParamByName('ExpendMoney').Value:= StrToInt(EdtMoney.Text);
            Query.Parameters.ParamByName('ExpendDate').Value:= EdtDate.Date;
            Query.Parameters.ParamByName('ExpendMemo').Value:= EdtMemo.Text;
            Query.Parameters.ParamByName('UpdateBy').Value:= DtclsData.UserName_;
            Query.Parameters.ParamByName('UpdateD').Value:= Date;
            Query.Parameters.ParamByName('ExpendID').Value:= AdoExpend.FieldByName('ExpendID').AsInteger;
            Query.Prepared;
            Query.ExecSQL;

          IF PNExpend=1 Then
            Begin
               //LAdoExpend.Parameters.ParamByName('ExpendID').Value:=Frm_CustManager.LAdoExpend.FieldByName('ExpendID').AsInteger;
            End;
          IF PNExpend=2 Then
            Begin
              //LAdoExpend.Parameters.ParamByName('ExpendID').Value:=Frm_Expend.DSExpend.DataSet.FieldByName('ExpendID').AsInteger;
            End;
          IF PNExpend=3 Then
            Begin
              //LAdoExpend.Parameters.ParamByName('ExpendID').Value:=Frm_PreService.DSExpend.DataSet.FieldByName('ExpendID').AsInteger;
            End;
          //LAdoExpend.ExecSQL;

          DtclsData.CommitTrans;
          Except
            Dtclsdata.RollbackTrans;
            Raise;
          End;  
        End;
    End;
  BtnExit.Click;  
end;

procedure TFrm_NewExpend.EdtNameClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_NewExpend.LDSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_NewExpend';
  Frm_search.ShowModal;
end;

procedure TFrm_NewExpend.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFrm_NewExpend.EdtManClick(Sender: TObject);
begin
  inherited;
  IF PNExpend=2 Then
    Begin
      Frm_Search:=TFrm_Search.Create(Self);
      Frm_Search.GrdSearch.CreateColumn;
      Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';

      Frm_Search.GrdSearch.Columns[0].Caption:='名称';

      LAdoUser.Close;
      LAdoUser.SQL.Clear;
      LAdoUser.SQL.Add('Select UserID_,UserName_ From Users_');
      LAdoUser.Prepared;
      LAdoUser.Open;

      Frm_Search.GrdSearch.DataController.DataSource:=Frm_NewExpend.LDSUser;
      Frm_Search.GrdSearch.Columns[0].DataBinding;
      Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='UserName_';
      Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
      Frm_Search.FrmName:='Frm_NewExpend';
      Frm_search.ShowModal;
    End;
end;

procedure TFrm_NewExpend.EdtMoneyPropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtMoney.Text);
  Except
    EdtMoney.Text:='';
  End;
end;

procedure TFrm_NewExpend.ShowExpendRecord;
begin
      IF PNExpend=1 Then EdtName.Text:=DatabaseModule.AdoCust.FieldByName('CustName').AsString;
      IF PNExpend=2 Then EdtName.Text:=DatabaseModule.AdoExpend.FieldByName('CustName').AsString;
      IF PNExpend=3 Then EdtName.Text:=DatabaseModule.AdoPreService.FieldByName('CustName').AsString;
      IF PNExpend=5 Then EdtName.Text:=DatabaseModule.AdoSupply.FieldByName('CustName').AsString;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select UserID_,UserName_ From Users_ Where UserID_=:UserID');
      Query.Parameters.ParamByName('UserID').Value:=DataBaseModule.AdoExpend.FieldByName('BelongID').AsInteger;
      Query.Prepared;
      Query.Open;
      EdtMan.Text:=Query.FieldByName('UserName_').AsString;
      EdtType.Text:=DataBaseModule.AdoExpend.FieldByName('ExpendType').AsString;
      EdtMoney.Text:=IntToStr(DataBaseModule.AdoExpend.FieldByName('ExpendMoney').AsInteger);
      EdtDate.Date:=DataBaseModule.AdoExpend.FieldByName('ExpendDate').AsDateTime;
      EdtMemo.Text:=DataBaseModule.AdoExpend.FieldByName('ExpendMemo').AsString;
      EdtName.Enabled:=False;
      EdtMan.Enabled:=False;
end;

procedure TFrm_NewExpend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=False;
  Action:=CaFree;
end;

end.
