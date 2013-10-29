unit AddUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxGraphics, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxMemo, cxButtonEdit, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxCheckBox, cxLabel, cxContainer, cxEdit, cxTextEdit,
  Buttons, cxPC, cxControls, dxBar, cxLookAndFeels, dxBarExtItems,
  cxClasses, ImgList, ActnList, XPMenu;

type
  TFrm_AddUser = class(TBaseData_Frm)
    BtnSave: TcxButton;
    BtnCancel: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    SpeedButton3: TSpeedButton;
    UserNum: TcxTextEdit;
    UserName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    UserSystem: TcxCheckBox;
    UserStop: TcxCheckBox;
    UserSex: TcxComboBox;
    UserDept: TcxComboBox;
    UserIn: TcxDateEdit;
    UserOut: TcxDateEdit;
    UserDuty: TcxButtonEdit;
    UserCard: TcxTextEdit;
    UserWPhone: TcxTextEdit;
    UserFPhone: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel17: TcxLabel;
    UserICQ: TcxTextEdit;
    UserMobil: TcxTextEdit;
    UserEmail: TcxTextEdit;
    UserAddress: TcxTextEdit;
    UserMemo: TcxMemo;
    UserBirthday: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure EditReadonly(Readonly: Boolean ; Color:TColor);
  public
    { Public declarations }
  end;

var
  Frm_AddUser: TFrm_AddUser;

implementation

uses PublicClass;

{$R *.dfm}

{ TFrm_AddUser }

procedure TFrm_AddUser.EditReadonly(Readonly: Boolean; Color: TColor);
Begin
IF (ISAdd=True) And (ISEdit=False) Then
    Begin
      UserNum.Text:='';
      UserName.Text:='';
      UserSex.Text:='';
      UserDept.Text:='';
      UserDuty.Text:='';
      UserIn.Text:='';
      UserOut.Text:='';
      UserStop.Checked:=False;
      UserSystem.Checked:=False;
      UserBirthday.Text:='';
      UserCard.Text:='';
      Userwphone.Text:='';
      Userfphone.Text:='';
      Usermobil.Text:='';
      UserICQ.Text:='';
      UserEmail.Text:='';
      UserAddress.Text:='';
      UserMemo.Text:='';
    End;
  IF ISEdit=True Then UserNum.Properties.ReadOnly:=Not Readonly
  Else UserNum.Properties.ReadOnly:=Readonly;
  
  UserName.Properties.ReadOnly:=Readonly;
  UserSex.Properties.ReadOnly:=Readonly;
  UserDept.Properties.ReadOnly:=Readonly;
  UserDuty.Properties.ReadOnly:=Readonly;
  UserIn.Properties.ReadOnly:= Readonly;
  UserOut.Properties.ReadOnly:=Readonly;
  UserStop.Enabled:=Not Readonly;
  UserSystem.Enabled:=Not Readonly;
  UserBirthday.Properties.Readonly:=Readonly;
  UserCard.Properties.ReadOnly:=Readonly;
  Userwphone.Properties.ReadOnly:=Readonly;
  Userfphone.Properties.ReadOnly:=Readonly;
  Usermobil.Properties.ReadOnly:=Readonly;
  UserICQ.Properties.ReadOnly:=Readonly;
  UserEmail.Properties.ReadOnly:=Readonly;
  UserAddress.Properties.ReadOnly:=Readonly;
  UserMemo.Properties.ReadOnly:=Readonly;

  UserNum.Style.Color:=Color;
  UserName.Style.Color:=Color;
  UserSex.Style.Color:=Color;
  UserDept.Style.Color:=Color;
  UserDuty.Style.Color:=Color;
  UserIn.Style.Color:=Color;
  UserOut.Style.Color:=Color;
  UserBirthday.Style.Color:=Color;
  UserCard.Style.Color:=Color;
  Userwphone.Style.Color:=Color;
  Userfphone.Style.Color:=Color;
  Usermobil.Style.Color:=Color;
  UserICQ.Style.Color:=Color;
  UserEmail.Style.Color:=Color;
  UserAddress.Style.Color:=Color;
  UserMemo.Style.Color:=Color;

end;

procedure TFrm_AddUser.FormCreate(Sender: TObject);
begin
  inherited;
   EditReadonly(False,Clwhite);
end;

end.
