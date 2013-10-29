unit Warn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeels, dxBar, dxBarExtItems, ImgList,
  ActnList, XPMenu, ADODB, bainaADOQuery, Grids, cxContainer, cxLabel;

type
  TFrm_Warn = class(TBaseData_Frm)
    DSWarn: TDataSource;
    GrdWarn: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Warn: TFrm_Warn;

implementation

uses DataBase;

{$R *.dfm}

end.
