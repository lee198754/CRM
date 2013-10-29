unit EMailSelectLinkman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrom, XPMenu, StdCtrls, ExtCtrls, CheckLst, ComCtrls,
  dxtree, dxdbtree, DB, ADODB, bainaADOQuery, ImgList, Grids, DBGrids,
  Buttons;

type
  TEMailSelectLinkman_Frm = class(TBase_Frm)
    pnl1: TPanel;
    pnl2: TPanel;
    Button1: TButton;
    NoteType: TdxDBTreeView;
    spl1: TSplitter;
    bndqryNoteType: TbainaADOQuery;
    dsNoteType: TDataSource;
    imList: TImageList;
    bndqryNote: TbainaADOQuery;
    dsNote: TDataSource;
    strngfldNoteFriendName: TStringField;
    strngfldNoteFriendDpart: TStringField;
    strngfldNoteFriendEmail: TStringField;
    dbgrd1: TDBGrid;
    btnok: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure NoteTypeChange(Sender: TObject; Node: TTreeNode);
    procedure Button1Click(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EMailSelectLinkman_Frm: TEMailSelectLinkman_Frm;

implementation

{$R *.dfm}
uses
  DataClass,DataBase;
procedure TEMailSelectLinkman_Frm.FormCreate(Sender: TObject);
var
  msql:String;
begin
  inherited;
  msql := 'Select * From  NoteType Where BelongID ='+
      Inttostr(DataBaseModule.dtclsData.UserID_);
  bndqryNoteType.Close;
  bndqryNoteType.SQL.Text := msql;
  bndqryNoteType.Open;
end;

procedure TEMailSelectLinkman_Frm.NoteTypeChange(Sender: TObject;
  Node: TTreeNode);
var
  msql:String;
begin
  inherited;
  if bndqryNoteType.Locate('TypeName',Node.Text,[]) Then
  Begin
    msql := 'Select * From Note where BelongID = '+
      Inttostr(DataBaseModule.dtclsData.UserID_);
    if bndqryNoteType.FieldByName('ParentId').AsInteger <> 1 Then
        msql := msql + ' and NoteSelfID = '+  bndqryNoteType.FieldByName('NoteSelfID').AsString;
    bndqryNote.Close;
    bndqryNote.SQL.Text := msql;
    bndqryNote.Open;
  End;
end;

procedure TEMailSelectLinkman_Frm.Button1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TEMailSelectLinkman_Frm.dbgrd1DblClick(Sender: TObject);
begin
  inherited;
  btnok.Click;
end;

end.
