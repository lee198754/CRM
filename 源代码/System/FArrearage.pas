unit FArrearage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxMaskEdit, cxButtonEdit, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses, ImgList,
  ActnList, XPMenu, DB, ADODB, bainaADOQuery;

type
  TFrm_FArrearage = class(TBaseData_Frm)
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
  Frm_FArrearage: TFrm_FArrearage;

implementation

uses Search, DataBase;

{$R *.dfm}

procedure TFrm_FArrearage.EdtCustClick(Sender: TObject);
begin
  inherited;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=Frm_FArrearage.LDSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_FArrearage';
  Frm_search.ShowModal;  
end;

procedure TFrm_FArrearage.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoCust.Close;
  LAdoCust.SQL.Clear;
  LAdoCust.SQL.Add('Select CustNum,CustName From Customer');
  LAdoCust.Prepared;
  LAdoCust.Open;
end;

procedure TFrm_FArrearage.EdtArrearagePropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtArrearage.Text);
  Except
    EdtArrearage.Text:='0';
  End;    
end;

procedure TFrm_FArrearage.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF (EdtCust.Text='') OR (EdtArrearage.Text='0') Then exit;
  With DatabaseModule Do
  Begin
    DtclsData.BeginTrans;
    Try
    LAdoArrearage.Close;
    LAdoArrearage.SQL.Clear;
    LAdoArrearage.SQL.Add('Update FirstArrear Set DeptID_=:DeptID,ArrearMoney=:ArrearMoney,');
    LAdoArrearage.SQL.Add('PreMoney=:PreMoney,BelongID=:BelongID,UpdateBy_=:UpdateBy,UpdateD_=:UpdateD');
    LAdoArrearage.SQL.Add(' Where CustNum=:CustNum');
    LAdoArrearage.Parameters.ParamByName('DeptID').Value:=DtclsData.DeptID_;
    LAdoArrearage.Parameters.ParamByName('CustNum').Value:=LAdoCust.FieldByName('CustNum').AsString;
    LAdoArrearage.Parameters.ParamByName('ArrearMoney').Value:=StrToFloat(EdtArrearage.Text);
    LAdoArrearage.Parameters.ParamByName('PreMoney').Value:=0;
    LAdoArrearage.Parameters.ParamByName('BelongID').Value:=DtclsData.UserID_;
    LAdoArrearage.Parameters.ParamByName('UpdateBy').Value:=DtclsData.UserName_;
    LAdoArrearage.Parameters.ParamByName('UpdateD').Value:=Date;
    LAdoArrearage.Prepared;
    LAdoArrearage.ExecSQL;
    Application.MessageBox('该客户期初欠款设置成功','提示',MB_OK+MB_Iconwarning);
    EdtCust.Text:='';
    EdtArrearage.Text:='0';
    DtclsData.CommitTrans;
    Except
      DtclsData.RollbackTrans;
    Raise;
    End;
  End;
end;

procedure TFrm_FArrearage.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_FArrearage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
