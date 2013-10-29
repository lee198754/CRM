unit Note;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, DB, ADODB, bainaADOQuery, ComCtrls, dxtree,
  dxdbtree, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses, ImgList,
  ActnList, XPMenu, Menus, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxLookAndFeelPainters, cxLabel,
  cxContainer, cxTextEdit, StdCtrls, cxButtons, ExtCtrls, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridExportLink, cxSplitter;

type
  TFrm_Note = class(TBaseData_Frm)
    NoteType: TdxDBTreeView;
    LAdoNoteType: TbainaADOQuery;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GrdNote: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    BtnSure: TcxButton;
    EdtType: TcxTextEdit;
    cxLabel1: TcxLabel;
    BtnExit: TcxButton;
    Query: TbainaADOQuery;
    LDSNoteType: TDataSource;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DSNote: TDataSource;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    DlgSave1: TSaveDialog;
    cxSplitter1: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure NoteTypeChange(Sender: TObject; Node: TTreeNode);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure GrdNoteCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Note: TFrm_Note;

implementation

uses DataBase, PublicClass, NewNote;

{$R *.dfm}

procedure TFrm_Note.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoNoteType.Close;
  LAdoNoteType.SQL.Clear;
  LAdoNoteType.SQL.Add('Select ParentID,NoteSelfID,TypeName,BelongID From NoteType where BelongID=:belongID');
  LAdoNoteType.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
  LAdoNoteType.Prepared;
  LAdoNoteType.Open;

  NoteType.ParentField:='ParentID';
  NoteType.KeyField:='NoteSelfID';
  NoteType.ListField:='TypeName';
end;

procedure TFrm_Note.N1Click(Sender: TObject);begin
  inherited;
  IF NoteType.Selected=Nil Then EdtType.Text:=DataBaseModule.dtclsData.UserName_+'的通讯录'
  Else EdtType.Text:='';
  ISAdd:=True;
  ISEdit:=False;
  Panel1.Visible:=True;
  NoteType.Enabled:=False;
  CXGrid1.Enabled:=False;
  EdtType.SetFocus;
end;

procedure TFrm_Note.N2Click(Sender: TObject);
begin
  inherited;
  ISEdit:=True;
  ISAdd:=False;
  Panel1.Visible:=True;
  NoteType.Enabled:=False;
  CXGrid1.Enabled:=False;
  EdtType.Text:= LAdoNoteType.FieldByname('TypeName').AsString;
  EdtType.SetFocus;
end;

procedure TFrm_Note.BtnSureClick(Sender: TObject);
Var
  ParentID,SelfID:String;
  RecCount:Integer;
begin
  inherited;
  IF NoteType.Selected=Nil Then
    Begin
      LAdoNoteType.Append;
      LAdoNoteType.FieldByName('ParentID').AsString:=IntToStr(DatabaseModule.dtclsData.UserID_);
      LAdoNoteType.FieldByName('NoteSelfID').AsString:=IntToStr(DatabaseModule.dtclsData.UserID_)+'1';
      LAdoNoteType.FieldByName('TypeName').AsString:=EdtType.Text;
      LAdoNoteType.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      LAdoNoteType.Post;
      LAdoNoteType.Refresh;

      BtnExit.Click;
    End;
  ParentID:=LAdoNoteType.FieldByname('ParentID').AsString;
  SelfID:=LAdoNoteType.FieldByname('NoteSelfID').AsString;
  IF ISAdd=True Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select ParentID,NoteSelfID,TypeName from NoteType Where ParentID=:ParentID');
      Query.Parameters.ParamByName('ParentID').Value:=SelfID;
      Query.Prepared;
      Query.Open;
      RecCount:=Query.RecordCount+1;
      Query.Close;

      LAdoNoteType.Append;
      LAdoNoteType.FieldByName('ParentID').AsString:=SelfID;
      LAdoNoteType.FieldByName('NoteSelfID').AsString:=SelfID+IntToStr(RecCount);
      LAdoNoteType.FieldByName('TypeName').AsString:=EdtType.Text;
      LAdoNoteType.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      LAdoNoteType.Post;
    End;
  IF ISEdit=True Then
    Begin
      LAdoNoteType.Edit;
      LAdoNoteType.FieldByName('TypeName').AsString:=EdtType.Text;
      LAdoNoteType.Post;
    End;

  LAdoNoteType.Refresh;

  BtnExit.Click;
end;

procedure TFrm_Note.BtnExitClick(Sender: TObject);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  Panel1.Visible:=False;
  NoteType.Enabled:=True;
  CXGrid1.Enabled:=True;
end;

procedure TFrm_Note.N3Click(Sender: TObject);
begin
  inherited;

      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from Note Where NoteSelfID=:NoteSelfID And BelongID=:BelongID');
      Query.Parameters.ParamByName('NoteSelfID').Value:=LAdoNoteType.FieldByName('NoteSelfID').AsString;
      Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
      Query.Prepared;
      Query.Open;

      IF Query.IsEmpty Then
        Begin
          LAdoNoteType.Delete;
          LAdoNoteType.Refresh;
        End
      Else
        Begin
          Application.MessageBox('该分类下有资料存在,不能删除该分类?','提示',MB_YESNO+MB_IconWarning);
        End;
end;

procedure TFrm_Note.NoteTypeChange(Sender: TObject; Node: TTreeNode);
Var
  I:Integer;  
begin
  inherited;
   With DatabaseModule Do
    Begin
          AdoNote.Close;
          AdoNote.SQL.Clear;
          AdoNote.SQL.Add('Select NoteID,BelongID,NoteSelfID,FriendName,FriendDpart,');
          AdoNote.SQL.Add('FriendSex,FriendDuty,FriendBirthday,FriendWorkPhone,FriendFamilyPhone,FriendMobile,FriendICQ,');
          AdoNote.SQL.Add('FriendEmail,FriendAddress,FriendMemo,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoNote.SQL.Add(' From Note Where BelongID=:BelongID');
          AdoNote.Parameters.ParamByName('BelongID').Value:=Dtclsdata.UserID_;
          IF LAdoNoteType.FieldByName('ParentID').AsString<>'1' Then
            Begin
              AdoNote.SQL.Add(' And NoteSelfID=:NoteSelfID');
              AdoNote.Parameters.ParamByName('NoteSelfID').Value:=LAdoNoteTYpe.fieldByname('NoteSelfID').AsString;
            End;
          AdoNote.Prepared;
          AdoNote.Open;
    End;
  IF DatabaseModule.AdoNote.State=DSBrowse Then
    Begin
      IF GrdNote.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

      FOR I:=0 TO DataBaseModule.AdoNote.FieldCount - 8 Do
        Begin
          GrdNote.CreateColumn;
          GrdNote.Columns[I].Name:='FileColumns'+IntToStr(I);
        End;
          GrdNote.DataController.DataSource:=DSNote;
          GrdNote.Columns[0].Caption:='姓名';
          GrdNote.Columns[0].DataBinding;
          GrdNote.Columns[0].DataBinding.FieldName:='FriendName';
          GrdNote.Columns[0].DataBinding.ValueType:='String';

          GrdNote.Columns[1].Caption:='部门';
          GrdNote.Columns[1].DataBinding;
          GrdNote.Columns[1].DataBinding.FieldName:='FriendDPart';
          GrdNote.Columns[1].DataBinding.ValueType:='String';
          GrdNote.Columns[1].Width:=150;

          GrdNote.Columns[2].Caption:='性别';
          GrdNote.Columns[2].DataBinding;
          GrdNote.Columns[2].DataBinding.FieldName:='FriendSex';
          GrdNote.Columns[2].DataBinding.ValueType:='String';

          GrdNote.Columns[3].Caption:='职务';
          GrdNote.Columns[3].DataBinding;
          GrdNote.Columns[3].DataBinding.FieldName:='FriendDuty';
          GrdNote.Columns[3].DataBinding.ValueType:='String';

          GrdNote.Columns[4].Caption:='生日';
          GrdNote.Columns[4].DataBinding;
          GrdNote.Columns[4].DataBinding.FieldName:='FriendBirthday';
          GrdNote.Columns[4].DataBinding.ValueType:='Datetime';

          GrdNote.Columns[5].Caption:='工作电话';
          GrdNote.Columns[5].DataBinding;
          GrdNote.Columns[5].DataBinding.FieldName:='FriendWorkPhone';
          GrdNote.Columns[5].DataBinding.ValueType:='String';

          GrdNote.Columns[6].Caption:='家庭电话';
          GrdNote.Columns[6].DataBinding;
          GrdNote.Columns[6].DataBinding.FieldName:='FriendFamilyPhone';
          GrdNote.Columns[6].DataBinding.ValueType:='String';

          GrdNote.Columns[7].Caption:='手机';
          GrdNote.Columns[7].DataBinding;
          GrdNote.Columns[7].DataBinding.FieldName:='FriendMobile';
          GrdNote.Columns[7].DataBinding.ValueType:='String';

          GrdNote.Columns[8].Caption:='ICQ';
          GrdNote.Columns[8].DataBinding;
          GrdNote.Columns[8].DataBinding.FieldName:='FriendICQ';
          GrdNote.Columns[8].DataBinding.ValueType:='String';

          GrdNote.Columns[9].Caption:='邮箱';
          GrdNote.Columns[9].DataBinding;
          GrdNote.Columns[9].DataBinding.FieldName:='FriendEmail';
          GrdNote.Columns[9].DataBinding.ValueType:='String';

          GrdNote.Columns[10].Caption:='地址';
          GrdNote.Columns[10].DataBinding;
          GrdNote.Columns[10].DataBinding.FieldName:='FriendAddress';
          GrdNote.Columns[10].DataBinding.ValueType:='String';

          GrdNote.Columns[11].Caption:='备注';
          GrdNote.Columns[11].DataBinding;
          GrdNote.Columns[11].DataBinding.FieldName:='FriendMemo';
          GrdNote.Columns[11].DataBinding.ValueType:='String';

    End;
end;

procedure TFrm_Note.N4Click(Sender: TObject);
begin
  inherited;
  IF NoteType.Items.Count=0 Then Exit;
  ISAdd:=True;
  ISEdit:=False;
  Frm_NewNote:=TFrm_NewNote.Create(Self);
  Frm_newNote.NoteSelfID := LAdoNoteType.FieldByname('NoteSelfID').AsInteger;
  Frm_NewNote.ShowModal;
end;

procedure TFrm_Note.N5Click(Sender: TObject);
begin
  inherited;
  IF DSNote.DataSet.IsEmpty Then Exit;
  ISEdit:=True;
  ISAdd:=False;
  Frm_NewNote:=TFrm_NewNote.Create(Self);
  Frm_NewNote.ShowModal;
end;

procedure TFrm_Note.N6Click(Sender: TObject);
begin
  inherited;
  IF DSNote.DataSet.IsEmpty Then Exit
  Else
    Begin
      IF Application.MessageBox('是否真的要删除该记录?','提示',MB_YESNO+MB_Iconwarning)=IDYes Then DSNote.DataSet.Delete;
    End;
end;

procedure TFrm_Note.N8Click(Sender: TObject);
begin
  inherited;
  if dlgSave1.Execute then
  ExportGridToExcel(dlgSave1.FileName ,cxGrid1);
end;

procedure TFrm_Note.GrdNoteCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF DSNote.DataSet.IsEmpty Then Exit;
  ISBrowse:=True;
  Frm_NewNote:=TFrm_NewNote.Create(Self);
  Frm_NewNote.ShowModal;
end;

procedure TFrm_Note.FormShow(Sender: TObject);
begin
  inherited;
  Self.LoadReport(PopupMenu2);
  Self.AddReportdataSet(DataBaseModule.AdoPre);
end;

end.
