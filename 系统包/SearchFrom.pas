unit SearchFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, cxControls, cxContainer, cxEdit, cxGroupBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ADODB, bainaADOQuery,DataClass, cxLookAndFeels,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, XPMenu;

type
  TSearch_Frm = class(TBase_Frm)
    cxgrpbx1: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    btn1: TcxButton;
    btn2: TcxButton;
    bndqry1: TbainaADOQuery;
    ds1: TDataSource;
    procedure btn2Click(Sender: TObject);
  private
    function GetConnection:TDataClass;
    procedure SetConnection(Value:TDataClass);
  public
    function GetSearchData(TableName:String;WhereSql:String;fields,captions:array of Variant):Variant;overload;
    function GetSearchData(msql:String;fields,captions:array of Variant):Variant;overload;
  published
    property Connection:TDataClass read GetConnection write SetConnection;
  end;

var
  Search_Frm: TSearch_Frm;
procedure Register;
implementation

{$R *.dfm}
procedure Register;
begin
  RegisterComponents('BaiNa', [TSearch_Frm]);
end;

procedure TSearch_Frm.btn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

function TSearch_Frm.GetConnection: TDataClass;
begin
  Result := TDataClass(bndqry1.Connection);
end;


function TSearch_Frm.GetSearchData(TableName: String;WhereSql:String; fields,
  captions:array of Variant):Variant;
var
  i:integer;
  ResultData:array of Variant;
  msql:String;
begin
  if TableName = '' Then Exit;
  msql := 'Select * from '+ TableName + ' '+ WhereSql;
  Result := GetSearchData(msql,fields,captions);
end;


function TSearch_Frm.GetSearchData(msql: String; fields,
  captions: array of Variant): Variant;
var
  i:Integer;
  ResultData:array of Variant;
begin
  if msql = '' Then Exit;
  bndqry1.Close;
  bndqry1.SQL.Text := msql;
  bndqry1.Open;
  if Length(fields) > 0 Then
  begin
     for i := Low(fields) to  High(fields) do
     begin
        TcxGridDBColumn.Create((cxgrdbtblvwGrid1DBTableView1));
        with cxgrdbtblvwGrid1DBTableView1.Columns[cxgrdbtblvwGrid1DBTableView1.ColumnCount-1] do
        begin
          DataBinding.FieldName := fields[i];
          if High(captions) >= i Then
                caption := captions[i];
        end;
     end;
  end;
  SetLength(ResultData,High(fields) +1);
  if (ShowModal = mrok) and (not bndqry1.IsEmpty) Then 
  begin
    for i := Low(ResultData) to High(ResultData) do
    begin
      ResultData[i] := bndqry1.FieldByname(fields[i]).AsVariant;
    end;
  end;
  Result := ResultData;
end;

procedure TSearch_Frm.SetConnection(Value: TDataClass);
begin
  bndqry1.Connection := Value;
end;

end.
