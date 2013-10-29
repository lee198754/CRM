unit Default;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxControls, cxContainer, cxEdit, cxLabel,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxGraphics,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, DB, ADODB, bainaADOQuery;

type
  TFrm_Default = class(TBaseData_Frm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    cxComboBox1: TcxComboBox;
    cxComboBox2: TcxComboBox;
    cxComboBox3: TcxComboBox;
    cxComboBox4: TcxComboBox;
    cxComboBox5: TcxComboBox;
    cxComboBox6: TcxComboBox;
    cxComboBox7: TcxComboBox;
    cxComboBox8: TcxComboBox;
    cxComboBox9: TcxComboBox;
    LAdoDict: TbainaADOQuery;
    LDSDict: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FilterValue(ComBX:TcxCombobox;FValue:String);
    Procedure SaveValue(SValue:String);
    Procedure GetValue(ComBX:TcxCombobox;FValue:String);
  public
    { Public declarations }
  end;

var
  Frm_Default: TFrm_Default;

implementation

uses DataBase;

{$R *.dfm}

procedure TFrm_Default.FilterValue(ComBX: TcxCombobox; FValue: String);
Var
  I:Integer;
begin
  ComBx.Properties.Items.Clear;
  LDSDict.DataSet.Filtered:=False;
  LDSDict.DataSet.Filter:='FactTableName = ' + QuotedStr(FValue);
  LDSDict.DataSet.Filtered:=True;

  LAdoDict.First;
  FOR I:=1 TO LAdoDict.RecordCount DO
    Begin
      ComBX.Properties.Items.Add(LAdoDict.FieldByName('Context').AsString);
      LAdoDict.Next;
    End;
end;

procedure TFrm_Default.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoDict.Close;
  LAdoDict.SQL.Clear;
  LAdoDict.SQL.Add('Select FactTableName,Context,IFDefault From Dict Where IFCust='+'1');
  LAdoDict.Prepared;
  LAdoDict.Open;

  FilterValue(cxCombobox1,'CustCountry');
  FilterValue(cxCombobox2,'CustProvince');
  FilterValue(cxCombobox3,'CustCity');
  FilterValue(cxCombobox4,'CustRate');
  FilterValue(cxCombobox5,'CustSource');
  FilterValue(cxCombobox6,'CustTrade');
  FilterValue(cxCombobox7,'CustType');
  FilterValue(cxCombobox8,'CustState');
  FilterValue(cxCombobox9,'CustCredit');

  GetValue(cxCombobox1,'CustCountry');
  GetValue(cxCombobox2,'CustProvince');
  GetValue(cxCombobox3,'CustCity');
  GetValue(cxCombobox4,'CustRate');
  GetValue(cxCombobox5,'CustSource');
  GetValue(cxCombobox6,'CustTrade');
  GetValue(cxCombobox7,'CustType');
  GetValue(cxCombobox8,'CustState');
  GetValue(cxCombobox9,'CustCredit');
end;

procedure TFrm_Default.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_Default.BtnSureClick(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  LAdoDict.Filtered:=False;
  FOR I:=1 TO LAdoDict.RecordCount DO
    Begin
      LAdoDict.Edit;
      LAdoDict.FieldByName('IFDefault').AsBoolean:=Boolean(0);
      LAdoDict.Post;
      LAdoDict.Next;
    End;

  IF cxCombobox1.Text<>'' Then
    SaveValue(cxCombobox1.Text);

  IF cxCombobox2.Text<>'' Then
    SaveValue(cxCombobox2.Text);

  IF cxCombobox3.Text<>'' Then
    SaveValue(cxCombobox3.Text);

  IF cxCombobox4.Text<>'' Then
    SaveValue(cxCombobox4.Text);

  IF cxCombobox5.Text<>'' Then
    SaveValue(cxCombobox5.Text);

  IF cxCombobox6.Text<>'' Then
    SaveValue(cxCombobox6.Text);

  IF cxCombobox7.Text<>'' Then
    SaveValue(cxCombobox7.Text);

  IF cxCombobox8.Text<>'' Then
    SaveValue(cxCombobox8.Text);

  IF cxCombobox9.Text<>'' Then
    SaveValue(cxCombobox9.Text);

  BtnExit.Click;  
end;

procedure TFrm_Default.SaveValue(SValue: String);
begin
  LAdoDict.First;
  IF LAdoDict.Locate('Context',SValue,[loCaseInsensitive]) Then
    Begin
      LAdoDict.Edit;
      LAdoDict.FieldByName('IFDefault').AsBoolean:=Boolean(1);
      LAdoDict.Post;
    End;
  LAdoDict.UpdateBatch;
end;

procedure TFrm_Default.GetValue(ComBX: TcxCombobox; FValue: String);
begin
  LAdoDict.Filtered:=False;
  LAdoDict.Filter:='FactTableName='+' '+ QuotedStr(FValue)+' '+'And'+' '+'IFDefault='+' '+QuotedStr('1');
  LAdoDict.Filtered:=True;

  ComBX.Text:=LAdoDict.FieldByName('Context').AsString;

end;

procedure TFrm_Default.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=CaFree;
end;

end.
