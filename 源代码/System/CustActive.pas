unit CustActive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, Menus, cxLookAndFeelPainters, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls, cxButtons,
  cxGraphics, cxDropDownEdit, cxMaskEdit, cxCalendar, cxMemo, cxButtonEdit,
  cxCheckBox, cxPC, cxSpinEdit, cxTimeEdit, ExtCtrls, DB, ADODB,
  bainaADOQuery, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFrm_CustActive = class(TBaseData_Frm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    EdtType: TcxComboBox;
    cxLabel5: TcxLabel;
    EdtTopic: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    EdtContact: TcxComboBox;
    cxLabel8: TcxLabel;
    EdtPlace: TcxButtonEdit;
    EdtBegin: TcxDateEdit;
    cxLabel6: TcxLabel;
    cxLabel4: TcxLabel;
    EdtContext: TcxMemo;
    EdtEnd: TcxDateEdit;
    BtnSave: TcxButton;
    BtnExit: TcxButton;
    cxLabel7: TcxLabel;
    DayTopic: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel9: TcxLabel;
    DayContact: TcxComboBox;
    cxLabel10: TcxLabel;
    DayPlace: TcxButtonEdit;
    DayType: TcxComboBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    Daybegindate: TcxDateEdit;
    cxLabel13: TcxLabel;
    DayEndDate: TcxDateEdit;
    cxLabel14: TcxLabel;
    DayMemo: TcxMemo;
    IFAllDay: TcxCheckBox;
    DaybeginTime: TcxTimeEdit;
    DayEndTime: TcxTimeEdit;
    DayStart: TcxComboBox;
    Bevel1: TBevel;
    BtnSure: TcxButton;
    BtnCancel: TcxButton;
    IFWarn: TcxCheckBox;
    cxLabel15: TcxLabel;
    DayCompany: TcxTextEdit;
    Query: TbainaADOQuery;
    CBIFFinish: TCheckBox;
    cxLabel16: TcxLabel;
    EdtMode: TcxButtonEdit;
    Panel1: TPanel;
    cxLabel17: TcxLabel;
    ExpendType: TcxButtonEdit;
    cxLabel19: TcxLabel;
    ExpendMoney: TcxTextEdit;
    ExpendMan: TcxButtonEdit;
    cxLabel18: TcxLabel;
    cxGrid1: TcxGrid;
    GrdExpend: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BtnAdd: TcxButton;
    BtnDel: TcxButton;
    LAdoExpend: TbainaADOQuery;
    LDSExpend: TDataSource;
    cxLabel20: TcxLabel;
    ActiveNum: TcxTextEdit;
    EdtBTime: TcxTimeEdit;
    EdtETime: TcxTimeEdit;
    LAdoUser: TbainaADOQuery;
    LDSUser: TDataSource;
    Panel2: TPanel;
    cxLabel21: TcxLabel;
    CustRate: TcxButtonEdit;
    cxLabel22: TcxLabel;
    CustState: TcxButtonEdit;
    cxLabel23: TcxLabel;
    CustCredit: TcxButtonEdit;
    procedure BtnExitClick(Sender: TObject);
    procedure EdtPlaceClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IFAllDayClick(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure IFWarnClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtModeClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure ExpendTypeClick(Sender: TObject);
    procedure GrdExpendCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ExpendManClick(Sender: TObject);
    procedure CustStateClick(Sender: TObject);
    procedure CustRateClick(Sender: TObject);
    procedure CustCreditClick(Sender: TObject);
  private
    { Private declarations }
    Procedure AddDict(FTableName,LFieldName:String;LIFCust:Integer);
    procedure AddDictOther(FTableName,LFieldName: String; LIFCust: Integer);
    Procedure ShowActiveRecord;
    Procedure ShowExpendRecord;
  public
    { Public declarations }
    ActiveOption:Integer;
  end;

var
  Frm_CustActive: TFrm_CustActive;

implementation

uses Dict, DataBase, PublicClass, Customer, Contract, Search, Supply, DictOther;

{$R *.dfm}



procedure TFrm_CustActive.AddDict(FTableName,LFieldName: String; LIFCust: Integer);
begin
  With DatabaseModule DO
     Begin
       AdoDict.Close;
       AdoDict.SQL.Clear;
       AdoDict.SQL.Add('Select * from Dict where FieldName=:FieldName');
       AdoDict.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDict.Prepared;
       AdoDict.Open;

       AdoDict.FieldByName('DictID').Visible:=False;
       AdoDict.FieldByName('FieldName').Visible:=False;
       AdoDict.FieldByName('IFCust').Visible:=False;
       AdoDict.FieldByName('Context').DisplayLabel:=LFieldName;
     End;
  Frm_Dict:=TFrm_Dict.Create(Self);
  Frm_Dict.FTableName:=FTableName;
  Frm_Dict.DictDuty:=LFieldName;
  Frm_Dict.DictIFCust:=LIFCust;
  Frm_Dict.FrmName:='Frm_CustActive';
  {IF PNActive=1 Then Frm_Dict.FrmName:='Frm_CustActive';
  IF PNActive=2 Then Frm_Dict.FrmName:='Frm_Contract';}
  Frm_Dict.ShowModal;
end;

procedure TFrm_CustActive.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_CustActive.EdtPlaceClick(Sender: TObject);
begin
  inherited;
  IF EdtPlace.Properties.ReadOnly=True Then Exit
  Else AddDictOther('ActivePlace','活动场所',0);
end;

procedure TFrm_CustActive.BtnSaveClick(Sender: TObject);
begin
  inherited;
  IF (EdtTopic.Text='') OR (EdtBegin.Text='') OR (EdtEnd.Text='') Then
    Begin
      Application.MessageBox('活动主题、活动开始日期和结束日期不能为空','提示',MB_OK+MB_IconWarning);
      Exit;
    End;
  Begin
      IF ISAdd=True Then
        Begin
          With DatabaseModule Do
            Begin
              DtclsData.BeginTrans;
              Try
              AdoActive.Append;
              Case PNActive OF
              1:Begin
                  AdoCust.Edit;
                  AdoCust.FieldByName('CustNextDate').AsDateTime:=EdtBegin.Date;
                  IF CustRate.Text<>'' Then AdoCust.FieldByName('CustRate').AsString;
                  IF CustState.Text<>'' Then AdoCust.FieldByName('CustState').AsString;
                  IF CustCredit.Text<>'' Then AdoCust.FieldByName('CustCredit').AsString;
                  AdoCust.Post;
                  AdoActive.FieldByName('ActiveOption').AsInteger:=1; //客户活动
                  AdoActive.fieldbyname('CustID').AsInteger:=AdoCust.fieldbyname('CustID').AsInteger;
                End;
              2:Begin
                  AdoActive.FieldByName('ActiveOption').AsInteger:=2; //合同活动
                  AdoActive.FieldByName('ProjNum').AsInteger:=AdoContract.fieldbyname('ContractID').AsInteger;
                  AdoActive.fieldbyname('CustID').AsInteger:=AdoContract.fieldbyname('CustID').AsInteger;
                End;
              5:Begin
                  AdoActive.FieldByName('ActiveOption').AsInteger:=5; //供应商活动
                  AdoActive.fieldbyname('CustID').AsInteger:=AdoSupply.fieldbyname('CustID').AsInteger;
                End;
              End;  
              AdoActive.fieldbyname('DeptID_').AsInteger:=DtClsData.DeptID_;
              AdoActive.FieldByName('ActiveNum').AsString:=ActiveNum.Text;
              AdoActive.fieldbyname('UserID').AsInteger:=DtClsData.UserID_;
              AdoActive.fieldbyname('ActiveName').AsString:=EdtTopic.Text;
              AdoActive.fieldbyname('ContactName').AsString:=EdtContact.Text;
              AdoActive.fieldbyname('ActivePlace').AsString:=EdtPlace.Text;
              AdoActive.fieldbyname('ActiveType').AsString:=EdtType.Text;
              AdoActive.FieldByName('ActiveMode').AsString:=EdtMode.Text;
              IF EdtBegin.Text='' Then AdoActive.FieldByName('ActiveBeginDate').Value:=Null
              Else AdoActive.FieldByName('ActiveBegindate').AsDateTime:=EdtBegin.Date;
              IF EdtEnd.Text='' Then AdoActive.FieldByName('ActiveEndTime').Value:=Null
              Else AdoActive.FieldByName('ActiveEnddate').AsDateTime:=EdtEnd.Date;

              AdoActive.FieldByName('ActiveBeginTime').AsString:=EdtBTime.Text;
              AdoActive.FieldByName('ActiveEndTime').AsString:=EdtETime.Text;
              AdoActive.fieldbyname('ActiveText').AsString:=EdtContext.Text;
              AdoActive.fieldbyname('IFFinish').AsBoolean:=CBIFFinish.Checked;
              AdoActive.fieldbyname('CreateD_').AsDateTime:=Now;
              AdoActive.fieldbyname('CreateBy_').AsString:=DtClsData.UserName_;
              AdoActive.fieldbyname('BelongID').AsInteger:=DtClsData.UserID_;
              AdoActive.Post;

              LAdoExpend.UpdateBatch;

              IF PNActive=1 Then
                Begin
                  AdoCust.Edit;
                  AdoCust.FieldByName('CustNextDate').AsDateTime:=EdtBegin.Date;
                  IF CustRate.Text<>'' Then
                    AdoCust.FieldByName('CustRate').AsString:=CustRate.Text;
                  IF CustState.Text<>'' Then
                    AdoCust.FieldByName('CustState').AsString:=CustState.Text;
                  IF CustCredit.Text<>'' Then
                    AdoCust.FieldByName('CustCredit').AsString:=CustCredit.Text;
                  AdoCust.Post;
                End;
              IF PNActive=5 Then
                Begin
                  AdoSupply.Edit;
                  AdoSupply.FieldByName('CustNextDate').AsDateTime:=EdtBegin.Date;
                  IF CustRate.Text<>'' Then
                    AdoSupply.FieldByName('CustRate').AsString:=CustRate.Text;
                  IF CustState.Text<>'' Then
                    AdoSupply.FieldByName('CustState').AsString:=CustState.Text;
                  IF CustCredit.Text<>'' Then
                    AdoSupply.FieldByName('CustCredit').AsString:=CustCredit.Text;
                  AdoSupply.Post;
                End;

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
              AdoActive.Edit;
              //AdoActive.fieldbyname('DeptID_').AsInteger:=DtClsData.DeptID_;
              //AdoActive.fieldbyname('CustID').AsInteger:=AdoCust.fieldbyname('CustID').AsInteger;
              //AdoActive.fieldbyname('UserID').AsInteger:=DtClsData.UserID_;
              AdoActive.fieldbyname('ActiveName').AsString:=EdtTopic.Text;
              AdoActive.fieldbyname('ContactName').AsString:=EdtContact.Text;
              AdoActive.fieldbyname('ActivePlace').AsString:=EdtPlace.Text;
              AdoActive.fieldbyname('ActiveType').AsString:=EdtType.Text;
              AdoActive.FieldByName('ActiveMode').AsString:=EdtMode.Text;
              IF EdtBegin.Text='' Then AdoActive.FieldByName('ActiveBeginDate').Value:=Null
              Else AdoActive.FieldByName('ActiveBegindate').AsDateTime:=EdtBegin.Date;
              IF EdtEnd.Text='' Then AdoActive.FieldByName('ActiveEndDate').Value:=Null
              Else AdoActive.FieldByName('ActiveEnddate').AsDateTime:=EdtEnd.Date;

              AdoActive.FieldByName('ActiveBeginTime').AsString:=EdtBTime.Text;
              AdoActive.FieldByName('ActiveEndTime').AsString:=EdtETime.Text;
              AdoActive.fieldbyname('ActiveText').AsString:=EdtContext.Text;
              AdoActive.fieldbyname('IFFinish').AsBoolean:=CBIFFinish.Checked;
              AdoActive.fieldbyname('UpdateD_').AsDateTime:=Now;
              AdoActive.fieldbyname('UpdateBy_').AsString:=DtClsData.UserName_;
              AdoActive.Post;
              LAdoExpend.UpdateBatch;
              IF PNActive=1 Then
                Begin
                  AdoCust.Edit;
                  AdoCust.FieldByName('CustNextDate').AsDateTime:=EdtBegin.Date;
                  IF CustRate.Text<>'' Then
                    AdoCust.FieldByName('CustRate').AsString:=CustRate.Text;
                  IF CustState.Text<>'' Then
                    AdoCust.FieldByName('CustState').AsString:=CustState.Text;
                  IF CustCredit.Text<>'' Then
                    AdoCust.FieldByName('CustCredit').AsString:=CustCredit.Text;
                  AdoCust.Post;
                End;
              IF PNActive=5 Then
                Begin
                  AdoSupply.Edit;
                  AdoSupply.FieldByName('CustNextDate').AsDateTime:=EdtBegin.Date;
                  IF CustRate.Text<>'' Then
                    AdoSupply.FieldByName('CustRate').AsString:=CustRate.Text;
                  IF CustState.Text<>'' Then
                    AdoSupply.FieldByName('CustState').AsString:=CustState.Text;
                  IF CustCredit.Text<>'' Then
                    AdoSupply.FieldByName('CustCredit').AsString:=CustCredit.Text;
                  AdoSupply.Post;
                End;
              DtclsData.CommitTrans;
              Except
              DtclsData.RollbackTrans;
              Raise;
              End;
            End;
        End;
    End;
  IF Not CBIFFinish.Checked Then
    Begin
      IF PNActive=1 Then Frm_CustManager.CustSon.ActivePage:=Frm_CustManager.TabActive; //Frm_CustManager.TabActiveShow(Sender);
      IF PNActive=2 Then Frm_Contract.ContractSon.ActivePage:=Frm_Contract.TabActive; //Frm_Contract.TabActiveShow(Sender);
      IF PNActive=5 Then Frm_Supply.CustSon.ActivePage:=Frm_Supply.TabActive;
    End
  Else
    Begin
      IF PNActive=1 Then Frm_CustManager.CustSon.ActivePage:=Frm_CustManager.TabHistory;
      IF PNActive=2 Then Frm_Contract.ContractSon.ActivePage:=Frm_Contract.TabHistory;
      IF PNActive=5 Then Frm_Supply.CustSon.ActivePage:=Frm_Supply.TabHistory;
    End;
  BtnExit.Click;
end;

procedure TFrm_CustActive.FormCreate(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  EdtContact.Properties.Items.Clear;
  With DatabaseModule Do
    Begin
      IF PNActive=1 Then
        Begin
          CustRate.Text:=AdoCust.FieldByName('CustRate').AsString;
          CustState.Text:=AdoCust.FieldByName('CustState').AsString;
          CustCredit.Text:=AdoCust.FieldByName('CustCredit').AsString;
        End
      Else
        Begin
          IF PNActive=5 Then
            Begin
              CustRate.Text:=AdoSupply.FieldByName('CustRate').AsString;
              CustState.Text:=AdoSupply.FieldByName('CustState').AsString;
              CustCredit.Text:=AdoSupply.FieldByName('CustCredit').AsString;
            End
        End;
      Panel2.Visible:=False;
      AdoContact.Close;
      AdoContact.SQL.Clear;
      AdoContact.SQL.Add('Select ConTactName,CustID From Contact Where CustID=:CustID');
      IF PNActive=1 Then
        AdoContact.Parameters.ParamByName('CustID').Value:=AdoCust.FieldByname('CustID').AsInteger;
      IF PNActive=2 Then
        AdoContact.Parameters.ParamByName('CustID').Value:=AdoContract.FieldByname('CustID').AsInteger;
      IF PNActive=5 Then
        AdoContact.Parameters.ParamByName('CustID').Value:=AdoSupply.FieldByname('CustID').AsInteger;
      AdoContact.Prepared;
      AdoContact.Open;
    End;
  DatabaseModule.AdoContact.First;
  FOR I:=1 TO DatabaseModule.AdoContact.RecordCount DO
    Begin
      EdtContact.Properties.Items.Add(DatabaseModule.AdoContact.FieldByname('ContactName').AsString);
      DatabaseModule.AdoContact.Next;
    End;
  IF ISAdd=True Then
    Begin
          EdtTopic.Text:='';
          EdtContact.Text:='';
          EdtPlace.Text:='';
          EdtMode.Text:='';
          EdtType.Text:='';
          EdtBegin.Date:=Date;
          EdtEnd.Date:=Date;
          EdtContext.Text:='';
          CBIFFinish.Checked:=False;
          ExpendType.Text:='';
          ExpendMoney.Text:='0';
          ExpendMan.Text:=DatabaseModule.dtclsData.UserName_;
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('Select Top 1 ActiveNum from CustActive where BelongID=:BelongID Order by ActiveNum Desc');
          Query.Parameters.ParamByName('BelongID').Value:=Databasemodule.dtclsData.UserID_;
          Query.Prepared;
          Query.Open;

      IF Query.IsEmpty Then
        Begin
          With Databasemodule.dtclsData DO
            Begin
              I:=Length(IntToStr(UserID_));
              Case I OF
              1:ActiveNum.Text:=IntToStr(UserID_)+'000'+'1000001';
              2:ActiveNum.Text:=IntToStr(UserID_)+'00'+'1000001';
              3:ActiveNum.Text:=IntToStr(UserID_)+'0'+'1000001';
              4:ActiveNum.Text:=IntToStr(UserID_)+'1000001';
              End;
            End;
        End
      Else
        Begin
          Query.Last;
          ActiveNum.Text:=FloatToStr(StrToFloat(Query.fieldbyname('ActiveNum').AsString)+1);
        End;
    End;
  IF (ISEdit=True) Then ShowActiveRecord;
  IF ISBrowse=True Then
    Begin
      ShowActiveRecord;
      BtnSave.Visible:=False;
      BtnAdd.Enabled:=False;
      BtnDel.Enabled:=False;
    End;
  ShowExpendRecord;  
end;

procedure TFrm_CustActive.IFAllDayClick(Sender: TObject);
begin
  inherited;
  IF IFAllDay.Checked=True Then
    Begin
      DayBeginTime.Enabled:=False;
      DayEndTime.Enabled:=False;
      DayBeginTime.Time:=StrToTime('00:00');
      DayEndTime.Time:=StrToTime('00:00');
    End
  Else
    Begin
      DayBeginTime.Enabled:=True;
      DayEndTime.Enabled:=True;
      DayBeginTime.Time:=Time;
      DayEndTime.Time:=Time;
    End;
end;

procedure TFrm_CustActive.cxTabSheet2Show(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  DayContact.Properties.Items.Clear;
  DatabaseModule.AdoContact.First;
  FOR I:=1 TO DatabaseModule.AdoContact.RecordCount DO
    Begin
      DayContact.Properties.Items.Add(DatabaseModule.AdoContact.FieldByname('ContactName').AsString);
      DatabaseModule.AdoContact.Next;
    End;
      With DatabaseModule Do
        Begin
          DayTopic.Text:= AdoActive.fieldbyname('ActiveName').AsString;
          DayContact.Text:=AdoActive.fieldbyname('ContactName').AsString;
          DayPlace.Text:=AdoActive.fieldbyname('ActivePlace').AsString;
          DayType.Text:=AdoActive.fieldbyname('ActiveType').AsString;
          Case PNActive OF
          1:Begin
              DayCompany.Text:=AdoCust.fieldbyname('CustName').AsString;
            End;
          2:Begin
              Query.Close;
              Query.SQL.Clear;
              Query.SQL.Add('Select CustName From Customer Where CustID=:CustID');
              Query.Parameters.ParamByName('CustID').Value:=AdoActive.FieldByName('CustID').AsInteger;
              Query.Prepared;
              Query.Open;
              DayCompany.Text:=Query.fieldbyname('CustName').AsString;
            End;
          End;
          DayBeginDate.Date:=Date;
          DayEndDate.Date:=Date;
          DayBeginTime.Time:=Time;
          DayEndTime.Time:=Time;
          DayMemo.Text:= AdoActive.fieldbyname('ActiveText').AsString;
          IFAllDay.Checked:=AdoActive.fieldbyname('IFAllDay').AsBoolean;
          IFWarn.Checked:= AdoActive.fieldbyname('IFWarn').AsBoolean;
          DayStart.Text:=IntToStr(AdoActive.fieldbyname('StartWarn').AsInteger);
        End;
end;

procedure TFrm_CustActive.BtnSureClick(Sender: TObject);
var
  Present: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
 begin
  //Present:= time-Dayendtime.Time;
  //DecodeDate(Present, Year, Month, Day);

  //DecodeTime(Present, Hour, Min, Sec, MSec);
  //DayTopic.Text := timeToStr(Time)+'时间'+IntToStr(Hour*60+Min);
  IF (DayBeginDate.Text<>'') OR (DayEndDate.Text<>'') Then
    Begin
      //IF IFAllDay.Checked=True Then
        Begin
          IF  (DayBeginTime.Text<>'') OR (DayEndTime.Text<>'') Then
            Begin
              With DatabaseModule Do
                Begin
                  DtclsData.BeginTrans;
                  Try
                    AdoActive.Edit;
                    AdoActive.fieldbyname('IFWarn').AsBoolean:=IFWarn.Checked;
                    AdoActive.fieldbyname('IFAllDay').AsBoolean:=IFAllDay.Checked;
                    AdoActive.fieldbyname('Warnbegindate').AsDateTime:=DayBeginDate.Date;
                    AdoActive.fieldbyname('WarnEndDate').AsDateTime:=DayEndDate.Date;
                    AdoActive.fieldbyname('WarnBeginTime').AsDateTime:=DayBeginTime.Time;
                    AdoActive.fieldbyname('WarnEndTime').AsDateTime:=DayEndTime.Time;
                    
                    IF DayStart.ItemIndex = 0 Then AdoActive.fieldbyname('StartWarn').AsInteger:=10;
                    IF DayStart.ItemIndex = 1 Then AdoActive.fieldbyname('StartWarn').AsInteger:=30;
                    IF DayStart.ItemIndex = 2 Then AdoActive.fieldbyname('StartWarn').AsInteger:=60;
                    IF DayStart.ItemIndex = 3 Then AdoActive.fieldbyname('StartWarn').AsInteger:=120;
                    IF DayStart.ItemIndex = 4 Then AdoActive.fieldbyname('StartWarn').AsInteger:=180;
                    IF DayStart.ItemIndex = 5 Then AdoActive.fieldbyname('StartWarn').AsInteger:=240;

                    AdoActive.fieldbyname('UpdateD_').AsDateTime:=Now;
                    AdoActive.fieldbyname('UpdateBy_').AsInteger:=DtClsData.UserID_;
                    AdoActive.Post;
                    DtclsData.CommitTrans;
                    BtnCancel.Click;
                  Except
                    DtclsData.RollbackTrans;
                    Raise;
                  End;
               End;
            End
          Else
            Application.MessageBox('时间不能为空','提示',MB_OK+MB_IconWarning);
        End;
    End
  Else
    Application.MessageBox('日期不能为空','提示',MB_OK+MB_IconWarning);

end;

procedure TFrm_CustActive.IFWarnClick(Sender: TObject);
begin
  inherited;
  IF IFWarn.Checked=True Then DayStart.Enabled:=True
  Else DayStart.Enabled:=False;
end;

procedure TFrm_CustActive.BtnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_CustActive.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISBrowse:=False;
  ISAdd:=False;
  ISEdit:=False;
  PNActive:=0;
  Action:=CaFree;
end;

procedure TFrm_CustActive.ShowActiveRecord;
begin
  With DatabaseModule Do
        Begin
          ActiveNum.Text:=AdoActive.FieldByName('ActiveNum').AsString;
          EdtTopic.Text:= AdoActive.fieldbyname('ActiveName').AsString;
          EdtContact.Text:=AdoActive.fieldbyname('ContactName').AsString;
          EdtPlace.Text:=AdoActive.fieldbyname('ActivePlace').AsString;
          EdtType.Text:=AdoActive.fieldbyname('ActiveType').AsString;
          EdtMode.Text:=AdoActive.FieldByName('ActiveMode').AsString;
          IF AdoActive.FieldByName('ActiveBeginDate').Value=Null Then EdtBegin.Text:=''
          Else EdtBegin.Date:=AdoActive.FieldByName('ActiveBegindate').AsDateTime;
          IF AdoActive.FieldByName('ActiveEndDate').Value=Null Then EdtEnd.Text:=''
          Else EdtEnd.Date:=AdoActive.FieldByName('ActiveEnddate').AsDateTime;
          EdtBTime.Text:=AdoActive.FieldByName('ActiveBeginTime').AsString;
          EdtETime.Text:=AdoActive.FieldByName('ActiveEndTime').AsString;
          EdtContext.Text:= AdoActive.fieldbyname('ActiveText').AsString;
          CBIFFinish.Checked:=AdoActive.fieldbyname('IFFinish').AsBoolean;
        End;
end;

procedure TFrm_CustActive.EdtModeClick(Sender: TObject);
begin
  inherited;
  IF EdtPlace.Properties.ReadOnly=True Then Exit
  Else AddDictOther('ActiveMode','活动方式',0);
end;

procedure TFrm_CustActive.BtnAddClick(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(ExpendMoney.Text);
  Except
    Application.MessageBox('费用金额输入有误.','提示',MB_OK+MB_Iconwarning);
    ExpendMoney.Text:='0';
    Exit;
  End;
  IF (ExpendType.Text='') OR (ExpendMoney.Text='0') OR (ExpendMan.Text='') Then
    Begin
      Application.MessageBox('费用类型和费用发生人不能为空,费用金额不能为零.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
          LAdoExpend.Append;
          IF DatabaseModule.dtclsData.UserName_=ExpendMan.Text Then
            Begin
              LAdoExpend.FieldByName('DeptID_').AsInteger:=DataBaseModule.DtClsData.DeptID_;
              LAdoExpend.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
            End
          Else
            Begin
              LAdoExpend.FieldByName('DeptID_').AsInteger:=LAdoUser.FieldByName('DeptID_').AsInteger;
              LAdoExpend.FieldByName('BelongID').AsInteger:=LAdoUser.FieldByName('UserID_').AsInteger;
            End;
          LAdoExpend.FieldByName('ActiveNum').AsString:=ActiveNum.Text;
          LAdoExpend.FieldByName('ExpendType').AsString:=ExpendType.Text;
          LAdoExpend.FieldByName('ExpendMoney').AsFloat:=StrToFloat(ExpendMoney.Text);
          LAdoExpend.FieldByName('ExpendMemo').AsString:=EdtContext.Text;
          LAdoExpend.FieldByName('ExpendDate').AsDateTime:=Date;
          LAdoExpend.FieldByName('IFCheck').AsBoolean:=Boolean(0);
          LAdoExpend.FieldByName('CreateBy_').AsString:=DatabaseModule.DtclsData.UserName_;
          LAdoExpend.FieldByName('CreateD_').AsDateTime:=Date;
          IF PNActive=1 Then
            Begin
              LAdoExpend.FieldByName('CustID').AsInteger:=DatabaseModule.AdoCust.FieldByName('CustID').AsInteger;
              LAdoExpend.FieldByName('ExpendOption').AsInteger:=1;
            End;
          IF PNActive=5 Then
            Begin
              LAdoExpend.FieldByName('CustID').AsInteger:=DatabaseModule.AdoSupply.FieldByName('CustID').AsInteger;
              LAdoExpend.FieldByName('ExpendOption').AsInteger:=5;
            End;

          LAdoExpend.Post;
  ExpendType.Text:='';
  ExpendMoney.Text:='0';
end;

procedure TFrm_CustActive.BtnDelClick(Sender: TObject);
begin
  inherited;
  IF LAdoExpend.IsEmpty Then Exit;
  LAdoExpend.Delete;
end;

procedure TFrm_CustActive.ExpendTypeClick(Sender: TObject);
begin
  inherited;
  IF ExpendType.Properties.ReadOnly=True Then Exit
  Else AddDictOther('ExpendType','费用类型',0);
end;

procedure TFrm_CustActive.ShowExpendRecord;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      LAdoExpend.Close;
      LAdoExpend.SQL.Clear;
      LAdoExpend.SQL.Add('Select ActiveNum,DeptID_,CustID,ProjID,ServiceID,ExpendType,ExpendOption,ExpendMoney,ExpendDate,ExpendMemo,CreateBy_,CreateD_,UpdateBY_,UpdateD_,BelongID,IFCheck');
      LAdoExpend.SQL.Add(' From Expend Where ActiveNum=:ActiveNum');
      LAdoExpend.Parameters.ParamByName('ActiveNum').Value:=ActiveNum.Text;
      LAdoExpend.Prepared;
      LAdoExpend.Open;
    End;
    
  IF GrdExpend.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  GrdExpend.OptionsView.ScrollBars:=SSNone;
  FOR I:=0 TO LDSExpend.DataSet.FieldCount - 15 Do
    Begin
      GrdExpend.CreateColumn;
      GrdExpend.Columns[I].Name:='ExpendColumns'+IntToStr(I);
   End;
          GrdExpend.DataController.DataSource:=LDSExpend;
          GrdExpend.Columns[0].Caption:='费用类型';
          GrdExpend.Columns[0].DataBinding;
          GrdExpend.Columns[0].DataBinding.FieldName:='ExpendType';
          GrdExpend.Columns[0].DataBinding.ValueType:='String';

          GrdExpend.Columns[1].Caption:='费用金额';
          GrdExpend.Columns[1].DataBinding;
          GrdExpend.Columns[1].DataBinding.FieldName:='ExpendMoney';
          GrdExpend.Columns[1].DataBinding.ValueType:='Float';
          GrdExpend.Columns[1].Width:=150;

       GrdExpend.OptionsView.ScrollBars:=SSBoth;
end;

procedure TFrm_CustActive.GrdExpendCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF LAdoExpend.IsEmpty Then Exit;
  ExpendType.Text:=LAdoExpend.FieldByName('ExpendType').AsString;
  ExpendMoney.Text:=FloatToStr(LAdoExpend.FieldByName('ExpendMoney').AsFloat);
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select UserName_ From Users_ where UserID_=:UserID ');
  Query.Parameters.ParamByName('UserID').Value:=LAdoExpend.FieldByName('BelongID').AsInteger;
  Query.Prepared;
  Query.Open;
  ExpendMan.Text:=Query.FieldByName('UserName_').AsString;
  Query.Close;
end;

procedure TFrm_CustActive.ExpendManClick(Sender: TObject);
begin
  inherited;
      Frm_Search:=TFrm_Search.Create(Self);
      Frm_Search.GrdSearch.CreateColumn;
      Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';

      Frm_Search.GrdSearch.Columns[0].Caption:='名称';

      LAdoUser.Close;
      LAdoUser.SQL.Clear;
      LAdoUser.SQL.Add('Select DeptID_,UserID_,UserName_ From Users_');
      LAdoUser.Prepared;
      LAdoUser.Open;

      Frm_Search.GrdSearch.DataController.DataSource:=Frm_CustActive.LDSUser;
      Frm_Search.GrdSearch.Columns[0].DataBinding;
      Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='UserName_';
      Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
      Frm_Search.FrmName:='Frm_CustActive';
      Frm_search.ShowModal;
end;

procedure TFrm_CustActive.CustStateClick(Sender: TObject);
begin
  inherited;
  IF CustState.Properties.ReadOnly=True Then Exit
  Else AddDict('CustState','客户状态',1);
end;

procedure TFrm_CustActive.CustRateClick(Sender: TObject);
begin
  inherited;
  IF CustRate.Properties.ReadOnly=True Then Exit
  Else AddDict('CustRate','客户等级',1);
end;

procedure TFrm_CustActive.CustCreditClick(Sender: TObject);
begin
  inherited;
  IF CustCredit.Properties.ReadOnly=True Then Exit
  Else AddDict('CustCredit','信用额度',1);
end;


procedure TFrm_CustActive.AddDictOther(FTableName,LFieldName: String; LIFCust: Integer);
begin
  With DatabaseModule DO
     Begin
       AdoDictOther.Close;
       AdoDictOther.SQL.Clear;
       AdoDictOther.SQL.Add('Select * from DictOther where FieldName=:FieldName');
       AdoDictOther.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDictOther.Prepared;
       AdoDictOther.Open;

       AdoDictOther.FieldByName('DictID').Visible:=False;
       AdoDictOther.FieldByName('FieldName').Visible:=False;
       AdoDictOther.FieldByName('IFCust').Visible:=False;
       AdoDictOther.FieldByName('Context').DisplayLabel:=LFieldName;
     End;
  Frm_DictOther:=TFrm_DictOther.Create(Self);
  Frm_DictOther.FTableName:=FTableName;
  Frm_DictOther.DictDuty:=LFieldName;
  Frm_DictOther.DictIFCust:=LIFCust;
  Frm_DictOther.FrmName:='Frm_CustActive';
  {IF PNActive=1 Then Frm_Dict.FrmName:='Frm_CustActive';
  IF PNActive=2 Then Frm_Dict.FrmName:='Frm_Contract';}
  Frm_DictOther.ShowModal;
end;

end.
