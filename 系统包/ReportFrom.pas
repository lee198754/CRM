unit ReportFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, cxPC, cxControls, cxContainer, cxEdit, cxGroupBox,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ADODB, bainaADOQuery,
  frxClass,ExtCtrls, cxTextEdit, cxDBEdit, frxDesgn, frxDBSet, frxChBox,
  frxCross, frxRich, frxOLE, frxBarcode, frxChart, frxDBXComponents,
  frxIBXComponents, XPMenu, cxLookAndFeels, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TReport_Frm = class(TBase_Frm)
    cxpgcntrl1: TcxPageControl;
    cxtbsht1: TcxTabSheet;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    bndqryRepDataSet: TbainaADOQuery;
    strngfldbndqry1RpName: TStringField;
    dsReport: TDataSource;
    cxgrdbclmnGrid1DBTableView1RpName: TcxGridDBColumn;
    strngfldRepDataSetModuName: TStringField;
    blbfldRepDataSetRpData: TBlobField;
    frxrprtReport: TfrxReport;
    cxgrpbx2: TcxGroupBox;
    btn1: TcxButton;
    btn2: TcxButton;
    btn4: TcxButton;
    btn5: TcxButton;
    cxdbtxtdt1: TcxDBTextEdit;
    frxdsgnr1: TfrxDesigner;
    frxchrtbjct1: TfrxChartObject;
    frxbrcdbjct1: TfrxBarCodeObject;
    frxlbjct1: TfrxOLEObject;
    frxrchbjct1: TfrxRichObject;
    frxcrsbjct1: TfrxCrossObject;
    frxchckbxbjct1: TfrxCheckBoxObject;
    frxbxcmpnts1: TfrxIBXComponents;
    frxdbxcmpnts1: TfrxDBXComponents;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset4: TfrxDBDataset;
    frxDBDataset5: TfrxDBDataset;
    frxDBDataset6: TfrxDBDataset;
    frxDBDataset7: TfrxDBDataset;
    frxDBDataset8: TfrxDBDataset;
    frxDBDataset9: TfrxDBDataset;
    frxDBDataset10: TfrxDBDataset;
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fFormName: String;
    function AddReportVariable:Boolean;
  public
    constructor Create(AOwner: TComponent;
        Connection:TADOConnection;dataSets:Array of TbainaADOQuery);
    destructor Destroy;override;
    function ShowReport(Repname:String):Boolean;
    
  end;

var
  Report_Frm: TReport_Frm;

implementation

{$R *.dfm}

{ TReport_Frm }
uses
  DataClass;
constructor TReport_Frm.Create(AOwner: TComponent;
    Connection: TADOConnection;dataSets:Array of TbainaADOQuery);
var
  msql:String;
  i:Integer;
begin
  if AOwner = nil Then Exit;
  inherited Create(AOwner);
  msql := 'Select * from Report Where ModuName = '''+ AOwner.ClassName +'''';
  bndqryRepDataSet.Connection := Connection;
  bndqryRepDataSet.Close;
  bndqryRepDataSet.SQL.Text := msql;
  bndqryRepDataSet.Open;
  fFormName :=  AOwner.ClassName;
  for i := 0 To frxrprtReport.DataSets.Count -1 do
  Begin
    frxrprtReport.DataSets.Items[i].Free;
  End;
  frxDBDataset1.Enabled := False;
  frxDBDataset2.Enabled := False;
  frxDBDataset3.Enabled := False;
  frxDBDataset4.Enabled := False;
  frxDBDataset5.Enabled := False;
  frxDBDataset6.Enabled := False;
  frxDBDataset7.Enabled := False;
  frxDBDataset8.Enabled := False;
  frxDBDataset9.Enabled := False;
  frxDBDataset10.Enabled := False;
  for i := 0 To high(dataSets) Do
  Begin
    case i of
      0:
        begin
          frxDBDataset1.DataSet := dataSets[i];
          frxDBDataset1.Enabled := True;
        end;
      1:
        begin
          frxDBDataset2.DataSet := dataSets[i];
          frxDBDataset2.Enabled := True;
        end;
      2:
        begin
          frxDBDataset3.DataSet := dataSets[i];
          frxDBDataset3.Enabled := True;
        end;
      3:
        begin
          frxDBDataset4.DataSet := dataSets[i];
          frxDBDataset4.Enabled := True;
        end;
      4:
        begin
          frxDBDataset5.DataSet := dataSets[i];
          frxDBDataset5.Enabled := True;
        end;
      5:
        begin
          frxDBDataset6.DataSet := dataSets[i];
          frxDBDataset6.Enabled := True;
        end;
      6:
        begin
          frxDBDataset7.DataSet := dataSets[i];
          frxDBDataset7.Enabled := True;
        end;
      7:
        begin
          frxDBDataset8.DataSet := dataSets[i];
          frxDBDataset8.Enabled := True;
        end;
      8:
        begin
          frxDBDataset9.DataSet := dataSets[i];
          frxDBDataset9.Enabled := True;
        end;
      9:
        begin
          frxDBDataset10.DataSet := dataSets[i];
          frxDBDataset10.Enabled := True;
        end;
    end;
  End;

  
end;

procedure TReport_Frm.btn5Click(Sender: TObject);
begin
  inherited;
  if not (bndqryRepDataSet.State in [dsinsert,dsedit]) Then Exit;
  bndqryRepDataSet.FieldByName('ModuName').AsString := fFormName;
  bndqryRepDataSet.Post;
end;

procedure TReport_Frm.btn1Click(Sender: TObject);
begin
  inherited;
  if bndqryRepDataSet.State in [dsinsert,dsedit] Then Exit;
  bndqryRepDataSet.Insert;
  
end;

procedure TReport_Frm.btn2Click(Sender: TObject);
begin
  inherited;
  bndqryRepDataSet.Delete;
end;

procedure TReport_Frm.btn4Click(Sender: TObject);
var
  Stream:TStream;
begin
  inherited;
  if bndqryRepDataSet.IsEmpty Then Exit;
  frxrprtReport.Clear;
  //读取报表
  if Not bndqryRepDataSet.FieldByName('RpData').IsNull Then
  Begin
    Stream := bndqryRepDataSet.CreateBlobStream(
      bndqryRepDataSet.FieldByName('RpData'),
      bmRead);
    Stream.Position := 0;
    frxrprtReport.LoadFromStream(Stream);
  End;
  AddReportVariable;
  frxrprtReport.DesignReport();

  //保存报表
  if not (bndqryRepDataSet.State in [dsinsert,dsedit]) Then
     bndqryRepDataSet.Edit;
  Stream := TMemoryStream.Create;
  Stream.Position := 0;
  frxrprtReport.SaveToStream(Stream);
  if Stream <> nil Then
  begin
    TBlobField(bndqryRepDataSet.FieldByName('RpData'))
      .LoadFromStream(Stream);
    bndqryRepDataSet.Post;
  end else
  begin
    bndqryRepDataSet.Cancel;
  end;
end;

function TReport_Frm.ShowReport(Repname: String): Boolean;
var
  Stream:TStream;
  i:integer;
begin
  frxrprtReport.Clear;
  //for i := 0 To frxrprtReport.DataSets.Count -1 Do
  if bndqryRepDataSet.Locate('RpName',Repname,[]) Then
  Begin
     //读取报表
    if Not bndqryRepDataSet.FieldByName('RpData').IsNull Then
    Begin
      Stream := bndqryRepDataSet.CreateBlobStream(
        bndqryRepDataSet.FieldByName('RpData'),bmRead);
      Stream.Position := 0;
      frxrprtReport.LoadFromStream(Stream);
      frxrprtReport.ShowReport();
    End;
  End;
end;

destructor TReport_Frm.Destroy;
begin
  inherited;
end;

procedure TReport_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

function TReport_Frm.AddReportVariable: Boolean;
  function ExistsVariable(varname:String):Boolean;
  var
    i:integer;
  begin
    Result := False;
    for i:= 0 To frxrprtReport.Variables.Count -1 Do
    Begin
      if varname = frxrprtReport.Variables.Items[i].Name Then
      Begin
        Result := True;
        Exit;
      End;
    End;
  end;

  function AddReportVariable(pname,pValue:String):Boolean;
  Begin
      if Not ExistsVariable(pname) Then
      Begin
        with frxrprtReport.Variables.Add do
        Begin
          name := pname;
          Value := #39+pValue+#39;
        End;
      end;
  End;
begin
  AddReportVariable('公司名称',TDataClass(bndqryRepDataSet.Connection).CompanyName);
  AddReportVariable('登录用户名',TDataClass(bndqryRepDataSet.Connection).UserName_);
  AddReportVariable('登录用户编码',TDataClass(bndqryRepDataSet.Connection).UserCode_);
end;

end.
