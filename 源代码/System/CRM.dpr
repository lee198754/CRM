program CRM;

uses
  Forms,
  SearchFrom in '..\系统包\SearchFrom.pas' {Search_Frm},
  bainaADOQuery in '..\系统包\bainaADOQuery.pas',
  BaseDataFrom in '..\系统包\BaseDataFrom.pas' {BaseData_Frm},
  BaseFrom in '..\系统包\BaseFrom.pas' {Base_Frm},
  DataClass in '..\系统包\DataClass.pas',
  FindDataFrom in '..\系统包\FindDataFrom.pas' {FindData_Frm},
  PublicClass in '..\系统包\PublicClass.pas',
  ReportFrom in '..\系统包\ReportFrom.pas' {Report_Frm},
  LoginFrm in 'System\LoginFrm.pas' {Login_Frm},
  MainFrm in 'System\MainFrm.pas' {Main_Frm},
  DataBase in 'System\DataBase.pas' {DataBaseModule: TDataModule},
  NewUser in 'System\NewUser.pas' {Frm_User},
  Dept in 'System\Dept.pas' {Frm_Dept},
  Password in 'System\Password.pas' {Frm_Password},
  AddUserGrp in 'System\AddUserGrp.pas' {Frm_UserGrpAdd},
  Right in 'System\Right.pas' {Frm_Right},
  Dict in 'System\Dict.pas' {Frm_Dict},
  Customer in 'System\Customer.pas' {Frm_CustManager},
  NewCust in 'System\NewCust.pas' {Frm_NewCust};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataBaseModule, DataBaseModule);
  Application.CreateForm(TMain_Frm, Main_Frm);
  Application.CreateForm(TFrm_NewCust, Frm_NewCust);
  Application.Run;
end.
