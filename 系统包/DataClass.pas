unit DataClass;

interface

uses
  SysUtils, Classes, DB, ADODB,IniFiles,Forms,math,Dialogs;
type
  {
    对哪个功能模块具有什么样的权限
    fRBrowser:Boolean;        //查看权限
    fRAdd:Boolean;            //新增权限
    fRDelete:Boolean;         //删除权限
    fREdit:boolean;           //修改权限
    fRPrint:boolean;          //列印权限
    fRCheck:Boolean;          //审核权限
    fRuncheck:Boolean;        //反审核权限
    fRPrice:Boolean;          //单价权限
    fRExportExcel:Boolean;    //导出权限
  }
  TAccRecord = class(TObject)
  private
    fRBrowser:Boolean;
    fRAdd:Boolean;
    fRDelete:Boolean;
    fREdit:boolean;
    fRPrint:boolean;
    fRCheck:Boolean;
    fRuncheck:Boolean;
    fRPrice:Boolean;
    fRExportExcel:Boolean;
  public
    constructor Create;
    property RBrowser:Boolean read fRBrowser  write fRBrowser;
    property RAdd:Boolean read fRAdd write fRAdd;
    property RDelete:Boolean read fRDelete write fRDelete;
    property REdit:boolean read fREdit write fREdit;
    property RPrint:boolean read fRPrint write fRPrint;
    property RCheck:Boolean read fRCheck write fRCheck;
    property Runcheck:Boolean read fRuncheck write fRuncheck;
    property RPrice:Boolean read fRPrice write fRPrice;
    property RExportExcel:Boolean read fRExportExcel write fRExportExcel;
  end;
  
  TModuleRecord = class(TCollectionItem)
  private
    {
      模块信息
      fModName_       模块名称
      fFromName_      窗体名称
      fParentModID_   父模块ID
      fifModule_      是否是模块
      fOrder_         排序
    }
    fModName_:String;
    fFromName_:String;
    fParentModID_:integer;
    fifModule_:Boolean;
    fOrder_:Integer;

    {
      权限信息
      fAcc_         权限值
      fRBrowser     查看权限
      fRAdd         新增权限
      fRDelete      删除权限
      fREdit        修改权限
      fRPrint       列印权限
      fRCheck       审核权限
      fRuncheck     反审核权限
      fRPrice       单价查看权限
    }
    fAcc_        :Integer ;
    fRBrowser    :Boolean;
    fRAdd        :Boolean;
    fRDelete     :Boolean;
    fREdit       :Boolean;
    fRPrint      :Boolean;
    fRCheck      :Boolean;
    fRuncheck    :Boolean;
    fRPrice      :Boolean;
  public
    property ModName_ :String read fModName_ write fModName_;
    property FromName_:String read fFromName_  write fFromName_;
    property ParentModID:integer read   fParentModID_ write fParentModID_;
    property ifModule_ :Boolean read fifModule_ write fifModule_;
    property Order_ :Integer read fOrder_ write fOrder_;

    property Acc_  :Integer read fAcc_  write fAcc_;
    Property RBrowser:Boolean read fRBrowser  write fRBrowser ;
    Property RAdd:Boolean read fRAdd write fRAdd;
    Property RDelete:Boolean read fRDelete write fRDelete;
    Property REdit:Boolean read fREdit write fREdit ;
    Property RPrint:Boolean read fRPrint write fRPrint;
    Property RCheck:Boolean read fRCheck write fRCheck;
    Property Runcheck:Boolean read fRuncheck write fRuncheck;
    Property RPrice:Boolean read fRPrice write fRPrice;
  end;

  TModuleAccess = class(TCollection)
  private
  public
    function  Add: TModuleRecord;
    function GetAccByFromName(frmname:String):TAccRecord;
    function AccByFromName(frmname:String):Integer;
  end;

  {
    用于处理所有数据库连接信息
  }
  TDataClass = class(TADOConnection)
  private
    {
    是否记录操作日志
    }
    fifWriteoperateLog:Boolean;
    {
      登录信息
      fUserID_    登录用户ID
      fUserCode_  登录用户编码
      fUserName_  登录用户名称
      fDeptID_    登录部门ID
      fAdminUser  系统默认超级用户名称
    }
    fUserID_:Integer;
    fUserCode_:String;
    fUserName_:String;
    fDeptID_:Integer;
    fAdminUser:String;

    {
      权限信息
    }
    fModuleAccess:TModuleAccess;

    {
      加密解密密匙
    }
    fKey:string;

    {
      用于查询或执行SQL语句
    }
    fQuery:array[0..9] of TADOQuery;
    fCurrQuery:Integer;

    {
      注册文件名称
    }
    finiFilename:String;

    {
      错误处理文件名称
      操作日志文件名称
    }
    fErrorLogFilename:String;
    foperateLogFieldname:String;

    {
      注册信息
      fCompanyName   注册公司名称
      fEndDate       软件到期日期
      fOnLineUserCount  允许在线用户数
    }
    fCompanyName:String;
    fEndDate:String;
    fOnLineUserCount:Integer;
    
  protected
    procedure DoConnect;override;
    
  public
    {
      根据窗体名称取出权限
    }
    function GetAccByFromName(frmname: String): TAccRecord;
    function AccByFromName(frmname: String): Integer;

    {
      执行SQL语句
    }
    function ExecSql(msql:String):Boolean;

    {
      数据库连接设置
    }
    function ConnectionSet:Boolean;

    {
      检测用户
    }
    function CheckUser(UserID:String;Pwd:String):Boolean;

    {
      查询
    }
    function Query(msql:String):TADOQUery;

    {
      写SQL语句错误日志
      写SQL操作日志
    }
    function WriteErrorLog(Info:String):boolean;
    function WriteoperateLog(Info:String):Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    {
      注册信息
    }
    property CompanyName:String read fCompanyName;
    property EndDate:String read fEndDate;
    property OnLineUserCount:integer read fOnLineUserCount;
  published
    property iniFilename:String read  finiFilename write finiFilename;
    property ifWriteoperateLog:Boolean read fifWriteoperateLog write fifWriteoperateLog default true;
    property ErrorLogFilename:String read fErrorLogFilename write fErrorLogFilename;

    {
      用户登录信息
    }
    property UserCode_ :string read fUserCode_;
    property UserName_ :String read fUserName_;
    property DeptID_  :Integer read fDeptID_;
    property UserID_  :Integer read fUserID_;
    property AdminUser:String read fAdminUser;
  end;

procedure Register;

implementation
uses
  AdoConEd,PublicClass;
procedure Register;
begin
  RegisterComponents('BaiNa', [TDataClass]);
end;

{ TDataClass }

function TDataClass.AccByFromName(frmname: String): Integer;
begin
  if Self.fUserCode_ = Self.fAdminUser Then
  begin
    Result := 255;
    Exit;
  end;
  Result := fModuleAccess.AccByFromName(frmname);
end;

function TDataClass.CheckUser(UserID, Pwd: String): Boolean;
var
  msql,pasword:string;
begin
  Result := False;
  if UserID = '' Then   exit;
  msql := 'Select * From Users_ Where UserCode_ = '''+Trim(UserID) + ''' and isEnable_=1';
  with Query(msql) do
  begin
    try
      if IsEmpty Then Exit;
      if FieldByname('password_').IsNull or
          (FieldByName('password_').AsString = '') Then
          pasword := ''
      else
          pasword :=  UncrypKey(FieldByname('password_').AsString,fKey);
      if pasword <> Pwd  Then Exit;
      //取得用户信息
      fUserID_ := FieldByName('UserID_').AsInteger;
      fUserCode_ := FieldByname('UserCode_').AsString;
      fUserName_ := FieldByname('UserName_').AsString;
      fDeptID_   := FieldByname('DeptID_').AsInteger;
      Result := True;
    finally
      close;
    end;
  end;

  //取得用户权限
  msql := 'Exec SelectAccess '+inttostr(fUserID_);
  with Query(msql) do
  begin
    try
      if IsEmpty Then exit;
      while not eof do
      begin
         with fModuleAccess.Add  do
         begin
            ModName_    := FieldByName('ModName_').AsString;
            FromName_   := FieldByname('FromName_').AsString;
            ParentModID := FieldByname('ParentModID').AsInteger;
            ifModule_   := FieldByName('ifModule_').AsBoolean;
            Order_      := FieldByName('Order_').AsInteger;
            Acc_        := FieldByName('Acc_').AsInteger;
            RBrowser    := FieldByName('RBrowser').AsBoolean;
            RAdd        := FieldByName('RAdd').AsBoolean;
            RDelete     := FieldByName('RDelete').AsBoolean;
            REdit       := FieldByName('REdit').AsBoolean;
            RPrint      := FieldByName('RPrint').AsBoolean;
            RCheck      := FieldByname('RCheck').AsBoolean;
            Runcheck    := FieldByname('Runcheck').AsBoolean;
            RPrice      := FieldByName('RPrice').AsBoolean;
         end;
         next;
      end;
    finally
    end;
  end;
end;

//连接设置
function TDataClass.ConnectionSet: Boolean;
var
  inifile:TIniFile;
begin
   if Self.Connected Then Self.Close;
   result := EditConnectionString(Self);
   if Result Then
   begin
     inifile := TIniFile.Create(PublicClass.ExePath+finiFilename);
     try
       inifile.WriteString('DataSet','ConnectionString',PublicClass.EncrypKey(Self.ConnectionString,FKey));
       inifile.UpdateFile;
     finally
       inifile.Destroy;
     end;
   end;
end;

constructor TDataClass.Create(AOwner: TComponent);
var
  i:integer;
  inifile:TIniFile;
  inifilename:String;
begin
  inherited Create(AOwner);
  for i := Low(fQuery) to High(fQuery) do
  begin
    fQuery[i] := TADOQuery.Create(nil);
    fQuery[i].Connection := Self;
  end;

  fModuleAccess := TModuleAccess.Create(TModuleRecord);
  finiFilename := 'dataSet.ini';
  fErrorLogFilename := 'Error.Log';
  fKey := 'Tushiqi';
  fAdminUser := 'Admin';

  //取注册文件
  //Showmessage(publicclass.ExePath);
 // inifilename := publicclass.ExePath + 'Crm.ini';
 { if not FileExists(inifilename) Then
  Begin
    Showmessage('安装目录下没有Crm.ini 注册文件,请与东莞协诚电脑科技联系!');
    Application.Terminate;
    Exit;
  End;  }
 { inifile := TIniFile.Create(inifilename);
  try
    fCompanyName  := UncrypKey(Inifile.ReadString('Option','CompanyName',''),fkey);
    fEndDate      := UncrypKey(Inifile.ReadString('Option','EndDate',''),fkey);
    fOnLineUserCount := StrToInt(UncrypKey(
      Inifile.ReadString('Option','UserCount',''),fkey));
  finally
    inifile.Free;
  end;

  //判断是否过期
  if  StrToDateTime(fEndDate) <=  Now Then
  Begin
    ShowMessage('软件已过期,请与东莞协诚电脑科技联系!');
    Application.Terminate;
    Exit;
  End; }
end;

destructor TDataClass.Destroy;
var
  i:integer;
begin
  for i := Low(fQuery) to High(fQuery) do
  begin
    fQuery[i].Destroy;
  end;
  inherited;
end;

procedure TDataClass.DoConnect;
var
  inifile:TIniFile;
  msql:String;
begin
  inifile := TIniFile.Create(PublicClass.ExePath+finiFilename);
  if Self.Connected Then Self.Close;
  try
    Self.ConnectionString := publicclass.UncrypKey(inifile.ReadString('DataSet','ConnectionString',''),FKey);
  finally
    inifile.Destroy;
  end;
  inherited;
  //判断是否有默认超级用户,如果没有,进行增加
  msql := 'if not exists(select * from Users_ where usercode_ = ''' +fAdminUser + ''')'+
        'insert into Users_(userCode_,UserName_,password_,isEnable_,IFSystem_) values('+
          ''''+fAdminUser+''',''超级用户'','''',1,1)';
  ExecSql(msql);
end;
//执行SQL语句
function TDataClass.ExecSql(msql: String): Boolean;
var
  i:integer;
begin
  result := False;
  if Trim(msql) = '' Then exit;
  for i := Low(fQuery) to High(fQuery) do
  begin
    if fCurrQuery >= High(fQuery) then
       fCurrQuery := 0
    else
       Inc(fCurrQuery);
    fQuery[fCurrQuery].SQL.Text := msql;
    try
      fQuery[fCurrQuery].ExecSQL;
    finally

    end;
  end;
end;

//查询资料
function TDataClass.GetAccByFromName(frmname: String): TAccRecord;
begin
  if Self.fUserCode_ = Self.fAdminUser Then
  begin
    Result := TAccRecord.Create;
    Result.RBrowser := True;
    Result.RAdd     := True;
    Result.RDelete  := True;
    Result.REdit    := True;
    Result.RPrint   := True;
    Result.RCheck   := True;
    Result.Runcheck := True;
    Result.RPrice   := True;
    Result.RExportExcel := True;
    Exit;
  End;
  Result := fModuleAccess.GetAccByFromName(frmname);
end;


function TDataClass.Query(msql: String): TADOQUery;
var
  i:integer;
begin
  if Trim(msql) = '' Then exit;
  for i := Low(fQuery) to High(fQuery) do
  begin
    if fCurrQuery >= High(fQuery) then
       fCurrQuery := 0
    else
       Inc(fCurrQuery);
    fQuery[fCurrQuery].SQL.Text := msql;
    try
      fQuery[fCurrQuery].Open;
      Result := fQuery[fCurrQuery];
    finally

    end;
  end;
end;

//写错误日志
function TDataClass.WriteErrorLog(Info: String): boolean;
var
  filename:String;
  f:Textfile;
begin
  result := false;
  filename := PublicClass.ExePath + FormatDateTime('YYYYMMDD',now);
  if not DirectoryExists(filename) Then
  begin
    CreateDir(filename);
  end;
  if fErrorLogFilename = '' Then
    filename := filename + '\'+'Error.Log'
  else
    filename := filename + fErrorLogFilename;
  AssignFile(f,filename);
  Info := 'Create By :'+UserName_ + ' Created Datetime:'+
     FormatDateTime('hh:ss',now) + #10#13+Info;
  if not FileExists(filename) Then Rewrite(f) else Append(f);
  try
    Writeln(f,Info);
  finally
    CloseFile(f);
  end;
end;

{ TModuleAccess }
//增加模块
function TModuleAccess.AccByFromName(frmname: String): Integer;
var
  i:integer;
begin
  Result := 0;
  for i := 0 To Self.Count -1 Do
  Begin
    if TModuleRecord(Self.Items[i]).fFromName_ =  frmname Then
    begin
      Result := TModuleRecord(Self.Items[i]).Acc_;
      Exit;
    end;
  End;
end;

function TModuleAccess.Add: TModuleRecord;
begin
   Result := TModuleRecord(inherited Add);
end;

//取得权限
function TModuleAccess.GetAccByFromName(frmname: String): TAccRecord;
var
  i:Integer;
  AccRecord:TAccRecord;
begin
  AccRecord := TAccRecord.Create;
  for i := 0 To Self.Count -1 Do
  begin
    if TModuleRecord(Self.Items[i]).fFromName_ =  frmname Then
    begin
        AccRecord.RBrowser  := TModuleRecord(Self.Items[i]).RBrowser or AccRecord.RBrowser;
        AccRecord.RAdd      := TModuleRecord(Self.Items[i]).RAdd or AccRecord.RAdd;
        AccReCord.RDelete   := TModuleRecord(Self.Items[i]).RDelete or AccRecord.RDelete;
        AccRecord.REdit     := TModuleRecord(Self.Items[i]).REdit or AccRecord.REdit;
        AccRecord.RPrint    := TModuleRecord(Self.Items[i]).RPrint or AccRecord.RPrint;
        AccRecord.RCheck    := TModuleRecord(Self.Items[i]).RCheck or AccRecord.RCheck;
        AccRecord.Runcheck  := TModuleRecord(Self.Items[i]).Runcheck or AccRecord.Runcheck;
        AccRecord.RExportExcel := TModuleRecord(Self.Items[i]).RPrint or AccRecord.RPrint;
    End;
  End;
  Result := AccRecord;
end;

function TDataClass.WriteoperateLog(Info: String): Boolean;
var
  filename:String;
  f:Textfile;
begin
  result := false;
  filename := PublicClass.ExePath + FormatDateTime('YYYYMMDD',now);
  if not DirectoryExists(filename) Then
  begin
    CreateDir(filename);
  end;
  if foperateLogFieldname = '' Then
    filename := filename + '\'+'operate.Log'
  else
    filename := filename + foperateLogFieldname;
  AssignFile(f,filename);
  Info := 'Create By :'+UserName_ + ' Created Datetime:'+
     FormatDateTime('hh:ss',now) + #10#13+Info;
  if not FileExists(filename) Then Rewrite(f) else Append(f);
  try
    Writeln(f,Info);
  finally
    CloseFile(f);
  end;
end;

{ TAccRecord }

constructor TAccRecord.Create;
begin
    inherited;
end;

end.
