unit Cash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxMemo, cxLabel, cxControls, cxContainer,
  cxEdit, cxTextEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  DB, ADODB, bainaADOQuery;

type
  TFrm_Cash = class(TBaseData_Frm)
    EdtCust: TcxTextEdit;
    EdtSaleMoney: TcxTextEdit;
    EdtFactMoney: TcxTextEdit;
    EdtCash: TcxTextEdit;
    EdtCancelMoney: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel10: TcxLabel;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    Query: TbainaADOQuery;
    cxLabel11: TcxLabel;
    FactCash: TcxTextEdit;
    procedure BtnExitClick(Sender: TObject);
    procedure EdtCancelMoneyPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure FactCashPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cash: TFrm_Cash;

implementation

uses Pay, DataBase;

{$R *.dfm}

procedure TFrm_Cash.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_Cash.EdtCancelMoneyPropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(EdtCancelMoney.Text);
  Except
    EdtCancelMoney.Text:='0';
  End;
end;

procedure TFrm_Cash.FormCreate(Sender: TObject);
begin
  inherited;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select CustNum,PreMoney,UpdateBY_,UpdateD_ From FirstArrear Where CustNum=:CustNum');
  Query.Parameters.ParamByName('CustNum').Value:=Frm_Pay.LAdoSaleM.FieldByName('CustNum').AsString;
  Query.Prepared;
  Query.Open;
  EdtCust.Text:=Frm_Pay.LAdoSaleM.FieldByName('CustName').AsString;
  EdtSaleMoney.Text:=FloatToStr(Frm_Pay.LAdoSaleM.FieldByName('SaleMoney').AsFloat);
  EdtFactMoney.Text:=FloatToStr(Frm_Pay.LAdoSaleM.FieldByName('FactMoney').AsFloat);
  EdtCash.Text:=FloatToStr(Query.FieldByName('PreMoney').AsFloat);
  FactCash.Text:=FloatToStr(Query.FieldByName('PreMoney').AsFloat);
end;

procedure TFrm_Cash.BtnSureClick(Sender: TObject);
Var
  ReceiveCash:Real;
begin
  inherited;
  IF (StrToFloat(FactCash.Text)>StrToFloat(EdtCash.Text)) OR (StrToFloat(FactCash.Text)=0) OR (StrToFloat(EdtSaleMoney.Text)=StrToFloat(EdtFactMoney.Text)+StrToFloat(EdtCancelMoney.Text)) Then
    Begin
      Application.MessageBox('请检查冲款金额是否正确','提示',MB_OK+MB_Iconwarning);
      Exit;
    End
  Else
    Begin
      IF (StrToFloat(EdtSaleMoney.Text)-StrToFloat(EdtFactMoney.Text)-StrToFloat(EdtCancelmoney.Text)>=StrToFloat(FactCash.Text)) Then
        Begin
          ReceiveCash:=StrToFloat(FactCash.Text);
          EdtCash.Text:=FloatToStr(StrToFloat(EdtCash.Text)-StrToFloat(FactCash.Text));
          EdtFactMoney.Text:=FloatToStr(StrTOFloat(EdtFactMoney.Text)+StrToFloat(FactCash.Text));
          FactCash.Text:= '0';
        End
      Else
        Begin
          ReceiveCash:=StrToFloat(EdtSaleMoney.Text)-StrToFloat(EdtFactMoney.Text)-StrToFloat(EdtCancelMoney.Text);
          EdtCash.Text:=FloatToStr(StrToFloat(EdtCash.Text)-ReceiveCash);//StrToFloat(FactCash.Text));
          FactCash.Text:='0';//FloatToStr(StrToFloat(FactCash.Text)-ReceiveCash);//(StrToFloat(EdtSaleMoney.Text)-StrToFloat(EdtFactMoney.Text)-StrToFloat(EdtCancelMoney.Text)));
          EdtFactMoney.Text:=FloatToStr(StrToFloat(EdtSaleMoney.Text)-StrToFloat(EdtCancelMoney.Text));
        End;
      With DatabaseModule Do
        Begin
          DtclsData.BeginTrans;
          Try
            //修改销售主表
            Frm_Pay.LAdoSaleM.Edit;
            Frm_Pay.LAdoSaleM.FieldByName('FactMoney').AsFloat:=StrToFloat(EdtFactMoney.Text);
            Frm_Pay.LAdoSaleM.FieldByName('CancelMoney').AsFloat:=StrToFloat(EdtCancelmoney.Text);
            Frm_Pay.LAdoSaleM.FieldByName('UpdateBy_').AsString:=DatabaseModule.dtclsData.UserName_;
            Frm_Pay.LAdoSaleM.FieldByName('UpdateD_').AsDateTime:=Date;
            IF StrToFloat(EdtSaleMoney.Text)=(StrToFloat(EdtFactMoney.Text)+StrToFloat(EdtCancelMoney.Text)) Then
              Frm_Pay.LAdoSaleM.FieldByName('IFFinish').AsBoolean:=Boolean(1);
            Frm_Pay.LAdoSaleM.Post;

            //增加收款明细记录
            Frm_Pay.LAdoPayList.Append;
            Frm_Pay.LAdoPayList.FieldByName('DeptID_').AsInteger:=DatabaseModule.dtclsData.DeptID_;
            Frm_Pay.LAdoPayList.FieldByName('SaleID').AsString:=Frm_Pay.LAdoSaleM.FieldByName('SaleID').AsString;
            Frm_Pay.LAdoPayList.FieldByName('paymoney').AsFloat:=ReceiveCash;
            Frm_Pay.LAdoPayList.FieldByName('CreateBy_').AsString:=DatabaseModule.dtclsData.UserName_;
            Frm_Pay.LAdoPayList.FieldByName('CreateD_').AsDateTime:=Date;
            Frm_Pay.LAdoPayList.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
            Frm_Pay.LAdoPayList.Post;
            //修改期初欠款表
            Query.Edit;
            Query.FieldByName('PreMoney').AsFloat:=StrToFloat(EdtCash.Text);
            Query.FieldByName('UpdateBy_').AsString:=DtclsData.UserName_;
            Query.FieldByName('UpdateD_').AsDateTime:=Date;
            Query.Post;

            DtclsData.CommitTrans;
            
          Except
            DtclsData.RollbackTrans;
            Raise;
          End;
        End;
    End;
end;

procedure TFrm_Cash.FactCashPropertiesChange(Sender: TObject);
begin
  inherited;
  Try
    StrToFloat(FactCash.Text);
  Except
    FactCash.Text:='0';
  End;
end;

procedure TFrm_Cash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
