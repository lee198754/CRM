unit BaseFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,cxPC,Menus, XPMenu;

type
  TBase_Frm = class(TForm)
    xpmn1: TXPMenu;
  private
    FAlignment: TAlignment;
    procedure SetAlignment(Value: TAlignment);
    procedure Paint;override;
  protected
    procedure DoClose(var Action: TCloseAction);override;
  public
    constructor Create(AOwner: TComponent);override;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment default taCenter;
  end;

var
  Base_Frm: TBase_Frm;

implementation

{$R *.dfm}

{ TBase_Frm }

procedure TBase_Frm.DoClose(var Action: TCloseAction);
var
  i:Integer;
  tabname:String;
begin
  inherited;
  if Self = nil Then Exit;
  if Self.Parent <> nil Then
  Begin
    if  Self.Parent.ClassType = TCxTabsheet Then
    Begin
      if TCxTabSheet(Self.Parent).PageControl.PopupMenu <> nil Then
      Begin
        for i := TPopUpMenu(TCxTabSheet(Self.Parent).PageControl.PopupMenu).Items.Count -1  downto 0 Do
        Begin
          tabname := TPopUpMenu(TCxTabSheet(Self.Parent).PageControl.PopupMenu).Items[i].Name;
          tabname := Copy(tabname,4,Length(tabname) -3);
          if TCxTabsheet(Self.Parent).Name = tabname Then
          Begin
             TPopUpMenu(TCxTabSheet(Self.Parent).PageControl.PopupMenu).Items[i].Free;
             TCxTabSheet(Self.Parent).PageControl.Pages[TCxTabsheet(Self.Parent).TabIndex].Free;
             Exit;
          End;
        End;
      End;
      TCxTabsheet(Self.Parent).Free;
    End;
  End;
  Self := nil;
end;

procedure TBase_Frm.SetAlignment(Value: TAlignment);
begin
  FAlignment := Value;
  Invalidate;
end;

procedure TBase_Frm.Paint;
begin
  inherited;
end;

constructor TBase_Frm.Create(AOwner: TComponent);
var
  fcaption:String;
  i,TextWidth,TextLeft:integer;
  Rect:TRect;
  MyStr:String;
begin
  inherited Create(AOwner);
  fAlignment := taCenter;
  FCaption:=Self.Caption;

end;
end.














