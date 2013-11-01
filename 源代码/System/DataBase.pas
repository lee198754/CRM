unit DataBase;

interface

uses
  SysUtils, Classes, DB, ADODB, DataClass, bainaADOQuery;


const
  c_ALLOWCOUNT = 50;

type
  TDataBaseModule = class(TDataModule)
    dtclsData: TDataClass;
    AdoUser: TbainaADOQuery;
    AdoQuery: TbainaADOQuery;
    AdoDict: TbainaADOQuery;
    AdoCust: TbainaADOQuery;
    AdoContact: TbainaADOQuery;
    AdoActive: TbainaADOQuery;
    AdoExpend: TbainaADOQuery;
    AdoSale: TbainaADOQuery;
    AdoContract: TbainaADOQuery;
    AdoPre: TbainaADOQuery;
    AdoFile: TbainaADOQuery;
    AdoWarn: TbainaADOQuery;
    AdoProd: TbainaADOQuery;
    ContractFile: TbainaADOQuery;
    CustFile: TbainaADOQuery;
    AdoPreService: TbainaADOQuery;
    AdoDay: TbainaADOQuery;
    AdoSaleList: TbainaADOQuery;
    AdoNote: TbainaADOQuery;
    AdoSelect: TbainaADOQuery;
    AdoShareSet: TbainaADOQuery;
    AdoSerProc: TbainaADOQuery;
    AdoShareCust: TbainaADOQuery;
    AdoSupply: TbainaADOQuery;
    Adodictother: TbainaADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function IsCheckAdd: Boolean;
  end;


var
  DataBaseModule: TDataBaseModule;

implementation

{$R *.dfm}

uses
  uCheckKey;
{ TDataBaseModule }
//--------------------lpj2013.09.13add------------------------------------
function TDataBaseModule.IsCheckAdd: Boolean;
var
  Query: TbainaADOQuery;
begin
  Result := False;
  Query := TbainaADOQuery.Create(Self);
  Query.Connection := dtclsData;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select Count(*)  Total From Customer ');
  Query.Open;
  if Assigned(Query) and (Query.FieldByName('Total').AsInteger >= c_ALLOWCOUNT) then
  Begin
    if not IsCheckKey then Exit;
  End;
  Query.Free;
  Result := True;
end;
//------------------------------------------------------------------------------

end.
