unit NewMailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin,
  ImgList,ShellAPI,DB,ADODB, Menus, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, bainaADOQuery,
  cxLookAndFeelPainters, cxButtons, cxContainer, cxListBox;

type
  TNewMail_Frm = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    lv: TListView;
    Memo: TMemo;
    Panel2: TPanel;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    il2: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    edtSendto: TEdit;
    edtCCList: TEdit;
    edtSubject: TEdit;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    N3: TMenuItem;
    Panel3: TPanel;
    ToolButton7: TToolButton;
    LGrdCust: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    LAdoCust: TbainaADOQuery;
    LDSCust: TDataSource;
    CCList: TcxListBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    procedure ToolButton3Click(Sender: TObject);
    procedure lvDblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure lvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton7Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure LGrdCustCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ISNewMail,ISReplyMail:Boolean;
  end;

var
  NewMail_Frm: TNewMail_Frm;

implementation

uses EMailFrm,EMailSelectLinkman, DataBase, PublicClass;

{$R *.dfm}

procedure TNewMail_Frm.ToolButton3Click(Sender: TObject);
var ListItem: TListItem;
  Flag: Cardinal;
  info: SHFILEINFOA;
  Icon: TIcon;
  OpenDiaLog: TOpenDialog;
begin
  OpenDiaLog:=TOpenDiaLog.Create(nil);
  if OpenDialog.Execute then
  begin
    with lv do
    begin
      LargeImages := il2;
      Icon := TIcon.Create;
      ListItem := Items.Add;
      Listitem.Caption := OpenDiaLog.FileName;
      Flag := (SHGFI_SMALLICON or SHGFI_ICON or SHGFI_USEFILEATTRIBUTES);
      SHGetFileInfo(Pchar(OpenDiaLog.FileName), 0, info, Sizeof(info), Flag);
      Icon.Handle := info.hIcon;
      il2.AddIcon(Icon);
      ListItem.ImageIndex := il2.Count - 1;
    end;
  end;
  if lv.Items.Count>0 then
    lv.Visible:=true;
end;

procedure TNewMail_Frm.lvDblClick(Sender: TObject);
var FileName: string;
  hFile: THandle;
begin
  if lv.Selected=nil then
    exit;
  FileName := lv.Selected.Caption;
  ShellExecute(self.Handle, nil, PChar(FileName), nil, nil, SW_SHOW);
end;

procedure TNewMail_Frm.ToolButton1Click(Sender: TObject);
begin
        ToolButton2.Click;
        ModalResult:=mrOK;
end;

procedure TNewMail_Frm.N1Click(Sender: TObject);
begin
  lv.OnDblClick(lv);
end;

procedure TNewMail_Frm.N2Click(Sender: TObject);
begin
  if lv.Selected=nil then exit;
  lv.Items.BeginUpdate;
  lv.Selected.Delete;
  lv.Items.EndUpdate;
end;

procedure TNewMail_Frm.lvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=46 then
  begin
      N2.Click;
  end;
end;

procedure TNewMail_Frm.ToolButton2Click(Sender: TObject);
var i: integer;
  Tmp,TempFile:String;
begin
  IF EdtSubject.Text='' Then
    Begin
      Application.MessageBox('主题不能为空','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  if Email_Frm.qryEml_set.RecordCount=0 then
    exit;
  //事先保存数据再发送
  //if not (EMail_Frm.qryMaster.State in [dsInsert,dsEdit]) then
    //EMail_Frm.qryMaster.Edit;
  IF ISReplyMail Then
    Email_Frm.qryMaster.Append;
  EMail_Frm.qryMaster.FieldByName('Fromman').AsString:=Email_Frm.qryEml_set.fieldbyname('EMail').AsString;
  EMail_Frm.qryMaster.FieldByName('SendTo').AsString:=edtSendTo.Text;
  EMail_Frm.qryMaster.FieldByName('CCList').AsString:=edtCCList.Text;
  EMail_Frm.qryMaster.FieldByName('Subject').AsString:=edtSubject.Text;
  EMail_Frm.qryMaster.FieldByName('Eml_TextPlain').AsString:=Memo.Text;
  EMail_Frm.qryMaster.FieldByName('Type').AsString:='发件箱';
  EMail_Frm.qryMaster.FieldByName('MsgSize').AsString:='';
  EMail_Frm.qryMaster.FieldByName('SendDate').AsDateTime:=Date;
  EMail_Frm.qryMaster.FieldByName('BelongID').AsInteger:= DatabaseModule.dtclsData.UserID_;
  EMail_Frm.qryMaster.Post;



  {if not (EMail_Frm.qryDetail.State in [dsInsert,dsEdit]) then
    EMail_Frm.qryDetail.Append;
  EMail_Frm.qryDetail.FieldByName('Eml_id').AsInteger:=EMail_Frm.qryMaster.FieldByName('Eml_id').AsInteger;
  //EMail_Frm.qryDetail.FieldByName('Eml_Text').AsString:=Memo.Text;
  EMail_Frm.qryDetail.Post;}
  IF ISReplyMail Then
    Begin
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
            TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).SaveToFile(tmp+'\'+EMail_Frm.qryDetail.FieldByName('Eml_FileName').AsString);
          end;
        end;
        Email_Frm.qryDetail.Next;
      end;

    End;
    
    EMail_Frm.qryDetail.Close;
    EMail_Frm.qryDetail.Parameters.ParamByName('Eml_ID').Value:=EMail_Frm.qryMaster.fieldByName('Eml_ID').AsInteger;
    EMail_Frm.qryDetail.Open;
    EMail_Frm.qryDetail.First;
    
  try
    for i:=0 to lv.Items.Count-1 do
    begin
      if not (EMail_Frm.qryDetail.State in [dsInsert,dsEdit]) then
        EMail_Frm.qryDetail.Append;
      EMail_Frm.qryDetail.FieldByName('Eml_id').AsInteger:=EMail_Frm.qryMaster.FieldByName('Eml_id').AsInteger;
      IF ISReplyMail Then
        TempFile:=Tmp+'\'+lv.Items[i].Caption;
      IF ISNewMail Then
        TempFile:=lv.Items[i].Caption;
      if FileExists(TempFile) then
      begin
        EMail_Frm.qryDetail.FieldByName('Eml_FileName').AsString:=ExtractFileName(lv.Items[i].Caption);
        EMail_Frm.qryDetail.FieldByName('CreateBy_').AsString:= DatabaseModule.dtclsData.UserName_;
        EMail_Frm.qryDetail.FieldByName('CreateD_').AsDateTime:=Date;
        TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).BlobType:=ftBlob;
        IF ISNewMail Then
          TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).LoadFromFile(TempFile)//lv.Items[i].Caption)
        Else
          TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).LoadFromFile(TempFIle);//Tmp+'\'+lv.Items[i].Caption);
      end
      else
      begin
        Application.MessageBox('此附件不存在，请查对。','Hint',mb_iconinformation+mb_ok);
        EMail_Frm.qryDetail.CancelUpdates;
        Abort;
      end;
      EMail_Frm.qryDetail.Post;
    end;
    EMail_Frm.qryDetail.UpdateBatch(arAll);
  finally
    Close;
  end;
end;

procedure TNewMail_Frm.ToolButton6Click(Sender: TObject);
begin
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;
  edtSendto.Text:='';
  edtCCList.Text:='';
  edtSubject.Text:='';
end;

procedure TNewMail_Frm.ToolButton4Click(Sender: TObject);
begin
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;
  NewMail_Frm.edtSendto.ReadOnly:=false;
  NewMail_Frm.edtCCList.ReadOnly:=false;
  NewMail_Frm.edtSubject.ReadOnly:=false;
  NewMail_Frm.Memo.ReadOnly:=false;
  NewMail_Frm.N2.Enabled:=true;

  edtSendto.Text :=Email_Frm.qryMaster.fieldbyname('FromMan').AsString;
end;

procedure TNewMail_Frm.ToolButton5Click(Sender: TObject);
var i: integer;
  sSendTo,sEml: string;
begin
  NewMail_Frm.ToolButton1.Visible:=true;
  NewMail_Frm.ToolButton2.Visible:=true;
  NewMail_Frm.ToolButton3.Visible:=true;
  NewMail_Frm.ToolButton4.Visible:=false;
  NewMail_Frm.ToolButton5.Visible:=false;
  NewMail_Frm.ToolButton6.Visible:=false;

  edtSendto.Text :=Email_Frm.qryMaster.fieldbyname('From').AsString;
  sSendTo:='';
  sSendTo:=Email_Frm.qryMaster.fieldbyname('SendTo').AsString+',';
  for i:=1 to length(sSendTo) do
  begin
    if (Copy(sSendTo,i,1)=',') or (Copy(sSendTo,i,1)=';') then
    begin
      if (pos('@',sEml)>0) then
      begin
        if pos(Email_Frm.qryEml_set.fieldbyname('EMail').AsString,sEml)<=0 then
          edtSendto.Text:=edtSendto.Text+','+sEml;
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
  sSendTo:='';
  if Email_Frm.qryMaster.fieldbyname('CCList').AsString<>'' then
    sSendTo:=Email_Frm.qryMaster.fieldbyname('CCList').AsString+',';
  for i:=1 to length(sSendTo) do
  begin
    if (Copy(sSendTo,i,1)=',') or (Copy(sSendTo,i,1)=';') then
    begin
      if (pos('@',sEml)>0) then
      begin
        if pos(Email_Frm.qryEml_set.fieldbyname('EMail').AsString,sEml)<=0 then
        begin
          if edtCCList.Text<>'' then
            edtCCList.Text:=edtCCList.Text+','+sEml
          else
            edtCCList.Text:=sEml;
        end;
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

end;

procedure TNewMail_Frm.N3Click(Sender: TObject);
var   SaveDiaLog: TSaveDialog;
begin
    if lv.Selected=nil then exit;
    SaveDiaLog:=TSaveDialog.Create(nil);
    SaveDiaLog.FileName:=lv.Selected.Caption;
    if SaveDiaLog.Execute then
    begin
      EMail_Frm.qryDetail.First;
      while not  EMail_Frm.qryDetail.Eof do
      begin
        if lv.Selected.Caption=EMail_Frm.qryDetail.fieldbyname('Eml_FileName').AsString then
        begin
          TBlobField(EMail_Frm.qryDetail.FieldbyName('Eml_Attachment')).SaveToFile(SaveDiaLog.FileName);
          break;
        end;
        EMail_Frm.qryDetail.Next;
      end;
    end;
end;

procedure TNewMail_Frm.SpeedButton1Click(Sender: TObject);
var
  i:Integer;
  mails:String;
begin
  {EMailSelectLinkman_Frm := TEMailSelectLinkman_Frm.Create(Self);
  if (EMailSelectLinkman_Frm.ShowModal = mrok) and (Not EMailSelectLinkman_Frm.bndqryNote.IsEmpty) Then
  Begin
    if EMailSelectLinkman_Frm.dbgrd1.SelectedRows.Count = 0 Then
       EMailSelectLinkman_Frm.dbgrd1.SelectedRows.CurrentRowSelected := True;
    mails := '';
    for i := 0 To EMailSelectLinkman_Frm.dbgrd1.SelectedRows.Count -1 Do
    Begin
       EMailSelectLinkman_Frm.bndqryNote.GotoBookmark(TBookmark(EMailSelectLinkman_Frm.dbgrd1.SelectedRows[i]));
       if i = 0 Then
         mails := mails +  EMailSelectLinkman_Frm.bndqryNote.fieldByname('FriendEmail').AsString
       else
         mails := mails +';'+EMailSelectLinkman_Frm.bndqryNote.fieldByname('FriendEmail').AsString;
    End;

    if Copy(Trim(edtSendto.Text),Length(Trim(edtSendto.Text)),1) <> ';' Then
       edtSendto.Text := edtSendto.Text + ';'+ mails
    else
       edtSendto.Text := edtSendto.Text + mails ;
  End;
  EMailSelectLinkman_Frm := nil;}
end;

procedure TNewMail_Frm.SpeedButton2Click(Sender: TObject);
var
  i:Integer;
  mails:String;
begin
  {EMailSelectLinkman_Frm := TEMailSelectLinkman_Frm.Create(Self);
  if (EMailSelectLinkman_Frm.ShowModal = mrok) and (Not EMailSelectLinkman_Frm.bndqryNote.IsEmpty) Then
  Begin
    if EMailSelectLinkman_Frm.dbgrd1.SelectedRows.Count = 0 Then
       EMailSelectLinkman_Frm.dbgrd1.SelectedRows.CurrentRowSelected := True;
    mails := '';
    for i := 0 To EMailSelectLinkman_Frm.dbgrd1.SelectedRows.Count -1 Do
    Begin
       EMailSelectLinkman_Frm.bndqryNote.GotoBookmark(TBookmark(EMailSelectLinkman_Frm.dbgrd1.SelectedRows[i]));
       if i = 0 Then
         mails := mails +  EMailSelectLinkman_Frm.bndqryNote.fieldByname('FriendEmail').AsString
       else
         mails := mails +';'+EMailSelectLinkman_Frm.bndqryNote.fieldByname('FriendEmail').AsString;
    End;

    if Copy(Trim(edtSendto.Text),Length(Trim(edtSendto.Text)),1) <> ';' Then
       edtCCList.Text := edtCCList.Text + ';'+ mails
    else
       edtCCList.Text := edtCCList.Text + mails ;
  End;
  EMailSelectLinkman_Frm := nil;}
  Mails:='';
  FOR I:=0 TO CCList.Count-1 DO
    Begin
      IF I=0 Then Mails:=Mails+CCList.Items.Strings[I]
      Else Mails:=Mails+';'+CCList.Items.Strings[I];
    End;
  if (EdtCCList.Text<>'') And (Copy(Trim(edtSendto.Text),Length(Trim(edtSendto.Text)),1) <> ';') Then
       edtCCList.Text := edtCCList.Text + ';'+ mails
    else
       edtCCList.Text := edtCCList.Text + mails ;
end;

procedure TNewMail_Frm.FormShow(Sender: TObject);
begin
  IF ISAdd=True Then Newmail_Frm.edtSendto.Text:=DatabaseModule.AdoContact.FieldByName('ContactEmail').AsString;
end;

procedure TNewMail_Frm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ISAdd:=False;
  Action:=CaFree;
end;

procedure TNewMail_Frm.ToolButton7Click(Sender: TObject);
Var
  I:Integer;
begin
          EdtSendTo.Enabled:=False;
          LAdoCust.AliasName:='a';
          LAdoCust.Close;
          LAdoCust.SQL.Clear;
          LAdoCust.SQL.Add('Select a.CustName,a.CustType,a.CustRate,a.CustTrade,a.CustState,b.ContactName,b.ContactEmail');
          LAdoCust.SQL.Add(' From Customer a,Contact b where a.BelongID=:BelongID And a.CustID = b.CustID And b.ContactEmail<>:ContactEmail');
          //if  LAdoCust.AccSQL <> '' Then LAdoCust.SQL.Add(' OR '+'('+LAdoCust.AccSQL+')');
          LAdoCust.Parameters.ParamByName('BelongID').Value:=DatabaseModule.DtClsData.UserID_;
          LAdoCust.Parameters.ParamByName('ContactEmail').Value:='';
          LAdoCust.Prepared;
          LAdoCust.Open;

      IF LGrdCust.ColumnCount<>0 Then Exit;//GrdCust.ClearItems;
          FOR I:=0 TO LAdoCust.FieldCount - 1 Do
            Begin
              LGrdCust.CreateColumn;
              LGrdCust.Columns[I].Name:='CColumns'+IntToStr(I);
              LGrdCust.Columns[I].Width:=80;
            End;

          LGrdCust.DataController.DataSource:=LDSCust;
          LGrdCust.Columns[0].Caption:='客户';
          LGrdCust.Columns[0].DataBinding;
          LGrdCust.Columns[0].DataBinding.FieldName:='CustName';
          LGrdCust.Columns[0].DataBinding.ValueType:='String';

          LGrdCust.Columns[1].Caption:='联系人';
          LGrdCust.Columns[1].DataBinding;
          LGrdCust.Columns[1].DataBinding.FieldName:='ContactName';
          LGrdCust.Columns[1].DataBinding.ValueType:='String';

          LGrdCust.Columns[2].Caption:='邮箱';
          LGrdCust.Columns[2].DataBinding;
          LGrdCust.Columns[2].DataBinding.FieldName:='ContactEmail';
          LGrdCust.Columns[2].DataBinding.ValueType:='String';

          LGrdCust.Columns[3].Caption:='等级';
          LGrdCust.Columns[3].DataBinding;
          LGrdCust.Columns[3].DataBinding.FieldName:='CustRate';
          LGrdCust.Columns[3].DataBinding.ValueType:='String';

          LGrdCust.Columns[4].Caption:='行业';
          LGrdCust.Columns[4].DataBinding;
          LGrdCust.Columns[4].DataBinding.FieldName:='CustTrade';
          LGrdCust.Columns[4].DataBinding.ValueType:='String';

          LGrdCust.Columns[5].Caption:='状态';
          LGrdCust.Columns[5].DataBinding;
          LGrdCust.Columns[5].DataBinding.FieldName:='CustState';
          LGrdCust.Columns[5].DataBinding.ValueType:='String';

          LGrdCust.Columns[6].Caption:='类型';
          LGrdCust.Columns[6].DataBinding;
          LGrdCust.Columns[6].DataBinding.FieldName:='CustType';
          LGrdCust.Columns[6].DataBinding.ValueType:='String';
      Panel3.Visible:=Not Panel3.Visible;
end;

procedure TNewMail_Frm.cxButton1Click(Sender: TObject);
Var
  I:Integer;
begin
  FOR I:=0 TO CCList.Count-1 DO
    Begin
      IF CCList.Items.Strings[I] = LAdoCust.FieldByName('ContactEmail').AsString Then Exit;
    End;
  CCList.Items.Add(LAdoCust.FieldByName('ContactEmail').AsString);
end;

procedure TNewMail_Frm.cxButton2Click(Sender: TObject);
Var
  I,J:INteger;
  ISRepeat:Boolean;
begin
  LAdoCust.First;
  FOR I:=1 TO LAdocust.RecordCount DO
    Begin
      ISRepeat:=False;
      FOR J:=0 TO CCList.Count-1 DO
        Begin
          IF CCList.Items.Strings[J] = LAdoCust.FieldByName('ContactEmail').AsString Then
            Begin
              ISRepeat:=True;
              Break;
            End;
        End;
      IF Not ISRepeat=True Then
        CCList.Items.Add(LAdoCust.FieldByName('ContactEmail').AsString);
      LAdoCust.Next;
    End;
end;

procedure TNewMail_Frm.cxButton3Click(Sender: TObject);
begin
  IF CCList.Items.Count>=0 Then
    CCLIst.Items.Delete(CCList.ItemIndex);
end;

procedure TNewMail_Frm.cxButton4Click(Sender: TObject);
begin
  IF CCList.Items.Count>=0 Then
    CCList.Clear;
end;

procedure TNewMail_Frm.LGrdCustCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  CXButton1.Click;
end;

procedure TNewMail_Frm.cxButton5Click(Sender: TObject);
begin
  Panel3.Visible:=False;
  IF EdtSendTo.Text='' Then EdtSendTo.Text:=CCList.Items.Strings[0];
  SpeedButton2.Click;
end;

end.
