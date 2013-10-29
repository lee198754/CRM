unit FileCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, DB, ADODB, bainaADOQuery, ComCtrls, dxtree,
  dxdbtree, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxLabel, cxContainer, cxTextEdit, ExtCtrls, ShellApi, cxSplitter;

type
  TFrm_FileCenter = class(TBaseData_Frm)
    TVFileType: TdxDBTreeView;
    AdoFileType: TbainaADOQuery;
    DSFileType: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GrdFile: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    BtnSure: TcxButton;
    EdtType: TcxTextEdit;
    cxLabel1: TcxLabel;
    BtnExit: TcxButton;
    Query: TbainaADOQuery;
    OpenDialog1: TOpenDialog;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    DSFile: TDataSource;
    N7: TMenuItem;
    SaveDialog1: TSaveDialog;
    LCustFile: TbainaADOQuery;
    cxSplitter1: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TVFileTypeChange(Sender: TObject; Node: TTreeNode);
    procedure N3Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure GrdFileCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_FileCenter: TFrm_FileCenter;

implementation

uses DataBase, PublicClass, Customer;

{$R *.dfm}

procedure TFrm_FileCenter.FormCreate(Sender: TObject);
begin
  inherited;
  AdoFileType.Close;
  AdoFileType.SQL.Clear;
  AdoFileType.SQL.Add('Select ParentID,FileSelfID,TypeName,BelongID From FileType where BelongID=:belongID');
  AdoFileType.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
  AdoFileType.Prepared;
  AdoFileType.Open;

  TVFileType.ParentField:='ParentID';
  TVFileType.KeyField:='FileSelfID';
  TVFileType.ListField:='TypeName';
end;

procedure TFrm_FileCenter.N1Click(Sender: TObject);
begin
  inherited;
  IF TVFileType.Selected=Nil Then EdtType.Text:=DataBaseModule.dtclsData.UserName_+'的文档'
  Else EdtType.Text:='';
  ISAdd:=True;
  Panel1.Visible:=True;
  TVFileType.Enabled:=False;
  CXGrid1.Enabled:=False;
  EdtType.SetFocus;
end;

procedure TFrm_FileCenter.N2Click(Sender: TObject);
begin
  inherited;
  ISEdit:=True;
  Panel1.Visible:=True;
  TVFileType.Enabled:=False;
  CXGrid1.Enabled:=False;
  EdtType.Text:= AdoFileType.FieldByname('TypeName').AsString;
  EdtType.SetFocus;
end;

procedure TFrm_FileCenter.BtnExitClick(Sender: TObject);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  Panel1.Visible:=False;
  TVFileType.Enabled:=True;
  CXGrid1.Enabled:=True;
end;

procedure TFrm_FileCenter.BtnSureClick(Sender: TObject);
Var
  ParentID,SelfID:String;
  RecCount:Integer;
begin
  inherited;
  IF TVFileType.Selected=Nil Then
    Begin
      AdoFileType.Append;
      AdoFileType.FieldByName('ParentID').AsString:=IntToStr(DatabaseModule.dtclsData.UserID_);
      AdoFileType.FieldByName('FileSelfID').AsString:=IntToStr(DatabaseModule.dtclsData.UserID_)+'1';
      AdoFileType.FieldByName('TypeName').AsString:=EdtType.Text;
      AdoFileType.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoFileType.Post;
      AdoFileType.Refresh;

      BtnExit.Click;
    End;
  ParentID:=AdoFileType.FieldByname('ParentID').AsString;
  SelfID:=AdoFileType.FieldByname('FileSelfID').AsString;
  IF ISAdd=True Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select ParentID,FileSelfID,TypeName from FileType Where ParentID=:ParentID');
      Query.Parameters.ParamByName('ParentID').Value:=SelfID;
      Query.Prepared;
      Query.Open;
      RecCount:=Query.RecordCount+1;
      Query.Close;

      AdoFileType.Append;
      AdoFileType.FieldByName('ParentID').AsString:=SelfID;
      AdoFileType.FieldByName('FileSelfID').AsString:=SelfID+IntToStr(RecCount);
      AdoFileType.FieldByName('TypeName').AsString:=EdtType.Text;
      AdoFileType.FieldByName('BelongID').AsInteger:=DatabaseModule.dtclsData.UserID_;
      AdoFileType.Post;
    End;
  IF ISEdit=True Then
    Begin
      AdoFileType.Edit;
      AdoFileType.FieldByName('TypeName').AsString:=EdtType.Text;
      AdoFileType.Post;
    End;

  AdoFileType.Refresh;

  BtnExit.Click;
end;

procedure TFrm_FileCenter.N4Click(Sender: TObject);
Var
  FileName,FilePath,ShareFilePath,ShareUser,SharePwd,ShareFileName:String;
begin
  inherited;

  IF TVFileType.Selected=Nil Then Exit;
  IF DatabaseModule.AdoShareSet.IsEmpty Then
    Begin
      Application.MessageBox('请先设置共享文件夹','提示',MB_OK+MB_Iconwarning);
      Exit;
    End
  Else
    Begin
      ShareUser:= DataBaseModule.AdoShareSet.FieldByName('ShareUser').AsString;
      SharePwd:= DataBaseModule.AdoShareSet.FieldByName('SharePwd').AsString;
      ShareFilePath:= DataBaseModule.AdoShareSet.FieldByName('SharePath').AsString;
      WinExec(PChar('net use '+ShareFilePath+' /user:'+ShareUser+' '+Sharepwd), SW_HIDE);
    End;
    
  IF Opendialog1.Execute Then
    Begin
      FileName:=Opendialog1.FileName;
      FilePath:=ExtractFilePath(FileName);
      ShareFileName:=ExtractFileName(Filename);
      IF Not DirectoryExists(ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_) Then
        Begin
          ForceDirectories(ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_);
          CopyFile(Pchar(FilePath+ShareFileName),Pchar(ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_+'\'+ShareFileName),False);
        End
      Else
        Begin
          IF FileExists(ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_+'\'+ShareFileName) Then
            Begin
              Application.MessageBox('该文件已存在,或者文件名重复.','提示',MB_OK+MB_Iconwarning);
              Exit;
            End
          Else
            Begin
              CopyFile(Pchar(FilePath+ShareFileName),Pchar(ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_+'\'+ShareFileName),False);
            End;
        End;
      IF FileExists(ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_+'\'+ShareFileName) Then
        Begin
        With DatabaseModule Do
          Begin
          AdoFile.Append;
          AdoFile.FieldByName('DeptID_').AsInteger:=DtClsData.DeptID_;
          AdoFile.FieldByName('UserID').AsInteger:=DtClsData.UserID_;
          //AdoFile.FieldByName('CustID').AsInteger:=AdoCust.fieldbyname('CustID').AsInteger;
          AdoFile.FieldByName('FileType').AsString:=AdoFileType.FieldByname('TypeName').AsString;
          AdoFile.FieldByName('MyFileName').AsString:=ShareFileName;//ExtractFileName(Filename);
          AdoFile.FieldByName('FilePath').AsString:=ShareFilePath+'\'+DatabaseModule.dtclsData.UserName_;//FilePath;
          AdoFile.FieldByName('FileSelfID').AsString:=AdoFileType.fieldbyname('FileSelfID').AsString;
          AdoFile.FieldByName('CreateBy_').AsString:=DtClsData.UserName_;
          AdoFile.FieldByName('CreateD_').AsDateTime:=Date;
          AdoFile.FieldByName('BelongID').AsInteger:=DtclsData.UserID_;
          AdoFile.Post;
          AdoFile.Refresh;
          End;
        End
      Else Application.MessageBox('网络故障,文件导入失败.','提示',MB_OK+MB_Iconwarning);
    End;
end;

procedure TFrm_FileCenter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DatabaseModule Do
    Begin
      {IF FrmRec=1 Then
        Begin
          AdoFile.Close;
          AdoFile.SQL.Clear;
          AdoFile.SQL.Add('Select MyFileName,BelongID,DeptID_,UserID,CustID,FileType,ProJNum,FilePath,FileSelfID,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoFile.SQL.Add(' From FileCenter Where CustID=:CustID');
          AdoFile.Parameters.ParamByName('CustID').Value:=AdoCust.fieldByName('CustID').AsInteger;
          AdoFile.Prepared;
          AdoFile.Open;
        End;
      IF FrmRec=0 Then
        Begin
          AdoFile.Close;
          AdoFile.SQL.Clear;
          AdoFile.SQL.Add('Select MyFileName,BelongID,DeptID_,UserID,CustID,FileType,ProJNum,FilePath,FileSelfID,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoFile.SQL.Add(' From FileCenter Where BelongID=:BelongID');
          AdoFile.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
          AdoFile.Prepared;
          AdoFile.Open;
        End;}
    End;
end;

procedure TFrm_FileCenter.TVFileTypeChange(Sender: TObject;
  Node: TTreeNode);
Var
  I:Integer;  
begin
  inherited;
   With DatabaseModule Do
    Begin
      //IF PNFile=1 Then
        Begin
          AdoFile.Close;
          AdoFile.SQL.Clear;
          AdoFile.SQL.Add('Select FileID,MyFileName,BelongID,DeptID_,UserID,CustID,FileType,ProJNum,FilePath,FileSelfID,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoFile.SQL.Add(' From FileCenter Where BelongID=:BelongID');
          AdoFile.Parameters.ParamByName('BelongID').Value:=Dtclsdata.UserID_;
          IF AdoFileType.FieldByName('ParentID').AsString<>'1' Then
            Begin
              AdoFile.SQL.Add(' And FileSelfID=:FileSelfID');
              AdoFile.Parameters.ParamByName('FileSelfID').Value:=AdoFileTYpe.fieldByname('FileSelfID').AsString;
            End;
          AdoFile.Prepared;
          AdoFile.Open;
        End;
      {IF PNFile=0 Then
        Begin
          AdoFile.Close;
          AdoFile.SQL.Clear;
          AdoFile.SQL.Add('Select FileID,MyFileName,BelongID,DeptID_,UserID,CustID,FileType,ProJNum,FilePath,FileSelfID,CreateBy_,CreateD_,UpdateBy_,UpdateD_');
          AdoFile.SQL.Add(' From FileCenter Where BelongID=:BelongID');
          AdoFile.Parameters.ParamByName('BelongID').Value:=DtClsData.UserID_;
          IF AdoFileType.FieldByName('ParentID').AsString<>'1' Then
            Begin
              AdoFile.SQL.Add(' And FileSelfID=:FileSelfID');
              AdoFile.Parameters.ParamByName('FileSelfID').Value:=AdoFileTYpe.fieldByname('FileSelfID').AsString;
            End;
          AdoFile.Prepared;
          AdoFile.Open;
        End;}
    End;
  IF DatabaseModule.AdoFile.State=DSBrowse Then
    Begin
      IF GrdFile.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
      GrdFile.OptionsView.ScrollBars:=SSNone;
      FOR I:=0 TO DataBaseModule.AdoFile.FieldCount - 12 Do
        Begin
          GrdFile.CreateColumn;
          GrdFile.Columns[I].Name:='FileColumns'+IntToStr(I);
        End;
          GrdFile.DataController.DataSource:=DSFile;
          GrdFile.Columns[0].Caption:='文件名称';
          GrdFile.Columns[0].DataBinding;
          GrdFile.Columns[0].DataBinding.FieldName:='MYFileName';
          GrdFile.Columns[0].DataBinding.ValueType:='String';

          GrdFile.Columns[1].Caption:='文件类型';
          GrdFile.Columns[1].DataBinding;
          GrdFile.Columns[1].DataBinding.FieldName:='FileType';
          GrdFile.Columns[1].DataBinding.ValueType:='String';
          GrdFile.Columns[1].Width:=150;

          GrdFile.Columns[2].Caption:='创建日期';
          GrdFile.Columns[2].DataBinding;
          GrdFile.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdFile.Columns[2].DataBinding.ValueType:='Datetime';

       GrdFile.OptionsView.ScrollBars:=SSBoth;
    End;
end;

procedure TFrm_FileCenter.N3Click(Sender: TObject);
begin
  inherited;
  IF PNFile=1 Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from FileCenter Where FileSelfID=:FileSelfID And CustID=:CustID');
      Query.Parameters.ParamByName('FileSelfID').Value:=AdoFileType.FieldByName('FileSelfID').AsString;
      Query.Parameters.ParamByName('CustID').Value:=DatabaseModule.AdoCust.Fieldbyname('CustID').AsInteger;
      Query.Prepared;
      Query.Open;
    End;
  IF PNFile=2 Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select * from FileCenter Where FileSelfID=:FileSelfID And BelongID=:BelongID');
      Query.Parameters.ParamByName('FileSelfID').Value:=AdoFileType.FieldByName('FileSelfID').AsString;
      Query.Parameters.ParamByName('BelongID').Value:=DatabaseModule.dtclsData.UserID_;
      Query.Prepared;
      Query.Open;
    End;

      IF Query.IsEmpty Then
        Begin
          AdoFileType.Delete;
          AdoFileType.Refresh;
        End
      Else
        Begin
          IF  Application.MessageBox('该分类下有文件存,请确认是否要删除该分类?','提示',MB_YESNO+MB_IconWarning)=IDYES Then
            Begin
              AdoFileType.Delete;
              AdoFileType.Refresh;
            End;
        End;
end;

procedure TFrm_FileCenter.N7Click(Sender: TObject);
begin
  inherited;
  IF DSFile.DataSet.IsEmpty Then Exit;
  With DatabaseModule Do
    Begin
      IF Application.MessageBox('该操作不会删除相关文件,是否要删除该记录?','提示',MB_YESNO+MB_IconWarning)=IDYES Then AdoFile.Delete;
    End;
end;

procedure TFrm_FileCenter.N5Click(Sender: TObject);
Var
  FIleName,ShareFilePath,SharePwd,ShareUSer:String;
begin
  inherited;
  IF Not (DSFile.DataSet.IsEmpty) Then
    Begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('Select UserName_ From Users_ Where UserID_=:UserID');
      Query.Parameters.ParamByName('UserID').Value:=DSFile.DataSet.FieldByName('BelongID').AsInteger;
      Query.Prepared;
      Query.Open;
      ShareUser:= DataBaseModule.AdoShareSet.FieldByName('ShareUser').AsString;
      SharePwd:= DataBaseModule.AdoShareSet.FieldByName('SharePwd').AsString;
      ShareFilePath:= DataBaseModule.AdoShareSet.FieldByName('SharePath').AsString+'\'+Query.FieldByName('UserName_').AsString;
      WinExec(PChar('net use '+ShareFilePath+' /user:'+ShareUser+' '+Sharepwd), SW_HIDE);
      IF DirectoryExists(ShareFilePath) Then
        Begin
          FileName:=ShareFilePath+'\'+DSFile.DataSet.fieldbyname('MyFilename').AsString;
          IF FileExists(FileName) Then
            shellexecute(handle,'open',pchar(Filename),'','',Sw_show)
          Else Application.MessageBox('文件不存在','提示',MB_OK+MB_Iconwarning);
        End
      Else  Application.MessageBox('共享文件夹不存在,可能被删除.','提示',MB_OK+MB_Iconwarning);
    End;
end;

procedure TFrm_FileCenter.GrdFileCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  With DatabaseModule DO
    Begin
      IF AdoFile.IsEmpty Then Exit;
      Case PNFile OF
      1:Begin  //客户管理
          Dtclsdata.BeginTrans;
          Try
            AdoFile.Edit;
            AdoFile.FieldByName('CustID').AsInteger:=AdoCust.FieldByName('CustID').AsInteger;
            AdoFile.Post;
            LCustFile.Close;
            LCustFile.SQL.Clear;
            LCustFile.SQL.Add('Insert into CustFile(FileIDM,CustID,BelongID) values(:FileIDM,:CustID,:BelongID)');
            LCustFile.Parameters.ParamByName('FileIDM').Value:= AdoFile.FieldByName('FileID').AsInteger;
            LCustFile.Parameters.ParamByName('CustID').Value:= AdoCust.FieldByName('CustID').AsInteger;
            LCustFile.Parameters.ParamByName('BelongID').Value:=AdoFile.FieldByName('BelongID').AsInteger;
            LCustFile.Prepared;
            LCustFile.ExecSQL;
            PNFile:=0;
            Dtclsdata.CommitTrans;
            Close;
          Except
            DtclsData.RollbackTrans;
            Raise;
          End;
        End;
      2:Begin
          Dtclsdata.BeginTrans;
          Try
            AdoFile.Edit;
            AdoFile.FieldByName('CustID').AsInteger:=AdoContract.FieldByName('CustID').AsInteger;
            AdoFile.Post;
            //合同管理
            LCustFile.Close;
            LCustFile.SQL.Clear;
            LCustFile.SQL.Add('Insert into ContractFile(FileIDM,ContractID,CustID,BelongID) values(:FileIDM,:ContractID,:CustID,:BelongID)');
            LCustFile.Parameters.ParamByName('FileIDM').Value:= AdoFile.FieldByName('FileID').AsInteger;
            LCustFile.Parameters.ParamByName('ContractID').Value:=AdoContract.FieldByName('ContractID').AsInteger;
            LCustFile.Parameters.ParamByName('CustID').Value:= AdoContract.FieldByName('CustID').AsInteger;
            LCustFile.Parameters.ParamByName('BelongID').Value:=AdoFile.FieldByName('BelongID').AsInteger;
            LCustFile.Prepared;
            LCustFile.ExecSQL;
            PNFile:=0;
            DtclsData.CommitTrans;
            Close;
          Except
            DtclsData.RollbackTrans;
            Raise;
          End;
        End;
      End;

  //机会管理
  //项目管理
    End;

end;

end.
