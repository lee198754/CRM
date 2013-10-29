unit PublicClass;



interface


uses
  SysUtils, Classes,Forms, DB, cxTreeview, cxTextEdit, ComCtrls, Windows, Messages,Variants,
  Dialogs,Controls,ExtCtrls,IMECode;

const
  PNoAccess='你没有使用该功能的权限.';   
  PNoNetWork='请检查网络是否联通,数据库服务器是否开启.';
  XSCK='销售出库';
  XSTH='销售退货';
  XJTH='现金退货';
  THZYSK='退货转入预收款';
  CGJK='采购进库';
  CGTH='采购退货';
  THZYFK='退货转入预付款';
Var
  ISBrowse,ISAdd,ISEdit,ISCust,ISSaleManage,ISPurchaseManage:Boolean;
  PNActive,PNExpend,PNContract,PNProJect,PNFile,PNProd,DecDigit:Integer;
  
function   ExePath:String;
Function   EncrypKey   (Src:String;   Key:String):string;
Function   UncrypKey   (Src:String;   Key:String):string;
Function ShowMessage(Mes:String):Boolean;
Function ShowMessageA(Mes:String):Boolean;
Function TreeAddItem(Sender:TcxTreeview;ItemList:TStrings;BookMark:TBookMark;Resort:Boolean):TTreenode;
Function TreeFindItem(Sender:TcxTreeview;NodeItem:TTreenode;Name:String):TTreenode;
Function TreeGetItem(Sender:TcxTreeview;ItemList:TStrings):TTreenode;
Function MyRound(MyNumeric: real; DecDigit: Integer): real;
{
  设置登录界面图片
}
function SetLoginLogo(LoginImage:TImage):Boolean;
Function NtoC(n0 :real) :String;
Function GetPY(HZS:String):String;
Function CheckEditValue(Edt:TcxTextEdit):String;
Function CheckKeyPress(Key:Char):Char;
Function CheckEditEmpty(Edt:TcxTextEdit):String;
Function GetDH:String;
implementation


{ TPublicClass }
Function GetDH:String;
var
  Present: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  SMonth,SDay,SHour,SMin,SSec:String;
begin
  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  DecodeTime(Present, Hour, Min, Sec, MSec);
  IF Length(IntToStr(Month))=1 Then SMonth:='0'+ IntToStr(Month)
  Else SMonth:=IntToStr(Month);
  IF Length(IntToStr(Day))=1 Then SDay:='0'+ IntToStr(Day)
  Else SDay:=IntToStr(Day);
  IF Length(IntToStr(Hour))=1 Then SHour:='0'+ IntToStr(Hour)
  Else SHour:=IntToStr(Hour);
  IF Length(IntToStr(Min))=1 Then SMin:='0'+ IntToStr(Min)
  Else SMin:=IntToStr(Min);
  IF Length(IntToStr(Sec))=1 Then SSec:='0'+ IntToStr(Sec)
  Else SSec:=IntToStr(Sec);
  Result:=IntToStr(Year)+SMonth+SDay+'-'+ SHour+ SMin+ SSec;
end;

Function CheckKeyPress(Key:Char):Char;
Begin
  if (not (key in ['0'..'9','.',#8,#13,#26,#24,#3,#22]))   then
    Begin
      Key:=#0;
      MessageBeep(0);
    End;
  Result:=Key;    
End;
Function CheckEditValue(Edt:TcxTextEdit):String;
Begin
  IF Edt.Text='' Then Edt.Text:='0';
  Try
    StrToFloat(Edt.Text);
  Except
    ShowmessageA('请不要输入非法字符');
    Edt.Text:='0';
    //Raise;
  End;
End;
Function CheckEditEmpty(Edt:TcxTextEdit):String;
Begin
  IF Edt.Text='' then Edt.Text:='0';
End;
Function GetPY(HZS:String):String;
Begin
  Result:=AnsiLowerCase(MakeSpellCode(Hzs, 0, 50));
End;

Function NtoC(n0 :real) :String;
Function IIF(b :boolean; s1,s2:string):string; 
begin //本函数在VFP和VB中均为系统内部函数 
  if b then IIF:=s1 else IIF:=s2;
end;
Const c = '零壹贰叁肆伍陆柒捌玖◇分角圆拾佰仟万拾佰仟亿拾佰仟万';
var L,i,n, code :integer;
  Z :boolean;
  s, st,st1 :string;
begin
  s :=FormatFloat( '0.00', n0);
  L :=Length(s);
  Z :=n0<1;
  For i:= 1 To L-3 do
    begin
      Val(Copy(s, L-i-2, 1), n, code);
      st:=IIf((n=0)And(Z Or (i=9)Or(i=5)Or(i=1)), '', Copy(c, n*2+1, 2))
      + IIf((n=0)And((i<>9)And(i<>5)And(i<>1)Or Z And(i=1)),'',Copy(c,(i+13)*2-1,2))
      + st;
      Z := (n=0);
    end;
  Z := False;
  For i:= 1 To 2 do
    begin
      Val(Copy(s, L-i+1, 1), n, code);
      st1:= IIf((n=0)And((i=1)Or(i=2)And(Z Or (n0<1))), '', Copy(c, n*2+1, 2))
      + IIf((n>0), Copy(c,(i+11)*2-1, 2), IIf((i=2) Or Z, '', '整'))
      + st1;
      Z := (n=0);
    end;
  For i := 1 To Length(st) do If Copy(st, i, 4) = '亿万' Then Delete(st,i+2,2);
  NtoC := IIf( n0=0, '零圆整', st + st1);
End;

function SetLoginLogo(LoginImage:TImage):Boolean;
var
  logofilename:String;
begin
  Result := False;
  logofilename := ExePath + 'bmp\login.jpg';
  if not fileexists(logofilename) Then exit;
  LoginImage.Picture.LoadFromFile(logofilename);
  Result := True;
end;

Function ShowMessage(Mes:String):Boolean;
begin
  Result :=(Application.MessageBox(PAnsiChar(mes),'提示',MB_YESNO+MB_Iconwarning) = IDYes) ;
end;

Function ShowMessageA(Mes:String):Boolean;
Begin
  Result:=(Application.MessageBox(PAnsiChar(mes),'提示',MB_OK+MB_Iconwarning) = IDYes) ;
End;
//执行文件路径
function ExePath: String;
begin
  Result := ExtractFilePath(Application.ExeName);
  if Copy(Result,Length(Result),1) <> '\' Then
    Result := Result + '\';
end;

//加密函数
Function   EncrypKey   (Src:String;   Key:String):string;
var
  idx   :integer;   
  KeyLen   :Integer;   
  KeyPos   :Integer;   
  offset   :Integer;   
  dest   :string;   
  SrcPos   :Integer;   
  SrcAsc   :Integer;   
  TmpSrcAsc   :Integer;
  Range   :Integer;   
    
begin
  if Src = '' Then
  Begin
    Result := '';
    Exit;
  End;
  KeyLen:=Length(Key);   
  if   KeyLen   =   0   then   key:='Think   Space';   
  KeyPos:=0;   
  SrcPos:=0;   
  SrcAsc:=0;   
  Range:=256;   
    
  Randomize;   
  offset:=Random(Range);   
  dest:=format('%1.2x',[offset]);   
  for   SrcPos   :=   1   to   Length(Src)   do   
  begin   
    SrcAsc:=(Ord(Src[SrcPos])   +   offset)   MOD   255;
    if   KeyPos   <   KeyLen   then   KeyPos:=   KeyPos   +   1   else   KeyPos:=1;
    SrcAsc:=   SrcAsc   xor   Ord(Key[KeyPos]);
    dest:=dest   +   format('%1.2x',[SrcAsc]);
    offset:=SrcAsc;
  end;   
  Result:=Dest;
end;
    
//解密函数   
Function   UncrypKey   (Src:String;   Key:String):string;
  var   
  idx   :integer;   
  KeyLen   :Integer;   
  KeyPos   :Integer;   
  offset   :Integer;   
  dest   :string;   
  SrcPos   :Integer;   
  SrcAsc   :Integer;   
  TmpSrcAsc   :Integer;   
  Range   :Integer;   

begin
  if Src = '' Then 
  Begin
    Result := '';
    Exit;
  End;
  KeyLen:=Length(Key);   
  if   KeyLen   =   0   then   key:='Think   Space';   
  KeyPos:=0;   
  SrcPos:=0;   
  SrcAsc:=0;   
  Range:=256;   
  offset:=StrToInt('$'+   copy(src,1,2));   
  SrcPos:=3;   
  repeat   
  SrcAsc:=StrToInt('$'+   copy(src,SrcPos,2));   
  if   KeyPos   <   KeyLen   Then   KeyPos   :=   KeyPos   +   1   else   KeyPos   :=   1;   
  TmpSrcAsc   :=   SrcAsc   xor   Ord(Key[KeyPos]);   
  if   TmpSrcAsc   <=   offset   then   
  TmpSrcAsc   :=   255   +   TmpSrcAsc   -   offset   
  else   
  TmpSrcAsc   :=   TmpSrcAsc   -   offset;   
  dest   :=   dest   +   chr(TmpSrcAsc);   
  offset:=srcAsc;   
  SrcPos:=SrcPos   +   2;   
  until   SrcPos   >=   Length(Src);   
  Result:=Dest;   
end;

function TreeAddItem(Sender: TcxTreeview;
  ItemList: TStrings; BookMark: TBookMark; Resort: Boolean): TTreenode;
Var
  ThisNode,Node:TTreenode;
  I:Integer;
Begin
  Node:=Nil;
  FOR I:=0 TO ItemList.Count - 1 Do
    Begin
      ThisNode:=TreeFindItem(Sender,Node,ItemList[I]);
      IF ThisNode<>Nil Then Node:=ThisNode
      Else
        Begin
          IF I<ItemList.Count - 1 Then
            Begin
              IF I=0 Then Node:=Sender.Items.Add(Node,ItemList[I])
              Else Node:=Sender.Items.AddChild(Node,ItemList[I]);
            End
          Else
            Begin
              IF I=0 Then Node:=Sender.Items.Addobject(Node,ItemList[I],BookMark)
              Else Node:=Sender.Items.AddChildobject(Node,ItemList[I],BookMark)
            End;
          Node.StateIndex:=Node.Level+1;
          IF Resort And (Node.Parent<>Nil) Then Node.Parent.Alphasort;
        End;
    End;
  Result:=Node;
End;

function TreeFindItem(Sender: TcxTreeview;
  NodeItem: TTreenode; Name: String): TTreenode;
begin
  IF NodeItem=Nil Then NodeItem:=Sender.Items.GetFirstNode
  Else NodeItem:=NodeItem.GetFirstChild;

  IF (NodeItem<>Nil) And (NodeItem.Text<>Name) Then
    Repeat
      NodeItem:=NodeItem.GetNextSibling;
    Until(NodeItem=Nil) OR (NodeItem.Text=Name);
    Result:=NodeItem;
end;

function TreeGetItem(Sender: TcxTreeview;
  ItemList: TStrings): TTreenode;
begin
  Result:=TreeAddItem(Sender,ItemList,Nil,False);
end;

Function MyRound(MyNumeric: real; DecDigit: Integer): real;
Var
  I,M,DFront,DNext:Integer;
begin
  M:=0;
  FOR I:=1 TO Length(FloatToStr(MyNumeric)) DO
    Begin
      IF Copy(FloatToStr(MyNumeric),I,1)='.' Then
        Begin
          M:=I;
          Break;
        End;
    End;
  IF M=0 Then Result:=MyNumeric
  Else
    Begin
      IF DecDigit=0 Then
        Begin
          IF StrToInt(Copy(FloatToStr(MyNumeric),M+1,1))>=5 Then
            Result:=StrToFloat(Copy(FloatToStr(MyNumeric),1,M-1))+1
          Else Result:=StrToFloat(Copy(FloatToStr(MyNumeric),1,M-1));  
        End
      Else
        Begin
          DFront:=M;
          DNext:=Length(FloatToStr(MyNumeric))-M;
          IF DNext<=DecDigit Then Result:=MyNumeric
          Else
            Begin
              IF StrToInt(Copy(FloatToStr(MyNumeric),DFront+DecDigit+1,1))>=5 Then
                Result:=StrToFloat(Copy(FloatToStr(MyNumeric),1,DFront)+FloatToStr(StrToFloat(Copy(FloatToStr(MyNumeric),M+1,DecDigit))+1))
              Else
                Result:=StrToFloat(Copy(FloatToStr(MyNumeric),1,DFront+DecDigit));
            End;
        End;
    End;
end;

end.
