unit ImportData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxLookAndFeels, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ADODB, cxGridExportLink, cxContainer,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxDropDownEdit ,ComObj, cxCheckBox,
  bainaADOQuery, ComCtrls ;

type
  TFrm_ImportData = class(TForm)
    cxButtonEdit1: TcxButtonEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    qry2: TADOQuery;
    ds2: TDataSource;
    btn3: TcxButton;
    btn4: TcxButton;
    btn5: TcxButton;
    dlgOpen1: TOpenDialog;
    cxgrdbclmnGridDBTableView1FieldName_1: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1FieldNote_1: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1selectvalue: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1FieldType_1: TcxGridDBColumn;
    cxgrdbclmnGridDBTableView1FieldLen_1: TcxGridDBColumn;
    lbl2: TLabel;
    cxtxtdt1: TcxTextEdit;
    Label1: TLabel;
    cxTextEdit1: TcxTextEdit;
    lbl3: TLabel;
    cxtxtdt2: TcxTextEdit;
    ADOQuery1: TADOQuery;
    cxLookAndFeelController1: TcxLookAndFeelController;
    lbl1: TLabel;
    NewCust: TbainaADOQuery;
    InsertQry: TbainaADOQuery;
    LAdoArrearage: TbainaADOQuery;
    Query: TbainaADOQuery;
    PB: TProgressBar;
    procedure btn5Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     //comboxproper: TcxComboBoxProperties;
     comboxproper : TcxComboBoxProperties ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_ImportData: TFrm_ImportData;

implementation

uses Preview, DataBase;



{$R *.dfm}

procedure TFrm_ImportData.btn5Click(Sender: TObject);
begin
 close ;
end;

procedure TFrm_ImportData.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  WorkBook, ExcelApp: OleVariant;
  Filename:string;
  i, rowumnnum ,Columnnum:Integer;
  ColCaption:string;
begin
  if dlgOpen1.Execute then
  begin
    cxButtonEdit1.Text := dlgOpen1.FileName;
    comboxproper.Items.Clear ;
    Filename:=dlgOpen1.FileName;
    ExcelApp:= CreateOLEObject('Excel.Application');
    WorkBook:= ExcelApp.WorkBooks.Open(Filename);
    Columnnum:= ExcelApp.Cells.CurrentRegion.Rows.Count; // 导入行数
    cxTextEdit1.Text:=IntToStr(Columnnum-1);
    Columnnum:= ExcelApp.Cells.CurrentRegion.Columns.Count; //导入列数
    cxtxtdt2.Text:=IntToStr(Columnnum);
    try
      for i:= 1 to Columnnum  do
       begin
         ColCaption:=WorkBook.WorkSheets[1].Cells[1,i];
         comboxproper.Items.Add(ColCaption);
       end;
    cxgrdbclmnGridDBTableView1selectvalue.Properties:=comboxproper;
    finally
      ExcelApp.Quit;
    end;
  end ;
end;

procedure TFrm_ImportData.FormCreate(Sender: TObject);
begin
   ADOQuery1.Close ;
   ADOQuery1.ExecSQL ;
   qry2.Close ;
   qry2.Open ;
   comboxproper:= TcxComboBoxProperties.Create(Nil);
   ADOQuery1.Close ;
   ADOQuery1.ExecSQL ;
end;

procedure TFrm_ImportData.btn4Click(Sender: TObject);
var
  WorkBook, ExcelApp: OleVariant;
  Title:array of string;
  Columnindex: array of SmallInt;
  i,j,count:Integer;
  RowCount,ColCount:Integer;
  Filename:string;
begin
  Filename:=Trim(cxButtonEdit1.Text);
//------------------------------------------------------------------------
  if not FileExists(Filename)  then
  begin
    Application.MessageBox('电子文件不存在','警告',MB_OK + MB_ICONWARNING);
    Exit;
  end;
//-----------------------------------------------------------------------
  if qry2.IsEmpty then Exit;
  SetLength(Title,qry2.RecordCount+1);
  SetLength(Columnindex,qry2.RecordCount+1);
  qry2.First;
  i:=0;
try

  ExcelApp:= CreateOLEObject('Excel.Application');
  WorkBook:= ExcelApp.WorkBooks.Open(Filename);
//--------------------------------------------------------
  while not qry2.Eof do
  begin
    if qry2.Fields[2].AsString <>'' then
    begin
      Inc(i);
      Title[i]:= qry2.Fields[1].AsString;
      Columnindex[i]:=comboxproper.Items.IndexOf(qry2.Fields[2].AsString) + 1;
    end;
    qry2.Next;
  end;
 //-------------------------------------------------------
  ColCount:=i;
  if ExcelLook_Frm=nil then
     ExcelLook_Frm:=TExcelLook_Frm.Create(nil);
  RowCount:=0;
  ExcelLook_Frm.strngrd1.ColCount:=ColCount;
  RowCount:= ExcelApp.Cells.CurrentRegion.Rows.Count;
  if RowCount>101 then RowCount:=101;

  ExcelLook_Frm.strngrd1.RowCount:= RowCount;

  for j:=0 to ColCount-1 do    //标题
  ExcelLook_Frm.strngrd1.Cells[j,0]:=Title[j+1];

//-----------------------------------------------------------------
  for i:= StrToInt(cxtxtdt1.Text) to RowCount do
  begin
    for j:=0 to ColCount-1 do
    begin
      ExcelLook_Frm.strngrd1.Cells[j,i-1]:=WorkBook.WorkSheets[1].Cells[i,Columnindex[j+1]];
    end;
  end;
//----------------------------------------------------------------------
 finally
   ExcelApp.Quit;
   ExcelLook_Frm.ShowModal ;
 end;   

end;

procedure TFrm_ImportData.btn3Click(Sender: TObject);
var
  WorkBook, ExcelApp: OleVariant;
  Filename ,ValueStr ,FieldName,SQLStr ,CustNo, buildPerson :string;
  DepartID  ,BelongID : Integer ;
  CreatData : TDateTime ;
  count , i ,j : Integer ;
begin
  DepartID := DataBaseModule.dtclsData.DeptID_;
  buildPerson := DataBaseModule.dtclsData.UserName_;
  BelongID := DataBaseModule.dtclsData.UserID_ ;
  CreatData := Now ;
  Filename:=Trim(cxButtonEdit1.Text);
  if not FileExists(Filename)  then
  begin
    Application.MessageBox('电子文件不存在','警告',MB_OK + MB_ICONWARNING);
    Exit;
  end;
  ExcelApp:= CreateOLEObject('Excel.Application');
  WorkBook:= ExcelApp.WorkBooks.Open(Filename);
//-----------------------------------------------------------------------------------------
  try
      NewCust.Close;
      NewCust.SQL.Clear;
      NewCust.SQL.Add('Select Top 1 DeptID_,CustNum,BelongID');
      NewCust.SQL.Add(' from Customer where BelongID=:BelongID Order by CustNum Desc');
      NewCust.Parameters.ParamByName('BelongID').Value:=Databasemodule.dtclsData.UserID_;
      NewCust.Prepared;
      NewCust.Open;
      IF NewCust.IsEmpty Then
        Begin
          With Databasemodule.dtclsData DO
            Begin
              j:=Length(IntToStr(UserID_));
              Case j OF
              1:CustNo:=IntToStr(UserID_)+'000'+'10001';
              2:CustNo:=IntToStr(UserID_)+'00'+'10001';
              3:CustNo:=IntToStr(UserID_)+'0'+'10001';
              4:CustNo:=IntToStr(UserID_)+'10001';
              End;
            End;
        End
      Else
        Begin
          NewCust.Last;
          CustNo:=IntToStr(NewCust.fieldbyname('CustNum').AsInteger+1);
        End;
//---------------------------------------------------------------------------------------
  DatabaseModule.dtclsData.BeginTrans;
  Try
   PB.Max:=StrToInt(cxTextEdit1.Text) + 1;
   for i:=StrToInt(cxtxtdt1.Text) to StrToInt(cxTextEdit1.Text) + 1 do
   begin

     with qry2 do
     begin
       if not IsEmpty then
       begin
//------------------------------------------------------------------------------------------

         SQLStr := 'insert into customer(CustNum ,DeptID_ ,CreateD_,CreateBy_,BelongID, CustNextDate,CustLastDate,';
         ValueStr := 'values('+Quotedstr(CustNo)+','+IntToStr(DepartID)+ ','+Quotedstr(DateToStr(creatdata))+','+
         QuotedStr(buildPerson)+','+Inttostr(BelongID)+','+Quotedstr(DateToStr(Date))+','+Quotedstr(DateToStr(Date))+',';
         first ;
         while not Eof do
         begin
           FieldName := Fields[2].Value ;
           if FieldName <> '' then
           begin
             SQLStr := SQLStr + Fields[0].Value + ','  ;
             count := comboxproper.Items.IndexOf(FieldName);
             FieldName := WorkBook.WorkSheets[1].Cells[i,count+1] ;
             ValueStr := ValueStr + ''''+FieldName+ ''''+ ',';
             Query.Close;
             Query.Sql.Clear;
             Query.Sql.Add('Select CustName From Customer Where CustName=:CustName');
             Query.Parameters.ParamByName('CustName').Value:=FieldName;
             Query.Prepared;
             Query.Open;
             IF Not Query.ISEmpty Then Break;
           end ;
         Next ;
         end ;
         IF Query.ISEmpty Then
           Begin
             SQLStr := Copy(SQLStr,1,length(SQLStr)-1) + ')' + Copy(ValueStr,1, Length(ValueStr)-1)+')' ;
             ADOQuery1.Close;
             ADOQuery1.SQL.clear ;
             ADOQuery1.SQL.Text := SQLStr ;
             ADOQuery1.ExecSQL ;
             CustNo:=IntToStr(StrToInt(CustNo)+1);
           End;
       end ;
     end ;
//------------------------------------------------------------------------------------------
//生成客户期初欠款表
   IF Query.ISEmpty Then
     Begin
        LAdoArrearage.Close;
        LAdoArrearage.SQL.Clear;
        LAdoArrearage.SQL.Add('Insert Into FirstArrear(DeptID_,CustNum,ArrearMoney,PreMoney,BelongID,CreateBy_,CreateD_)');
        LAdoArrearage.SQL.Add(' values(:DeptID,:CustNum,:ArrearMoney,:PreMoney,:BelongID,:CreateBy,:CreateD)');
        LAdoArrearage.Parameters.ParamByName('DeptID').Value:=DatabaseModule.dtclsData.DeptID_;
        LAdoArrearage.Parameters.ParamByName('CustNum').Value:=CustNo;
        LAdoArrearage.Parameters.ParamByName('ArrearMoney').Value:=0;
        LAdoArrearage.Parameters.ParamByName('PreMoney').Value:=0;
        LAdoArrearage.Parameters.ParamByName('BelongID').Value:=DatabaseModule.DtclsData.UserID_;
        LAdoArrearage.Parameters.ParamByName('CreateBy').Value:=DatabaseModule.DtclsData.UserName_;
        LAdoArrearage.Parameters.ParamByName('CreateD').Value:=Date;
        LAdoArrearage.Prepared;
        LAdoArrearage.ExecSQL;
      End;
//------------------------------------------------------------------------------------------
     //CustNo:=IntToStr(StrToInt(CustNo)+1);
     PB.Position:=PB.Position+1;
   end ;
   InsertQry.Close ;
   InsertQry.ExecSQL ;
   Databasemodule.dtclsData.CommitTrans;
   Application.MessageBox('导入成功','提示',MB_OK + MB_ICONWARNING);
   Except
     DatabaseModule.dtclsData.RollbackTrans;
     Raise;
   End;
finally
  ExcelApp.quit ;
end;
end;
procedure TFrm_ImportData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
