unit DemoForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mail2000;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    bConnect: TButton;
    Label1: TLabel;
    eHost: TEdit;
    Label2: TLabel;
    eUsername: TEdit;
    Label3: TLabel;
    ePassword: TEdit;
    lStatus: TLabel;
    bDisconnect: TButton;
    bRetrieve: TButton;
    eMsgNum: TEdit;
    UpDown1: TUpDown;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    mHeader: TMemo;
    TabSheet5: TTabSheet;
    Label7: TLabel;
    eFromName: TEdit;
    Label8: TLabel;
    eFromAddress: TEdit;
    Label10: TLabel;
    eReplyName: TEdit;
    Label11: TLabel;
    eReplyAddress: TEdit;
    TabSheet6: TTabSheet;
    mTextHtml: TMemo;
    Label6: TLabel;
    lbFiles: TListBox;
    bSave: TButton;
    bAttach: TButton;
    Label5: TLabel;
    bHtml: TButton;
    Label9: TLabel;
    mTextPlain: TMemo;
    bPlain: TButton;
    Label12: TLabel;
    eSubject: TEdit;
    Label13: TLabel;
    dtDate: TDateTimePicker;
    dtTime: TDateTimePicker;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    eLabel: TEdit;
    Label21: TLabel;
    eValue: TEdit;
    bLabel: TButton;
    bDelLabel: TButton;
    Label22: TLabel;
    mBody: TMemo;
    OpenDialog: TOpenDialog;
    bRebuild: TButton;
    bReset: TButton;
    bRefresh: TButton;
    Label23: TLabel;
    eSmtpHost: TEdit;
    bSmtpConnect: TButton;
    bSmtpDisconnect: TButton;
    bSend: TButton;
    POP: TPOP2000;
    SMTP: TSMTP2000;
    Label4: TLabel;
    Label24: TLabel;
    SaveDialog: TSaveDialog;
    bSaveMsg: TButton;
    Label25: TLabel;
    bLoadMsg: TButton;
    bRemove: TButton;
    bPlainRemove: TButton;
    bHtmlRemove: TButton;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    Msg: TMailMessage2000;
    Label26: TLabel;
    ePort: TEdit;
    Label27: TLabel;
    eSmtpPort: TEdit;
    Label28: TLabel;
    eToName: TEdit;
    Label29: TLabel;
    eToAddress: TEdit;
    bAddTo: TButton;
    bAddCc: TButton;
    bClearTo: TButton;
    bClearCc: TButton;
    mToNames: TListBox;
    mToAddresses: TListBox;
    mCcNames: TListBox;
    mCcAddresses: TListBox;
    TabSheet7: TTabSheet;
    mHops: TMemo;
    mResponse: TMemo;
    mSmtpResponse: TMemo;
    Label31: TLabel;
    bSaveHeader1: TButton;
    cbEmbedded: TCheckBox;
    bNormalize: TButton;
    cbHeader: TCheckBox;
    bDelete: TButton;
    bUIDL: TButton;
    Label30: TLabel;
    lSmtpStatus: TLabel;
    bAbort: TButton;
    bSmtpAbort: TButton;
    bFindParts: TButton;
    cbPriority: TComboBox;
    Label32: TLabel;
    chReceipt: TCheckBox;
    Label33: TLabel;
    eUID: TEdit;
    Label34: TLabel;
    ePWD: TEdit;
    bLogin: TButton;
    cbMethod: TComboBox;
    Label35: TLabel;
    bHelo: TButton;
    bEhlo: TButton;
    bAuthLogin: TButton;
    procedure bConnectClick(Sender: TObject);
    procedure bDisconnectClick(Sender: TObject);
    procedure bRetrieveClick(Sender: TObject);
    procedure bRefreshClick(Sender: TObject);
    procedure bRebuildClick(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure bLabelClick(Sender: TObject);
    procedure bDelLabelClick(Sender: TObject);
    procedure bSaveHeaderClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bAttachClick(Sender: TObject);
    procedure bPlainClick(Sender: TObject);
    procedure bHtmlClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bSaveMsgClick(Sender: TObject);
    procedure bSmtpConnectClick(Sender: TObject);
    procedure bSmtpDisconnectClick(Sender: TObject);
    procedure bSendClick(Sender: TObject);
    procedure bLoadMsgClick(Sender: TObject);
    procedure bRemoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure POPProgress(Sender: TObject; Total, Current: Integer);
    procedure MsgProgress(Sender: TObject; Total, Current: Integer);
    procedure SMTPProgress(Sender: TObject; Total, Current: Integer);
    procedure bPlainRemoveClick(Sender: TObject);
    procedure bHtmlRemoveClick(Sender: TObject);
    procedure bAddToClick(Sender: TObject);
    procedure bAddCcClick(Sender: TObject);
    procedure bClearToClick(Sender: TObject);
    procedure bClearCcClick(Sender: TObject);
    procedure mToNamesClick(Sender: TObject);
    procedure mToAddressesClick(Sender: TObject);
    procedure mCcNamesClick(Sender: TObject);
    procedure mCcAddressesClick(Sender: TObject);
    procedure bNormalizeClick(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure bUIDLClick(Sender: TObject);
    procedure bAbortClick(Sender: TObject);
    procedure bSmtpAbortClick(Sender: TObject);
    procedure bFindPartsClick(Sender: TObject);
    procedure bLoginClick(Sender: TObject);
    procedure bHeloClick(Sender: TObject);
    procedure bEhloClick(Sender: TObject);
    procedure bAuthLoginClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.bConnectClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  POP.UserName := eUserName.Text;
  POP.Password := ePassword.Text;
  POP.Host := eHost.Text;
  POP.Port := StrToInt(ePort.Text);

  if POP.Connect then
  begin

    if POP.Login then
    begin

      lStatus.Caption := IntToStr(POP.SessionMessageCount)+' messages on server';
      bDisconnect.Enabled := True;
      bRetrieve.Enabled := True;
      bDelete.Enabled := True;
      bUIDL.Enabled := True;
      bConnect.Enabled := False;
      UpDown1.Max := POP.SessionMessageCount;
      mResponse.Lines.Text := POP.LastResponse;
    end
    else
    begin

      POP.Abort;
      mResponse.Lines.Text := POP.LastResponse;
      lStatus.Caption := 'Failed on login';
    end;
  end
  else
  begin

    POP.Abort;
    mResponse.Lines.Text := POP.LastResponse;
    lStatus.Caption := 'Failed on connect';
  end;

  Screen.Cursor := crDefault;
end;

procedure TForm1.bDisconnectClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if POP.Quit then
  begin

    lStatus.Caption := 'Disconnected';
  end
  else
  begin

    POP.Abort;
    lStatus.Caption := 'Failed on quit';
  end;

  bDisconnect.Enabled := False;
  bRetrieve.Enabled := False;
  bDelete.Enabled := False;
  bUIDL.Enabled := False;
  bConnect.Enabled := True;
  mResponse.Lines.Text := POP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bRetrieveClick(Sender: TObject);
var
  Result: Boolean;

begin

  Screen.Cursor := crHourglass;
  ProgressBar1.Position := 0;
  ProgressBar2.Position := 0;

  lStatus.Caption := 'Retrieving...';

  if cbHeader.Checked then
    Result := POP.RetrieveHeader(StrToInt(eMsgNum.Text))
  else
    Result := POP.RetrieveMessage(StrToInt(eMsgNum.Text));

  if Result then
  begin

    bRefreshClick(Sender);
  end
  else
  begin

    lStatus.Caption := 'Failed on retrieve';
  end;

  mResponse.Lines.Text := Copy(POP.LastResponse, 1, 10000);
  Screen.Cursor := crDefault;
end;

procedure TForm1.bRefreshClick(Sender: TObject);
var
  Loop: Integer;
  Text: String;

begin

  Screen.Cursor := crHourglass;

  SetLength(Text, Msg.Body.Size);

  if Length(Text) > 0 then
  begin

    Msg.Body.Position := 0;
    Msg.Body.ReadBuffer(Text[1], Msg.Body.Size);
  end;

  mHeader.Lines.Text := Copy(Msg.Header.Text, 1, 10000);
  mBody.Lines.Text := Copy(Text, 1, 10000);
  eFromName.Text := Msg.FromName;
  eFromAddress.Text := Msg.FromAddress;
  eReplyName.Text := Msg.ReplyToName;
  eReplyAddress.Text := Msg.ReplyToAddress;
  eSubject.Text := Msg.Subject;
  dtDate.DateTime := Msg.Date;
  dtTime.DateTime := Msg.Date;
  cbPriority.ItemIndex := Ord(Msg.Priority);
  chReceipt.Checked := Msg.ReceiptAddress <> '';

  mToNames.Clear;
  mToAddresses.Clear;
  mCcNames.Clear;
  mCcAddresses.Clear;
  lbFiles.Clear;

  mTextPlain.Lines.Text := Msg.TextPlain.Text;
  mTextHtml.Lines.Text := Msg.TextHTML.Text;

  mToNames.Items.CommaText := Msg.ToList.AllNames;
  mToAddresses.Items.CommaText := Msg.ToList.AllAddresses;

  mCcNames.Items.CommaText := Msg.CcList.AllNames;
  mCcAddresses.Items.CommaText := Msg.CcList.AllAddresses;

  for Loop := 0 to Msg.AttachList.Count-1 do
  begin

    if Msg.AttachList[Loop].Decoded.Size = 0 then
      Msg.AttachList[Loop].Decode;

    if Msg.AttachList[Loop].Embedded then
      lbFiles.Items.Add(Msg.AttachList[Loop].FileName+#32'('+IntToStr(Msg.AttachList[Loop].Decoded.Size)+')'#32+Msg.AttachList[Loop].AttachInfo+#32'Embedded')
    else
      lbFiles.Items.Add(Msg.AttachList[Loop].FileName+#32'('+IntToStr(Msg.AttachList[Loop].Decoded.Size)+')'#32+Msg.AttachList[Loop].AttachInfo);
  end;

  if Msg.NeedFindParts then
    bFindParts.Font.Style := [fsBold]
  else
    bFindParts.Font.Style := [];

  if Msg.NeedNormalize then
    bNormalize.Font.Style := [fsBold]
  else
    bNormalize.Font.Style := [];

  if Msg.NeedRebuild then
    bRebuild.Font.Style := [fsBold]
  else
    bRebuild.Font.Style := [];

  mHops.Clear;

  for Loop := Msg.ReceivedCount-1 downto 0 do
  begin

    mHops.Lines.Add(FormatDateTime('yyyy-mm-dd hh:nn:ss', Msg.Received[Loop].Date)+
                    #32'By ('+Msg.Received[Loop].By+')'+
                    #32'From ('+Msg.Received[Loop].From+')'+
                    #32'For ('+Msg.Received[Loop].Address+')');
  end;

  Screen.Cursor := crDefault;
end;

procedure TForm1.bRebuildClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.RebuildBody;
  bRefreshClick(Sender);
  Screen.Cursor := crDefault;
end;

procedure TForm1.bResetClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.Reset;
  Screen.Cursor := crDefault;
  bRefreshClick(Sender);
end;

procedure TForm1.bLabelClick(Sender: TObject);
begin

  Msg.SetLabelValue(eLabel.Text, eValue.Text);
  bRefreshClick(Sender);
end;

procedure TForm1.bDelLabelClick(Sender: TObject);
begin

  Msg.SetLabelValue(eLabel.Text, '');
  bRefreshClick(Sender);
end;

procedure TForm1.bSaveHeaderClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  Msg.ToList.Clear;
  Msg.CcList.Clear;
  Msg.SetFrom(eFromName.Text, eFromAddress.Text);
  Msg.SetReplyTo(eReplyName.Text, eReplyAddress.Text);
  Msg.Subject := eSubject.Text;
  Msg.Date := Int(dtDate.DateTime) + dtTime.DateTime - Int(dtTime.DateTime);
  Msg.Priority := TMailPriority(cbPriority.ItemIndex);

  if chReceipt.Checked then
    Msg.SetReceipt(eFromName.Text, eFromAddress.Text)
  else
    Msg.SetLabelValue('Disposition-Notification-To', '');

  if mToNames.Items.Count > 0 then
    Msg.ToList.SetAll(mToNames.Items.CommaText, mToAddresses.Items.CommaText);

  if mCcNames.Items.Count > 0 then
    Msg.CcList.SetAll(mCcNames.Items.CommaText, mCcAddresses.Items.CommaText);

  Screen.Cursor := crDefault;
  bRefreshClick(Sender);
end;

procedure TForm1.bSaveClick(Sender: TObject);
begin

  SaveDialog.FileName := Msg.AttachList[lbFiles.ItemIndex].FileName;

  if SaveDialog.Execute then
  begin

    Screen.Cursor := crHourglass;
    Msg.AttachList[lbFiles.ItemIndex].Decoded.SaveToFile(SaveDialog.FileName);
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.bAttachClick(Sender: TObject);
begin

  if OpenDialog.Execute then
  begin

    Screen.Cursor := crHourglass;
    Msg.AttachFile(OpenDialog.FileName, '', cbEmbedded.Checked);
    bRefreshClick(Sender);
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.bPlainClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.SetTextPlain(mTextPlain.Lines.Text);
  bRefreshClick(Sender);
  Screen.Cursor := crDefault;
end;

procedure TForm1.bHtmlClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.SetTextHTML(mTextHtml.Lines.Text);
  bRefreshClick(Sender);
  Screen.Cursor := crDefault;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

  PageControl1.ActivePage := PageControl1.Pages[0];
  PageControl2.ActivePage := PageControl2.Pages[0];
  dtDate.DateTime := Now;
  dtTime.DateTime := Now;
  cbMethod.ItemIndex := 0;
  bRefreshClick(Sender);
end;

procedure TForm1.bSaveMsgClick(Sender: TObject);
begin

  SaveDialog.FileName := 'message.eml';

  if SaveDialog.Execute then
  begin

    Screen.Cursor := crHourglass;
    Msg.SaveToFile(SaveDialog.FileName);
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.bSmtpConnectClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  SMTP.Host := eSmtpHost.Text;
  SMTP.Port := StrToInt(eSmtpPort.Text);
  SMTP.UserName := eUID.Text;
  SMTP.Password := ePWD.Text;
  SMTP.Handshaking := THandshaking(cbMethod.ItemIndex);

  if SMTP.Connect then
  begin

    lSmtpStatus.Caption := 'Connected';

    if cbMethod.ItemIndex = 0 then
    begin

      bSmtpDisconnect.Enabled := True;
      bSmtpConnect.Enabled := False;
      eUID.Enabled := False;
      ePWD.Enabled := False;
      bHelo.Enabled := False;
      bEhlo.Enabled := False;
      bAuthLogin.Enabled := False;
      bLogin.Enabled := False;
      bSend.Enabled := True;
    end
    else
    begin

      bSmtpDisconnect.Enabled := True;
      bSmtpConnect.Enabled := False;
      eUID.Enabled := True;
      ePWD.Enabled := True;
      bHelo.Enabled := True;
      bEhlo.Enabled := True;
      bAuthLogin.Enabled := True;
      bLogin.Enabled := False;
      bSend.Enabled := True;
    end;
  end
  else
  begin

    lSmtpStatus.Caption := 'Failed on connect';
    bSmtpDisconnect.Enabled := True;
    bSmtpConnect.Enabled := False;
    bSend.Enabled := False;
    eUID.Enabled := False;
    ePWD.Enabled := False;
    bHelo.Enabled := False;
    bEhlo.Enabled := False;
    bAuthLogin.Enabled := False;
    bLogin.Enabled := False;
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bSmtpDisconnectClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if SMTP.Quit then
  begin

    lSmtpStatus.Caption := 'Disconnected';
    bSmtpDisconnect.Enabled := False;
    bSmtpConnect.Enabled := True;
    bSend.Enabled := False;
    eUID.Enabled := True;
    ePWD.Enabled := True;
    bHelo.Enabled := False;
    bEhlo.Enabled := False;
    bAuthLogin.Enabled := False;
    bLogin.Enabled := False;
  end
  else
  begin

    SMTP.Abort;
    lSmtpStatus.Caption := 'Failed on quit';
    bSmtpDisconnect.Enabled := False;
    bSmtpConnect.Enabled := False;
    bSend.Enabled := False;
    eUID.Enabled := True;
    ePWD.Enabled := True;
    bHelo.Enabled := False;
    bEhlo.Enabled := False;
    bAuthLogin.Enabled := False;
    bLogin.Enabled := False;
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bSendClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if Msg.NeedRebuild then
  begin

    lSmtpStatus.Caption := 'Message body needs rebuild';
    Exit;
  end;

  lSmtpStatus.Caption := 'Sending...';
  Application.ProcessMessages;

  if SMTP.SendMessage then
  begin

    lSmtpStatus.Caption := 'Message sent';
  end
  else
  begin

    lSmtpStatus.Caption := 'Failed on send';
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bLoadMsgClick(Sender: TObject);
begin

  if OpenDialog.Execute then
  begin

    Screen.Cursor := crHourglass;
    Msg.LoadFromFile(OpenDialog.FileName);
    Screen.Cursor := crDefault;

    bRefreshClick(Sender);
  end;
end;

procedure TForm1.bRemoveClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.DetachFileIndex(lbFiles.ItemIndex);
  Screen.Cursor := crDefault;
  bRefreshClick(Sender);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if POP.SessionConnected or SMTP.SessionConnected then Action := caNone;
end;

procedure TForm1.POPProgress(Sender: TObject; Total, Current: Integer);
begin

  ProgressBar1.Max := Total;
  ProgressBar1.Position := Current;
end;

procedure TForm1.MsgProgress(Sender: TObject; Total, Current: Integer);
begin

  ProgressBar2.Max := Total;
  ProgressBar2.Position := Current;
end;

procedure TForm1.SMTPProgress(Sender: TObject; Total, Current: Integer);
begin

  ProgressBar3.Max := Total;
  ProgressBar3.Position := Current;
end;

procedure TForm1.bPlainRemoveClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.RemoveTextPlain;
  Screen.Cursor := crDefault;
  bRefreshClick(Sender);
end;

procedure TForm1.bHtmlRemoveClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.RemoveTextHTML;
  Screen.Cursor := crDefault;
  bRefreshClick(Sender);
end;

procedure TForm1.bAddToClick(Sender: TObject);
begin

  mToNames.Items.Add(eToName.Text);
  mToAddresses.Items.Add(eToAddress.Text);
  eToName.Text := '';
  eToAddress.Text := '';
end;

procedure TForm1.bAddCcClick(Sender: TObject);
begin

  mCcNames.Items.Add(eToName.Text);
  mCcAddresses.Items.Add(eToAddress.Text);
  eToName.Text := '';
  eToAddress.Text := '';
end;

procedure TForm1.bClearToClick(Sender: TObject);
begin

  mToNames.Clear;
  mToAddresses.Clear;
end;

procedure TForm1.bClearCcClick(Sender: TObject);
begin

  mCcNames.Clear;
  mCcAddresses.Clear;
end;

procedure TForm1.mToNamesClick(Sender: TObject);
begin

  mToAddresses.ItemIndex := mToNames.ItemIndex;
end;

procedure TForm1.mToAddressesClick(Sender: TObject);
begin

  mToNames.ItemIndex := mToAddresses.ItemIndex;
end;

procedure TForm1.mCcNamesClick(Sender: TObject);
begin

  mCcAddresses.ItemIndex := mCcNames.ItemIndex;
end;

procedure TForm1.mCcAddressesClick(Sender: TObject);
begin

  mCcNames.ItemIndex := mCcAddresses.ItemIndex;
end;

procedure TForm1.bNormalizeClick(Sender: TObject);
begin

  Msg.AddHop('somewhere', 'mail2000', '', '');
  Msg.Normalize;
  bRefreshClick(Sender);
end;

procedure TForm1.bDeleteClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if POP.DeleteMessage(StrToInt(eMsgNum.Text)) then
  begin

    mResponse.Lines.Text := Copy(POP.LastResponse, 1, 10000);
    Screen.Cursor := crDefault;
  end
  else
  begin

    ShowMessage('Failed on delete');
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.bUIDLClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  POP.GetUIDL(StrToInt(eMsgNum.Text));
  mResponse.Lines.Text := Copy(POP.LastResponse, 1, 10000);
  Screen.Cursor := crDefault;
end;

procedure TForm1.bAbortClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  POP.Abort;
  lStatus.Caption := 'Aborted';
  bDisconnect.Enabled := False;
  bRetrieve.Enabled := False;
  bDelete.Enabled := False;
  bUIDL.Enabled := False;
  bConnect.Enabled := True;
  mResponse.Lines.Text := '';
  Screen.Cursor := crDefault;
end;

procedure TForm1.bSmtpAbortClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  SMTP.Abort;
  mSmtpResponse.Lines.Text := '';
  bSmtpDisconnect.Enabled := False;
  bSmtpConnect.Enabled := True;
  bSend.Enabled := False;
  eUID.Enabled := True;
  ePWD.Enabled := True;
  bLogin.Enabled := False;
  lSmtpStatus.Caption := 'Aborted';
  Screen.Cursor := crDefault;
end;

procedure TForm1.bHeloClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if SMTP.Helo then
  begin

    lSmtpStatus.Caption := 'HELO succedded';
  end
  else
  begin

    lSmtpStatus.Caption := 'HELO failed';
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bEhloClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if SMTP.Ehlo then
  begin

    lSmtpStatus.Caption := 'EHLO succedded';
  end
  else
  begin

    lSmtpStatus.Caption := 'EHLO failed';
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bAuthLoginClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  if SMTP.AuthLogin then
  begin

    lSmtpStatus.Caption := 'Succedded, please login';
    bSmtpDisconnect.Enabled := False;
    bSmtpConnect.Enabled := False;
    bSend.Enabled := False;
    eUID.Enabled := True;
    ePWD.Enabled := True;
    bHelo.Enabled := False;
    bEhlo.Enabled := False;
    bAuthLogin.Enabled := False;
    bLogin.Enabled := True;
  end
  else
  begin

    lSmtpStatus.Caption := 'AUTH LOGIN failed';
    bSmtpDisconnect.Enabled := True;
    bSmtpConnect.Enabled := False;
    bSend.Enabled := True;
    eUID.Enabled := False;
    ePWD.Enabled := False;
    bHelo.Enabled := True;
    bEhlo.Enabled := True;
    bAuthLogin.Enabled := True;
    bLogin.Enabled := False;
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bLoginClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;

  SMTP.UserName := eUID.Text;
  SMTP.Password := ePWD.Text;

  if SMTP.Login then
  begin

    lSmtpStatus.Caption := 'Authenticated';
    bSmtpDisconnect.Enabled := True;
    bSmtpConnect.Enabled := False;
    bSend.Enabled := True;
    eUID.Enabled := False;
    ePWD.Enabled := False;
    bHelo.Enabled := True;
    bEhlo.Enabled := True;
    bAuthLogin.Enabled := False;
    bLogin.Enabled := False;
  end
  else
  begin

    lSmtpStatus.Caption := 'Login failed';
    bSmtpDisconnect.Enabled := True;
    bSmtpConnect.Enabled := False;
    bSend.Enabled := False;
    eUID.Enabled := True;
    ePWD.Enabled := True;
    bHelo.Enabled := True;
    bEhlo.Enabled := True;
    bAuthLogin.Enabled := True;
    bLogin.Enabled := False;
  end;

  mSmtpResponse.Lines.Text := SMTP.LastResponse;
  Screen.Cursor := crDefault;
end;

procedure TForm1.bFindPartsClick(Sender: TObject);
begin

  Screen.Cursor := crHourglass;
  Msg.FindParts;
  bRefreshClick(Sender);
  Screen.Cursor := crDefault;
end;

end.
