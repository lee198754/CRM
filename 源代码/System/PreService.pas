unit PreService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ADODB, bainaADOQuery, ComCtrls, cxPC,
  ExtCtrls, cxContainer, cxTreeView, Menus, cxTextEdit, cxMemo, cxDBEdit,
  frxClass, frxDBSet, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, cxLookAndFeelPainters,
  dxSkinscxPCPainter;

type
  TFrm_PreService = class(TBaseData_Frm)
    DSService: TDataSource;
    PreService: TbainaADOQuery;
    TVPre: TcxTreeView;
    Splitter1: TSplitter;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    GrdPre: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxPageControl1: TcxPageControl;
    Splitter2: TSplitter;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cxDBMemo1: TcxDBMemo;
    GrdProc: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    GrdExpend: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    DSSerProc: TDataSource;
    cxDBMemo2: TcxDBMemo;
    DSExpend: TDataSource;
    N16: TMenuItem;
    N17: TMenuItem;
    LAdoExpend: TbainaADOQuery;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    cxTabSheet3: TcxTabSheet;
    GrdSelect: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    LDSSelect: TDataSource;
    N24: TMenuItem;
    N25: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GrdPreCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N3Click(Sender: TObject);
    procedure TVPreChange(Sender: TObject; Node: TTreeNode);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure GrdProcCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure GrdPreCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxPageControl1Change(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure GrdPreColumnSizeChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure GrdPreCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    Procedure ShowPreService;
    Procedure openDatabase;
    Procedure ShowProcedure;
    Procedure ShowExpend;
    Procedure ShowSelect;
    Function EditRight:Boolean;
    Function DeleteRight:Boolean;
  public
    { Public declarations }
    LPreService,LProceService:Boolean;
  end;

var
  Frm_PreService: TFrm_PreService;

implementation

uses DataBase, PreWrite, PublicClass, SerProc, NewExpend, MainFrm;

{$R *.dfm}

procedure TFrm_PreService.openDatabase;
begin
  With DatabaseModule DO
    Begin
      AdoPreService.Close;
      AdoPreService.SQL.Clear;
      AdoPreService.SQL.Add('Select a.CustID As MCustID,a.CustName,b.DeptID_,b.ServiceID,b.ServiceNum,b.CustRegion,b.CustAdd,b.Trafic,b.ContactMode,b.CustId,b.ServiceRate,b.ServiceDate,b.Contact,b.ServiceQuestion,b.FinishDate,b.FactFinishDate,b.ServiceMemo');
      AdoPreService.SQL.Add(',b.IFCheck,b.CheckMan,b.CheckDate,b.IFFinish,B.IFSelect,b.CreateD_,b.CreateBy_,b.Updated_,b.UpdateBy_,b.BelongID,C.UserID_,C.UserName_');
      AdoPreService.SQL.Add('From Customer a,Service b,Users_ C where b.CustID=a.CustID And B.CreateBy_=C.UserID_ ');
      IF LPreService=True Then
        Begin
          AdoPreService.SQL.Add(' And B.IFSelect=:IFSelect');
          AdoPreService.Parameters.ParamByName('IFSelect').Value:=Boolean(0);
        End;

      IF LProceService=True Then
        Begin
          //AdoPreService.SQL.Add(' And B.BelongID=:BelongID');
          //AdoPreService.Parameters.ParamByName('BelongID').Value:=Dtclsdata.UserID_;
        End;

      AdoPreService.Open;
    End;
end;

procedure TFrm_PreService.ShowPreService;
Var
  I:Integer;
begin
  inherited;
  IF GrdPre.ColumnCount<>0 Then
    Begin
      IF TVPre.Selected.Text='新预约' Then  GrdPre.Columns[2].Caption:='建单人员'
      Else  GrdPre.Columns[2].Caption:='维护人员';
      Exit;//GrdPre.ClearItems;
    End;
  FOR I:=0 TO DSService.DataSet.FieldCount - 17 Do
    Begin
      GrdPre.CreateColumn;
      GrdPre.Columns[I].Name:='ServiceMColumns'+IntToStr(I);
      GrdPre.Columns[I].Width:=100;
   End;
          GrdPre.DataController.DataSource:=DSService;
          GrdPre.Columns[0].Caption:='客户名称';
          GrdPre.Columns[0].DataBinding;
          GrdPre.Columns[0].DataBinding.FieldName:='CustName';
          GrdPre.Columns[0].DataBinding.ValueType:='String';

          GrdPre.Columns[1].Caption:='维护编号';
          GrdPre.Columns[1].DataBinding;
          GrdPre.Columns[1].DataBinding.FieldName:='ServiceNum';
          GrdPre.Columns[1].DataBinding.ValueType:='String';
          GrdPre.Columns[1].Width:=150;

          IF TVPre.Selected.Text='新预约' Then  GrdPre.Columns[2].Caption:='建单人员'
          Else  GrdPre.Columns[2].Caption:='维护人员';

          GrdPre.Columns[2].DataBinding;
          GrdPre.Columns[2].DataBinding.FieldName:='UserName_';
          GrdPre.Columns[2].DataBinding.ValueType:='String';
          GrdPre.Columns[2].Width:=150;

          GrdPre.Columns[3].Caption:='联系人';
          GrdPre.Columns[3].DataBinding;
          GrdPre.Columns[3].DataBinding.FieldName:='Contact';
          GrdPre.Columns[3].DataBinding.ValueType:='String';

          GrdPre.Columns[4].Caption:='联系方式';
          GrdPre.Columns[4].DataBinding;
          GrdPre.Columns[4].DataBinding.FieldName:='ContactMode';
          GrdPre.Columns[4].DataBinding.ValueType:='String';

          GrdPre.Columns[5].Caption:='是否完成';
          GrdPre.Columns[5].DataBinding;
          GrdPre.Columns[5].DataBinding.FieldName:='IFFinish';
          GrdPre.Columns[5].DataBinding.ValueType:='Boolean';

          GrdPre.Columns[6].Caption:='预约维护日期';
          GrdPre.Columns[6].DataBinding;
          GrdPre.Columns[6].DataBinding.FieldName:='ServiceDate';
          GrdPre.Columns[6].DataBinding.ValueType:='DateTime';

          GrdPre.Columns[7].Caption:='预约完成日期';
          GrdPre.Columns[7].DataBinding;
          GrdPre.Columns[7].DataBinding.FieldName:='FinishDate';
          GrdPre.Columns[7].DataBinding.ValueType:='DateTime';

          GrdPre.Columns[8].Caption:='实际完成日期';
          GrdPre.Columns[8].DataBinding;
          GrdPre.Columns[8].DataBinding.FieldName:='FactFinishDate';
          GrdPre.Columns[8].DataBinding.ValueType:='Datetime';

          GrdPre.Columns[9].Caption:='是否审核';
          GrdPre.Columns[9].DataBinding;
          GrdPre.Columns[9].DataBinding.FieldName:='IFCheck';
          GrdPre.Columns[9].DataBinding.ValueType:='Boolean';

          GrdPre.Columns[10].Caption:='审核人';
          GrdPre.Columns[10].DataBinding;
          GrdPre.Columns[10].DataBinding.FieldName:='CheckMan';
          GrdPre.Columns[10].DataBinding.ValueType:='String';

          GrdPre.Columns[11].Caption:='审核日期';
          GrdPre.Columns[11].DataBinding;
          GrdPre.Columns[11].DataBinding.FieldName:='CheckDate';
          GrdPre.Columns[11].DataBinding.ValueType:='Datetime';
          GrdPre.Columns[11].Width:=60;

          GrdPre.Columns[12].Caption:='建立日期';
          GrdPre.Columns[12].DataBinding;
          GrdPre.Columns[12].DataBinding.FieldName:='CreateD_';
          GrdPre.Columns[12].DataBinding.ValueType:='Datetime';


end;

procedure TFrm_PreService.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LPreService:=False;
  LProceService:=False;
end;

procedure TFrm_PreService.N1Click(Sender: TObject);
begin
  inherited;
  IF Self.Access.RAdd Then
    Begin
      ISAdd:=True;
      ISEdit:=False;
      Frm_Pre:=TFrm_Pre.Create(Self);
      Frm_Pre.ShowModal;
      //OpenDatabase;
      //ShowPreService;
      TVPreChange(TVPre,TVPre.Selected);
    End
  Else
    Application.MessageBox('你没有新增记录的权限','提示',MB_OK+MB_Iconwarning);
end;

procedure TFrm_PreService.FormShow(Sender: TObject);
begin
  inherited;
  GrdPre.RestoreFromIniFile(ExtractFilePath(Application.ExeName)+'ini\PreService.ini');
  DatabaseModule.AdoPreService.AllowCheckAcc := True;
  IF LPreService=True Then
    Begin
      N3.Visible:=False;
      N8.Visible:=False;
      N9.Visible:=False;
      N10.Visible:=False;
      N11.Visible:=False;
      N12.Visible:=False;
      N13.Visible:=False;
      N14.Visible:=False;
      N15.Visible:=False;
      N17.Visible:=False;
      GrdPre.PopupMenu:=PopupMenu1;
      GrdSelect.PopupMenu:=PopupMenu1;
    End;
  IF LProceService=True Then
    Begin
      N1.Visible:=False;
      N7.Visible:=False;
      N4.Visible:=False;
      N5.Visible:=False;
      N6.Visible:=False;
      N16.Visible:=False;
      N18.Visible:=False;
      N20.Visible:=False;
      N24.Visible:=False;
      N25.Visible:=False;
      GrdPre.PopupMenu:=PopupMenu1;
      GrdProc.PopupMenu:=PopupMenu1;
      GrdExpend.PopupMenu:=PopupMenu1;
      TVPre.Items[1].Selected:=True;
    End;

  {OpenDatabase;
  ShowPreService;}
end;

procedure TFrm_PreService.GrdPreCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  //ShowProcedure;
  //ShowExpend;
  //ShowSelect;
  cxPageControl1change(cxpageControl1.ActivePage);
  cxDBMemo1.DataBinding.DataField:='ServiceQuestion';
end;

procedure TFrm_PreService.N3Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin
      IF (DatabaseModule.AdoPreService.ModifyAcc(DSService.DataSet.FieldbyName('BelongID').AsInteger)=False) Then
        Begin
          Application.MessageBox('你没有修改记录的权限','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
      IF (Not (AdoPreService.IsEmpty)) And (AdoPreService.FieldByName('IFSelect').AsBoolean=Boolean(1)) And (AdoPreService.FieldByName('IFFinish').AsBoolean=Boolean(0)) Then
        Begin
          AdoPreService.Edit;
          AdoPreservice.FieldByName('IFFinish').AsBoolean:=Boolean(1);
          AdoPreService.FieldByName('UpdateBy_').AsInteger:=Dtclsdata.UserID_;
          AdoPreservice.FieldByName('CreateD_').AsDateTime:=Date;
          AdoPreService.Prepared;
          AdoPreService.Post;
        End;
    End;
  TVPreChange(TVPre,TVPre.Selected);
end;

procedure TFrm_PreService.TVPreChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  With DatabaseModule DO
    Begin
      AdoPreService.Close;
      AdoPreService.SQL.Clear;
      AdoPreService.SQL.Add('Select a.CustID As MCustID,a.CustName,b.DeptID_,b.ServiceID,b.ServiceNum,b.CustRegion,b.CustAdd,b.Trafic,b.ContactMode,b.CustId,b.ServiceRate,b.ServiceDate,b.Contact,b.ServiceQuestion,b.FinishDate,b.FactFinishDate,b.ServiceMemo');
      AdoPreService.SQL.Add(',b.IFCheck,b.CheckMan,b.CheckDate,b.IFFinish,b.IFSelect,b.CreateD_,b.CreateBy_,b.Updated_,b.UpdateBy_,b.BelongID,C.UserID_,C.UserName_');
      AdoPreService.SQL.Add('From Customer a,Service b,Users_ C where b.CustID=a.CustID');
      IF LProceService=True Then
        Begin
          //AdoPreService.SQL.Add(' And B.BelongID=:BelongID  ');
          //AdoPreService.Parameters.ParamByName('BelongID').Value:=Dtclsdata.UserID_;
        End;

      IF TVPre.Selected.Text='新预约' Then
        Begin
          AdoPreService.SQL.Add('And b.IFSelect=:IFSelect And B.CreateBY_=C.UserID_');
          AdoPreService.Parameters.ParamByName('IFSelect').Value:=Boolean(0);
        End;
      IF TVPre.Selected.Text='已安排' Then
        Begin
          AdoPreservice.SQL.Add(' And b.IFSelect=:IFSelect And IFFinish=:IFFinish And IFCheck=:IFCheck And B.BelongID=C.UserID_');
          AdoPreService.Parameters.ParamByName('IFSelect').Value:=Boolean(1);
          AdoPreService.Parameters.ParamByName('IFFinish').Value:=Boolean(0);
          AdoPreService.Parameters.ParamByName('IFCheck').Value:=Boolean(0);
        End;
      IF TVPre.Selected.Text='已完成' Then
        Begin
          AdoPreservice.SQL.Add('  And b.IFFinish=:IFFinish And IFCheck=:IFCheck And B.BelongID=C.UserID_');
          AdoPreService.Parameters.ParamByName('IFFinish').Value:=Boolean(1);
          AdoPreService.Parameters.ParamByName('IFCheck').Value:=Boolean(0);
        End;
      IF TVpre.Selected.Text='已审核' Then
        Begin
          AdoPreService.SQL.Add(' And B.IFCheck=:IFCheck And B.BelongID=C.UserID_');
          AdoPreService.Parameters.ParamByName('IFCheck').Value:=Boolean(1);
        End;
      AdoPreService.Open;
    End;
  ShowPreService;
  //ShowProcedure;
  //ShowExpend;
  //ShowSelect;
  CxPageControl1change(CxpageControl1.ActivePage);
end;

procedure TFrm_PreService.N4Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin
      IF (Not (AdoPreService.IsEmpty)) And (AdoPreService.FieldByName('IFFinish').AsBoolean=Boolean(1)) Then
        Begin
          IF AdoPreService.IsEmpty Then Exit;
          IF (Not Self.Access.RCheck) Then
            Begin
              Application.MessageBox('你没有审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
              Exit;
            End;
          AdoPreService.Check(DSService.DataSet.FieldByname('ServiceID').AsInteger,'ServiceID');
        End
      Else Application.MessageBox('只有已完成的单才可以审核','提示',MB_OK+MB_Iconwarning);
    End;
  TVPreChange(TVPre,TVPre.Selected);
end;

procedure TFrm_PreService.N5Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin
      IF (Not (AdoPreService.IsEmpty)) And (AdoPreService.FieldByName('IFCheck').AsBoolean=Boolean(1)) Then
        Begin
          IF (Not Self.Access.RUnCheck) Then
            Begin
              Application.MessageBox('你没有反审核此资料的权限.','提示',MB_OK+MB_Iconwarning);
              Exit;
            End;
          AdoPreService.UnCheck(DSService.DataSet.FieldByname('ServiceID').AsInteger,'ServiceID');
        End;
    End;
  TVPreChange(TVPre,TVPre.Selected);
end;

procedure TFrm_PreService.ShowProcedure;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      AdoSerProc.Close;
      AdoSerProc.SQL.Clear;
      AdoSerProc.SQL.Add('Select ServiceID,Serrecord,CreateD_,CreateBy_,UpdateD_,UpdateBy_ From Serproc Where ServiceID=:ServiceID');
      AdoSerProc.Parameters.ParamByName('ServiceID').Value:=DSService.DataSet.FieldByName('ServiceID').AsInteger;
      AdoSerProc.Prepared;
      AdoSerProc.Open;
    End;
   IF GrdProc.ColumnCount<>0 Then Exit;
   FOR I:=0 TO DSSerProc.DataSet.FieldCount - 1 Do
    Begin
      GrdProc.CreateColumn;
      GrdProc.Columns[I].Name:='ProcMColumns'+IntToStr(I);
   End;
          GrdProc.DataController.DataSource:=DSSerProc;
          GrdProc.Columns[0].Caption:='过程记录';
          GrdProc.Columns[0].DataBinding;
          GrdProc.Columns[0].DataBinding.FieldName:='Serrecord';
          GrdProc.Columns[0].DataBinding.ValueType:='String';
          GrdProc.Columns[0].Width:=150;

          GrdProc.Columns[1].Caption:='建立人';
          GrdProc.Columns[1].DataBinding;
          GrdProc.Columns[1].DataBinding.FieldName:='CreateBy_';
          GrdProc.Columns[1].DataBinding.ValueType:='String';
          GrdProc.Columns[1].Width:=80;

          GrdProc.Columns[2].Caption:='建立日期';
          GrdProc.Columns[2].DataBinding;
          GrdProc.Columns[2].DataBinding.FieldName:='CreateD_';
          GrdProc.Columns[2].DataBinding.ValueType:='Datetime';
          GrdProc.Columns[2].Width:=80;

          GrdProc.Columns[3].Caption:='修改人';
          GrdProc.Columns[3].DataBinding;
          GrdProc.Columns[3].DataBinding.FieldName:='UpdateBy_';
          GrdProc.Columns[3].DataBinding.ValueType:='String';
          GrdProc.Columns[3].Width:=80;

          GrdProc.Columns[4].Caption:='修改日期';
          GrdProc.Columns[4].DataBinding;
          GrdProc.Columns[4].DataBinding.FieldName:='UpdateD_';
          GrdProc.Columns[4].DataBinding.ValueType:='Datetime';
          GrdProc.Columns[4].Width:=80;
   end;

procedure TFrm_PreService.GrdProcCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  cxDBMemo2.DataBinding.DataField:='Serrecord';
end;

procedure TFrm_PreService.N9Click(Sender: TObject);
begin
  inherited;
  IF (DSService.DataSet.IsEmpty) OR (TVPre.Selected.Text='新预约') Then Exit;
  ISAdd:=True;
  ISEdit:=False;
  Frm_SerProc:=TFrm_SerProc.Create(Self);
  Frm_SerProc.ShowModal;
end;

procedure TFrm_PreService.N13Click(Sender: TObject);
begin
  inherited;
  IF (DatabaseModule.AdoPreService.IsEmpty) OR (TVPre.Selected.Text='新预约') Then Exit;
  ISAdd:=True;
  ISEdit:=False;
  PNExpend:=3;
  Frm_NewExpend:=TFrm_NewExpend.Create(Self);
  Frm_NewExpend.ShowModal;
end;

procedure TFrm_PreService.ShowExpend;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      AdoExpend.Close;
      AdoExpend.SQL.Clear;
      AdoExpend.SQL.Add('Select ServiceID,ExpendID,DeptID_,CustID,ExpendOption,ExpendType,ExpendMoney,ExpendDate,ExpendMemo,CreateBy_,CreateD_,UpdateBY_,UpdateD_,BelongID,CheckMan,CheckDate,IFCheck');
      AdoExpend.SQL.Add(' From Expend  Where ServiceID=:ServiceID And ExpendOption=:ExpendOption');
      AdoExpend.Parameters.ParamByName('ServiceID').Value:=DSService.DataSet.FieldByName('ServiceID').AsInteger;
      AdoExpend.Parameters.ParamByName('ExpendOption').Value:=2;
      //LAdoExpend.Parameters.ParamByName('CustID').Value:=DSService.DataSet.fieldByName('CustID').AsInteger;
      AdoExpend.Prepared;
      AdoExpend.Open;
    End;

  IF GrdExpend.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  FOR I:=0 TO DSExpend.DataSet.FieldCount - 12 Do
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
          GrdExpend.Columns[1].Width:=150;

          GrdExpend.Columns[2].Caption:='发生日期';
          GrdExpend.Columns[2].DataBinding;
          GrdExpend.Columns[2].DataBinding.FieldName:='ExpendDate';
          GrdExpend.Columns[2].DataBinding.ValueType:='Datetime';

          {GrdExpend.Columns[3].Caption:='业务归属';
          GrdExpend.Columns[3].DataBinding;
          GrdExpend.Columns[3].DataBinding.FieldName:='UserName_';
          GrdExpend.Columns[3].DataBinding.ValueType:='String';}

          GrdExpend.Columns[3].Caption:='是否审核';
          GrdExpend.Columns[3].DataBinding;
          GrdExpend.Columns[3].DataBinding.FieldName:='IFCheck';
          GrdExpend.Columns[3].DataBinding.ValueType:='Boolean';
          GrdExpend.Columns[3].Width:=60;

          GrdExpend.Columns[4].Caption:='审核人';
          GrdExpend.Columns[4].DataBinding;
          GrdExpend.Columns[4].DataBinding.FieldName:='CheckMan';
          GrdExpend.Columns[4].DataBinding.ValueType:='String';

          GrdExpend.Columns[5].Caption:='审核日期';
          GrdExpend.Columns[5].DataBinding;
          GrdExpend.Columns[5].DataBinding.FieldName:='CheckDate';
          GrdExpend.Columns[5].DataBinding.ValueType:='Datetime';
end;

procedure TFrm_PreService.N17Click(Sender: TObject);
begin
  inherited;
  With DatabaseModule DO
    Begin
      IF AdoPreService.FieldByName('IFCheck').AsBoolean=Boolean(1) Then
        Begin
          Application.MessageBox('此单已审核,不能恢复未完成状态.','提示',MB_OK+MB_Iconwarning);
          Exit;
        End;
      IF (Not (AdoPreService.IsEmpty)) And (AdoPreService.FieldByName('IFSelect').AsBoolean=Boolean(1)) And (AdoPreService.FieldByName('IFFinish').AsBoolean=Boolean(1)) Then
        Begin
          IF (DatabaseModule.AdoPreService.ModifyAcc(DSService.DataSet.FieldbyName('BelongID').AsInteger)=False) Then
            Begin
              Application.MessageBox('你没有修改记录的权限','提示',MB_OK+MB_Iconwarning);
              Exit;
            End
          Else
            Begin
              AdoPreService.Edit;
              AdoPreservice.FieldByName('IFFinish').AsBoolean:=Boolean(0);
              AdoPreService.FieldByName('UpdateBy_').AsInteger:=Dtclsdata.UserID_;
              AdoPreservice.FieldByName('CreateD_').AsDateTime:=Date;
              AdoPreService.Prepared;
              AdoPreService.Post;
            End;
        End;
    End;
  TVPreChange(TVPre,TVPre.Selected);
end;

procedure TFrm_PreService.N14Click(Sender: TObject);
begin
  inherited;
  IF Not (DSExpend.DataSet.IsEmpty) Then
    Begin
      IF (DatabaseModule.dtclsData.UserID_=DSSerproc.DataSet.FieldByName('BelongID').AsInteger) Then
        Begin
          IF DSExpend.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(0) Then
            Begin
              ISAdd:=False;
              ISEdit:=True;
              PNExpend:=3;
              Frm_NewExpend:=TFrm_NewExpend.Create(Self);
              Frm_NewExpend.ShowModal;
            End
          Else Application.MessageBox('费用已审核,不能修改.','提示',MB_OK+MB_Iconwarning);
        End
      Else Application.MessageBox('你没有修改费用的权限','提示',MB_OK+MB_Iconwarning);
    End;
end;

procedure TFrm_PreService.N7Click(Sender: TObject);
begin
  inherited;
  IF Not (DSService.DataSet.IsEmpty) Then
    Begin
      IF EditRight Then
        Begin
          ISAdd:=False;
          ISEdit:=True;
          Frm_Pre:=TFrm_Pre.Create(Self);
          Frm_Pre.ShowModal;
          TVPreChange(TVPre,TVPre.Selected);
        End;
    End;

end;

procedure TFrm_PreService.N18Click(Sender: TObject);
begin
  inherited;
      IF Not (DSService.DataSet.IsEmpty) Then
        Begin
          IF DeleteRight Then
            Begin
              IF (DSExpend.DataSet.IsEmpty) And (DSSerProc.DataSet.IsEmpty) Then
                Begin
                  //DSService.DataSet.Delete;
                  PreService.Close;
                  PreService.SQL.Clear;
                  PreService.SQL.Add('Delete From Service Where ServiceID=:ServiceID');
                  PreService.Parameters.ParamByName('ServiceID').Value:=DSService.DataSet.FieldByName('ServiceID').AsInteger;
                  PreService.Prepared;
                  PreService.ExecSQL;
                  TVPreChange(TVPre,TVPre.Selected);
                End
              Else Application.MessageBox('该预约单处于工作当中,不能删除','提示',MB_OK+MB_Iconwarning);
            End;
        End;
end;

function TFrm_PreService.DeleteRight: Boolean;
begin
  IF (DatabaseModule.AdoPreService.DeleteAcc(DSService.DataSet.FieldbyName('CreateBy_').AsInteger)=False) OR (Not Self.Access.RDelete) Then
    Begin
      Application.MessageBox('你没有单据删除的权限.','提示',MB_OK+MB_Iconwarning);
      Result:=False;
    End
  Else Result:=True;
end;

function TFrm_PreService.EditRight: Boolean;
begin
  IF (DatabaseModule.AdoPreService.ModifyAcc(DSService.DataSet.FieldbyName('CreateBy_').AsInteger)=False) OR (Not Self.Access.REdit) Then
    Begin
      Application.MessageBox('你没有操作此单据权限.','提示',MB_OK+MB_Iconwarning);
      Result:=False;
    End
  Else Result:=True;  
end;

procedure TFrm_PreService.N20Click(Sender: TObject);
begin
  inherited;
  if DataBase.DataBaseModule.dtclsData.AccByFromName('Frm_Select') <= 0 Then
    begin
      Application.MessageBox('你没有人员安排的权限','提示',MB_OK+MB_Iconwarning);
    end Else
    Begin
      ISAdd:=True;
      Main_Frm.M_Frm_Select.Click;
      TVPreChange(TVPre,TVPre.Selected);
    End;
end;

procedure TFrm_PreService.N15Click(Sender: TObject);
begin
  inherited;
  IF Not (DSExpend.DataSet.IsEmpty) Then
    Begin
      IF (DatabaseModule.dtclsData.UserID_=DSSerproc.DataSet.FieldByName('BelongID').AsInteger) Then
        Begin
          IF DSExpend.DataSet.FieldByName('IFCheck').AsBoolean=Boolean(0) Then
            Begin
              DSExpend.DataSet.Delete;
            End
          Else Application.MessageBox('费用已审核,不能删除.','提示',MB_OK+MB_Iconwarning);
        End
      Else Application.MessageBox('你没有删除费用的权限','提示',MB_OK+MB_Iconwarning);  
    End;
end;

procedure TFrm_PreService.ShowSelect;
Var
  I:Integer;
begin
  With DatabaseModule Do
    Begin
      AdoSelect.Close;
      AdoSelect.SQL.Clear;
      AdoSelect.SQL.Add('Select ServiceNum,SelectUser,UserID,IFMain,CreateBy_,CreateD_,UpdateBY_,UpdateD_');
      AdoSelect.SQL.Add(' From SelectUser  Where ServiceNum=:ServiceNum');
      AdoSelect.Parameters.ParamByName('ServiceNum').Value:=DSService.DataSet.FieldByName('ServiceID').AsInteger;
      AdoSelect.Prepared;
      AdoSelect.Open;
    End;

  IF GrdSelect.ColumnCount<>0 Then Exit;// GrdContact.ClearItems;
  FOR I:=0 TO LDSSelect.DataSet.FieldCount - 3 Do
    Begin
      GrdSelect.CreateColumn;
      GrdSelect.Columns[I].Name:='SelectColumns'+IntToStr(I);
   End;
          GrdSelect.DataController.DataSource:=LDSSelect;
          GrdSelect.Columns[0].Caption:='维护人员';
          GrdSelect.Columns[0].DataBinding;
          GrdSelect.Columns[0].DataBinding.FieldName:='SelectUser';
          GrdSelect.Columns[0].DataBinding.ValueType:='String';

          GrdSelect.Columns[1].Caption:='是否主维护';
          GrdSelect.Columns[1].DataBinding;
          GrdSelect.Columns[1].DataBinding.FieldName:='IFMain';
          GrdSelect.Columns[1].DataBinding.ValueType:='Boolean';
          GrdSelect.Columns[1].Width:=100;

          GrdSelect.Columns[2].Caption:='建单人';
          GrdSelect.Columns[2].DataBinding;
          GrdSelect.Columns[2].DataBinding.FieldName:='CreateBy_';
          GrdSelect.Columns[2].DataBinding.ValueType:='String';

          GrdSelect.Columns[3].Caption:='建单日期';
          GrdSelect.Columns[3].DataBinding;
          GrdSelect.Columns[3].DataBinding.FieldName:='CreateD_';
          GrdSelect.Columns[3].DataBinding.ValueType:='Datetime';

          GrdSelect.Columns[4].Caption:='修改人';
          GrdSelect.Columns[4].DataBinding;
          GrdSelect.Columns[4].DataBinding.FieldName:='UpdateBy_';
          GrdSelect.Columns[4].DataBinding.ValueType:='String';

          GrdSelect.Columns[5].Caption:='修改日期';
          GrdSelect.Columns[5].DataBinding;
          GrdSelect.Columns[5].DataBinding.FieldName:='UpdateD_';
          GrdSelect.Columns[5].DataBinding.ValueType:='Datetime';

end;

procedure TFrm_PreService.N24Click(Sender: TObject);
begin
  inherited;
  IF LDSSelect.DataSet.IsEmpty Then Exit;
  if DataBase.DataBaseModule.dtclsData.AccByFromName('Frm_Select') <= 0 Then
    begin
      Application.MessageBox('你没有人员修改的权限','提示',MB_OK+MB_Iconwarning);
    end Else
    Begin
      ISEdit:=True;
      Main_Frm.M_Frm_Select.Click;
    End;
end;

procedure TFrm_PreService.N25Click(Sender: TObject);
begin
  inherited;
  IF LDSSelect.DataSet.IsEmpty Then Exit;
  if DataBase.DataBaseModule.dtclsData.AccByFromName('Frm_Select') <= 0 Then
    begin
      Application.MessageBox('你没有人员删除的权限','提示',MB_OK+MB_Iconwarning);
    end Else
    Begin
      With DatabaseModule Do
        Begin
          DtclsData.BeginTrans;
          Try
            IF AdoSelect.FieldByName('IFMain').AsBoolean=Boolean(1) Then
              Begin
                AdoPreService.Edit;
                AdoPreService.FieldByName('BelongID').AsString:='';
                AdoPreservice.FieldByName('IFSelect').AsBoolean:=Boolean(0);
                AdoPreService.Post;
              End;
            LDSSelect.DataSet.Delete;
            DtClsData.CommitTrans;
          Except
            DtclsData.RollbackTrans;
            Raise;
          End;
        End;
    End;
end;

procedure TFrm_PreService.GrdPreCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  IF Not (DSService.DataSet.IsEmpty) Then
    Begin

          ISAdd:=False;
          ISEdit:=False;
          ISBrowse:=True;
          Frm_Pre:=TFrm_Pre.Create(Self);
          Frm_Pre.ShowModal;

    End;
end;

procedure TFrm_PreService.cxPageControl1Change(Sender: TObject);
begin
  inherited;
  IF cxPageControl1.ActivePage=cxtabsheet1 Then ShowProcedure;
  IF cxPageControl1.ActivePage=cxtabsheet2 Then ShowExpend;
  IF cxPageControl1.ActivePage=cxtabsheet3 Then showSelect;
end;

procedure TFrm_PreService.N10Click(Sender: TObject);
begin
  inherited;
  IF (DSSerProc.DataSet.IsEmpty) Then Exit;
  IF (DatabaseModule.dtclsData.UserID_=DSService.DataSet.FieldByName('BelongID').AsInteger) Then
    Begin
      ISAdd:=False;
      ISEdit:=True;
      Frm_SerProc:=TFrm_SerProc.Create(Self);
      Frm_SerProc.ShowModal;
    End
  Else Application.MessageBox('你没有修改记录的权限','提示',MB_OK+MB_Iconwarning);

end;

procedure TFrm_PreService.N11Click(Sender: TObject);
begin
  inherited;
  IF (DSSerProc.DataSet.IsEmpty) Then Exit;
  IF DatabaseModule.dtclsData.UserID_=DSService.DataSet.FieldByName('BelongID').AsInteger Then
    DSSerProc.DataSet.Delete
  Else Application.MessageBox('你没有删除记录的权限','提示',MB_OK+MB_Iconwarning);
end;

procedure TFrm_PreService.GrdPreColumnSizeChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  GrdPre.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\PreService.ini');
end;

procedure TFrm_PreService.GrdPreCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  GrdPre.StoreToIniFile(ExtractFilePath(Application.ExeName)+'ini\PreService.ini');
end;

end.
