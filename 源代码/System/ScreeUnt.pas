unit ScreeUnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls;

type
  TScreeFrm = class(TForm)
    pnl1: TPanel;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    ds1: TDataSource;
    cxgrdbclmnGrid1DBTableView1IndexID: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1CustomerID: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1CustomerName: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Telphone: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Fax: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1LinkMan: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1address: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Net: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1LocalNum: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1CallInNum: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1TelDataTime: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxgrdbtblvwGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScreeFrm: TScreeFrm;

implementation

uses MainFrm;
{$R *.dfm}

procedure TScreeFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ScreeFrm := nil ;
end;

procedure TScreeFrm.cxgrdbtblvwGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  s: String;
  hnd : HWND;
begin
  close ;
  s := Self.Caption;
  hnd := FindWindow(nil ,PChar('客户关系管理系统'));
  PostMessage( hnd, WM_LMZ, Integer(s), 0);
  Application.ProcessMessages;
end;

end.
