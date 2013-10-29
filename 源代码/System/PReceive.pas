unit PReceive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxMaskEdit, cxButtonEdit, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses, ImgList,
  ActnList, XPMenu, DB, ADODB, bainaADOQuery;

type
  TFrm_Receive = class(TBaseData_Frm)
    EdtArrearage: TcxTextEdit;
    cxLabel1: TcxLabel;
    EdtCust: TcxButtonEdit;
    cxLabel2: TcxLabel;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    cxLabel3: TcxLabel;
    LAdoArrearage: TbainaADOQuery;
    LAdoCust: TbainaADOQuery;
    LDSCust: TDataSource;
    Query: TbainaADOQuery;
    EdtReceive: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    EdtCash: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    procedure EdtCustClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtArrearagePropertiesChange(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Receive: TFrm_Receive;

implementation

uses Search, DataBase;

{$R *.dfm}

procedure TFrm_Receive.EdtCustClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_Receive.LDSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_Receive';
  Frm_search.ShowModal;
  LAdoArrearage.Close;
  LAdoArrearage.SQL.Clear;
  LAdoArrearage.SQL.Add('Select DeptID_,CustNum,ArrearMoney,PreMoney,UpdateBy_,UpdateD_ From FirstArrear Where CustNum=:CustNum');
  LAdoArrearage.Parameters.ParamByName('CustNum').Value:=LAdoCust.FieldByName('CustNum').AsString;
  LAdoArrearage.Prepared;
  LAdoArrearage.Open;
  EdtArrearage.Text:=FloatToStr(LAdoArrearage.FieldByName('ArrearMoney').AsFloat);
  EdtCash.Text:=FloatToStr(LAdoArrearage.FieldByName('PreMoney').AsFloat);
end;

procedure TFrm_Receive.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoCust.Close;
  LAdoCust.SQL.Clear;
  LAdoCust.SQL.Add('Select CustNum,CustName From Customer');
  LAdoCust.Prepared;
  LAdoCust.Open;
end;

procedure TFrm_Receive.EdtArrearagePropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtReceive.Text);
  Except
    EdtReceive.Text:='0';
  End;    
end;

procedure TFrm_Receive.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF (EdtCust.Text='') OR (EdtReceive.Text='0') Then exit;
  With DatabaseModule Do
  Begin
    IF StrToFloat(EdtArrearage.Text)>0 Then
      Begin
        IF Application.MessageBox('是否冲销客户期初欠款','提示',MB_YESNO+MB_Iconwarning)=IDYES Then
          Begin
            DtclsData.BeginTrans;
            Try
            LAdoArrearage.Edit;
            LAdoArrearage.FieldByName('DeptID_').AsInteger:=DtclsData.DeptID_;
            IF StrToFloat(EdtArrearage.Text)>StrToFloat(EdtReceive.Text) Then
              Begin
                LAdoArrearage.FieldByName('ArrearMoney').AsFloat:=StrToFloat(EdtArrearage.Text)-StrToFloat(EdtReceive.Text);
                LAdoArrearage.FieldByName('PreMoney').AsFloat:=0;
              End;
            IF StrToFloat(EdtArrearage.Text)<StrToFloat(EdtReceive.Text) Then
              Begin
                LAdoArrearage.FieldByName('ArrearMoney').AsFloat:=0;
                LAdoArrearage.FieldByName('PreMoney').AsFloat:=StrToFloat(EdtReceive.Text)-StrToFloat(EdtArrearage.Text);
              End;
            IF StrToFloat(EdtArrearage.Text)=StrToFloat(EdtReceive.Text) Then
              Begin
                LAdoArrearage.FieldByName('ArrearMoney').AsFloat:=0;
                LAdoArrearage.FieldByName('PreMoney').AsFloat:=0;
              End;
            LAdoArrearage.FieldByName('UpdateBy_').AsString:=DtclsData.UserName_;
            LAdoArrearage.FieldByName('UpdateD_').AsDateTime:=Date;
            LAdoArrearage.Post;
            Dtclsdata.CommitTrans;
            Except
              DtclsData.RollbackTrans;
              Raise;
            End;
          End
        Else
          Begin
            DtclsData.BeginTrans;
            Try
            LAdoArrearage.Edit;
            LAdoArrearage.FieldByName('DeptID_').AsInteger:=DtclsData.DeptID_;
            LAdoArrearage.FieldByName('PreMoney').AsFloat:=LAdoArrearage.FieldByName('PreMoney').AsFloat+StrToFloat(EdtReceive.Text);
            LAdoArrearage.FieldByName('UpdateBy_').AsString:=DtclsData.UserName_;
            LAdoArrearage.FieldByName('UpdateD_').AsDateTime:=Date;
            LAdoArrearage.Post;
            DtclsData.CommitTrans;
            EdtCash.Text:= FloatToStr(StrToFloat(EdtReceive.Text)+StrToFloat(EdtCash.Text));
            EdtReceive.Text:='0';
            Except
              DtclsData.RollbackTrans;
              Raise;
            End;
          End;
      End
    Else
      Begin
            DtclsData.BeginTrans;
            Try
            LAdoArrearage.Edit;
            LAdoArrearage.FieldByName('DeptID_').AsInteger:=DtclsData.DeptID_;
            LAdoArrearage.FieldByName('PreMoney').AsFloat:=LAdoArrearage.FieldByName('PreMoney').AsFloat+StrToFloat(EdtReceive.Text);
            LAdoArrearage.FieldByName('UpdateBy_').AsString:=DtclsData.UserName_;
            LAdoArrearage.FieldByName('UpdateD_').AsDateTime:=Date;
            LAdoArrearage.Post;
            DtclsData.CommitTrans;
            EdtCash.Text:=  FloatToStr(StrToFloat(EdtReceive.Text)+StrToFloat(EdtCash.Text));
            EdtReceive.Text:='0';
            Except
              DtclsData.RollbackTrans;
              Raise;
            End;
      End;
  End;
  
end;

procedure TFrm_Receive.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_Receive.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
