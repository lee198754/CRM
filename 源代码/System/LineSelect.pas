unit LineSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ADODB, bainaADOQuery, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls;

type
  TFrm_HideSelect = class(TForm)
    LAdoHideSelect: TbainaADOQuery;
    LDSHideSelect: TDataSource;
    Query: TbainaADOQuery;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    GrdSelect: TcxGridDBTableView;
    GrdSelectColumn1: TcxGridDBColumn;
    GrdSelectColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    BtnExit: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_HideSelect: TFrm_HideSelect;

implementation

uses DataBase, Customer;

{$R *.dfm}

procedure TFrm_HideSelect.cxButton1Click(Sender: TObject);
Var
  I:Integer;
begin
    IF LAdoHideSelect.State In [DSEdit] Then LAdoHideSelect.Post;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('Select HSelectLine from HideSelect Where IFSelect=:IFSelect And HSelectTable=:HSelectTable And BelongID=:BelongID');
    Query.Parameters.ParamByName('IFSelect').Value:=Boolean(0);
    Query.Parameters.ParamByName('HSelectTable').Value:='Customer';
    Query.Parameters.ParamByName('BelongID').Value:=Databasemodule.dtclsData.UserID_;
    Query.Prepared;
    Query.Open;
    FOR I:=1 TO Query.RecordCount Do
      Begin
        Frm_CustManager.GrdCust.Columns[Query.FieldByName('HSelectLine').AsInteger].Visible:=False;
        Query.Next;
      End;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('Select HSelectLine from HideSelect Where IFSelect=:IFSelect And HSelectTable=:HSelectTable And BelongID=:BelongID');
    Query.Parameters.ParamByName('IFSelect').Value:=Boolean(1);
    Query.Parameters.ParamByName('HSelectTable').Value:='Customer';
    Query.Parameters.ParamByName('BelongID').Value:=Databasemodule.dtclsData.UserID_;
    Query.Prepared;
    Query.Open;
    FOR I:=1 TO Query.RecordCount Do
      Begin
        Frm_CustManager.GrdCust.Columns[Query.FieldByName('HSelectLine').AsInteger].Visible:=True;
        Query.Next;
      End;
    Query.Close;  
    BtnExit.Click;  
end;

procedure TFrm_HideSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TFrm_HideSelect.BtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrm_HideSelect.FormShow(Sender: TObject);
begin
  LAdoHideSelect.Close;
  LAdoHideSelect.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
  LAdoHideSelect.Open;
  IF LAdoHideSelect.IsEmpty Then
    Begin
      LAdoHideSelect.Close;
      LAdoHideSelect.SQL.Clear;
      LAdoHideSelect.SQL.Add('Delete From HideSelect Where BelongID=:CBelongID');
      LAdoHideSelect.SQL.Add('Select * Into Temp_ From HideSelect Where BelongID=:ABelongID');
      LAdoHideSelect.SQL.Add('Update Temp_ Set BelongID=:BBelongID');
      LAdoHideSelect.SQL.Add('Insert HideSelect Select HSelectTable,HSelectLine,IFSelect,LineCaption,BelongID From Temp_');
      LAdoHideSelect.SQL.Add('Drop Table Temp_');
      LAdoHideSelect.Parameters.ParamByName('ABelongID').Value:=1;
      LAdoHideSelect.Parameters.ParamByName('BBelongID').Value:=DatabaseModule.dtclsData.UserID_;
      LAdoHideSelect.Parameters.ParamByName('CBelongID').Value:=DatabaseModule.dtclsData.UserID_;
      LAdoHideSelect.Prepared;
      LAdoHideSelect.ExecSQL;

      LAdoHideSelect.Close;
      LAdoHideSelect.SQL.Clear;
      LAdoHideSelect.SQL.Add('Select HSelectTable,HSelectLine,IFSelect,LineCaption,BelongID From HideSelect Where BelongID=:BelongID');
      LAdoHideSelect.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
      LAdoHideSelect.Open;
    End;
end;

end.
