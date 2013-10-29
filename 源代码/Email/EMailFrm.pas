unit EMailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls, StdCtrls, ImgList,
  ToolWin, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdPOP3,FileCtrl, Menus,shellapi, IdSMTP,
  IdAntiFreezeBase, IdAntiFreeze, bainaADOQuery,DataBase, BaseFrom,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, OleCtrls, SHDocVw,
  Mail2000, Buttons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;


type
  TEMail_Frm = class(TBase_Frm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    dsMaster: TDataSource;
    qryMaster: TbainaADOQuery;
    Splitter2: TSplitter;
    Panel4: TPanel;
    lv: TListView;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ImageList2: TImageList;
    tv: TTreeView;
    qryDetail: TbainaADOQuery;
    qryEml_set: TbainaADOQuery;
    il3: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ToolButton11: TToolButton;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    IdMessage1: TIdMessage;
    IdPOP31: TIdPOP3;
    IdSMTP1: TIdSMTP;
    bndqry1: TbainaADOQuery;
    btn1: TToolButton;
    webbrowser: TWebBrowser;
    memo: TcxMemo;
    POP3: TPOP2000;
    msg: TMailMessage2000;
    procedure FormCreate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure tvClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure qryMasterAfterScroll(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    procedure SendTo;
    procedure ShowEml;
    function ExecSql(sql: string): boolean;
    Function ConnectPop3Server:Boolean;
    Procedure DownLoadEmail(UIDNo:Integer);
  public
    { Public declarations }
  end;

var
  EMail_Frm: TEMail_Frm;
  const   cBase64:string='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
  Function   GetMailTitle(Const   Value:   String):   String;
  Function   GetMailSender(Const   value:   String):String;

implementation

uses NewMailFrm, ProgressFrm,EMailSet,DataClass;

{$R *.dfm}


Function   QuotedPrintableEncode(mSource:   String):   String;   
Var   
  I,   J:   Integer;   
Begin   
  Result   :=   '';   
  J   :=   0;   
  For   I   :=   1   To   Length(mSource)   Do   Begin   
          If   mSource[I]   In   [#32..#127,   #13,   #10]   -   ['=']   Then   Begin   
                  Result   :=   Result   +   mSource[I];   
                  Inc(J);   
              End   Else   Begin   
                  Result   :=   Result   +   '='   +   IntToHex(Ord(mSource[I]),   2);   
                  Inc(J,   3);   
              End;   
          If   mSource[I]   In   [#13,   #10]   Then   J   :=   0;   
          If   J   >=   70   Then   Begin   
                  Result   :=   Result   +   #13#10;   
                  J   :=   0;   
              End;   
      End;   
End;   {   QuotedPrintableEncode   }   
    
Function   QuotedPrintableDecode(mCode:   String):   String;   
Var   
  I,   J,   L:   Integer;   
Begin   
  Result   :=   '';   
  J   :=   0;   
  mCode   :=   AdjustLineBreaks(mCode);   
  L   :=   Length(mCode);   
  I   :=   1;   
  While   I   <=   L   Do   Begin   
          If   mCode[I]   =   '='   Then   Begin   
                  Result   :=   Result   +   Chr(StrToIntDef('$'   +   Copy(mCode,   I   +   1,   2),   0));   
                  Inc(J,   3);   
                  Inc(I,   3);   
              End   Else   If   mCode[I]   In   [#13,   #10]   Then   Begin   
                  If   J   <   70   Then   Result   :=   Result   +   mCode[I];   
                  If   mCode[I]   =   #10   Then   J   :=   0;   
                  Inc(I);   
              End   Else   Begin   
                  Result   :=   Result   +   mCode[I];   
                  Inc(J);   
                  Inc(I);   
              End;   
      End;   
End;   {   QuotedPrintableDecode   }   
    
Function   Base64Encode(mSource:   String;   mAddLine:   Boolean   =   True):   String;   
Var   
  I,   J:   Integer;   
  S:   String;   
Begin   
  Result   :=   '';   
  J   :=   0;   
  For   I   :=   0   To   Length(mSource)   Div   3   -   1   Do   Begin   
          S   :=   Copy(mSource,   I   *   3   +   1,   3);   
          Result   :=   Result   +   cBase64[Ord(S[1])   Shr   2   +   1];   
          Result   :=   Result   +   cBase64[((Ord(S[1])   And   $03)   Shl   4)   +   (Ord(S[2])   Shr   4)   +   1];   
          Result   :=   Result   +   cBase64[((Ord(S[2])   And   $0F)   Shl   2)   +   (Ord(S[3])   Shr   6)   +   1];   
          Result   :=   Result   +   cBase64[Ord(S[3])   And   $3F   +   1];   
          If   mAddLine   Then   Begin   
                  Inc(J,   4);   
                  If   J   >=   76   Then   Begin   
                          Result   :=   Result   +   #13#10;   
                          J   :=   0;   
                      End;   
              End;   
      End;   
  I   :=   Length(mSource)   Div   3;   
  S   :=   Copy(mSource,   I   *   3   +   1,   3);   
  Case   Length(S)   Of   
      1:   Begin   
              Result   :=   Result   +   cBase64[Ord(S[1])   Shr   2   +   1];   
              Result   :=   Result   +   cBase64[(Ord(S[1])   And   $03)   Shl   4   +   1];   
              Result   :=   Result   +   cBase64[65];   
              Result   :=   Result   +   cBase64[65];   
          End;   
      2:   Begin   
              Result   :=   Result   +   cBase64[Ord(S[1])   Shr   2   +   1];   
              Result   :=   Result   +   cBase64[((Ord(S[1])   And   $03)   Shl   4)   +   (Ord(S[2])   Shr   4)   +   1];   
              Result   :=   Result   +   cBase64[(Ord(S[2])   And   $0F)   Shl   2   +   1];   
              Result   :=   Result   +   cBase64[65];   
          End;   
  End;   
End;   {   Base64Encode   }   
    
Function   Base64Decode(mCode:   String):   String;   
Var   
  I,   L:   Integer;   
  S:   String;   
Begin   
  Result   :=   '';   
  L   :=   Length(mCode);   
  I   :=   1;   
  While   I   <=   L   Do   Begin   
          If   Pos(mCode[I],   cBase64)   >   0   Then   Begin   
                  S   :=   Copy(mCode,   I,   4);   
                  If   (Length(S)   =   4)   Then   Begin   
                          Result   :=   Result   +   Chr((Pos(S[1],   cBase64)   -   1)   Shl   2   +   
                              (Pos(S[2],   cBase64)   -   1)   Shr   4);   
                          If   S[3]   <>   cBase64[65]   Then   Begin   
                                  Result   :=   Result   +   Chr(((Pos(S[2],   cBase64)   -   1)   And   $0F)   Shl   4   +   
                                      (Pos(S[3],   cBase64)   -   1)   Shr   2);   
                                  If   S[4]   <>   cBase64[65]   Then   
                                      Result   :=   Result   +   Chr(((Pos(S[3],   cBase64)   -   1)   And   $03)   Shl   6   +   
                                          (Pos(S[4],   cBase64)   -   1));   
                              End;   
                      End;   
                  Inc(I,   4);   
              End   Else   Inc(I);   
      End;   
End;   {   Base64Decode   }   
    
Function   GetMailTitle(Const   Value:   String):   String;   
Var   
  iPos:   integer;   
Begin   
  Result   :=   Value;   
  If   Copy(Value,   1,   2)   <>   '=?'   Then   
      Begin   
          Result   :=   Value;   
          exit;   
      End;   
  //'?B?'前面的都要去掉   
  iPos   :=   Pos('?B?',   Value);   
  If   iPos   =   0   Then   
      Begin   
          iPos   :=   Pos('?Q?',   Value);   
          If   iPos   =   0   Then   
              Begin   
                  Result   :=   Value;   
                  exit;   
              End;   
          Inc(iPos,   3);   
  //最后的'?='也要去掉   
          Result   :=   Copy(Value,   iPos,   Length(Value)   -   iPos   -   1);   
          Result   :=   QuotedPrintableDecode(Result);   
      End   
  Else   
      Begin   
          Inc(iPos,   3);   
  //最后的'?='也要去掉   
          Result   :=   Copy(Value,   iPos,   Length(Value)   -   iPos   -   1);   
          Result   :=   Base64Decode(Result);   
      End;   
    
End;   
//由于发件人是中文+'<mail@mailServer.com>'，组成的，所以多加了这个函数！   
Function   GetMailSender(Const   value:   String):String;   
var   
  iPos:integer;   
  preStr:String;   
  bkStr:String;   
begin   
  Result:=   value;   
  If   Copy(Value,   1,   2)   <>   '=?'   Then   
      Begin   
          Result   :=   Value;   
          exit;   
      End;   
  iPos   :=   Pos('?=   <',   Value);   
  if   iPos=0   then   
      begin   
          Result   :=   Value;   
          exit;   
      end   
  else   
      begin   
          preStr:=Copy(Value,1,iPos+1);   
          bkStr:=Copy(Value,iPos+2,length(Value)-iPos+2);   
          Result:=   GetMailTitle(preStr)+   bkStr;   
      end;   
end;   

procedure TEMail_Frm.FormCreate(Sender: TObject);
begin
  tv.Items[0].Expanded:=true;
  qryMaster.Close;
  qryMaster.Parameters.ParamByName('Type').Value:='收件箱';
  QryMaster.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
  qryMaster.Open;
  qryDetail.Close;
  qryDetail.Open;
  qryEml_set.Close;
  qryEml_set.SQL.Text:='Select * from Eml_set where BelongID='''+
      IntToStr(TDataClass(qryEml_set.Connection).UserID_)+'''';
  qryEml_set.Open;
  if not qryEml_set.IsEmpty then
    tv.Items.Item[0].Text:=qryEml_set.fieldbyName('Username').AsString;
  tv.Items.Item[1].Selected:=true;
  tv.OnClick(tv);
  tv.Items.Item[0].Selected:=true;
end;

procedure TEMail_Frm.ToolButton3Click(Sender: TObject);
begin
  
  tv.Items.Item[2].Selected:=true;
  tv.OnClick(tv);
  qryMaster.Append;
  NewMail_Frm:=TNewMail_Frm.Create(nil);
  NewMail_Frm.ISNewMail:=True;
  NewMail_Frm.ISReplyMail:=False;
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;
  if NewMail_Frm.ShowModal=mrOK then
  begin
    SendTo;
  end
  else
  begin
    if qryMaster.State in [dsInsert,dsEdit] then
      qryMaster.Cancel;
  end;

end;

procedure TEMail_Frm.ToolButton6Click(Sender: TObject);
var emlid: integer;
begin
  if tv.Selected=nil then exit;
  if qryMaster.IsEmpty then exit;

  if tv.Selected.Text ='已删除邮件' then
  begin
    qryDetail.First;
    while not qryDetail.Eof do
      qryDetail.Delete;
    qryDetail.UpdateBatch(arAll);
    qryMaster.Delete;
    tv.OnClick(tv);
  end
  else
  begin
    emlid:=qryMaster.FieldByName('Eml_ID').AsInteger;
    qryMaster.Locate('Eml_ID',emlid,[]);
    if not (qryMaster.State in [dsInsert,dsEdit]) then
      qryMaster.Edit;
    qryMaster.FieldByName('Type').AsString:='已删除邮件';
    qryMaster.Post;
    tv.OnClick(tv);
  end ;
end;

procedure TEMail_Frm.tvClick(Sender: TObject);
begin
  if tv.Selected=nil then exit;
  Memo.Clear;
  lv.Clear;

  if tv.Selected.Text='收件箱' then
  begin
    qryMaster.Close;
    qryMaster.Parameters.ParamByName('Type').Value:='收件箱';
    QryMaster.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    qryMaster.Open;
  end
  else if tv.Selected.Text ='发件箱' then
  begin
    qryMaster.Close;
    qryMaster.Parameters.ParamByName('Type').Value:='发件箱';
    QryMaster.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    qryMaster.Open;
  end
  else if tv.Selected.Text ='已发送邮件' then
  begin
    qryMaster.Close;
    qryMaster.Parameters.ParamByName('Type').Value:='已发送邮件';
    QryMaster.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    qryMaster.Open;
  end
  else if tv.Selected.Text ='已删除邮件' then
  begin
    qryMaster.Close;
    qryMaster.Parameters.ParamByName('Type').Value:='已删除邮件';
    QryMaster.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
    qryMaster.Open;
  end;
end;

procedure TEMail_Frm.ToolButton4Click(Sender: TObject);
begin
  
  NewMail_Frm:=TNewMail_Frm.Create(nil);
  NewMail_Frm.ISNewMail:=False;
  NewMail_Frm.ISReplyMail:=True;
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;
  ShowEml;
  NewMail_Frm.ToolButton4.Click;
  if NewMail_Frm.ShowModal=mrOK then
  begin
    SendTo;
    tv.Items.Item[2].Selected:=true;
  end
  else
  begin
    if qryMaster.State in [dsInsert,dsEdit] then
      qryMaster.Cancel;
  end;
end;

procedure TEMail_Frm.qryMasterAfterScroll(DataSet: TDataSet);
var ListItem: TListItem;
begin
  {Memo.Clear;
  lv.Clear;
  if qryDetail.Active=False then
    Exit;
  qryDetail.Close;
  qryDetail.Parameters.ParamByName('Eml_ID').Value:=qryMaster.fieldByName('Eml_ID').AsInteger;
  qryDetail.Open;
  qryDetail.First;
  if not qryMaster.FieldByName('Eml_TextPlain').IsNull then
      Memo.Lines.Add(qryMaster.FieldByName('Eml_TextPlain').AsString);
  while not qryDetail.Eof do
  begin

    if not qryDetail.FieldByName('Eml_FileName').IsNull then
    begin
      ListItem := lv.Items.Add;
      Listitem.Caption := qryDetail.FieldByName('Eml_FileName').AsString;
      Listitem.ImageIndex:=0;
    end;
    qryDetail.Next;
  end;}

end;
procedure TEMail_Frm.ToolButton1Click(Sender: TObject);
var ListItem: TListItem;
  mailcount,mcount,iNo,I,M,DownMail,NMailCount : integer;
  UIDLID:String;
  Result:Boolean;
  qry: TbainaADOQuery;
begin
   Try
     //连接邮件服务器并下载新邮件
     NMailCount:=0;
     DownMail:=0;
     IF ConnectPop3Server Then
       Begin
         Progress_Frm:=TProgress_Frm.Create(nil);
         Progress_Frm.ProgressBar1.Max:=Pop3.SessionMessageCount;

         Progress_Frm.Label1.Caption:=Email_Frm.qryEml_set.fieldbyname('EMail').AsString;
         Progress_Frm.Label2.Caption:='正在连接服务器...';
         Progress_Frm.Show;
         Progress_Frm.Update;
         qry:=TbainaADOQuery.Create(nil);
         qry.Connection:=DataBase.DataBaseModule.dtclsData;
         qry.Close;
         qry.SQL.Text:='Select UIDL from Eml_UIDL  where Email='+QuotedStr(qryEml_set.fieldbyname('EMail').AsString);
         qry.Open;
         MailCount:=pop3.SessionMessageCount;
         FOR M:=1 TO MailCount Do
           Begin
             IF Not qry.Locate('UIDL',Pop3.GetUIDL(M),[]) Then
               NMailCount:=NMailCount+1;
           End;
         FOR I:=1 TO MailCount Do
           Begin
             //if Result then
                begin
                  UIDLID:=Pop3.GetUIDL(I);
                  //检测该UIDLID是否存在
                  IF Not qry.Locate('UIDL',UIDLID,[]) Then
                    Begin
                      DownMail:=DownMail+1;
                      Progress_Frm.Label2.Caption:='新邮件数为:'+inttostr(Nmailcount)+'封,正在收取第'+inttostr(DownMail)+'封邮件.';
                      Progress_Frm.ProgressBar1.Position:=Progress_frm.ProgressBar1.Position+1;
                     
                      Progress_Frm.Update;
                      Result := POP3.RetrieveMessage(I);
                      if Msg.NeedFindParts then
                        Begin
                          Msg.FindParts;
                        End;
                      if Msg.NeedNormalize then
                        Begin
                          Msg.Normalize;
                        End;

                      if Msg.NeedRebuild then
                        Begin
                          Msg.RebuildBody;
                        End;
                      DownLoadEmail(I);
                    End;
                end;
              {else
                begin
                  Application.MessageBox('接收失败......','提示',MB_OK+MB_Iconinformation);
                  Exit;
                end;}
           End;
       End
     Else
       Exit;
   Finally
     //下载完成并断开邮件服务器
     if POP3.Quit then
       begin
         qry.Close;
         Progress_Frm.Update;
         Progress_Frm.close;
         Application.MessageBox('下载完成......','提示',MB_OK+MB_Iconinformation);
       end
     else
       begin
         POP3.Abort;
       end;
   End;

  {try
    IdPOP31.Host := qryEml_set.fieldbyname('POP3').AsString;
    IdPOP31.Username := qryEml_set.fieldbyname('Username').AsString;
    IdPOP31.Password := qryEml_set.fieldbyname('Pwd').AsString;
    IdPOP31.Port := Email_Frm.qryEml_set.fieldbyname('Pop3_port').AsInteger;

    Progress_Frm:=TProgress_Frm.Create(nil);
    Progress_Frm.Label1.Caption:=Email_Frm.qryEml_set.fieldbyname('EMail').AsString;
    Progress_Frm.Label2.Caption:='正在连接服务器...';
    Progress_Frm.Show;
    Progress_Frm.Update;

    if not IdPOP31.Connected then
      IdPOP31.Connect(); //连接到POP3服务器
    UIDL:=TStringList.Create;
    IdPOP31.UIDL(UIDL, -1);
    qry:=TbainaADOQuery.Create(nil);
    qry.Connection:=DataBase.DataBaseModule.dtclsData;
    qry.Close;
    qry.SQL.Text:='Select UIDL from Eml_UIDL  where Email='+QuotedStr(qryEml_set.fieldbyname('EMail').AsString);
    qry.Open;
    mcount:=0;
    for i:=0 to UIDL.Count -1 do
    begin
      UIDLID:=copy(UIDL[i],pos(' ',UIDL[i])+1,length(UIDL[i])-pos(' ',UIDL[i]));
      if qry.Locate('UIDL',UIDLID,[]) then
        continue;
      mcount:=mcount+1;
    end;
    if mcount=0 then
      goto A;

    mailcount := IdPOP31.CheckMessages; //得到邮箱邮件的各数
    iNo:=0;
    Progress_Frm.Label2.Caption:='总邮件数为：'+inttostr(mcount);
    Progress_Frm.ProgressBar1.Max:=MailCount;
    Progress_Frm.Update;
    for i:=1 to mailcount do //遍历每一封邮件
    begin
      UIDLID:=copy(UIDL[i-1],pos(' ',UIDL[i-1])+1,length(UIDL[i-1])-pos(' ',UIDL[i-1]));
      if qry.Locate('UIDL',UIDLID,[]) then
        continue;
      iNo:=iNo+1;
      Progress_Frm.Label2.Caption:='总邮件数为：'+inttostr(mcount)+'正在收取第'+inttostr(iNo)+'封邮件.';
      Progress_Frm.ProgressBar1.Position:=Progress_frm.ProgressBar1.Position+1;
      Progress_Frm.Update;

      IdMessage1.Clear;
      IdPOP31.retrieveHeader(i,IdMessage1); //得到邮件的头信息
      tv.Items.Item[1].Selected:=true;
      tv.OnClick(tv);
      qryMaster.Append;
      qryMaster.FieldByName('Fromman').AsString:=IdMessage1.From.Text;
      qryMaster.FieldByName('SendTo').AsString:=IdMessage1.Recipients.EMailAddresses;
      qryMaster.FieldByName('CCList').AsString:=IdMessage1.CCList.EMailAddresses;
      qryMaster.FieldByName('Subject').AsString:=GetMailTitle(IdMessage1.Subject);
      qryMaster.FieldByName('Type').AsString:='收件箱';
      qryMaster.FieldByName('MsgSize').AsString:=formatfloat('#.##',IdPOP31.RetrieveMsgSize(i) / 1024)+'K';
      qryMaster.FieldByName('SendDate').AsDateTime:=Date;
      QryMaster.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      qryMaster.Post;

      IdMessage1.Clear;
      IdMessage1.Body.Clear;
      IdPOP31.Retrieve(i,IdMessage1); //接收到邮件所有内容
      if IdMessage1.MessageParts.Count=0 then
      begin
        qryDetail.Append;
        qryDetail.FieldByName('Eml_ID').AsInteger:=qryMaster.FieldByName('Eml_ID').AsInteger;
        qryDetail.FieldByName('Eml_Text').AsString:=IdMessage1.Body.Text;
        qryDetail.Post;
      end;
      for j:=0 to Pred(IdMessage1.MessageParts.Count) do
      begin
        qryDetail.Append;
        qryDetail.FieldByName('Eml_ID').AsInteger:=qryMaster.FieldByName('Eml_ID').AsInteger;

        if IdMessage1.MessageParts.Items[j] is TIdAttachment then
        begin
          qryDetail.FieldByName('Eml_FileName').AsString:=TIdAttachment(IdMessage1.MessageParts.Items[j]).Filename;
          //showmessage(qryDetail.FieldByName('Eml_FileName').AsString);
          
          ListItem := lv.Items.Add;
          Listitem.Caption := qryDetail.FieldByName('Eml_FileName').AsString;
          tmp:=ExtractFilePath(Application.ExeName)+'temp';
          IF Not DirectoryExists(tmp) Then ForceDirectories(tmp);

          if FileExists(tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString) then
            DeleteFile(tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString);
          TIdAttachment(IdMessage1.MessageParts.Items[j]).SaveToFile(tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString);



          TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).LoadFromFile(tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString);
          DeleteFile(tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString); 
        end
        else
        begin
          if IdMessage1.MessageParts.Items[j] is TIdText then
          begin
            qryDetail.FieldByName('Eml_Text').AsString:=GetMailTitle(pchar(TIdText(IdMessage1.MessageParts.Items[j]).Body.Text));
          end;
        end;
      end;
      qryDetail.UpdateBatch(arAll);
      ExecSql('insert into Eml_UIDL(Email,UIDL) values('+quotedstr(qryEml_set.fieldbyname('EMail').AsString)+','+quotedstr(UIDLID)+')');

      //if Not qryEml_set.fieldbyname('IsBackUP').AsBoolean then
        //IdPOP31.Delete(i);
      tv.Items.Item[1].Selected:=true;
      tv.OnClick(tv);
      qryMaster.AfterScroll(qryMaster);
    end;
A:
    Progress_Frm.Label2.Caption:='收取完成.';
    Progress_Frm.Update;
    Progress_Frm.close;
  finally
    IdPOP31.Disconnect; //断开连接
  end;}
end;

procedure TEMail_Frm.N2Click(Sender: TObject);
begin
  if lv.Selected=nil then exit;

  qryDetail.First;
  while not  qryDetail.Eof do
  begin
    if lv.Selected.Caption=qryDetail.fieldbyname('Eml_FileName').AsString then
    begin
      qryDetail.Delete;
      qryDetail.UpdateBatch(arAll);
      break;
    end;
    qryDetail.Next;
  end;
end;

procedure TEMail_Frm.N3Click(Sender: TObject);
var   SaveDiaLog: TSaveDialog;
begin
  if lv.Selected=nil then exit;
  SaveDiaLog:=TSaveDialog.Create(nil);
  SaveDiaLog.FileName:=lv.Selected.Caption;
  if SaveDiaLog.Execute then
  begin
    qryDetail.First;
    while not  qryDetail.Eof do
    begin
      if lv.Selected.Caption=qryDetail.fieldbyname('Eml_FileName').AsString then
      begin
        TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).SaveToFile(SaveDiaLog.FileName);
        break;
      end;
      qryDetail.Next;
    end;
  end;
end;

procedure TEMail_Frm.N1Click(Sender: TObject);
var filename: string;
begin
  if lv.Selected=nil then exit;
  filename:=ExtractFilePath(Application.ExeName)+'temp';
  if not DirectoryExists(filename) then
     CreateDir(filename);

  qryDetail.First;
  while not  qryDetail.Eof do
  begin
    if lv.Selected.Caption=qryDetail.fieldbyname('Eml_FileName').AsString then
    begin
      filename:=filename+'\'+qryDetail.fieldbyname('Eml_FileName').AsString;
      TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).SaveToFile(filename);
      ShellExecute(self.Handle, nil, PChar(FileName), nil, nil, SW_SHOW);
      break;
    end;
    qryDetail.Next;
  end;

end;


procedure TEMail_Frm.SendTo;
var i: integer;
  sSendTo,sEml,tmp: string;
  emlid: integer;
begin
  try
    qryMaster.AfterScroll(qryMaster);

//    IdSMTP1.Disconnect; //断开与服务器的连接
    IdSMTP1.Host := Email_Frm.qryEml_set.fieldbyname('SMTP').AsString;
    IdSMTP1.AuthenticationType := atLogin; //保证登录模式为Login
    IdSMTP1.Username := Email_Frm.qryEml_set.fieldbyname('Username').AsString;
    IdSMTP1.Password := Email_Frm.qryEml_set.fieldbyname('Pwd').AsString;
    IdSMTP1.Port := Email_Frm.qryEml_set.fieldbyname('Smtp_port').AsInteger;
    
    IdMessage1.Clear;
    IdMessage1.Subject:= Email_Frm.qryMaster.fieldbyname('Subject').AsString;
    IdMessage1.From.Address := Email_Frm.qryMaster.fieldbyname('Fromman').AsString;
    //发件人
    IdMessage1.Recipients.Clear;
    sSendTo:='';
    sSendTo:=Email_Frm.qryMaster.fieldbyname('SendTo').AsString+',';
    for i:=1 to length(sSendTo) do
    begin
      if (Copy(sSendTo,i,1)=',') or (Copy(sSendTo,i,1)=';') then
      begin
        if pos('@',sEml)>0 then
        begin
          IdMessage1.Recipients.Add.Text:=sEml;
          sEml:='';
        end
        else
        begin
          Application.MessageBox(pchar(sEml+' 邮件地址错误。'),'Hint',mb_iconinformation+mb_ok);
          Exit;
        end;
      end
      else
        sEml:= sEml+Copy(sSendTo,i,1);

    end;

    //抄送
    IdMessage1.BccList.Clear;
    sSendTo:='';
    if Email_Frm.qryMaster.fieldbyname('CCList').AsString<>'' then
      sSendTo:=Email_Frm.qryMaster.fieldbyname('CCList').AsString+',';
    for i:=1 to length(sSendTo) do
    begin
      if (Copy(sSendTo,i,1)=',') or (Copy(sSendTo,i,1)=';') then
      begin
        if pos('@',sEml)>0 then
        begin
          IdMessage1.BccList.Add.Text:=sEml;
          sEml:='';
        end
        else
        begin
          Application.MessageBox(pchar(sEml+' 邮件地址错误。'),'Hint',mb_iconinformation+mb_ok);
          Exit;
        end;
      end
      else
        sEml:= sEml+Copy(Email_Frm.qryMaster.fieldbyname('CCList').AsString,i,1);

    end;
    
    Email_Frm.qryDetail.First;
    while not Email_Frm.qryDetail.Eof do
    begin
      if not ((EMail_Frm.qryDetail.FieldbyName('Eml_FileName').IsNull) or (EMail_Frm.qryDetail.FieldbyName('Eml_FileName').AsString='')) then
      begin
        if (not EMail_Frm.qryDetail.FieldbyName('Eml_FileName').IsNull) and (EMail_Frm.qryDetail.FieldbyName('Eml_FileName').AsString<>'') then
        begin
          tmp:=ExtractFilePath(Application.ExeName)+'temp';
          if not DirectoryExists(tmp) then
             CreateDir(tmp);

          TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).BlobType:=ftBlob;
          TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).SaveToFile(tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString);
          TIdAttachment.Create(IdMessage1.MessageParts,tmp+'\'+qryDetail.FieldByName('Eml_FileName').AsString);
        end
        else
        begin
          Application.MessageBox('此附件不存在，请查对。','Hint',mb_iconinformation+mb_ok);
          exit;
        end;
      end;
      Email_Frm.qryDetail.Next;
    end;


    Progress_Frm:=TProgress_Frm.Create(nil);
    Progress_Frm.Label1.Caption:=Email_Frm.qryEml_set.fieldbyname('EMail').AsString;
    Progress_Frm.Label2.Caption:='正在连接服务器...';
    Progress_Frm.Show;
    Progress_Frm.Update;

    IdMessage1.Body.AddStrings(Memo.Lines);

    if not IdSMTP1.Connected then
      IdSMTP1.Connect(); //连接SMTP服务器
    
    if IdSMTP1.AuthSchemesSupported.IndexOf('LOGIN')>-1 then
    begin
      Progress_Frm.Label2.Caption:='正在验证...';
      IdSMTP1.AuthenticationType := atLogin; //连接前要保存为Login 上面己设，此处不必要
      IdSMTP1.Authenticate;
      Progress_Frm.Update;
    end;

    Progress_Frm.Label2.Caption:='正在发送...';
    Progress_Frm.Update;
    IdSMTP1.Send(IdMessage1); //向服务器发送邮箱
    
    Progress_Frm.Label2.Caption:='发送成功.';
    Progress_Frm.Update;
    Progress_Frm.Close;

    emlid:=qryMaster.FieldByName('Eml_ID').AsInteger;
    qryMaster.Locate('Eml_ID',emlid,[]);
    if not (qryMaster.State in [dsInsert,dsEdit]) then
      qryMaster.Edit;
    qryMaster.FieldByName('Type').AsString:='已发送邮件';
    qryMaster.Post;
    tv.Items.Item[2].Selected:=true;
    tv.OnClick(tv);

  finally
    IdSMTP1.Disconnect; //断开与服务器的连接
  end;
end;

procedure TEMail_Frm.ToolButton2Click(Sender: TObject);
begin
  tv.Items.Item[2].Selected:=true;
end;

procedure TEMail_Frm.DBGrid1DblClick(Sender: TObject);
begin
  if qryMaster.IsEmpty then exit;

  NewMail_Frm:=TNewMail_Frm.Create(nil);
  NewMail_Frm.ToolButton1.Visible:=false;
  NewMail_Frm.ToolButton2.Visible:=false;
  NewMail_Frm.ToolButton3.Visible:=false;
  NewMail_Frm.ToolButton4.Visible:=true;
  NewMail_Frm.ToolButton5.Visible:=true;
  NewMail_Frm.ToolButton6.Visible:=true;
  NewMail_Frm.edtSendto.ReadOnly:=true;
  NewMail_Frm.edtCCList.ReadOnly:=true;
  NewMail_Frm.edtSubject.ReadOnly:=true;
  NewMail_Frm.Memo.ReadOnly:=true;
  NewMail_Frm.N2.Enabled:=false;
  ShowEml;
  if NewMail_Frm.ShowModal=mrOK then
  begin
    SendTo;
    tv.Items.Item[2].Selected:=true;
    tv.OnClick(tv);
  end
  else
  begin
    if qryMaster.State in [dsInsert,dsEdit] then
      qryMaster.Cancel;
  end;
end;

procedure TEMail_Frm.ToolButton11Click(Sender: TObject);
begin
  NewMail_Frm:=TNewMail_Frm.Create(nil);
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;
  ShowEml;
  NewMail_Frm.ToolButton5.Click;
  if NewMail_Frm.ShowModal=mrOK then
  begin
    SendTo;
    tv.Items.Item[2].Selected:=true;
  end
  else
  begin
    if qryMaster.State in [dsInsert,dsEdit] then
      qryMaster.Cancel;
  end;
end;

procedure TEMail_Frm.ToolButton5Click(Sender: TObject);
begin
  NewMail_Frm:=TNewMail_Frm.Create(nil);
  NewMail_Frm.ISNewMail:=False;
  NewMail_Frm.ISReplyMail:=True;
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;
  ShowEml;
  NewMail_Frm.ToolButton6.Click;
  if NewMail_Frm.ShowModal=mrOK then
  begin
    SendTo;
    tv.Items.Item[2].Selected:=true;
  end
  else
  begin
    if qryMaster.State in [dsInsert,dsEdit] then
      qryMaster.Cancel;
  end;
end;

procedure TEMail_Frm.ShowEml;
var ListItem: TListItem;
begin
  NewMail_Frm.edtSendto.Text:=qryMaster.fieldByName('SendTo').AsString;
  NewMail_Frm.edtCCList.Text:=qryMaster.fieldByName('CCList').AsString;
  NewMail_Frm.edtSubject.Text:=qryMaster.fieldByName('Subject').AsString;
  NewMail_Frm.N3.Visible:=true;
  NewMail_Frm.Memo.Clear;
  NewMail_Frm.lv.Clear;
  if qryDetail.Active=False then
    Exit;
  qryDetail.Close;
  qryDetail.Parameters.ParamByName('Eml_ID').Value:=qryMaster.fieldByName('Eml_ID').AsInteger;
  qryDetail.Open;
  qryDetail.First;
  if not qryMaster.FieldByName('Eml_TextPlain').IsNull then
      NewMail_Frm.Memo.Lines.Add(qryMaster.FieldByName('Eml_TextPlain').AsString);
  while not qryDetail.Eof do
  begin

    if not qryDetail.FieldByName('Eml_FileName').IsNull then
    begin
      ListItem := NewMail_Frm.lv.Items.Add;
      Listitem.Caption := qryDetail.FieldByName('Eml_FileName').AsString;
      Listitem.ImageIndex:=0;
    end;
    qryDetail.Next;
  end;
  if NewMail_Frm.lv.Items.Count>0 then
    NewMail_Frm.lv.Visible:=true;
end;

function TEMail_Frm.ExecSql(sql: string): boolean;
var qry: TbainaADOQuery;
begin
  result:=false;
  try
  qry:=TbainaADOQuery.Create(nil);
  qry.Connection:=DataBase.DataBaseModule.dtclsData;
  qry.Close;
  qry.SQL.Text:=sql;
  qry.ExecSQL;
  result:=true;
  except
  end;
end;

procedure TEMail_Frm.PopupMenu2Popup(Sender: TObject);
begin  if tv.Selected=nil then exit;
  N4.Enabled:=false;
  if tv.Selected.Text='已删除邮件' then
    N4.Enabled:=true;

end;

procedure TEMail_Frm.N4Click(Sender: TObject);
begin
    qryMaster.First;
    while not qryMaster.Eof do
    begin
      qryDetail.First;
      while not qryDetail.Eof do
        qryDetail.Delete;
      qryDetail.UpdateBatch(arAll);
      qryMaster.Delete;
    end;
    tv.OnClick(tv);
end;

procedure TEMail_Frm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Action := caFree;
  EMail_Frm := nil;
end;

procedure TEMail_Frm.btn1Click(Sender: TObject);
begin
  inherited;
  EMailSet_Frm := TEMailSet_Frm.Create(Self);
  EMailSet_Frm.ShowModal;
end;

Function TEMail_Frm.ConnectPop3Server:Boolean;
begin
  pop3.Host:=qryEml_set.fieldbyname('POP3').AsString;
  pop3.Port:=Email_Frm.qryEml_set.fieldbyname('Pop3_port').AsInteger;
  pop3.UserName:=qryEml_set.fieldbyname('Username').AsString;
  pop3.Password:=qryEml_set.fieldbyname('Pwd').AsString;

  IF pop3.Connect Then
    Begin
      IF Pop3.Login Then
        begin
          Result:=True;
        End
      Else
        Begin
          Pop3.Abort;
          Application.MessageBox('登录邮件服务器失败......','提示',MB_OK+MB_Iconinformation);
          Result:=False;
        End;
    End
  Else
    Begin
      Pop3.Abort;
      Application.MessageBox('连接邮件服务器失败......','提示',MB_OK+MB_Iconinformation);
      Result:=False;
    End;
end;

procedure TEMail_Frm.DownLoadEmail(UIDNo:Integer);
var
  Loop: Integer;
  Text: String;
  tmp,UIDLID: string;
  UIDL: Tstrings;
  qry: TbainaADOQuery;      
  ListItem:TListItem;
  TempStream:TMemoryStream;
begin

  SetLength(Text, Msg.Body.Size);
  UIDLID:=Pop3.GetUIDL(UIDNO);
  if Length(Text) > 0 then
  begin
    Msg.Body.Position := 0;
    Msg.Body.ReadBuffer(Text[1], Msg.Body.Size);
  end;

  qryMaster.Append;
  qryMaster.FieldByName('Fromman').AsString:=Msg.FromName;
  qryMaster.FieldByName('SendTo').AsString:=Msg.FromAddress;
  qryMaster.FieldByName('CCList').AsString:=Msg.ReplyToAddress;
  qryMaster.FieldByName('Subject').AsString:=Msg.Subject;
  qryMaster.FieldByName('Eml_TextPlain').AsString:=Msg.TextPlain.Text;
  qryMaster.FieldByName('Eml_HtmlPlain').AsString:=Msg.TextHTML.Text;
  qryMaster.FieldByName('Type').AsString:='收件箱';
  qryMaster.FieldByName('MsgSize').AsString:=IntToStr(Msg.Body.Size);
  qryMaster.FieldByName('SendDate').AsDateTime:=Msg.Date;
  QryMaster.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
  qryMaster.Post;

  {Memo1.Lines.Text := Msg.TextPlain.Text;
  Memo2.Lines.Text := Msg.TextHTML.Text;
  IF Memo2.Lines.Text<>'' then
    Begin
      Memo1.Visible:=False;
      Msg.TextHTML.SaveToFile(ExtractFilePath(Application.ExeName)+'Temp.html');
      webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'Temp.html');
    End;}



      //if Not qryEml_set.fieldbyname('IsBackUP').AsBoolean then
        //pop3.DeleteMessage(i);

  for Loop := 0 to Msg.AttachList.Count-1 do
    begin
      TempStream:=TMemoryStream.Create;
      //ListItem:=ListView1.Items.Add;
      if Msg.AttachList[Loop].Decoded.Size = 0 then
        Msg.AttachList[Loop].Decode;
      Msg.AttachList[Loop].Decoded.SaveToStream(TempStream);
      //if Msg.AttachList[Loop].Embedded then
        //ListItem.Caption:=Msg.AttachList[Loop].FileName //+#32'('+IntToStr(Msg.AttachList[Loop].Decoded.Size)+')'#32+Msg.AttachList[Loop].AttachInfo+#32'Embedded'
      //else
        //ListItem.Caption:=Msg.AttachList[Loop].FileName;//+#32'('+IntToStr(Msg.AttachList[Loop].Decoded.Size)+')'#32+Msg.AttachList[Loop].AttachInfo;
      qryDetail.Append;
      qryDetail.FieldByName('Eml_ID').AsInteger:=qryMaster.FieldByName('Eml_ID').AsInteger;
      qryDetail.FieldByName('Eml_FileName').AsString:=Msg.AttachList[Loop].FileName;
      TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).LoadFromStream(TempStream);
      qryDetail.UpdateBatch(arAll);
      TempStream.Free;
    end;
    if Not qryEml_set.fieldbyname('IsBackUP').AsBoolean then
      POP3.DeleteMessage(UIDNO)
    Else
      ExecSql('insert into Eml_UIDL(Email,UIDL) values('+quotedstr(qryEml_set.fieldbyname('EMail').AsString)+','+quotedstr(UIDLID)+')');
    //qryMaster.AfterScroll(qryMaster);

end;

procedure TEMail_Frm.DBGrid1CellClick(Column: TColumn);
var ListItem: TListItem;
  Tmp:String;
begin
  Memo.Clear;
  lv.Clear;
  if qryDetail.Active=False then
    Exit;
  qryDetail.Close;
  qryDetail.Parameters.ParamByName('Eml_ID').Value:=qryMaster.fieldByName('Eml_ID').AsInteger;
  qryDetail.Open;
  qryDetail.First;
  if not qryMaster.FieldByName('Eml_TextPlain').IsNull then
    Begin
      Memo.Visible:=True;
      Memo.Lines.Add(qryMaster.FieldByName('Eml_TextPlain').AsString);
    End;
  {IF  not qryMaster.FieldByName('Eml_HtmlPlain').IsNull then
    Begin
      Memo.Visible:=False;
      tmp:=ExtractFilePath(Application.ExeName)+'temp';
      if not DirectoryExists(tmp) then
        CreateDir(tmp);

      TBlobField(EMail_Frm.qryMaster.FieldbyName('Eml_HtmlPlain')).BlobType:=ftBlob;
      TBlobField(EMail_Frm.qryMaster.FieldbyName('Eml_HtmlPlain')).SaveToFile(tmp+'\temp.html');
      WebBrowser.Navigate(Tmp+'\Temp.html');
    End;}
  while not qryDetail.Eof do
  begin

    if not qryDetail.FieldByName('Eml_FileName').IsNull then
    begin
      ListItem := lv.Items.Add;
      Listitem.Caption := qryDetail.FieldByName('Eml_FileName').AsString;
      Listitem.ImageIndex:=0;
    end;
    qryDetail.Next;
  end;

end;

end.
