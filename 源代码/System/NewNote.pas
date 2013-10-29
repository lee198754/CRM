unit NewNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxGraphics, cxMemo, cxButtonEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses, ImgList,
  ActnList, XPMenu, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TFrm_NewNote = class(TBaseData_Frm)
    EdtName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    EdtSex: TcxComboBox;
    EdtBirthday: TcxDateEdit;
    EdtDpart: TcxButtonEdit;
    EdtDuty: TcxButtonEdit;
    EdtWPhone: TcxTextEdit;
    EdtFPhone: TcxTextEdit;
    EdtMobile: TcxTextEdit;
    EdtICQ: TcxTextEdit;
    EdtEmail: TcxTextEdit;
    EdtAddress: TcxTextEdit;
    EdtMemo: TcxMemo;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure EdtDpartClick(Sender: TObject);
    procedure EdtDutyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AddDict(FTableName,LFieldName: String; LIFCust: Integer);
    Procedure ClearEdt;
    Procedure ShowNoteRecord;
  public
    NoteSelfID:Integer;
  end;

var
  Frm_NewNote: TFrm_NewNote;

implementation

uses PublicClass, DataBase, Dict, Dictother;

{$R *.dfm}

procedure TFrm_NewNote.ClearEdt;
begin
  EdtName.Text:='';
  EdtSex.Text:='男';
  EdtBirthday.Date:=Date;
  EdtDpart.Text:='';
  EdtDuty.Text:='';
  EdtWphone.Text:='';
  EdtFPhone.Text:='';
  EdtMobile.Text:='';
  EdtICQ.Text:='';
  EdtEmail.Text:='';
  EdtAddress.Text:='';
  EdtMemo.Text:='';
end;

procedure TFrm_NewNote.FormCreate(Sender: TObject);
begin
  inherited;
  IF ISAdd=True Then
    Begin
      ClearEdt;
    End;
  IF ISEdit=True Then
    Begin
      ShowNoteRecord;
    End;
  IF ISBrowse=True Then
    Begin
      ShowNoteRecord;
      BtnSure.Visible:=False;
    End;
end;

procedure TFrm_NewNote.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_NewNote.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF EdtName.Text='' Then
    Begin
      Application.MessageBox('姓名不能为空','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  With DatabaseModule Do
    Begin
      DtclsData.BeginTrans;
      Try
        IF ISAdd=True Then
          Begin
            AdoNote.Append;
            AdoNote.FieldByName('BelongID').AsInteger:=DtclsData.UserID_;
            AdoNote.FieldByName('FriendName').AsString:=EdtName.Text;
            AdoNote.FieldByName('FriendSex').AsString:=EdtSex.Text;
            AdoNote.FieldByName('FriendDPart').AsString:=EdtDPart.Text;
            AdoNote.FieldByName('FriendDuty').AsString:=EdtDuty.Text;
            AdoNote.FieldByName('FriendWorkPhone').AsString:=EdtWPhone.Text;
            AdoNote.FieldByName('FriendFamilyPhone').AsString:=EdtFPhone.Text;
            AdoNote.FieldByName('FriendMobile').AsString:=EdtMobile.Text;
            AdoNote.FieldByName('FriendICQ').AsString:=EdtICQ.Text;
            AdoNote.FieldByName('FriendEmail').AsString:=EdtEmail.Text;
            AdoNote.FieldByName('FriendAddress').AsString:=EdtAddress.Text;
            AdoNote.FieldByName('FriendMemo').AsString:=EdtMemo.Text;
            IF EdtBirthday.Text='' Then AdoNote.FieldByName('FriendBirthday').Value:=Null
            Else AdoNote.FieldByName('FriendBirthday').AsDateTime:=EdtBirthday.Date;
            AdoNote.FieldByName('CreateBy_').AsString:=DtclsData.UserName_;
            AdoNote.FieldByName('CreateD_').AsDateTime:=Date;
            AdoNote.FieldByName('BelongID').AsInteger:=DtclsData.UserID_;
            AdoNote.FieldByName('NoteSelfID').Value:=Inttostr(NoteSelfID);
            AdoNote.Post;
            DtClsData.CommitTrans;
            ClearEdt;
          End;
        IF ISEdit=True Then
          Begin
            AdoNote.Edit;
            AdoNote.FieldByName('BelongID').AsInteger:=DtclsData.UserID_;
            AdoNote.FieldByName('FriendName').AsString:=EdtName.Text;
            AdoNote.FieldByName('FriendSex').AsString:=EdtSex.Text;
            AdoNote.FieldByName('FriendDPart').AsString:=EdtDPart.Text;
            AdoNote.FieldByName('FriendDuty').AsString:=EdtDuty.Text;
            AdoNote.FieldByName('FriendWorkPhone').AsString:=EdtWPhone.Text;
            AdoNote.FieldByName('FriendFamilyPhone').AsString:=EdtFPhone.Text;
            AdoNote.FieldByName('FriendMobile').AsString:=EdtMobile.Text;
            AdoNote.FieldByName('FriendICQ').AsString:=EdtICQ.Text;
            AdoNote.FieldByName('FriendEmail').AsString:=EdtEmail.Text;
            AdoNote.FieldByName('FriendAddress').AsString:=EdtAddress.Text;
            AdoNote.FieldByName('FriendMemo').AsString:=EdtMemo.Text;
            IF EdtBirthday.Text='' Then AdoNote.FieldByName('FriendBirthday').Value:=Null
            Else AdoNote.FieldByName('FriendBirthday').AsDateTime:=EdtBirthday.Date;
            AdoNote.FieldByName('UpdateBy_').AsString:=DtclsData.UserName_;
            AdoNote.FieldByName('UpdateD_').AsDateTime:=Date;
            AdoNote.Post;
            DtClsData.CommitTrans;
            BtnExit.Click;
          End;
      Except
        DtclsData.RollbackTrans;
        Raise;
      End;
    End;
end;

procedure TFrm_NewNote.AddDict(FTableName,LFieldName: String; LIFCust: Integer);
begin
  With DatabaseModule DO
     Begin
       AdoDictother.Close;
       AdoDictother.SQL.Clear;
       AdoDictother.SQL.Add('Select * from Dictother where FieldName=:FieldName');
       AdoDictother.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDictother.Prepared;
       AdoDictother.Open;

       AdoDictother.FieldByName('DictID').Visible:=False;
       AdoDictother.FieldByName('FieldName').Visible:=False;
       AdoDictother.FieldByName('IFCust').Visible:=False;
       AdoDictother.FieldByName('Context').DisplayLabel:=LFieldName;
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:=FTableName;
  Frm_Dictother.DictDuty:=LFieldName;
  Frm_Dictother.DictIFCust:=LIFCust;
  Frm_Dictother.FrmName:='Frm_NewNote';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_NewNote.EdtDpartClick(Sender: TObject);
begin
  inherited;
  IF EdtDpart.Properties.ReadOnly=True Then Exit
  Else AddDict('DepartMent','部门',0);
end;

procedure TFrm_NewNote.EdtDutyClick(Sender: TObject);
begin
  inherited;
  IF EdtDpart.Properties.ReadOnly=True Then Exit
  Else AddDict('FriendDuty','职务',0);
end;

procedure TFrm_NewNote.ShowNoteRecord;
begin
  With DatabaseModule Do
        Begin
          EdtName.Text:=AdoNote.FieldByName('FriendName').AsString;
          EdtSex.Text:=AdoNote.FieldByName('FriendSex').AsString;
          IF AdoNote.FieldByName('FriendBirthday').Value=Null Then EdtBirthday.Text:=''
          Else EdtBirthday.Date:=AdoNote.FieldByName('FriendBirthday').AsDateTime;
          EdtDPart.Text:=AdoNote.FieldByName('FriendDPart').AsString;
          EdtDuty.Text:=AdoNote.FieldByName('FriendDuty').AsString;
          EdtWPhone.Text:=AdoNote.FieldByName('FriendWorkPhone').AsString;
          EdtFPhone.Text:=AdoNote.FieldByName('FriendFamilyPhone').AsString;
          EdtMobile.Text:=AdoNote.FieldByName('FriendMobile').AsString;
          EdtICQ.Text:=AdoNote.FieldByName('FriendICQ').AsString;
          EdtEmail.Text:=AdoNote.FieldByName('FriendEmail').AsString;
          EdtAddress.Text:=AdoNote.FieldByName('FriendAddress').AsString;
          EdtMemo.Text:=AdoNote.FieldByName('FriendMemo').AsString;
        End;
end;

procedure TFrm_NewNote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  ISBrowse:=False;
  Action:=CaFree;
end;

end.
