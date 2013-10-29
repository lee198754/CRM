unit PreWrite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxMemo, cxCheckBox, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls,
  cxContainer, cxEdit, cxLabel, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, DB, ADODB, bainaADOQuery, frxClass, frxDBSet;

type
  TFrm_Pre = class(TBaseData_Frm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel9: TcxLabel;
    EdtCust: TcxButtonEdit;
    EdtNum: TcxTextEdit;
    EdtMoney: TcxTextEdit;
    EdtBDate: TcxDateEdit;
    EdtFDate: TcxDateEdit;
    EdtFFDate: TcxDateEdit;
    EdtMemo: TcxMemo;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    LAdoService: TbainaADOQuery;
    EdtMan: TcxTextEdit;
    LAdoCust: TbainaADOQuery;
    LDSCust: TDataSource;
    LDSService: TDataSource;
    cxLabel8: TcxLabel;
    EdtIFFinish: TCheckBox;
    cxLabel10: TcxLabel;
    EdtMode: TcxButtonEdit;
    cxLabel11: TcxLabel;
    Trafic: TcxMemo;
    cxLabel12: TcxLabel;
    EdtAdd: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure EdtCustClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtModeClick(Sender: TObject);
  private
    { Private declarations }
    CustName:String;
    Procedure ShowPreServiceRecord;
    Procedure AddDict(FTableName,LFieldName:String;LIFCust:Integer);
  public
    { Public declarations }
  end;

var
  Frm_Pre: TFrm_Pre;

implementation

uses DataBase, Search, PublicClass, Dict, Dictother;

{$R *.dfm}

procedure TFrm_Pre.FormCreate(Sender: TObject);
var
  Present: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
 begin
  inherited;
  IF ISAdd = True Then
    Begin
      Present:= Now;
      DecodeDate(Present, Year, Month, Day);
      DecodeTime(Present, Hour, Min, Sec, MSec);
      EdtNum.Text:=IntToStr(Year)+IntToStr(Month)+IntToStr(Day)+IntToStr(Hour+Min+Sec)+IntToStr(DatabaseModule.dtclsData.UserID_);
      EdtCust.Text:='';
      EdtMan.Text:='';
      EdtMode.Text:='';
      EdtAdd.Text:='';
      Trafic.Text:='';
      EdtBDate.Date:=Date;
      EdtFDate.Date:=Date;
      EdtFFDate.Date:=Date;
      EdtMemo.Text:='';
      EdtIFFinish.Checked:=False;
      EdtIFFinish.Enabled:=False;
    End;
  IF ISEdit = True Then
    Begin
      ShowPreServiceRecord;
      CustName:=EdtCust.Text;
    End;
  IF ISBrowse=True Then
    Begin
      ShowPreServiceRecord;
      BtnSure.Visible:=False;  
      Exit;  
    End;
  LAdoCust.Close;
  LAdoCust.SQL.Clear;
  LAdoCust.SQL.Add('Select CustID,CustName,CustAddress From Customer');
  LAdoCust.Prepared;
  LAdoCust.Open;
end;

procedure TFrm_Pre.EdtCustClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_Pre.LDSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_Pre';
  Frm_search.ShowModal;
  //Showmessage(IntToStr(LAdoCust.fieldbyname('CustID').asinteger));
end;

procedure TFrm_Pre.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_Pre.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF EdtCust.Text='' Then Exit;
  IF ISAdd=True Then
  Begin
  With DatabaseModule Do
    Begin
      Dtclsdata.BeginTrans;
      Try
      AdoPreService.Append;
      AdoPreService.FieldByName('ServiceNum').AsString:=EdtNum.Text;
      AdoPreService.FieldByName('DeptID_').AsInteger:=Dtclsdata.DeptID_;
      AdoPreService.FieldByName('CustID').AsInteger:=LAdoCust.FieldByName('CustID').AsInteger;
      AdoPreService.FieldByName('ServiceRate').AsInteger:=StrToInt(EdtMoney.Text);
      AdoPreService.FieldByName('Contact').Text:=EdtMan.Text;
      AdoPreService.FieldByName('CustAdd').AsString:=EdtAdd.Text;
      AdoPreService.FieldByName('Trafic').AsString:=Trafic.Text;
      AdoPreService.FieldByName('ContactMode').AsString:=EdtMode.Text;
      AdoPreService.FieldByName('IFFinish').AsBoolean:=EdtIFFinish.Checked;
      AdoPreService.FieldByName('CreateBy_').AsInteger:=Dtclsdata.UserID_;
      AdoPreService.FieldByName('CreateD_').AsDateTime:=Date;
      AdoPreService.FieldByName('IFSelect').AsBoolean:=Boolean(0);
      AdoPreservice.FieldByName('IFCheck').AsBoolean:=Boolean(0);
      IF EdtBDate.Text='' Then AdoPreService.FieldByName('ServiceDate').Value:=Null
      Else AdoPreService.FieldByName('ServiceDate').AsDateTime:=EdtBDate.Date;
      IF EdtFDate.Text='' Then AdoPreService.FieldByName('FinishDate').Value:=Null
      Else AdoPreService.FieldByName('FinishDate').AsDateTime:=EdtFDate.Date;
      IF EdtFFDate.Text='' Then AdoPreService.FieldByName('FactFinishDate').Value:=Null
      Else AdoPreService.FieldByName('FactFinishDate').AsDateTime:=EdtFFDate.Date;
      AdoPreService.FieldByName('ServiceQuestion').AsString:=EdtMemo.Text;
      AdoPreService.Post;
      Dtclsdata.CommitTrans;
      BtnExit.Click;
      Except
        Dtclsdata.RollbackTrans;
        Raise;
      End;
    End;
  End;
  IF ISEdit=True Then
  Begin
  With DatabaseModule Do
    Begin
      Dtclsdata.BeginTrans;
      Try
      AdoPreService.Edit;
      //AdoPreService.FieldByName('ServiceNum').AsString:=EdtNum.Text;
      //AdoPreService.FieldByName('DeptID_').AsInteger:=Dtclsdata.DeptID_;
      IF Not (CustName=EdtCust.Text) Then
        AdoPreService.FieldByName('CustID').AsInteger:=LAdoCust.FieldByName('CustID').AsInteger;
      AdoPreService.FieldByName('ServiceRate').AsInteger:=StrToInt(EdtMoney.Text);
      AdoPreService.FieldByName('Contact').Text:=EdtMan.Text;
      AdoPreService.FieldByName('CustAdd').AsString:=EdtAdd.Text;
      AdoPreService.FieldByName('Trafic').AsString:=Trafic.Text;
      AdoPreService.FieldByName('ContactMode').AsString:=EdtMode.Text;
      //AdoPreService.FieldByName('IFFinish').AsBoolean:=EdtIFFinish.Checked;
      AdoPreService.FieldByName('UpdateBy_').AsString:=Dtclsdata.UserName_;
      AdoPreService.FieldByName('UpdateD_').AsDateTime:=Date;
      //AdoPreService.FieldByName('IFSelect').AsBoolean:=Boolean(0);
      AdoPreservice.FieldByName('IFCheck').AsBoolean:=Boolean(0);
      IF EdtBDate.Text='' Then AdoPreService.FieldByName('ServiceDate').Value:=Null
      Else AdoPreService.FieldByName('ServiceDate').AsDateTime:=EdtBDate.Date;
      IF EdtFDate.Text='' Then AdoPreService.FieldByName('FinishDate').Value:=Null
      Else AdoPreService.FieldByName('FinishDate').AsDateTime:=EdtFDate.Date;
      IF EdtFFDate.Text='' Then AdoPreService.FieldByName('FactFinishDate').Value:=Null
      Else AdoPreService.FieldByName('FactFinishDate').AsDateTime:=EdtFFDate.Date;
      AdoPreService.FieldByName('ServiceQuestion').AsString:=EdtMemo.Text;
      AdoPreService.Post;
      Dtclsdata.CommitTrans;
      BtnExit.Click;
      Except
        Dtclsdata.RollbackTrans;
        Raise;
      End;
    End;
  End;
end;

procedure TFrm_Pre.ShowPreServiceRecord;
begin
      With DatabaseModule Do
        Begin
          EdtNum.Text:= AdoPreService.FieldByName('ServiceNum').AsString;
          EdtCust.Text:=AdoPreService.FieldByName('CustName').AsString;
          EdtMan.Text:=AdoPreService.FieldByName('Contact').AsString;
          EdtAdd.Text:=AdoPreService.FieldByName('CustAdd').AsString;
          Trafic.Text:=AdoPreService.FieldByName('Trafic').AsString;
          EdtMode.Text:=AdoPreService.FieldByName('ContactMode').AsString;
          EdtMoney.Text:=IntToStr(AdoPreService.FieldByName('ServiceRate').AsInteger);
          IF AdoPreService.FieldByName('ServiceDate').Value=Null Then EdtBDate.Text:=''
          Else EdtBdate.Date:=AdoPreService.FieldByName('ServiceDate').AsDateTime;
          IF AdoPreService.FieldByName('FinishDate').Value=Null Then EdtFDate.Text:=''
          Else EdtFdate.Date:=AdoPreService.FieldByName('FinishDate').AsDateTime;
          IF AdoPreService.FieldByName('FactFinishDate').Value=Null Then EdtFFDate.Text:=''
          Else EdtFFdate.Date:=AdoPreService.FieldByName('FactFinishDate').AsDateTime;
          EdtMemo.Text:=AdoPreService.FieldByName('ServiceQuestion').Text;
          EdtIFFinish.Checked:= AdoPreService.FieldByName('IFFInish').AsBoolean;
        End;
end;

procedure TFrm_Pre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=False;
  Action:=CaFree;
end;

procedure TFrm_Pre.AddDict(FTableName, LFieldName: String;
  LIFCust: Integer);
begin
  With DatabaseModule DO
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:=LFieldName;
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:=FTableName;
  Frm_Dictother.DictDuty:=LFieldName;
  Frm_Dictother.DictIFCust:=LIFCust;
  Frm_Dictother.FrmName:='Frm_Pre';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_Pre.EdtModeClick(Sender: TObject);
begin
  inherited;
  AddDict('ContactMode','联系方式',0);
end;

end.
