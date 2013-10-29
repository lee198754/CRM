unit Expend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeels, dxBar, dxBarExtItems, ImgList,
  ActnList, XPMenu, ADODB, bainaADOQuery, Menus, frxClass, frxDBSet,
  ComCtrls, cxSplitter, cxContainer, cxTreeView, StdCtrls, cxRadioGroup,
  ExtCtrls, cxLookAndFeelPainters, cxButtons, cxLabel, cxTextEdit, cxGridExportLink,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFrm_Expend = class(TBaseData_Frm)
    GrdExpend: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DSExpend: TDataSource;
    Query: TbainaADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    LAdoExpend: TbainaADOQuery;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel1: TPanel;
    RBNotCheck: TcxRadioButton;
    RBCheck: TcxRadioButton;
    FDate: TcxDateEdit;
    EDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    SaveDlg: TSaveDialog;
    N9: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure GrdExpendCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure RBNotCheckClick(Sender: TObject);
    procedure RBCheckClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure GrdExpendColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure GrdExpendCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    Procedure ShowExpend;
  public
    { Public declarations }
  end;

var
  Frm_Expend: TFrm_Expend;

implementation

uses DataBase, NewExpend, PublicClass;

{$R *.dfm}

{ TFrm_Expend }

procedure TFrm_Expend.ShowExpend;
Var
  I:Integer;
  
  CustColumn:TcxGridDBColumn;
begin
  With DatabaseModule Do
    Begin
      AdoExpend.AliasName:='b';
      AdoExpend.Close;
      AdoExpend.SQL.Clear;
      AdoExpend.SQL.Add('Select a.CustName,b.ExpendMoney,b.ExpendID,B.ExpendID,B.DeptID_,b.CustID,b.ExpendType,b.ExpendOption,B.ExpendDate,b.ExpendMemo,b.CreateBy_,b.CreateD_,B.UpdateBY_,B.UpdateD_,B.BelongID,B.CheckMan,B.CheckDate,B.IFCheck,C.UserName_');
      AdoExpend.SQL.Add(' From Customer a,Expend b,Users_ C Where (B.BelongID='+IntToStr(DtclsData.UserID_));
      if  AdoExpend.AccSQL <> '' Then
      begin
        AdoExpend.SQL.Add(' OR '+AdoExpend.AccSQL);
      END;
      AdoExpend.SQL.Add(')');
      AdoExpend.SQl.Add(' And a.CustID=B.CustID And B.BelongID=C.UserID_');
      IF RBNotCheck.Checked Then AdoExpend.SQL.Add(' And b.IFCheck=0')
      Else AdoExpend.SQL.Add(' And B.IFCheck=1');
      IF (FDate.Text<>'') And (EDate.Text<>'') Then
        Begin
          AdoExpend.SQL.Add(' And b.CreateD_>=:AFDate And b.CreateD_<=:AEDate');
          AdoExpend.Parameters.ParamByName('AFDate').Value:=FDate.Text;
          AdoExpend.Parameters.ParamByName('AEDate').Value:=EDate.Text;
        End;
      AdoExpend.SQL.Add('  Union Select '+' '+''''''+' '+',b.ExpendMoney,b.ExpendID,B.ExpendID,B.DeptID_,b.CustID,b.ExpendType,b.ExpendOption,B.ExpendDate,b.ExpendMemo,b.CreateBy_,b.CreateD_,B.UpdateBY_,B.UpdateD_,B.BelongID,B.CheckMan,B.CheckDate,B.IFCheck,C.UserName_');
      AdoExpend.SQL.Add(' From Expend b,Users_ C Where (B.BelongID='+IntToStr(DtclsData.UserID_));
      if  AdoExpend.AccSQL <> '' Then
      begin
        AdoExpend.SQL.Add(' OR '+AdoExpend.AccSQL);
      END;
      AdoExpend.SQL.Add(')');
      AdoExpend.SQl.Add(' And b.ExpendOption=0 And B.BelongID=C.UserID_');
      IF RBNotCheck.Checked Then AdoExpend.SQL.Add(' And b.IFCheck=0')
      Else AdoExpend.SQL.Add(' And B.IFCheck=1');
      IF (FDate.Text<>'') And (EDate.Text<>'') Then
        Begin
          AdoExpend.SQL.Add(' And b.CreateD_>=:BFDate And b.CreateD_<=:BEDate');
          AdoExpend.Parameters.ParamByName('BFDate').Value:=FDate.Text;
          AdoExpend.Parameters.ParamByName('BEDate').Value:=EDate.Text;
        End;
      AdoExpend.Prepared;
      AdoExpend.Open;
    End;

  IF GrdExpend.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;

  FOR I:=0 TO DSExpend.DataSet.FieldCount - 11 Do
    Begin
      GrdExpend.CreateColumn;
      GrdExpend.Columns[I].Name:='ExpendColumns'+IntToStr(I);
   End;
          GrdExpend.DataController.DataSource:=DSExpend;
          GrdExpend.Columns[0].Caption:='费用类型';
          GrdExpend.Columns[0].DataBinding;
          GrdExpend.Columns[0].DataBinding.FieldName:='ExpendType';
          GrdExpend.Columns[0].DataBinding.ValueType:='String';

          GrdExpend.Columns[1].Caption:='费用金额';
          GrdExpend.Columns[1].DataBinding;
          GrdExpend.Columns[1].DataBinding.FieldName:='ExpendMoney';
          GrdExpend.Columns[1].DataBinding.ValueType:='Float';
          //GrdExpend.Columns[1].Width:=150;

          GrdExpend.Columns[2].Caption:='发生日期';
          GrdExpend.Columns[2].DataBinding;
          GrdExpend.Columns[2].DataBinding.FieldName:='ExpendDate';
          GrdExpend.Columns[2].DataBinding.ValueType:='Datetime';

          GrdExpend.Columns[3].Caption:='业务归属';
          GrdExpend.Columns[3].DataBinding;
          GrdExpend.Columns[3].DataBinding.FieldName:='UserName_';
          GrdExpend.Columns[3].DataBinding.ValueType:='String';

          GrdExpend.Columns[4].Caption:='是否审核';
          GrdExpend.Columns[4].DataBinding;
          GrdExpend.Columns[4].DataBinding.FieldName:='IFCheck';
          GrdExpend.Columns[4].DataBinding.ValueType:='Boolean';
          GrdExpend.Columns[4].Width:=60;

          GrdExpend.Columns[5].Caption:='审核人';
          GrdExpend.Columns[5].DataBinding;
          GrdExpend.Columns[5].DataBinding.FieldName:='CheckMan';
          GrdExpend.Columns[5].DataBinding.ValueType:='String';

          GrdExpend.Columns[6].Caption:='审核日期';
          GrdExpend.Columns[6].DataBinding;
          GrdExpend.Columns[6].DataBinding.FieldName:='CheckDate';
          GrdExpend.Columns[6].DataBinding.ValueType:='Datetime';

          GrdExpend.Columns[7].Caption:='相关客户';
          GrdExpend.Columns[7].DataBinding;
          GrdExpend.Columns[7].DataBinding.FieldName:='CustName';
          GrdExpend.Columns[7].DataBinding.ValueType:='String';
          GrdExpend.Columns[7].Width:=150;

          GrdExpend.Columns[8].Caption:='费用备注';
          GrdExpend.Columns[8].DataBinding;
          GrdExpend.Columns[8].DataBinding.FieldName:='ExpendMemo';
          GrdExpend.Columns[8].DataBinding.ValueType:='String';
          GrdExpend.Columns[8].Width:=150;


   with TcxGridDBTableSummaryItem(
       GrdExpend.DataController.Summary.FooterSummaryItems.Add) do
       begin
         CustColumn:=GrdExpend.Columns[1];
         CustColumn.DataBinding.FieldName :=
         GrdExpend.DataController.DataSet.Fields[1].FieldName;
         Column  :=  CustColumn;
         //DisplayText:='费用总额';
         FieldName :=  CustColumn.DataBinding.FieldName;
         //Format  :=  '#,##0.00';
         Kind  :=  skSum;
       end;

end;

procedure TFrm_Expend.FormShow(Sender: TObject);
begin
  inherited;
  GrdExpend.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'ini\Expend.ini');
  DatabaseModule.AdoExpend.AllowCheckAcc := True;
  ShowExpend;
end;

procedure TFrm_Expend.N2Click(Sender: TObject);
Var
  RecordMark:TBookMark;
begin
  inherited;

  IF (DSExpend.DataSet.IsEmpty) Then Exit;
  IF DSExpend.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
    Begin
      Application.MessageBox('费用已审核,不能再修改.','警告',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF LAdoExpend.ModifyAcc(DSExpend.DataSet.FieldByName('BelongID').AsInteger) = False Then
    Begin
      Application.MessageBox('你没有修改该资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End
  Else
    Begin
      RecordMark:=Nil;
      With DatabaseModule Do
      Begin
        IF AdoExpend.State=DSBrowse Then
          Begin
            IF Not (AdoExpend.IsEmpty) Then
              Begin
                RecordMark:=AdoExpend.GetBookmark;
              End;
          End;
      End;
      ISAdd:=False;
      ISEdit:=True;
      PNExpend:=2;
      Frm_NewExpend:=TFrm_NewExpend.Create(Self);
      Frm_NewExpend.ShowModal;
      ShowExpend;
      IF RecordMark<>Nil Then
        Begin
          Databasemodule.AdoExpend.GotoBookmark(RecordMark);
          Databasemodule.AdoExpend.FreeBookmark(RecordMark);
        End;
    End;
end;

procedure TFrm_Expend.N8Click(Sender: TObject);
begin
  inherited;
  ShowExpend;
end;

procedure TFrm_Expend.N5Click(Sender: TObject);
begin
  inherited;
  IF (DSExpend.DataSet.IsEmpty) Then Exit;
  IF (Not Self.Access.RCheck) Then
        Begin
          Application.MessageBox('你没有审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
  //AdoSale.Check(DSSaleM.DataSet.FieldByname('SaleMID').AsInteger,'SaleMID');
  LAdoExpend.Close;
  LAdoExpend.SQL.Clear;
  LAdoExpend.SQL.Add('Update Expend Set IFCheck=:IFCheck,CheckMan=:CheckMan,CheckDate=:CheckDate Where ExpendID=:ExpendID');
  LAdoExpend.Parameters.ParamByName('IFCheck').Value:=Boolean(1);
  LAdoExpend.Parameters.ParamByName('CheckMan').Value:=DatabaseModule.dtclsData.UserName_;
  LAdoExpend.Parameters.ParamByName('CheckDate').Value:=Date;
  LAdoExpend.Parameters.ParamByName('ExpendID').Value:=DSExpend.DataSet.FieldByName('ExpendID').AsInteger;
  LAdoExpend.ExecSQL;
  ShowExpend;
end;

procedure TFrm_Expend.N6Click(Sender: TObject);
begin
  inherited;
  IF (DSExpend.DataSet.IsEmpty) Then Exit;
  IF (Not Self.Access.Runcheck) Then
        Begin
          Application.MessageBox('你没有审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
  LAdoExpend.Close;
  LAdoExpend.SQL.Clear;
  LAdoExpend.SQL.Add('Update Expend Set IFCheck=:IFCheck,CheckMan=:CheckMan,CheckDate=:CheckDate Where ExpendID=:ExpendID');
  LAdoExpend.Parameters.ParamByName('IFCheck').Value:=Boolean(0);
  LAdoExpend.Parameters.ParamByName('CheckMan').Value:=DatabaseModule.dtclsData.UserName_;
  LAdoExpend.Parameters.ParamByName('CheckDate').Value:=Date;
  LAdoExpend.Parameters.ParamByName('ExpendID').Value:=DSExpend.DataSet.FieldByName('ExpendID').AsInteger;
  LAdoExpend.ExecSQL;
  ShowExpend;
end;

procedure TFrm_Expend.N3Click(Sender: TObject);
begin
  inherited;
  IF DSExpend.DataSet.IsEmpty Then Exit;
  IF DSExpend.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
    Begin
      Application.MessageBox('费用已审核,不能再删除.','警告',MB_OK+MB_Iconwarning);
      Exit;
    End;
  IF LAdoExpend.DeleteAcc(DSExpend.DataSet.FieldByName('BelongID').AsInteger) = False Then
    Begin
      Application.MessageBox('你没有删除该资料的权限.','提示',MB_OK+MB_Iconwarning);
      Exit;
    End;
  LAdoExpend.Close;
  LAdoExpend.SQL.Clear;
  LAdoExpend.SQL.Add('Delete Expend Where ExpendID=:ExpendID');
  LAdoExpend.Parameters.ParamByName('ExpendID').Value:=DSExpend.DataSet.FieldByName('ExpendID').AsInteger;
  LAdoExpend.ExecSQL;
  ShowExpend;
end;

procedure TFrm_Expend.N1Click(Sender: TObject);
begin
  inherited;
  IF Self.Access.RAdd Then
    Begin
      ISAdd:=True;
      ISEdit:=False;
      PNExpend:=2;
      Frm_NewExpend:=TFrm_NewExpend.Create(Self);
      Frm_NewExpend.EdtName.Enabled:=False;
      Frm_NewExpend.ShowModal;
      DSExpend.DataSet.Last;
      ShowExpend;
    End
  Else
    Application.MessageBox('你没有新增记录的权限','提示',MB_OK+MB_Iconwarning);  
end;

procedure TFrm_Expend.GrdExpendCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not DSExpend.DataSet.IsEmpty Then
    Begin
      ISBrowse:=True;
      PNExpend:=2;
      Frm_NewExpend:=TFrm_NewExpend.Create(Self);
      Frm_NewExpend.ShowModal;
    End;
end;

procedure TFrm_Expend.RBNotCheckClick(Sender: TObject);
begin
  inherited;
  ShowExpend;
end;

procedure TFrm_Expend.RBCheckClick(Sender: TObject);
begin
  inherited;
  ShowExpend;
end;

procedure TFrm_Expend.cxButton1Click(Sender: TObject);
begin
  inherited;
  ShowExpend;
end;

procedure TFrm_Expend.N9Click(Sender: TObject);
begin
  inherited;
  IF SaveDlg.Execute Then
    ExportGridToExcel(SaveDlg.FileName ,CXGrid1);
end;

procedure TFrm_Expend.GrdExpendColumnSizeChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  GrdExpend.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\Expend.ini');
end;

procedure TFrm_Expend.GrdExpendCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  GrdExpend.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\Expend.ini');
end;

end.
