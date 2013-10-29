program Product;

uses
  Forms,
  ProdCode in 'ProdCode.pas' {Frm_Product};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Product, Frm_Product);
  Application.Run;
end.
