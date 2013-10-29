unit uCheckKey;

interface

uses
  SysUtils;



type
  TCheckKey = class
  private
    FAppName: string;
    FLoninKey: string;
    FAdminKey: string;
    Rtn: Integer;
    keyHandle:array [0..8] of Integer;
    number:Integer;
    FSecretKey: string;
    function p_OpenMacroDog: boolean;
    function p_WriteMacroDog(const s: string): boolean;
    function p_ReadMacroDog: string;
    //解密
    function p_DecryStr(const sIn: string): string;
    //加密
    function p_EncryStr(const sID, sPW: string): Boolean;
    //设置管理员密码
    procedure p_SetAdminPW(s: string);
    //写狗前，要验证
    function p_FindKey: boolean;
    //写狗前，先改下管理员密码(不是必须，加了别人就不能改内容了)；admin->abc123def
    function p_ChangePWD: boolean;
    //设置登录标识.返回登陆密码(不是必须，加了别人就不能改内容了)；原值->1234567890ABCDEF
    function p_SetLoginPWD: string;
    function p_VerifyPassword(const AsAppID,AsAdmin:string): Integer;
    function p_GetDefaultAdminKey: string;
    function p_GetDefaultLoginKey: string;
    property SecretKey: string read FSecretKey write FSecretKey;
    property AdminKey: string read FAdminKey write FAdminKey;
    property LoninKey: string read FLoninKey write FLoninKey;
    property AppName: string read FAppName write FAppName;
  public
    constructor Create(AAdminKey: String='';AAppName: string='';ALoginKey: String='');

  end;
  function IsCheckKey: Boolean;

implementation

uses
  NT119Mgr,iDESCrypt;


const
  c_DefaultAdminKey1: Char = 'a';
  c_DefaultAdminKey2: Char = 'd';
  c_DefaultAdminKey3: Char = 'm';
  c_DefaultAdminKey4: Char = 'i';
  c_DefaultAdminKey5: Char = 'n';

const
  c_DefaultLoginKey1: string = '12';
  c_DefaultLoginKey2: string = '34';
  c_DefaultLoginKey3: string = '56';
  c_DefaultLoginKey4: string = '78';
  c_DefaultLoginKey5: string = '90';
  c_DefaultLoginKey6: string = 'AB';
  c_DefaultLoginKey7: string = 'CD';
  c_DefaultLoginKey8: string = 'EF';

var
  //管理员密码默认为admin，可改成其他值
  g_edtntcode: string = 'admin';
  g_APPID: string='1234567890ABCDEF';
  CheckKey: TCheckKey;

function IsCheckKey: Boolean;
var
  sKey: string;
  nPos: integer;
  sID: string;
begin
  Result := False;
  if not Assigned(CheckKey) then
    CheckKey := TCheckKey.Create('abc123cc__');

  if not CheckKey.p_OpenMacroDog then
  begin
    //Application.MessageBox('未找到加密锁,请插入加密锁后，再进行操作。', '提示信息', MB_ICONINFORMATION);
    Exit;
  end;

  sKey := CheckKey.p_ReadMacroDog;
  sKey := CheckKey.p_DecryStr(sKey);

  nPos := Pos('|', sKey);
  if nPos < 1 then exit;
  sID := Copy(sKey, 1, nPos - 1);
  if sID = '23' then
  begin
    Result := True;
    Exit;
  end;
  sKey := Copy(sKey, nPos + 1, Length(sKey));

  nPos := Pos('|', sKey);
  if nPos < 1 then exit;
  //Edt_ShopCode.Text := Copy(sKey, 1, nPos - 1);
  //Edt_ShopName.Text := Copy(sKey, nPos + 1, Length(sKey));
  Result := True;
end;

{ TCheckKey }

constructor TCheckKey.Create(AAdminKey: String;AAppName: string;ALoginKey: String);
begin
  if AAdminKey='' then
    AdminKey := p_GetDefaultAdminKey
  else
    AdminKey := AAdminKey;
  if ALoginKey='' then
    LoninKey := p_GetDefaultLoginKey
  else
    LoninKey := ALoginKey;

  if AdminKey<>'' then
    SecretKey := AdminKey;

end;

function TCheckKey.p_ChangePWD: boolean;
var
  s, sKey: string;
begin
  Result := false;

  // ableragsoft
  sKey := AdminKey;
  Rtn := NT119Mgr.NTSetSuperPin(keyHandle[0], PChar(sKey));
  Result := Rtn = 0;
end;

function TCheckKey.p_DecryStr(const sIn: string): string;
var
  s, sDo: string;
  n, nV: integer;
function p_V(c: char): integer;
begin
  case Ord(c) of
    Ord('0'): Result := 0;
    Ord('1'): Result := 1;
    Ord('2'): Result := 2;
    Ord('3'): Result := 3;
    Ord('4'): Result := 4;
    Ord('5'): Result := 5;
    Ord('6'): Result := 6;
    Ord('7'): Result := 7;
    Ord('8'): Result := 8;
    Ord('9'): Result := 9;
    
    Ord('a'), Ord('A'): Result := 10;
    Ord('b'), Ord('B'): Result := 11;
    Ord('c'), Ord('C'): Result := 12;
    Ord('d'), Ord('D'): Result := 13;
    Ord('e'), Ord('E'): Result := 14;
    Ord('f'), Ord('F'): Result := 15;
  end;
end;
begin
  Result := '';
  if Length(sIn) < 1 then exit;
  if Length(sIn) mod 2 <> 0 then exit;
  sDo := '';
  n := 1;
  while n < Length(sIn) do
  begin
    nV := p_V(sIn[n]) * 16 + p_V(sIn[n + 1]);
    sDo := sDo + Chr(nV);
    Inc(n, 2);
  end;

  Result := Trim(DecryStr(sDo, SecretKey));
end;

function TCheckKey.p_EncryStr(const sID, sPW: string): Boolean;

  function p_GetNodeLicence_EncryStrHex(const sID, sPW: string): string;
  var
    s: string;
    n: integer;
  begin
    s := EncryStr(sID, sPW);
    Result := '';

    for n := 1 to Length(s) do
    begin
      Result := Result + Format('%.2x', [Ord(s[n])]);
    end;
  end;
var
  sCode, sName, s, sW, sError: string;
begin
  Result := False;
  if not p_OpenMacroDog then  Exit;
  if not p_FindKey() then exit;
  if not p_ChangePWD then exit;
  //if not p_SetLoginPWD then exit;

    sW := sID + '|' + sCode + '|' + sName;
    sW := p_GetNodeLicence_EncryStrHex(sW,SecretKey );
  Result := p_WriteMacroDog(sW);
end;

function TCheckKey.p_FindKey: boolean;
var
  s, sKey: string;
begin
  Result := False;

  // ableragsoft
  sKey := AdminKey;

  Rtn := NT119Mgr.NTFindAll(@keyHandle, @number);

  if Rtn <> 0 then
    Rtn := NT119Mgr.NTCheckSuperPin(keyHandle[0], PChar(sKey));
  if Rtn <> 0 then exit;

  Result := True;
end;

function TCheckKey.p_GetDefaultAdminKey: string;
begin
  Result := c_DefaultAdminKey1 + c_DefaultAdminKey2 + c_DefaultAdminKey3 + c_DefaultAdminKey4 + c_DefaultAdminKey5;
end;



function TCheckKey.p_GetDefaultLoginKey: string;
begin
  Result := c_DefaultLoginKey1 + c_DefaultLoginKey2 + c_DefaultLoginKey3 + c_DefaultLoginKey4 + c_DefaultLoginKey5
    +c_DefaultLoginKey6 + c_DefaultLoginKey7 + c_DefaultLoginKey8;
end;

function TCheckKey.p_OpenMacroDog: boolean;
begin
  Rtn:=NT119Mgr.NTFindAll(@keyHandle, @number);
  Result := Rtn = 0;
end;


function TCheckKey.p_ReadMacroDog: string;
var
  ReadAdd, ReadLen: Integer;
  PData: array [0..1024] of CHar;
  nL: word;
  sL: string;
  iHandle: Integer;
begin
  Result := '';
  if not p_OpenMacroDog then exit;
  iHandle := p_VerifyPassword(g_APPID,AdminKey);
  if iHandle=0 then exit;
  ReadAdd := 0;   //起始地址
  ReadLen := 2;   //长度  最大 1024
  FillChar(pData, sizeof(pData), 0);
  Rtn := NT119Mgr.NTRead(iHandle, ReadAdd, ReadLen, PData); //读取第一存储区数据，读取的数据放在PData中
  if Rtn <> 0 then exit;

  nL := 0;
  Move(pData[0], nL, 2);
  ReadAdd := 2;   //起始地址
  ReadLen := nL;   //长度  最大 1024
  FillChar(pData, sizeof(pData), 0);
  Rtn := NT119Mgr.NTRead(iHandle, ReadAdd, ReadLen, PData); //读取第一存储区数据，读取的数据放在PData中
  if Rtn = 0 then
    Result := PData;

end;


procedure TCheckKey.p_SetAdminPW(s: string);
begin
  g_edtntcode := s;
end;

function TCheckKey.p_SetLoginPWD: string;
var
  upin: array [0..32] of Char;
  sSeed: string;
begin
  Result := '';

  // 1234567890ABCDEF
  sSeed := '12';
  sSeed := sSeed + '34';
  sSeed := sSeed + '56';
  sSeed := sSeed + '78';
  sSeed := sSeed + '90';
  sSeed := sSeed + 'AB';
  sSeed := sSeed + 'CD';
  sSeed := sSeed + 'EF';

  Rtn := NT119Mgr.NTSetUserPin(keyHandle[0], PChar(SecretKey), PChar(sSeed), @upin);
  Result := upin;
end;

function TCheckKey.p_VerifyPassword(const AsAppID,AsAdmin:string): Integer;
var
  i: Integer;
  appid:array [0..32] of Char;
begin
  Result := 0;
  for i := 0 to number -1 do
  begin
    Rtn:= NT119Mgr.NTGetAppName(keyhandle[i],appid);
    if Rtn = 0 then
    begin
      if AsAppID = appid then
      begin
        Rtn := NT119Mgr.NTCheckSuperPin(keyHandle[i], PChar(AsAdmin));
        if Rtn=0 then
        begin
          Result := keyHandle[i];
          Break;
        end;
      end;

    end;
  end;
end;

function TCheckKey.p_WriteMacroDog(const s: string): boolean;
var
  WriteAdd, WriteLen: Integer;
  pData: array [0..1023] of Char;
  nL: word;
  sL: string;
  iHandle: integer;
begin
  Result := false;
  if not p_OpenMacroDog then exit;
  iHandle := p_VerifyPassword(g_APPID,g_edtntcode);
  if iHandle=0 then exit;

  WriteAdd := 0;  //起始地址
  WriteLen := 2;  //长度 最大 1024
  nL := Length(s);
  SetLength(sL, 2);
  Move(nL, sL[1], 2);
  StrCopy(pData, PChar(sL));
  Rtn := NT119Mgr.NTWrite(iHandle, WriteAdd, WriteLen, pData); //写入数据到第一存储区
  if Rtn <> 0 then exit;

  WriteAdd := 2;  //起始地址
  WriteLen := Length(s);  //长度 最大 1024
  StrCopy(pData, PChar(S));
  Rtn := NT119Mgr.NTWrite(iHandle, WriteAdd, WriteLen, pData); //写入数据到第一存储区
  if Rtn = 0 then
    Result := s = p_ReadMacroDog;
end;

end.








