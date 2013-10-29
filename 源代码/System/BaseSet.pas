unit BaseSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Menus, cxLookAndFeelPainters, cxButtons,
  ExtCtrls, cxControls, cxPC, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, DB, ADODB, bainaADOQuery;

type
  TFrm_BaseSet = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    Panel2: TPanel;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    Panelarea: TPanel;
    CustCountry: TcxButtonEdit;
    CustProv: TcxButtonEdit;
    CustCity: TcxButtonEdit;
    CustRegion: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Query: TbainaADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure CustCountryClick(Sender: TObject);
    procedure CustProvClick(Sender: TObject);
    procedure CustCityClick(Sender: TObject);
    procedure CustRegionClick(Sender: TObject);
  private
    { Private declarations }
    DictFieldNum,DictFieldCountryID,DictFieldProvID,DictFieldCityID:Integer;
    Procedure AddDict(FTableName,LFieldName:String;LIFCust:Integer);
  public
    { Public declarations }
  end;

var
  Frm_BaseSet: TFrm_BaseSet;

implementation

uses Dict, DataBase;

{$R *.dfm}

procedure TFrm_BaseSet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TFrm_BaseSet.cxButton1Click(Sender: TObject);
begin
  AddDict('CustRate','客户等级',1);
end;

procedure TFrm_BaseSet.AddDict(FTableName, LFieldName: String; LIFCust: Integer);
begin
  IF (Frm_Dict<>Nil) And (Assigned(Frm_Dict)) Then Frm_Dict.Close;
  With DatabaseModule DO
     Begin
       IF (FTableName='CustCountry') OR (FTableName='CustProvince') OR (FTableName='CustCity') OR (FTableName='CustRegion') Then
         PanelArea.Visible:=True
       Else PanelArea.Visible:=False;  
       AdoDict.Close;
       AdoDict.SQL.Clear;
       AdoDict.SQL.Add('Select DictID,PFieldNum,FactTableName,FieldName,Context,IFCust,IFDefault,ProtectLimit from Dict where FieldName=:FieldName');
       IF (FTableName='CustProvince') Then
         Begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('Select DictID From Dict Where Context='''+CustCountry.Text+'''');
           Query.Prepared;
           Query.Open;
           DictFieldCountryID:=Query.FieldByName('DictID').AsInteger;
           DictFieldNum:=DictFieldCountryID;
           AdoDict.SQL.Add(' And PFieldNum=:PFieldNum');
           AdoDict.Parameters.ParamByName('PFieldNum').Value:=DictFieldCountryID;
         End;
       IF (FTableName='CustCity') Then
         Begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('Select DictID From Dict Where Context='''+CustProv.Text+'''');
           Query.Prepared;
           Query.Open;
           DictFieldProvID:=Query.FieldByName('DictID').AsInteger;
           DictFieldNum:=DictFieldProvID;
           AdoDict.SQL.Add(' And PFieldNum=:PFieldNum');
           AdoDict.Parameters.ParamByName('PFieldNum').Value:=DictFieldProvID;
         End;
       IF (FTableName='CustRegion') Then
         Begin
           Query.Close;
           Query.SQL.Clear;
           Query.SQL.Add('Select DictID From Dict Where Context='''+CustCity.Text+'''');
           Query.Prepared;
           Query.Open;
           DictFieldCityID:=Query.FieldByName('DictID').AsInteger;
           DictFieldNum:=DictFieldCityID;
           AdoDict.SQL.Add(' And PFieldNum=:PFieldNum');
           AdoDict.Parameters.ParamByName('PFieldNum').Value:=DictFieldCityID;
         End;

       AdoDict.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDict.Prepared;
       AdoDict.Open;

       AdoDict.FieldByName('Context').DisplayLabel:=LFieldName;
     End;

  //----------------------------------------------------------------------

  Frm_Dict:=TFrm_Dict.Create(Panel2);
  Frm_Dict.Parent:=panel2;
  Frm_Dict.BorderStyle:=BSNone;
  Frm_Dict.WindowState:=WSMaximized;
  Frm_Dict.Align:=ALClient;
  Frm_Dict.FrmName:='Frm_BaseSet';
  Frm_Dict.FTableName:=FTableName;
  Frm_Dict.PFieldNum:=DictFieldNum;
  Frm_Dict.DictDuty:=LFieldName;
  Frm_Dict.DictIFCust:=LIFCust;
  //Frm_Dict.BitBtn4.Visible:=False;
  Frm_Dict.BitBtn5.Visible:=False;
  {IF LFieldName='客户类型' Then
    Begin
      Frm_Dict.Label1.Visible:=True;
      Frm_Dict.EdtLimit.Visible:=True;
      Frm_Dict.EdtLimit.Text:='0';
    End;}
  Frm_Dict.Show;
end;

procedure TFrm_BaseSet.cxButton4Click(Sender: TObject);
begin
  AddDict('CustKind','客户性质',1);
end;

procedure TFrm_BaseSet.cxButton2Click(Sender: TObject);
begin
  AddDict('CustType','客户类型',1);
end;

procedure TFrm_BaseSet.cxButton5Click(Sender: TObject);
begin
  AddDict('CustTrade','客户行业',1);
end;

procedure TFrm_BaseSet.cxButton3Click(Sender: TObject);
begin
  AddDict('CustState','客户状态',1);
end;

procedure TFrm_BaseSet.cxButton6Click(Sender: TObject);
begin
  AddDict('CustCredit','信用额度',1);
end;

procedure TFrm_BaseSet.cxButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_BaseSet.cxButton8Click(Sender: TObject);
begin
  AddDict('CustSource','客户来源',1);
end;

procedure TFrm_BaseSet.cxButton9Click(Sender: TObject);
begin
  IF (Frm_Dict<>Nil) And (Assigned(Frm_Dict)) Then Frm_Dict.Close;
  Panelarea.Visible:=True;
end;

procedure TFrm_BaseSet.CustCountryClick(Sender: TObject);
begin
  AddDict('CustCountry','国家',1);
end;

procedure TFrm_BaseSet.CustProvClick(Sender: TObject);
begin
  IF CustCountry.Text='' Then Exit
  Else AddDict('CustProvince','省份',1);
end;

procedure TFrm_BaseSet.CustCityClick(Sender: TObject);
begin
  IF  CustProv.Text='' Then Exit
  Else AddDict('CustCity','城市',1);
end;

procedure TFrm_BaseSet.CustRegionClick(Sender: TObject);
begin
  IF CustCity.Text='' Then Exit
  Else AddDict('CustRegion','区域',1);
end;

end.
