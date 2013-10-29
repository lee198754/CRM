unit CustContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, DB, ADODB, bainaADOQuery, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxGraphics, cxMemo,
  cxDropDownEdit, cxCalendar, cxButtonEdit, cxMaskEdit, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter;

type
  TFrm_CustContact = class(TBaseData_Frm)
    DSContact: TDataSource;
    cxLabel1: TcxLabel;
    ContactName: TcxTextEdit;
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
    ContactSex: TcxComboBox;
    ContactDuty: TcxButtonEdit;
    ContactBirthday: TcxDateEdit;
    Contactwork: TcxTextEdit;
    ContactFamily: TcxTextEdit;
    ContactMobil: TcxTextEdit;
    ContactQQ: TcxTextEdit;
    ContactEmail: TcxTextEdit;
    ContactAdd: TcxTextEdit;
    ContactMemo: TcxMemo;
    cxLabel12: TcxLabel;
    ContactDept: TcxButtonEdit;
    BtnAdd: TcxButton;
    BtnEdit: TcxButton;
    BtnSave: TcxButton;
    BtnClose: TcxButton;
    cxLabel13: TcxLabel;
    EdtFax: TcxTextEdit;
    ContactValue: TcxButtonEdit;
    cxLabel14: TcxLabel;
    BtnSaveAdd: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure ContactDutyClick(Sender: TObject);
    procedure ContactDeptClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ContactValueClick(Sender: TObject);
    procedure BtnSaveAddClick(Sender: TObject);
  private
    { Private declarations }
    Procedure EdtReadColor(Readonly:Boolean;Color:TColor);
    procedure AddDict(FTableName,LFieldName: String; LIFCust: Integer);
    Procedure SaveRecord;
  public
    { Public declarations }
  end;

var
  Frm_CustContact: TFrm_CustContact;

implementation

uses DataBase, DictOther, PublicClass;

{$R *.dfm}

Var
  ISAdd,ISEdit:Boolean;

{ TFrm_CustContact }

procedure TFrm_CustContact.EdtReadColor(Readonly: Boolean; Color: TColor);
begin
  ContactName.Properties.ReadOnly:=Readonly;
  ContactValue.Properties.ReadOnly:=Readonly;
  ContactSex.Properties.ReadOnly:=Readonly;
  ContactDept.Properties.ReadOnly:=Readonly;
  ContactBirthday.Properties.ReadOnly:=Readonly;
  ContactDuty.Properties.ReadOnly:=Readonly;
  ContactFamily.Properties.ReadOnly:=Readonly;
  ContactWork.Properties.ReadOnly:=Readonly;
  EdtFax.Properties.ReadOnly:=Readonly;
  ContactMobil.Properties.ReadOnly:=Readonly;
  ContactQQ.Properties.ReadOnly:=Readonly;
  ContactEmail.Properties.ReadOnly:=Readonly;
  ContactAdd.Properties.ReadOnly:=Readonly;
  ContactMemo.Properties.ReadOnly:=Readonly;

  ContactName.Style.Color:=Color;
  ContactValue.Style.Color:=Color;
  ContactSex.Style.Color:=Color;
  ContactDept.Style.Color:=Color;
  ContactBirthday.Style.Color:=Color;
  ContactDuty.Style.Color:=Color;
  ContactFamily.Style.Color:=Color;
  ContactWork.Style.Color:=Color;
  EdtFax.Style.Color:=Color;
  ContactMobil.Style.Color:=Color;
  ContactQQ.Style.Color:=Color;
  ContactEmail.Style.Color:=Color;
  ContactAdd.Style.Color:=Color;
  ContactMemo.Style.Color:=Color;
end;

procedure TFrm_CustContact.FormCreate(Sender: TObject);
begin
  inherited;
  IF ISBrowse=True Then
    Begin
      BtnEdit.Click;
      BtnSave.Visible:=False;
      BtnSaveAdd.Visible:=False;
    End;
  EdtReadColor(True,ClBtnFace);
end;

procedure TFrm_CustContact.BtnAddClick(Sender: TObject);
begin
  inherited;
  ContactName.Text:='';
  ContactValue.Text:='';
  ContactSex.Text:='';
  ContactDept.Text:='';
  ContactBirthday.Text:='';
  ContactDuty.Text:='';
  ContactFamily.Text:='';
  ContactWork.Text:='';
  EdtFax.Text:='';
  ContactMobil.Text:='';
  ContactQQ.Text:='';
  ContactEmail.Text:='';
  ContactAdd.Text:='';
  ContactMemo.Text:='';
  ISAdd:=True;
  ISEdit:=False;
  EdtReadColor(False,ClWhite);
end;

procedure TFrm_CustContact.BtnEditClick(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
    Begin
      ContactName.Text:=AdoContact.FieldByName('ContactName').AsString;
      ContactValue.Text:=AdoContact.FieldByName('ContactValue').AsString;
      ContactSex.Text:=AdoContact.FieldByName('ContactSex').AsString;
      ContactDept.Text:=AdoContact.FieldByName('Department').AsString;
      ContactBirthday.Text:=AdoContact.FieldByName('ContactBirthday').AsString;
      ContactDuty.Text:=AdoContact.FieldByName('ContactDuty').AsString;
      ContactFamily.Text:=AdoContact.FieldByName('ContactFamilyPhone').AsString;
      ContactWork.Text:=AdoContact.FieldByName('ContactWorkPhone').AsString;
      EdtFax.Text:=AdoContact.FieldByName('ContactFax').AsString;
      ContactMobil.Text:=AdoContact.FieldByName('ContactMobile').AsString;
      ContactQQ.Text:=AdoContact.FieldByName('ContactICQ').AsString;
      ContactEmail.Text:=AdoContact.FieldByName('ContactEmail').AsString;
      ContactAdd.Text:=AdoContact.FieldByName('ContactAddress').AsString;
      ContactMemo.Text:=AdoContact.FieldByName('ContactMemo').AsString;
    end;
  ISAdd:=False;
  ISEdit:=True;
  EdtReadColor(False,ClWhite);
end;

procedure TFrm_CustContact.BtnSaveClick(Sender: TObject);
begin
  inherited;
  BtnSave.Tag:=1;
  BtnSaveAdd.Tag:=0;
  SaveRecord;
end;

procedure TFrm_CustContact.cxButton3Click(Sender: TObject);
begin
  inherited;
  EdtReadColor(True,ClBtnFace);
end;

procedure TFrm_CustContact.BtnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrm_CustContact.AddDict(FTableName,LFieldName: String; LIFCust: Integer);
begin
  With DatabaseModule DO
     Begin
       AdoDictOther.Close;
       AdoDictOther.SQL.Clear;
       AdoDictOther.SQL.Add('Select * from DictOther where FieldName=:FieldName');
       AdoDictOther.Parameters.ParamByName('FieldName').Value:=LFieldName;
       AdoDictOther.Prepared;
       AdoDictOther.Open;

       AdoDictOther.FieldByName('DictID').Visible:=False;
       AdoDictOther.FieldByName('FieldName').Visible:=False;
       AdoDictOther.FieldByName('IFCust').Visible:=False;
       AdoDictOther.FieldByName('Context').DisplayLabel:=LFieldName;
     End;
  Frm_Dictother:=TFrm_Dictother.Create(Self);
  Frm_Dictother.FTableName:=FTableName;
  Frm_Dictother.DictDuty:=LFieldName;
  Frm_Dictother.DictIFCust:=LIFCust;
  Frm_Dictother.FrmName:='Frm_CustContact';
  Frm_Dictother.ShowModal;
end;

procedure TFrm_CustContact.ContactDutyClick(Sender: TObject);
begin
  inherited;
  IF ContactDuty.Properties.ReadOnly=True Then Exit
  Else AddDict('ContactDuty','职务',0);
end;

procedure TFrm_CustContact.ContactDeptClick(Sender: TObject);
begin
  inherited;
  IF ContactDept.Properties.ReadOnly=True Then Exit
  Else AddDict('DepartMent','部门',0);
end;

procedure TFrm_CustContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Frm_CustContact.Tag:=0;
  ISBrowse:=False;
  ISAdd:=False;
  ISEdit:=False;
  ISCust:=False;
  Action:=CaFree;
end;

procedure TFrm_CustContact.ContactValueClick(Sender: TObject);
begin
  inherited;
  IF ContactValue.Properties.ReadOnly=True Then Exit
  Else AddDict('ContactValue','人物属性',0);
end;

procedure TFrm_CustContact.SaveRecord;
begin
  IF ContactName.Text='' Then
  Begin
    Application.MessageBox('联系人名不能空','提示',MB_OK+MB_IconInformation);
    Exit;
  End;
  if not DataBaseModule.IsCheckAdd then
  begin
    Application.MessageBox(PChar('现在客户数已经大于等于 '+IntToStr(c_ALLOWCOUNT)+' ,如需要继续添加客户请插入加密狗!'),'提示',MB_OK+MB_Iconwarning);
    Exit;
  end;
  IF ISAdd=True Then
    Begin
      With DatabaseModule Do
        Begin
          DtClsData.BeginTrans;
          Try
          AdoContact.Append;
          IF ISCust Then
            Begin
              AdoContact.FieldByName('CustID').AsInteger:=AdoCust.fieldbyname('CustID').AsInteger

            End
          Else
            Begin
              AdoContact.FieldByName('CustID').AsInteger:=AdoSupply.fieldbyname('CustID').AsInteger;

            End;
          AdoContact.FieldByName('ContactName').AsString:=ContactName.Text;
          AdoContact.FieldByName('ContactValue').AsString:=ContactValue.Text;
          AdoContact.FieldByName('DepartMent').AsString:=ContactDept.Text;
          AdoContact.FieldByName('ContactSex').AsString:=ContactSex.Text;
          AdoContact.FieldByName('ContactDuty').AsString:=ContactDuty.Text;

          IF ContactBirthday.Text='' Then AdoContact.FieldByName('ContactBirthday').Value:=Null
          Else AdoContact.FieldByName('ContactBirthday').AsDateTime:=ContactBirthday.Date;

          AdoContact.FieldByName('ContactWorkPhone').AsString:=ContactWork.Text;
          AdoContact.FieldByName('ContactFamilyphone').AsString:=ContactFamily.Text;
          AdoContact.FieldByName('ContactFax').AsString:=EdtFax.Text;
          AdoContact.FieldByName('ContactMobile').AsString:=ContactMobil.Text;
          AdoContact.FieldByName('ContactICQ').AsString:=ContactQQ.Text;
          AdoContact.FieldByName('ContactEmail').AsString:=ContactEmail.Text;
          AdoContact.FieldByName('ContactAddress').AsString:=ContactAdd.Text;
          AdoContact.FieldByName('ContactMemo').AsString:=ContactMemo.Text;
          AdoContact.FieldByName('CreateD_').AsDateTime:=Now;
          AdoContact.FieldByName('CreateBy_').AsString:=DtClsData.UserName_;
          AdoContact.FieldByName('BelongID').AsInteger:=DtClsData.UserID_;
          AdoContact.Post;
          DtClsData.CommitTrans;
          Except
          DtClsData.RollbackTrans;
          Raise;
          End;
        End;
    End;
  IF ISEdit=True Then
    Begin
      With DatabaseModule Do
        Begin
          DtClsData.BeginTrans;
          Try
          AdoContact.Edit;
          IF ISCust Then
            Begin
              AdoContact.FieldByName('CustID').AsInteger:=AdoCust.fieldbyname('CustID').AsInteger

            End
          Else
            Begin
              AdoContact.FieldByName('CustID').AsInteger:=AdoSupply.fieldbyname('CustID').AsInteger;

            End;
          AdoContact.FieldByName('ContactName').AsString:=ContactName.Text;
          AdoContact.FieldByName('ContactValue').AsString:=ContactValue.Text;
          AdoContact.FieldByName('DepartMent').AsString:=ContactDept.Text;
          AdoContact.FieldByName('ContactSex').AsString:=ContactSex.Text;
          AdoContact.FieldByName('ContactDuty').AsString:=ContactDuty.Text;

          IF ContactBirthday.Text='' Then AdoContact.FieldByName('ContactBirthday').Value:=Null
          Else AdoContact.FieldByName('ContactBirthday').AsDateTime:=ContactBirthday.Date;

          AdoContact.FieldByName('ContactWorkPhone').AsString:=ContactWork.Text;
          AdoContact.FieldByName('ContactFamilyphone').AsString:=ContactFamily.Text;
          AdoContact.FieldByName('ContactFax').AsString:=EdtFax.Text;
          AdoContact.FieldByName('ContactMobile').AsString:=ContactMobil.Text;
          AdoContact.FieldByName('ContactICQ').AsString:=ContactQQ.Text;
          AdoContact.FieldByName('ContactEmail').AsString:=ContactEmail.Text;
          AdoContact.FieldByName('ContactAddress').AsString:=ContactAdd.Text;
          AdoContact.FieldByName('ContactMemo').AsString:=ContactMemo.Text;
          AdoContact.FieldByName('UpdateD_').AsDateTime:=Now;
          AdoContact.FieldByName('UpdateBy_').AsString:=DtClsData.UserName_;
          //AdoContact.FieldByName('BelongID').AsInteger:=DtClsData.UserID_;
          AdoContact.Post;
          DtClsData.CommitTrans;
          Except
          DtClsData.RollbackTrans;
          Raise;
          End;
        End;
    End;
  IF BtnSave.Tag=1 Then Btnclose.Click;
  IF BtnSaveAdd.Tag=1 Then BtnAdd.Click;
end;

procedure TFrm_CustContact.BtnSaveAddClick(Sender: TObject);
begin
  inherited;
  BtnSave.Tag:=0;
  BtnSaveAdd.Tag:=1;
  SaveRecord;
end;

end.
