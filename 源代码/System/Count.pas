unit Count;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, ExtCtrls, dxNavBar, dxNavBarBase,
  dxNavBarCollns, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ADODB, bainaADOQuery, TeeProcs,
  TeEngine, Chart, DbChart, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxPC, Series, cxDBEdit,
  Grids, DBGrids, DBCtrls, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxRadioGroup, cxSplitter, cxCheckBox, cxTrackBar, cxLabel, cxCalendar,
  ComCtrls,cxGridExportLink;

type
  TFrm_Count = class(TBaseData_Frm)
    dxNavBar1: TdxNavBar;
    dxNavBar1Item1: TdxNavBarItem;
    Query: TbainaADOQuery;
    DSQuery: TDataSource;
    LAdoCust: TbainaADOQuery;
    LDSCust: TDataSource;
    AdoDictA: TbainaADOQuery;
    AdoDictB: TbainaADOQuery;
    DSDictA: TDataSource;
    DSDictB: TDataSource;
    Panel4: TPanel;
    AdoCustClass: TbainaADOQuery;
    DSCustClass: TDataSource;
    dxNavBar1Item2: TdxNavBarItem;
    Panel3: TPanel;
    CBConditionA: TcxComboBox;
    EdtTextA: TcxTextEdit;
    CBConditionB: TcxComboBox;
    EdtTextB: TcxTextEdit;
    RBAnd: TcxRadioButton;
    RBOR: TcxRadioButton;
    CBA: TDBLookupComboBox;
    CBB: TDBLookupComboBox;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Item3: TdxNavBarItem;
    cxSplitter1: TcxSplitter;
    dxNavBar1Item4: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1Item7: TdxNavBarItem;
    Panel1: TPanel;
    GridCount: TcxGrid;
    GrdCustClass: TcxGridDBTableView;
    GridCountLevel1: TcxGridLevel;
    Panel2: TPanel;
    Panel6: TPanel;
    CustClass: TDBLookupComboBox;
    Panel5: TPanel;
    CBStyle: TcxComboBox;
    cxCheckBox1: TcxCheckBox;
    cxTrackBar1: TcxTrackBar;
    cxTrackBar2: TcxTrackBar;
    Panel7: TPanel;
    DBChart: TDBChart;
    Series1: TBarSeries;
    Series2: TPieSeries;
    cxButton1: TcxButton;
    Panel8: TPanel;
    RBCust: TcxRadioButton;
    RBProd: TcxRadioButton;
    RBDept: TcxRadioButton;
    RBPerson: TcxRadioButton;
    dxNavBar1Item8: TdxNavBarItem;
    LDSJXCheck: TDataSource;
    //LAdoJXCheck:TBainaAdoQuery;
    LAdoUser: TbainaADOQuery;
    EdtDateA: TcxDateEdit;
    EdtDateB: TcxDateEdit;
    Panel9: TPanel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    LAdoJXCheck: TbainaADOQuery;
    LAdoPercent: TbainaADOQuery;
    PB: TProgressBar;
    GrdShow: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    LAdoShow: TbainaADOQuery;
    LDSShow: TDataSource;
    PopupMenu1: TPopupMenu;
    EXCEL1: TMenuItem;
    SaveDlg: TSaveDialog;
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxNavBar1Item1Click(Sender: TObject);
    procedure dxNavBar1Item2Click(Sender: TObject);
    procedure dxNavBar1Item3Click(Sender: TObject);
    procedure dxNavBar1Item4Click(Sender: TObject);
    procedure dxNavBar1Item5Click(Sender: TObject);
    procedure dxNavBar1Item6Click(Sender: TObject);
    procedure dxNavBar1Item7Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxTrackBar2PropertiesChange(Sender: TObject);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure CBStylePropertiesChange(Sender: TObject);
    procedure RBCustClick(Sender: TObject);
    procedure RBProdClick(Sender: TObject);
    procedure RBDeptClick(Sender: TObject);
    procedure RBPersonClick(Sender: TObject);
    procedure dxNavBar1Item8Click(Sender: TObject);
    procedure CBACloseUp(Sender: TObject);
    procedure CBBCloseUp(Sender: TObject);
    procedure GrdCustClassCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure GrdCustClassCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EXCEL1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowCustClass;
    Procedure ShowCustDevelop;
    Procedure ShowCustActive;
    Procedure ShowSaleSum;
    Procedure ShowSaleList;
    Procedure CustInitial;
    Procedure GetSqlText;
    Procedure ShowDBChartStyle;
    Procedure ShowClassCount;
    Procedure ShowSaleLine(SaleLine,SaleField,SaleType,SaleMoney,MoneyField,MoneyType:String);
    Procedure ShowJXCheck;
    Procedure ClassInitial;
    Procedure SaleInitial;
  public
    { Public declarations }
  end;

var
  Frm_Count: TFrm_Count;

implementation

uses DataBase, MainFrm, Customer;

{$R *.dfm}
Var
  LCustClass,LCustDevelop,LCustActive,LJXCheck,LSaleSum,LSaleList,LClassCount,LSaleline:Boolean;
  SQLText:String;

procedure TFrm_Count.cxButton1Click(Sender: TObject);
Var
  FieldName,LSqlText,RSqlText,LRSqlText,PercentSql:String;
  I:Integer;
  UserName,UserDept:String;
  CountPercent,CustCount,ActiveCustCount,ExpendSum,SaleCount,SaleSum,FactSum,NoPay,ContractCount,ContractSum:Real;
Begin
  inherited;
  GetSqlText;
  LSqlText:='';
  RSqlText:='';
  PercentSql:='';
  CountPerCent:=0;
  LAdoCust.AliasName:='a';
  if  LAdoCust.AccSQL <> '' Then
    Begin
      RSqlText:=' And (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoCust.AccSQL+'))'+ ')';
    End
      Else RSqlText:= ')';

  IF LCustClass=True Then
    Begin
      LAdoPercent.AliasName:='a';
      if  LAdoPercent.AccSQL <> '' Then
        Begin
          LRSqlText:=' Where (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoPercent.AccSQL+'))';
        End
          Else LRSqlText:= ' ';
      PercentSql:='Select Count(a.CustID) As CountCustID From Customer a,UserS_ b  '+LRSqlText+' '+'And a.belongid=b.userID_'+' '+SqlText;

      LAdoPercent.Close;
      LAdoPercent.SQL.Clear;
      LAdoPercent.SQL.Add(PercentSql);
      LAdoPercent.Prepared;
      //Showmessage(PercentSql);
      LAdoPercent.Open;
      CountPerCent:=LAdoPercent.FieldByName('CountCustID').AsFloat;
      IF CountPerCent=0 Then
        Begin
          CustInitial;
          Exit;
        End;

      FieldName:= AdoCustClass.FieldByName('FactTableName').AsString;
      IF FieldName='' Then Exit;
      LSQLText:= 'Select Count(a.CustID) As CustCount,a.'+FieldName+' As CustClass'+','+'Convert(Varchar(12),Convert(Numeric(10,2),Convert(Numeric(10,2),Count(a.CustID))/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount' +' '+' From Customer a,Users_ b Where (' +
                 'a.belongID=b.UserId_ '+RSqlText+' '+SQLText+' Group by '+FieldName+' '+'Order by CustCount Desc';
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //ShowMessage(LSqlText);
      LAdoCust.Open;
      ShowCustClass;//显示客户分类记录
    End;
  IF LCustDevelop=True Then
    Begin
      LAdoPercent.AliasName:='a';
      if  LAdoPercent.AccSQL <> '' Then
        Begin
          LRSqlText:=' And (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoPercent.AccSQL+'))';
        End
          Else LRSqlText:= ' ';
      PercentSql:='Select Count(a.CustID) As CountCustID From Customer a,Users_ b Where b.userID_=a.belongid'+LRSqlText+' '+SqlText;
      LAdoPercent.Close;
      LAdoPercent.SQL.Clear;
      LAdoPercent.SQL.Add(PercentSql);
      LAdoPercent.Prepared;

      LAdoPercent.Open;
      CountPerCent:=LAdoPercent.FieldByName('CountCustID').AsFloat;
      IF CountPerCent=0 Then
        Begin
          CustInitial;
          Exit;
        End;
      LSQLText:= 'Select Count(a.CustID) As CustCount,Convert(varchar(4),Year(a.CreateD_))' +
                ' + ''-'' + Convert(Varchar(2),Month(a.CreateD_)) As CreateD'+','+'Convert(Varchar(12),Convert(Numeric(10,2),Convert(Numeric(10,2),Count(a.CustID))/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                'From Customer a,users_ b where ('+'a.belongID=b.UserID_ ' +
                RSqlText+' '+SQLText +' Group by Convert(varchar(4),Year(a.CreateD_)) + ' + '''-'' + Convert(Varchar(2),Month(a.CreateD_))'+' '+'Order by CustCount Desc';
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //Showmessage(PercentSql);
      LAdoCust.Open;
      ShowCustDevelop;//显示客户发展记录
    End;
  IF LCustActive=True Then
    Begin
      LAdoPercent.AliasName:='a';
      if  LAdoPercent.AccSQL <> '' Then
        Begin
          LRSqlText:=' Where (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoPercent.AccSQL+'))';
        End
          Else LRSqlText:= ' ';
      PercentSql:='Select Count(a.CustID) As CountCustID From Customer a,CustActive b  '+LRSqlText+' '+'And a.custID=b.custId'+' '+SqlText;
      LAdoPercent.Close;
      LAdoPercent.SQL.Clear;
      LAdoPercent.SQL.Add(PercentSql);
      LAdoPercent.Prepared;
      //Showmessage(PercentSql);
      LAdoPercent.Open;
      CountPerCent:=LAdoPercent.FieldByName('CountCustID').AsFloat;
      IF CountPerCent=0 Then
        Begin
          CustInitial;
          Exit;
        End;
      LSQLText:= 'Select Count(a.CustID) as CustCount,C.UserName_' + ','+'Convert(Varchar(12),Convert(Numeric(10,2),Convert(Numeric(10,2),Count(a.CustID))/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                 ' From Customer a,CustActive b,Users_ c where ( a.CustID=B.CustID And b.BelongID=c.UserID_ ' +
                 RSqlText+' '+SqlText+' Group By C.UserName_'+' '+'Order by CustCount Desc';
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //ShowMessage(LSqlText);
      LAdoCust.Open;
      ShowCustActive;//显示客户跟进记录
    End;
  IF LSaleSum=True Then
    Begin
      LAdoPercent.AliasName:='a';
      if  LAdoPercent.AccSQL <> '' Then
        Begin
          LRSqlText:=' Where (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoPercent.AccSQL+'))';
        End
          Else LRSqlText:= ' ';
      PercentSql:='Select Sum(c.SaleMoney) As CountCustID From Customer a,Users_ b,SaleMaste C  '+LRSqlText+' '+'And c.IFCheck='+'1'+' And B.UserID_=a.BelongID And a.custID=c.custId'+' '+SqlText;
      LAdoPercent.Close;
      LAdoPercent.SQL.Clear;
      LAdoPercent.SQL.Add(PercentSql);
      LAdoPercent.Prepared;
      //Showmessage(PercentSql);
      LAdoPercent.Open;
      CountPerCent:=LAdoPercent.FieldByName('CountCustID').AsFloat;
      IF CountPerCent=0 Then
        Begin
          CustInitial;
          Exit;
        End;
      LSQLText:=' Select b.UserName_,Sum(a.SaleMoney) As SaleMoney,Sum(a.FactMoney) As FactMoney' +','+'Convert(Varchar(12),Convert(Numeric(10,2),Sum(a.SaleMoney)/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                ' From Customer c,Users_ b,saleMaste a where ( a.IFCheck='+'1'+' '+'And b.UserID_=a.BelongID and a.CustID=c.CustID ' +
                RSqlText+' '+SqlText+' Group By b.UserName_'+' '+'Order by SaleMoney Desc';
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //ShowMessage(LSqlText);
      LAdoCust.Open;
      ShowSaleSum;//显示销售总额
    End;
  IF LSaleList=True Then
    Begin
      LSQLText:=' Select a.CreateD_,a.SCustName,c.ProdName,c.SaleCount,c.SaleAgio,c.SalePrice,c.SaleTotal,b.UserName_' +
                ' From SaleMaste a,Users_ b,saleDetail c where ( a.IFCheck='+'1'+' '+'And b.UserID_=a.BelongID ' + 'And a.SaleID=c.SaleID '+
                RSqlText+' '+SqlText+' Order by c.SaleTotal';
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //ShowMessage(LSqlText);
      LAdoCust.Open;
      ShowSaleList;//显示销售明细
    End;
  IF LClassCount=True Then
    Begin
      LAdoPercent.AliasName:='a';
      if  LAdoPercent.AccSQL <> '' Then
        Begin
          LRSqlText:=' Where (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoPercent.AccSQL+'))';
        End
          Else LRSqlText:= ' ';
      PercentSql:='Select Sum(a.SaleMoney) As CountCustID From Customer b,SaleMaste a,UserS_ C  '+LRSqlText+' '+'And a.IFCheck='+'1'+' And a.custID=b.custId'+' And a.BelongID=c.UserID_'+' '+SqlText;
      LAdoPercent.Close;
      LAdoPercent.SQL.Clear;
      LAdoPercent.SQL.Add(PercentSql);
      LAdoPercent.Prepared;
      //Showmessage(PercentSql);
      LAdoPercent.Open;
      CountPerCent:=LAdoPercent.FieldByName('CountCustID').AsFloat;
      IF CountPerCent=0 Then
        Begin
          CustInitial;
          Exit;
        End;

      FieldName:= AdoCustClass.FieldByName('FactTableName').AsString;
      IF FieldName='' Then Exit;
      LSQLText:= 'Select b.'+FieldName+' As CustClass,Sum(a.SaleMoney) As SaleMoney'+','+'Convert(Varchar(12),Convert(Numeric(10,2),Sum(a.SaleMoney)/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
      ' From Customer b,SaleMaste a,Users_ c Where ( a.IFCheck='+'1'+' ' +
                 'And a.CustID=B.CustID '+' '+'And B.Belongid=C.UserID_'+' '+RSqlText+' '+SQLText+' Group by '+FieldName+' '+'Order by SaleMoney Desc';
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //ShowMessage(LSqlText);
      LAdoCust.Open;
      ShowClassCount;
    End;
  IF LSaleline=True Then
    Begin
      LAdoPercent.AliasName:='a';
      if  LAdoPercent.AccSQL <> '' Then
        Begin
          LRSqlText:=' Where (a.BelongID='+' '+IntToStr(DatabaseModule.dtclsData.UserID_) +' '+' or ('+LAdoPercent.AccSQL+'))';
        End
          Else LRSqlText:= ' ';
      PercentSql:='Select Sum(a.SaleMoney) As CountCustID From Customer b,SaleMaste a  '+LRSqlText+' '+'And a.IFCheck='+'1'+' And a.custID=b.custId'+' '+SqlText;
      LAdoPercent.Close;
      LAdoPercent.SQL.Clear;
      LAdoPercent.SQL.Add(PercentSql);
      LAdoPercent.Prepared;
      //Showmessage(PercentSql);
      LAdoPercent.Open;
      CountPerCent:=LAdoPercent.FieldByName('CountCustID').AsFloat;

      IF CountPerCent=0 Then
        Begin
          CustInitial;
          Exit;
        End;
      CustInitial;
      IF RBCust.Checked=True Then
        Begin
          LSQLText:= 'Select b.CustID,b.CustName,Sum(a.SaleMoney) As SaleMoney' +','+'Convert(Varchar(12),Convert(Numeric(10,2),Sum(a.SaleMoney)/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                     ' From Customer b,SaleMaste a Where ( a.IFCheck='+'1'+' ' +
                     'And a.CustID=B.CustID '+RSqlText+' '+SQLText+' Group by b.CustID,b.CustName'+' '+'Order by SaleMoney Desc';
        End;
      IF RBProd.Checked=True Then
        Begin
          LSQLText:= 'Select B.ProdID,B.ProdName,Sum(A.SaleMoney) As SaleMoney' +','+'Convert(Varchar(12),Convert(Numeric(10,2),Sum(a.SaleMoney)/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                     ' From SaleMaste a,SaleDetail b Where ( a.IFCheck='+'1'+' ' +
                     'And a.SaleID=B.SaleID '+RSqlText+' '+SQLText+' Group by B.ProdID,B.ProdName'+' '+'Order by SaleMoney Desc';
        End;
      IF RBDept.Checked=True Then
        Begin
          LSQLText:= 'Select b.DeptID_,b.DeptName_,Sum(A.SaleMoney) As SaleMoney' +','+'Convert(Varchar(12),Convert(Numeric(10,2),Sum(a.SaleMoney)/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                     ' From SaleMaste a,DepartMent_ b Where ( a.IFCheck='+'1'+' ' +
                     'And a.DeptID_=B.DeptID_ '+RSqlText+' '+SQLText+' Group by B.DeptID_,B.DeptName_'+' '+'Order by SaleMoney Desc';
        End;
      IF RBPerson.Checked=True Then
        Begin
          LSQLText:= 'Select B.UserID_,B.UserName_,Sum(A.SaleMoney) As SaleMoney' +','+'Convert(Varchar(12),Convert(Numeric(10,2),Sum(a.SaleMoney)/'+FloattoStr(CountPerCent)+'*100))'+'+ '+'''%'''+' As PercentCount'+' '+
                     ' From SaleMaste a,Users_ b Where ( a.IFCheck='+'1'+' ' +
                     'And a.BelongID=B.UserID_'+RSqlText+' '+SQLText+' Group by B.UserID_,B.UserName_ '+' '+'Order by SaleMoney Desc';
        End;
      LAdoCust.Close;
      LAdoCust.SQL.Clear;
      LAdoCust.SQL.Add(LSqlText);
      LAdoCust.Prepared;
      //ShowMessage(LSqlText);
      LAdoCust.Open;
      IF RBCust.Checked=True Then ShowSaleLine('客户','CustName','String','销售总额','SaleMoney','Float');
      IF RBProd.Checked=True Then ShowSaleLine('产品','ProdName','String','销售总额','SaleMoney','Float');
      IF RBDept.Checked=True Then ShowSaleLine('部门','DeptName_','String','销售总额','SaleMoney','Float');
      IF RBPerson.Checked=True Then ShowSaleLine('个人','UserName_','String','销售总额','SaleMoney','Float');

    End;
  IF LJXCheck=True Then
    Begin
      {FOR I:=1 TO LAdoJXCheck.RecordCount DO
        Begin
          LAdoJXCheck.Delete;
        End;}
      LAdoJXCheck.AliasName:='a';
      LSqlText:='select a.username_,b.deptname_,u.devpcust,v.activecust,w.expendmoney,x.salecount,x.salesum,x.factsum,x.cancelsum From users_ a left join'+
                ' (select b.username_ as '+'''username_'''+', Count(a.custid) as '+'''devpcust'''+
                ' from customer a,users_ b where b.userid_=a.belongid  and a.created_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+' a.created_<='''+DateToStr(cxDateEdit2.Date)+''''+' group by b.username_) u on a.username_=u.username_ '+
                ' Left join'+
                ' (select a.username_ as '+'''username_'''+',Count(t.CustID) as '+'''activecust'''+
                ' From users_ a left join (select b.custid,c.belongid from customer b'+
                ' inner join custactive c on b.custid=c.custid where c.created_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+' c.created_<='''+DateToStr(cxDateEdit2.Date)+''''+' ) t on a.userid_=t.belongid group by a.username_) v on a.username_ = v.username_ '+
                ' left join '+
                ' (select a.username_ as '+'''username_'''+',Sum(b.ExpendMoney) As '+'''expendmoney'''+
                ' From users_ a left join Expend b on a.userid_=b.belongid  where b.created_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+' b.created_<='''+DateToStr(cxDateEdit2.Date)+''''+' group by a.username_) w on a.username_ = w.username_ '+
                ' left join '+
                ' (select a.username_ as '+'''username_'''+',count(b.Saleid) as '+'''salecount'''+',sum(b.salemoney) as '+'''salesum'''+',sum(b.Factmoney) as '+'''factsum'''+',sum(b.cancelmoney) as '+'''cancelsum'''+
                ' From users_ a left join Salemaste b on a.userid_=b.belongid  where b.saledate>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+' b.saledate<='''+DateToStr(cxDateEdit2.Date)+''''+' group by a.username_) x on a.username_ = x.username_'+
                ' Left join department_ b on a.deptid_=b.deptid_';
      LAdoJXCheck.Close;
      LAdoJXCheck.SQL.Clear;
      LAdoJXCheck.SQL.Add(LSqlText);//('Select a.UserID_,a.UserName_,b.DeptName_ From Users_ a,DepartMent_ b Where a.DeptID_=b.DeptID_');
      LAdoJXCheck.Prepared;

      LAdoJXCheck.Open;
      LAdoJXCheck.First;

      {PB.Max:=LadoUser.RecordCount;
      FOR I:=1 TO LadoUser.RecordCount DO
        Begin
          USerName:=LAdoUser.FieldByName('UserName_').AsString;
          UserDept:=LAdoUser.FieldByName('DeptName_').AsString;

          LSQLText:='';
          LSQLText:='Select Count(a.CustID) as CustCount From Customer a  Where (a.BelongID='+IntToStr(LAdoUser.FieldByName('UserID_').AsInteger)+' '+
                    RSqlText+' And '+'a.CreateD_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+'a.CreateD_<='''+DateToStr(cxDateEdit2.Date)+'''';
          LAdoCust.Close;
          LAdoCust.SQL.Clear;
          LAdoCust.SQL.Add(LSQLText);
          LAdoCust.Prepared;

          LAdoCust.Open;
          CustCount:= LAdoCust.FieldByName('CustCount').AsInteger;

          LSQLText:='';
          LSQLText:='Select Count(a.CustID) as ActiveCustCount From Customer a,CustActive b  Where (a.BelongID='+IntToStr(LAdoUser.FieldByName('UserID_').AsInteger)+' '+
                    ' '+'And a.CustID=b.CustID'+' '+
                    RSqlText+' And '+'b.CreateD_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+'b.CreateD_<='''+DateToStr(cxDateEdit2.Date)+'''';
          LAdoCust.Close;
          LAdoCust.SQL.Clear;
          LAdoCust.SQL.Add(LSQLText);
          LAdoCust.Prepared;

          LAdoCust.Open;
          ActiveCustCount:= LAdoCust.FieldByName('ActiveCustCount').AsInteger;

          LSQLText:='';
          LSQLText:='Select Sum(a.ExpendMoney) As ExpendSum From Expend a  Where (a.BelongID='+IntToStr(LAdoUser.FieldByName('UserID_').AsInteger)+' '+
                    ' '+RSqlText+' And '+'a.CreateD_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+'a.CreateD_<='''+DateToStr(cxDateEdit2.Date)+'''';
          LAdoCust.Close;
          LAdoCust.SQL.Clear;
          LAdoCust.SQL.Add(LSQLText);
          LAdoCust.Prepared;

          LAdoCust.Open;
          ExpendSum:= LAdoCust.FieldByName('ExpendSum').AsFloat;

          LSQLText:='';
          LSQLText:='Select Count(a.SaleMID) As SaleCount,Sum(a.SaleMoney) As SaleSum,Sum(a.FactMoney) As FactSum,Sum(a.CancelMoney) As CancelMoney  From SaleMaste a  Where (a.BelongID='+IntToStr(LAdoUser.FieldByName('UserID_').AsInteger)+' '+
                    ' '+'And a.IFcheck='+'1'+' '+
                    RSqlText+' And '+'a.CreateD_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+'a.CreateD_<='''+DateToStr(cxDateEdit2.Date)+'''';
          LAdoCust.Close;
          LAdoCust.SQL.Clear;
          LAdoCust.SQL.Add(LSQLText);
          LAdoCust.Prepared;

          LAdoCust.Open;
          SaleCount:= LAdoCust.FieldByName('SaleCount').AsInteger;

          //LSQLText:='';
          //LSQLText:='Select Sum(b.SaleMoney) As SaleSum,Sum(b.FactMoney) As FactSum From Customer a,SaleMaste b  Where (a.BelongID='+IntToStr(LAdoUser.FieldByName('UserID_').AsInteger)+' '+
          //          ' '+'And b.IFCheck='+'1'+'and a.CustID=b.CustID'+' '+
          //          RSqlText+' And '+'b.CreateD_>='''+DateToStr(cxDateEdit1.Date)+''''+' And '+'b.CreateD_<='''+DateToStr(cxDateEdit2.Date)+'''';
          //LAdoCust.Close;
          //LAdoCust.SQL.Clear;
          //LAdoCust.SQL.Add(LSQLText);
          //LAdoCust.Prepared;
          //ShowMessage(lsqltext);
          //LAdoCust.Open;
          SaleSum:= LAdoCust.FieldByName('SaleSum').AsFloat;
          FactSum:= LAdoCust.FieldByName('FactSum').AsFloat;
          NoPay:= LAdoCust.FieldByName('CancelMoney').AsFloat;

          //ContractCount,ContractSum
          LAdoJXCheck.Append;
          LAdoJXCheck.FieldByName('DeptName').AsString:=UserDept;
          LAdoJXCheck.FieldByName('UserName').AsString:=UserName;
          LAdoJXCheck.FieldByName('CustCount').AsFloat :=CustCount;
          LAdoJXCheck.FieldByName('ActiveCustCount').AsFloat :=ActiveCustCount;
          LAdoJXCheck.FieldByName('ExpendSum').AsFloat :=ExpendSum;
          LAdoJXCheck.FieldByName('SaleCount').AsFloat :=SaleCount;
          LAdoJXCheck.FieldByName('SaleSum').AsFloat :=SaleSum;
          LAdoJXCheck.FieldByName('CancelMoney').AsFloat:=NoPay;
          LAdoJXCheck.FieldByName('FactSum').AsFloat :=FactSum;
          LAdoJXCheck.Post;
          LAdoJXCheck.Append;
          LAdoJXCheck.FieldByName('DeptName').AsString:=LAdoUser.FieldByName('DeptName_').AsString;
          LAdoJXCheck.FieldByName('UserName').AsString:=LAdoUser.FieldByName('UserName_').AsString;
          LAdoJXCheck.FieldByName('CustCount').AsFloat :=LAdoUser.FieldByName('devpcust').AsFloat;
          LAdoJXCheck.FieldByName('ActiveCustCount').AsFloat :=LAdoUser.FieldByName('ActiveCust').AsFloat;
          LAdoJXCheck.FieldByName('ExpendSum').AsFloat :=LAdoUser.FieldByName('ExpendMoney').AsFloat;
          LAdoJXCheck.FieldByName('SaleCount').AsFloat :=LAdoUser.FieldByName('SaleCount').AsFloat;
          LAdoJXCheck.FieldByName('SaleSum').AsFloat :=LAdoUser.FieldByName('SaleSum').AsFloat;
          LAdoJXCheck.FieldByName('CancelMoney').AsFloat:=LAdoUser.FieldByName('CancelSum').AsFloat;
          LAdoJXCheck.FieldByName('FactSum').AsFloat :=LAdoUser.FieldByName('FactSum').AsFloat;
          LAdoJXCheck.Post;

          LAdoUser.Next;
          PB.Position:=PB.Position+1;
        End;}
      ShowJXCheck;
      PB.Position:=0;
    End;
end;

procedure TFrm_Count.FormCreate(Sender: TObject);
Var
  TableNo: array[0..1] of Integer;
  I:Integer;
begin
  inherited;
  {CBStyle.ItemIndex:=0;
  LJXCheck:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LSaleSum:=False;
  LSaleList:=False;
  LClassCount:=False;
  LSaleline:=False;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select DictMID_ From DataDictMast where TableName_=''Customer'' OR TableName_=''Users_''');
  Query.Prepared;
  Query.Open;
  Query.First;
  FOR I:=0 TO Query.RecordCount - 1 Do
    Begin
      TableNo[I]:=Query.FieldByName('DictMID_').AsInteger;
      Query.Next;
    End;
  Query.Close;

  AdoDictA.Close;
  AdoDictA.SQL.Clear;
  AdoDictA.SQL.Add('Select DictMid_,FieldName_,FieldNote_,FieldType_ From Bill_DataDictLine where (DictMID_=:DictMIDA OR DictMID_=:DictMIDB)');
  AdoDictA.SQL.Add(' And FieldNote_<>'+'''建立日期'''+' '+' And FieldName_ in ('+'''CustName'''+','+'''UserName_'''+','+'''CreateD_'''+','+'''CustCountry'''+','+'''CustProvince'''+','+'''CustCity'''+','+'''CustRegion'''+','+'''CustRate'''+','+'''CustType'''+','+'''CustSource'''+','+'''CustTrade'''+','+'''CustCredit'''+')');
  AdoDictA.Parameters.ParamByName('DictMIDA').Value:=TableNo[0];
  AdoDictA.Parameters.ParamByName('DictMIDB').Value:=TableNo[1];
  AdoDictA.Prepared;
  AdoDictA.Open;
  AdoDictB.Close;
  AdoDictB.SQL.Clear;
  AdoDictB.SQL.Add('Select DictMid_,FieldName_,FieldNote_,FieldType_ From Bill_DataDictLine where (DictMID_=:DictMIDA OR DictMID_=:DictMIDB)');
  AdoDictB.SQL.Add(' And FieldNote_<>'+'''建立日期'''+' '+' And FieldName_ in ('+'''CustName'''+','+'''UserName_'''+','+'''CreateD_'''+','+'''CustCountry'''+','+'''CustProvince'''+','+'''CustCity'''+','+'''CustRegion'''+','+'''CustRate'''+','+'''CustType'''+','+'''CustSource'''+','+'''CustTrade'''+','+'''CustCredit'''+')');
  AdoDictB.Parameters.ParamByName('DictMIDA').Value:=TableNo[0];
  AdoDictB.Parameters.ParamByName('DictMIDB').Value:=TableNo[1];
  AdoDictB.Prepared;
  AdoDictB.Open;

  CBA.ListSource:=DSDictA;
  CBA.ListField:='FieldNote_';
  CBA.KeyField:= 'FieldNote_';

  CBB.ListSource:=DSDictB;
  CBB.ListField:='FieldNote_';
  CBB.KeyField:= 'FieldNote_';}
  
end;

procedure TFrm_Count.dxNavBar1Item1Click(Sender: TObject);
  Var
  I:Integer;
begin
  inherited;
  ClassInitial;
  LJXCheck:=False;
  LCustClass:=True;
  LCustDevelop:=False;
  LCustActive:=False;
  LSaleSum:=False;
  LSaleList:=False;
  LClassCount:=False;
  LSaleline:=False;
  AdoCustClass.Close;
  AdoCustClass.SQL.Clear;
  AdoCustClass.SQL.Add('Select DISTINCT FieldName,FactTableName From Dict Where IFCust=1');
  AdoCustClass.Prepared;
  AdoCustClass.Open;
  CustClass.ListSource:=DSCustClass;
  CustClass.ListField:='FieldName';
  CustClass.KeyField:='FieldName';
  CustInitial;
  CustClass.Visible:=True;
  Panel9.Visible:=False;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=True;
  cxGrid2.Visible:=False;
end;

procedure TFrm_Count.ShowCustClass;
Var
  I:Integer;
  aIndex:integer;
  pie:TPieSeries;
  bar:TBarSeries;
begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=100;
   End;
          GrdCustClass.DataController.DataSource:=LDSCust;
          GrdCustClass.Columns[0].Caption:=AdoCustClass.FieldByName('FieldName').AsString;
          GrdCustClass.Columns[0].DataBinding;
          GrdCustClass.Columns[0].DataBinding.FieldName:='CustClass';
          GrdCustClass.Columns[0].DataBinding.ValueType:='String';

          GrdCustClass.Columns[1].Caption:='客户数量';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='CustCount';
          GrdCustClass.Columns[1].DataBinding.ValueType:='integer';

          GrdCustClass.Columns[2].Caption:='百分比';
          GrdCustClass.Columns[2].DataBinding;
          GrdCustClass.Columns[2].DataBinding.FieldName:='PercentCount';
          GrdCustClass.Columns[2].DataBinding.ValueType:='String';

    ShowDBChartStyle;
    
    DBChart.Series[0].DataSource := LAdoCust;
    DBChart.Series[0].XLabelsSource:= 'CustClass';
    DBChart.Series[0].YValues.ValueSource := 'CustCount';

end;

procedure TFrm_Count.GetSqlText;
begin
  SQLText:='';
  IF (CBA.Text<>'') AND (CBConditionA.Text<>'') AND ((EdtTextA.Text<>'') OR (EdtDateA.Text<>'')) Then
    Begin
      IF CBConditionA.Text='等于' Then
        Begin
          IF UpperCase(AdoDictA.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=' And a.'+AdoDictA.FieldByName('FieldName_').AsString+' = '''+EdtDateA.Text+''''
          Else SqlText:=' And '+AdoDictA.FieldByName('FieldName_').AsString+' = '''+EdtTextA.Text+'''';
        End;
      IF CBConditionA.Text='不等于' Then
        Begin
          IF UpperCase(AdoDictA.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=' And a.'+AdoDictA.FieldByName('FieldName_').AsString+' <> '''+EdtDateA.Text+''''
          Else SqlText:=' And '+AdoDictA.FieldByName('FieldName_').AsString+' <> '''+EdtTextA.Text+'''';
        End;
      IF CBConditionA.Text='相似' Then
        Begin
          IF UpperCase(AdoDictA.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=' And a.'+AdoDictA.FieldByName('FieldName_').AsString+' Like ''%'+EdtDateA.Text+'%'''
          Else SqlText:=' And '+AdoDictA.FieldByName('FieldName_').AsString+' Like ''%'+EdtTextA.Text+'%''';
        End;
      IF CBConditionA.Text='大于等于' Then
        Begin
          IF UpperCase(AdoDictA.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=' And a.'+AdoDictA.FieldByName('FieldName_').AsString+' >= '''+EdtDateA.Text+''''
          Else SqlText:=' And '+AdoDictA.FieldByName('FieldName_').AsString+' >= '''+EdtTextA.Text+'''';
        End;
      IF CBConditionA.Text='小于等于' Then
        Begin
          IF UpperCase(AdoDictA.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=' And a.'+AdoDictA.FieldByName('FieldName_').AsString+' <= '''+EdtDateA.Text+''''
          Else SqlText:=' And '+AdoDictA.FieldByName('FieldName_').AsString+' <= '''+EdtTextA.Text+'''';
        End;
      IF (CBB.Text<>'') AND (CBConditionB.Text<>'') AND ((EdtTextB.Text<>'') OR (EdtDateB.Text<>'')) Then
        Begin
          IF CBConditionB.Text='等于' Then
            Begin
              IF RBAnd.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' And a.'+AdoDictB.FieldByName('FieldName_').AsString+' = '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' And '+AdoDictB.FieldByName('FieldName_').AsString+' = '''+EdtTextB.Text+'''';
                End;
              IF RBOR.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' OR a.'+AdoDictB.FieldByName('FieldName_').AsString+' = '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' OR '+AdoDictB.FieldByName('FieldName_').AsString+' = '''+EdtTextB.Text+'''';
                End;
            End;
          IF CBConditionB.Text='不等于' Then
            Begin
              IF RBAnd.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' And a.'+AdoDictB.FieldByName('FieldName_').AsString+' <> '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' And '+AdoDictB.FieldByName('FieldName_').AsString+' <> '''+EdtTextB.Text+'''';
                End;
              IF RBOR.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' OR a.'+AdoDictB.FieldByName('FieldName_').AsString+' <> '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' OR '+AdoDictB.FieldByName('FieldName_').AsString+' <> '''+EdtTextB.Text+'''';
                End;
            End;
          IF CBConditionB.Text='相似' Then
            Begin
              IF RBAnd.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' And a.'+AdoDictB.FieldByName('FieldName_').AsString+' Like ''%'+EdtDateB.Text+'%'''
                  Else SqlText:=SqlText+' And '+AdoDictB.FieldByName('FieldName_').AsString+' Like ''%'+EdtTextB.Text+'%''';
                End;
              IF RBOR.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' OR a.'+AdoDictB.FieldByName('FieldName_').AsString+' Like ''%'+EdtDateB.Text+'%'''
                  Else SqlText:=SqlText+' OR '+AdoDictB.FieldByName('FieldName_').AsString+' Like ''%'+EdtTextB.Text+'%''';
                End;
            End;
          IF CBConditionB.Text='大于等于' Then
            Begin
              IF RBAnd.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' And a.'+AdoDictB.FieldByName('FieldName_').AsString+' >= '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' And '+AdoDictB.FieldByName('FieldName_').AsString+' >= '''+EdtTextB.Text+'''';
                End;
              IF RBOR.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' OR a.'+AdoDictB.FieldByName('FieldName_').AsString+' >= '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' OR '+AdoDictB.FieldByName('FieldName_').AsString+' >= '''+EdtTextB.Text+'''';
                End;
            End;
          IF CBConditionB.Text='小于等于' Then
            Begin
              IF RBAnd.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' And a.'+AdoDictB.FieldByName('FieldName_').AsString+' <= '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' And '+AdoDictB.FieldByName('FieldName_').AsString+' <= '''+EdtTextB.Text+'''';
                End;
              IF RBOR.Checked Then
                Begin
                  IF UpperCase(AdoDictB.FieldByName('FieldType_').AsString)=UpperCase('DateTime') Then SqlText:=SqlText+' OR a.'+AdoDictB.FieldByName('FieldName_').AsString+' <= '''+EdtDateB.Text+''''
                  Else SqlText:=SqlText+' OR '+AdoDictB.FieldByName('FieldName_').AsString+' <= '''+EdtTextB.Text+'''';
                End;
            End;
        End;
    End;
end;

procedure TFrm_Count.ShowCustDevelop;
Var
  I:Integer;
  aIndex:integer;
  pie:TPieSeries;
  bar:TBarSeries;
begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=100;
   End;
          GrdCustClass.DataController.DataSource:=LDSCust;
          GrdCustClass.Columns[0].Caption:='发展日期';
          GrdCustClass.Columns[0].DataBinding;
          GrdCustClass.Columns[0].DataBinding.FieldName:='CreateD';
          GrdCustClass.Columns[0].DataBinding.ValueType:='String';

          GrdCustClass.Columns[1].Caption:='客户数量';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='CustCount';
          GrdCustClass.Columns[1].DataBinding.ValueType:='integer';

          GrdCustClass.Columns[2].Caption:='百分比';
          GrdCustClass.Columns[2].DataBinding;
          GrdCustClass.Columns[2].DataBinding.FieldName:='PercentCount';
          GrdCustClass.Columns[2].DataBinding.ValueType:='String';

    ShowDBChartStyle;

    DBChart.Series[0].DataSource := LAdoCust;
    DBChart.Series[0].XLabelsSource:= 'CreateD';
    DBChart.Series[0].YValues.ValueSource := 'CustCount';

end;

procedure TFrm_Count.dxNavBar1Item2Click(Sender: TObject);
begin
  inherited;
  ClassInitial;
  LJXCheck:=False;
  LCustClass:=False;
  LCustDevelop:=True;
  LCustActive:=False;
  LSaleSum:=False;
  LSaleList:=False;
  LClassCount:=False;
  LSaleline:=False;
  CustInitial;
  CustClass.Visible:=False;
  Panel9.Visible:=False;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=True;
  cxGrid2.Visible:=False;
end;

procedure TFrm_Count.CustInitial;
Var
  I:integer;
begin
  for i:=self.DBChart.SeriesCount-1 downto 0 do
  begin
    try
      self.DBChart.Series[i].Free;
    except
    end;
  end;
  IF LAdoCust.State=DSBrowse Then LAdoCust.Close;
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;
end;

procedure TFrm_Count.ShowCustActive;
Var
  I:Integer;
  aIndex:integer;
  pie:TPieSeries;
  bar:TBarSeries;
begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=200;
   End;
          GrdCustClass.DataController.DataSource:=LDSCust;
          GrdCustClass.Columns[0].Caption:='归属人';
          GrdCustClass.Columns[0].DataBinding;
          GrdCustClass.Columns[0].DataBinding.FieldName:='UserName_';
          GrdCustClass.Columns[0].DataBinding.ValueType:='String';

          {GrdCustClass.Columns[1].Caption:='客户名称';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='CustName';
          GrdCustClass.Columns[1].DataBinding.ValueType:='String';}

          GrdCustClass.Columns[1].Caption:='跟进次数';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='CustCount';
          GrdCustClass.Columns[1].DataBinding.ValueType:='Integer';

          GrdCustClass.Columns[2].Caption:='百分比';
          GrdCustClass.Columns[2].DataBinding;
          GrdCustClass.Columns[2].DataBinding.FieldName:='PercentCount';
          GrdCustClass.Columns[2].DataBinding.ValueType:='String';

    ShowDBChartStyle;
    
    DBChart.Series[0].DataSource := LAdoCust;
    DBChart.Series[0].XLabelsSource:= 'UserName_';
    DBChart.Series[0].YValues.ValueSource := 'CustCount';

end;

procedure TFrm_Count.dxNavBar1Item3Click(Sender: TObject);
begin
  inherited;
  ClassInitial;
  LJXCheck:=False;
  LSaleSum:=False;
  LSaleList:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=True;
  LClassCount:=False;
  LSaleline:=False;
  CustInitial;
  CustClass.Visible:=False;
  Panel9.Visible:=False;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=True;
  cxGrid2.Visible:=False;
end;

procedure TFrm_Count.dxNavBar1Item4Click(Sender: TObject);
begin
  inherited;
  SaleInitial;
  LJXCheck:=False;
  LSaleSum:=True;
  LSaleList:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LClassCount:=False;
  LSaleline:=False;
  CustInitial;
  CustClass.Visible:=False;
  Panel9.Visible:=False;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=False;
  cxGrid2.Visible:=False;
end;

procedure TFrm_Count.dxNavBar1Item5Click(Sender: TObject);
begin
  inherited;
  SaleInitial;
  LJXCheck:=False;
  LSaleList:=True;
  LSaleSum:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LClassCount:=False;
  LSaleline:=False;
  CustInitial;
  CustClass.Visible:=False;
  Panel9.Visible:=False;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=False;
  cxGrid2.Visible:=False;
end;

procedure TFrm_Count.ShowSaleList;
Var
  I:Integer;
  CustColumn:TcxGridDBColumn;
begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
   End;
          GrdCustClass.DataController.DataSource:=LDSCust;
          GrdCustClass.Columns[0].Caption:='销售日期';
          GrdCustClass.Columns[0].DataBinding;
          GrdCustClass.Columns[0].DataBinding.FieldName:='CreateD_';
          GrdCustClass.Columns[0].DataBinding.ValueType:='Datetime';

          GrdCustClass.Columns[1].Caption:='客户名称';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='SCustName';
          GrdCustClass.Columns[1].DataBinding.ValueType:='String';

          GrdCustClass.Columns[2].Caption:='产品名称';
          GrdCustClass.Columns[2].DataBinding;
          GrdCustClass.Columns[2].DataBinding.FieldName:='ProdName';
          GrdCustClass.Columns[2].DataBinding.ValueType:='String';

          GrdCustClass.Columns[3].Caption:='数量';
          GrdCustClass.Columns[3].DataBinding;
          GrdCustClass.Columns[3].DataBinding.FieldName:='SaleCount';
          GrdCustClass.Columns[3].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[4].Caption:='折扣';
          GrdCustClass.Columns[4].DataBinding;
          GrdCustClass.Columns[4].DataBinding.FieldName:='SaleAgio';
          GrdCustClass.Columns[4].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[5].Caption:='单价';
          GrdCustClass.Columns[5].DataBinding;
          GrdCustClass.Columns[5].DataBinding.FieldName:='SalePrice';
          GrdCustClass.Columns[5].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[6].Caption:='销售合计';
          GrdCustClass.Columns[6].DataBinding;
          GrdCustClass.Columns[6].DataBinding.FieldName:='SaleTotal';
          GrdCustClass.Columns[6].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[7].Caption:='业务员';
          GrdCustClass.Columns[7].DataBinding;
          GrdCustClass.Columns[7].DataBinding.FieldName:='UserName_';
          GrdCustClass.Columns[7].DataBinding.ValueType:='String';

    with TcxGridDBTableSummaryItem(
       GrdCustClass.DataController.Summary.FooterSummaryItems.Add) do
       begin
         CustColumn:=GrdCustClass.Columns[6];
         CustColumn.DataBinding.FieldName :=
         GrdCustClass.DataController.DataSet.Fields[6].FieldName;
         Column  :=  CustColumn;
         //DisplayText:='费用总额';
         FieldName :=  CustColumn.DataBinding.FieldName;
         //Format  :=  '#,##0.00';
         Kind  :=  skSum;
       end;


end;

procedure TFrm_Count.ShowSaleSum;
Var
  I:Integer;
  CustColumn:TcxGridDBColumn;
begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=100;
   End;
          GrdCustClass.DataController.DataSource:=LDSCust;
          GrdCustClass.Columns[0].Caption:='业务员';
          GrdCustClass.Columns[0].DataBinding;
          GrdCustClass.Columns[0].DataBinding.FieldName:='UserName_';
          GrdCustClass.Columns[0].DataBinding.ValueType:='String';

          GrdCustClass.Columns[1].Caption:='销售总额';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='SaleMoney';
          GrdCustClass.Columns[1].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[2].Caption:='已收金额';
          GrdCustClass.Columns[2].DataBinding;
          GrdCustClass.Columns[2].DataBinding.FieldName:='FactMoney';
          GrdCustClass.Columns[2].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[3].Caption:='销售额百分比';
          GrdCustClass.Columns[3].DataBinding;
          GrdCustClass.Columns[3].DataBinding.FieldName:='PercentCount';
          GrdCustClass.Columns[3].DataBinding.ValueType:='String';

   FOR I:=1 TO 2 DO
     Begin
       with TcxGridDBTableSummaryItem(
       GrdCustClass.DataController.Summary.FooterSummaryItems.Add) do
       begin
         CustColumn:=GrdCustClass.Columns[I];
         CustColumn.DataBinding.FieldName :=
         GrdCustClass.DataController.DataSet.Fields[I].FieldName;
         Column  :=  CustColumn;
         //DisplayText:='费用总额';
         FieldName :=  CustColumn.DataBinding.FieldName;
         //Format  :=  '#,##0.00';
         Kind  :=  skSum;
       end;
     End;
end;

procedure TFrm_Count.dxNavBar1Item6Click(Sender: TObject);
begin
  inherited;
  SaleInitial;
  LJXCheck:=False;
  LSaleList:=False;
  LSaleSum:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LClassCount:=True;
  LSaleline:=False;
  AdoCustClass.Close;
  AdoCustClass.SQL.Clear;
  AdoCustClass.SQL.Add('Select DISTINCT FieldName,FactTableName From Dict Where IFCust=1');
  AdoCustClass.Prepared;
  AdoCustClass.Open;
  CustClass.ListSource:=DSCustClass;
  CustClass.ListField:='FieldName';
  CustClass.KeyField:='FieldName';
  CustInitial;
  CustClass.Visible:=True;
  Panel9.Visible:=False;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=True;
  cxGrid2.Visible:=False;
end;

procedure TFrm_Count.dxNavBar1Item7Click(Sender: TObject);
begin
  inherited;
  SaleInitial;
  LJXCheck:=False;
  LSaleList:=False;
  LSaleSum:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LClassCount:=False;
  LSaleline:=True;
  CustInitial;
  CustClass.Visible:=True;
  Panel9.Visible:=False;
  Panel8.Visible:=True;
  Panel1.Visible:=True;
  Panel2.Visible:=True;
  cxGrid2.Visible:=True;
end;

procedure TFrm_Count.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  inherited;
  IF cxCheckBox1.Checked Then DBChart.View3D:=True
  Else DBChart.View3D:=False;
end;

procedure TFrm_Count.cxTrackBar2PropertiesChange(Sender: TObject);
begin
  inherited;
  DBChart.View3DOptions.Elevation:= cxTrackBar2.Position;
end;

procedure TFrm_Count.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  inherited;
  DBChart.View3DOptions.Rotation:= cxTrackBar1.Position;
end;

procedure TFrm_Count.CBStylePropertiesChange(Sender: TObject);
begin
  inherited;
  IF LDSCust.DataSet.IsEmpty Then Exit;
  IF LCustClass Then ShowCustClass;
  IF LCustDevelop Then ShowCustDevelop;
  IF LCustActive Then ShowCustActive;
  IF LClassCount Then ShowClassCount;
  IF LSaleline=True Then
    Begin
      IF (RBCust.Checked) And (DBChart.SeriesCount=1) Then
        ShowSaleLine('客户','CustName','String','销售总额','SaleMoney','Float');
      IF (RBProd.Checked) And (DBChart.SeriesCount=1) Then
        ShowSaleLine('产品','ProdName','String','销售总额','SaleMoney','Float');
      IF (RBDept.Checked) And (DBChart.SeriesCount=1) Then
        ShowSaleLine('部门','DeptName_','String','销售总额','SaleMoney','Float');
      IF (RBPerson.Checked) And (DBChart.SeriesCount=1) Then
        ShowSaleLine('个人','UserName_','String','销售总额','SaleMoney','Float');
    End;   
end;

procedure TFrm_Count.ShowDBChartStyle;
Var
  I:Integer;
  Bar:TBarSeries;
  pie:TPieSeries;
begin
  for i:=self.DBChart.SeriesCount-1 downto 0 do
  begin
    try
      self.DBChart.Series[i].Free;
    except
    end;
  end;
  //self.DBChart.View3D := true;
  self.DBChart.View3DOptions.Orthogonal := True;
  Case CBStyle.ItemIndex OF
  0:Begin
    bar := TBarSeries.Create(self);
    bar.ColorEachPoint:=true;
    bar.AutoBarSize := true;
    bar.ShowInLegend := true;
    bar.Marks.Style := teengine.smsLabelValue;
    bar.Dark3D:=true;
    self.DBChart.AddSeries(bar);
    End;
  1:Begin
    pie := TPieSeries.Create(self);
    pie.Marks.Style := teengine.smsLabelPercent;
    pie.Title := '统计分析';
    self.DBChart.AddSeries(pie);
    End;
  End;
end;

procedure TFrm_Count.ShowClassCount;
Var
  I:Integer;
begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=100;
   End;
          GrdCustClass.DataController.DataSource:=LDSCust;
          GrdCustClass.Columns[0].Caption:='客户分类';
          GrdCustClass.Columns[0].DataBinding;
          GrdCustClass.Columns[0].DataBinding.FieldName:='CustClass';
          GrdCustClass.Columns[0].DataBinding.ValueType:='String';

          GrdCustClass.Columns[1].Caption:='销售总额';
          GrdCustClass.Columns[1].DataBinding;
          GrdCustClass.Columns[1].DataBinding.FieldName:='SaleMoney';
          GrdCustClass.Columns[1].DataBinding.ValueType:='Float';

          GrdCustClass.Columns[2].Caption:='百分比';
          GrdCustClass.Columns[2].DataBinding;
          GrdCustClass.Columns[2].DataBinding.FieldName:='PercentCount';
          GrdCustClass.Columns[2].DataBinding.ValueType:='String';
    ShowDBChartStyle;
    DBChart.Series[0].DataSource := LAdoCust;
    DBChart.Series[0].XLabelsSource:= 'CustClass';
    DBChart.Series[0].YValues.ValueSource := 'SaleMoney';
end;



procedure TFrm_Count.ShowSaleLine(SaleLine, SaleField, SaleType, SaleMoney,
  MoneyField, MoneyType: String);
Var
  I:Integer;
Begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSCust.DataSet.FieldCount - 2 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=100;
   End;

      GrdCustClass.DataController.DataSource:=LDSCust;
      GrdCustClass.Columns[0].Caption:=SaleLine;
      GrdCustClass.Columns[0].DataBinding;
      GrdCustClass.Columns[0].DataBinding.FieldName:=SaleField;
      GrdCustClass.Columns[0].DataBinding.ValueType:=SaleType;

      GrdCustClass.Columns[1].Caption:=SaleMoney;
      GrdCustClass.Columns[1].DataBinding;
      GrdCustClass.Columns[1].DataBinding.FieldName:=MoneyField;
      GrdCustClass.Columns[1].DataBinding.ValueType:=MoneyType;

      GrdCustClass.Columns[2].Caption:='百分比';
      GrdCustClass.Columns[2].DataBinding;
      GrdCustClass.Columns[2].DataBinding.FieldName:='PercentCount';
      GrdCustClass.Columns[2].DataBinding.ValueType:='String';

      ShowDBChartStyle;
      DBChart.Series[0].DataSource := LAdoCust;
      DBChart.Series[0].XLabelsSource:= SaleField;
      DBChart.Series[0].YValues.ValueSource := MoneyField;

End;

procedure TFrm_Count.RBCustClick(Sender: TObject);
begin
  inherited;
  CustInitial;
  CXGrid2.Visible:=True;
  IF GrdShow.ColumnCount<>0 Then  GrdShow.ClearItems;
end;

procedure TFrm_Count.RBProdClick(Sender: TObject);
begin
  inherited;
  CustInitial;
  CXGrid2.Visible:=True;
  IF GrdShow.ColumnCount<>0 Then  GrdShow.ClearItems;
end;

procedure TFrm_Count.RBDeptClick(Sender: TObject);
begin
  inherited;
  CustInitial;
  CXGrid2.Visible:=False;
end;

procedure TFrm_Count.RBPersonClick(Sender: TObject);
begin
  inherited;
  CustInitial;
  CXGrid2.Visible:=False;
end;

procedure TFrm_Count.dxNavBar1Item8Click(Sender: TObject);
begin
  inherited;
  ClassInitial;
  LJXCheck:=True;
  LSaleSum:=False;
  LSaleList:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LClassCount:=False;
  LSaleline:=False;
  CustInitial;
  CustClass.Visible:=False;
  Panel9.Visible:=True;
  Panel8.Visible:=False;
  Panel1.Visible:=True;
  Panel2.Visible:=False;
  CxDateEdit1.Date:=Date-30;
  CxDateEdit2.Date:=Date;
  cxGrid2.Visible:=False;
  {IF Not (LDSJXCheck.DataSet.State=DSBrowse) Then
    Begin
      LAdoJXCheck.Close;
      LAdoJXCheck.SQL.Clear;
      LAdoJXCheck.SQL.Add('Select DeptName,UserName,CustCount,ActiveCustCount,ExpendSum,SaleCount,SaleSum,CancelMoney,FactSum,ContractCount,ContractSum');
      LAdoJXCheck.SQL.Add(' From JXCheck');
      LAdoJXCheck.Prepared;
      LAdoJXCheck.Open;
    End;}

end;

procedure TFrm_Count.ShowJXCheck;
Var
  I:Integer;
Begin
  IF GrdCustClass.ColumnCount<>0 Then  GrdCustClass.ClearItems;

  FOR I:=0 TO LDSJXCheck.DataSet.FieldCount-1 Do
    Begin
      GrdCustClass.CreateColumn;
      GrdCustClass.Columns[I].Name:='CustClassColumns'+IntToStr(I);
      GrdCustClass.Columns[I].Width:=70;
   End;

      GrdCustClass.DataController.DataSource:=LDSJXCheck;
      GrdCustClass.Columns[0].Caption:='部门';
      GrdCustClass.Columns[0].DataBinding;
      GrdCustClass.Columns[0].DataBinding.FieldName:='DeptName_';
      GrdCustClass.Columns[0].DataBinding.ValueType:='String';

      GrdCustClass.Columns[1].Caption:='归属人';
      GrdCustClass.Columns[1].DataBinding;
      GrdCustClass.Columns[1].DataBinding.FieldName:='UserName_';
      GrdCustClass.Columns[1].DataBinding.ValueType:='String';


      GrdCustClass.Columns[2].Caption:='发展客户数';
      GrdCustClass.Columns[2].DataBinding;
      GrdCustClass.Columns[2].DataBinding.FieldName:='DevpCust';
      GrdCustClass.Columns[2].DataBinding.ValueType:='Integer';

      GrdCustClass.Columns[3].Caption:='跟进客户数';
      GrdCustClass.Columns[3].DataBinding;
      GrdCustClass.Columns[3].DataBinding.FieldName:='ActiveCust';
      GrdCustClass.Columns[3].DataBinding.ValueType:='Integer';

      GrdCustClass.Columns[4].Caption:='费用总额';
      GrdCustClass.Columns[4].DataBinding;
      GrdCustClass.Columns[4].DataBinding.FieldName:='ExpendMoney';
      GrdCustClass.Columns[4].DataBinding.ValueType:='Float';

      GrdCustClass.Columns[5].Caption:='销售订单数';
      GrdCustClass.Columns[5].DataBinding;
      GrdCustClass.Columns[5].DataBinding.FieldName:='SaleCount';
      GrdCustClass.Columns[5].DataBinding.ValueType:='Integer';

      GrdCustClass.Columns[6].Caption:='销售总额';
      GrdCustClass.Columns[6].DataBinding;
      GrdCustClass.Columns[6].DataBinding.FieldName:='SaleSum';
      GrdCustClass.Columns[6].DataBinding.ValueType:='Float';

      GrdCustClass.Columns[7].Caption:='受让总额';
      GrdCustClass.Columns[7].DataBinding;
      GrdCustClass.Columns[7].DataBinding.FieldName:='CancelSum';
      GrdCustClass.Columns[7].DataBinding.ValueType:='Float';

      GrdCustClass.Columns[8].Caption:='收款总额';
      GrdCustClass.Columns[8].DataBinding;
      GrdCustClass.Columns[8].DataBinding.FieldName:='FactSum';
      GrdCustClass.Columns[8].DataBinding.ValueType:='Float';

      {GrdCustClass.Columns[8].Caption:='合同数';
      GrdCustClass.Columns[8].DataBinding;
      GrdCustClass.Columns[8].DataBinding.FieldName:='ContractCount';
      GrdCustClass.Columns[8].DataBinding.ValueType:='Float';

      GrdCustClass.Columns[9].Caption:='合同金额';
      GrdCustClass.Columns[9].DataBinding;
      GrdCustClass.Columns[9].DataBinding.FieldName:='ContractSum';
      GrdCustClass.Columns[9].DataBinding.ValueType:='Float';}

End;

procedure TFrm_Count.CBACloseUp(Sender: TObject);
begin
  inherited;
  IF AdoDictA.FieldByName('FieldType_').AsString='datetime' Then EdtDateA.Visible:=True
  Else EdtDateA.Visible:=False;
end;

procedure TFrm_Count.CBBCloseUp(Sender: TObject);
begin
  inherited;
  IF AdoDictB.FieldByName('FieldType_').AsString='datetime' Then EdtDateB.Visible:=True
  Else EdtDateB.Visible:=False;
end;

procedure TFrm_Count.SaleInitial;
Var
  TableNo: array[0..2] of Integer;
  I:Integer;
begin
  inherited;
  CBStyle.ItemIndex:=0;
  LJXCheck:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LSaleSum:=False;
  LSaleList:=False;
  LClassCount:=False;
  LSaleline:=False;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select DictMID_ From DataDictMast where TableName_=''Customer'' OR TableName_=''Users_'' OR TableName_=''SaleMaste''');
  Query.Prepared;
  Query.Open;
  Query.First;
  FOR I:=0 TO Query.RecordCount - 1 Do
    Begin
      TableNo[I]:=Query.FieldByName('DictMID_').AsInteger;
      Query.Next;
    End;
  Query.Close;

  AdoDictA.Close;
  AdoDictA.SQL.Clear;
  AdoDictA.SQL.Add('Select DictMid_,FieldName_,FieldNote_,FieldType_ From Bill_DataDictLine where (DictMID_=:DictMIDA OR DictMID_=:DictMIDB OR DictMID_=:DictMIDC)');
  AdoDictA.SQL.Add(' And FieldNote_<>'+'''建立日期'''+' '+' And FieldNote_<>'+'''客户建立日期'''+' '+' And FieldName_ in ('+'''CustName'''+','+'''UserName_'''+','+'''SaleDate'''+','+'''CustCountry'''+','+'''CustProvince'''+','+'''CustCity'''+','+'''CustRegion'''+','+'''CustRate'''+','+'''CustType'''+','+'''CustSource'''+','+'''CustTrade'''+','+'''CustCredit'''+')');
  AdoDictA.Parameters.ParamByName('DictMIDA').Value:=TableNo[0];
  AdoDictA.Parameters.ParamByName('DictMIDB').Value:=TableNo[1];
  AdoDictA.Parameters.ParamByName('DictMIDC').Value:=TableNo[2];
  AdoDictA.Prepared;
  AdoDictA.Open;
  AdoDictB.Close;
  AdoDictB.SQL.Clear;
  AdoDictB.SQL.Add('Select DictMid_,FieldName_,FieldNote_,FieldType_ From Bill_DataDictLine where (DictMID_=:DictMIDA OR DictMID_=:DictMIDB OR DictMID_=:DictMIDC)');
  AdoDictB.SQL.Add(' And FieldNote_<>'+'''建立日期'''+' '+' And FieldNote_<>'+'''客户建立日期'''+' '+' And FieldName_ in ('+'''CustName'''+','+'''UserName_'''+','+'''SaleDate'''+','+'''CustCountry'''+','+'''CustProvince'''+','+'''CustCity'''+','+'''CustRegion'''+','+'''CustRate'''+','+'''CustType'''+','+'''CustSource'''+','+'''CustTrade'''+','+'''CustCredit'''+')');
  AdoDictB.Parameters.ParamByName('DictMIDA').Value:=TableNo[0];
  AdoDictB.Parameters.ParamByName('DictMIDB').Value:=TableNo[1];
  AdoDictB.Parameters.ParamByName('DictMIDC').Value:=TableNo[2];
  AdoDictB.Prepared;
  AdoDictB.Open;

  CBA.ListSource:=DSDictA;
  CBA.ListField:='FieldNote_';
  CBA.KeyField:= 'FieldNote_';

  CBB.ListSource:=DSDictB;
  CBB.ListField:='FieldNote_';
  CBB.KeyField:= 'FieldNote_';
end;

procedure TFrm_Count.ClassInitial;
Var
  TableNo: array[0..1] of Integer;
  I:Integer;
begin
  inherited;
  CBStyle.ItemIndex:=0;
  LJXCheck:=False;
  LCustClass:=False;
  LCustDevelop:=False;
  LCustActive:=False;
  LSaleSum:=False;
  LSaleList:=False;
  LClassCount:=False;
  LSaleline:=False;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('Select DictMID_ From DataDictMast where TableName_=''Customer'' OR TableName_=''Users_''');
  Query.Prepared;
  Query.Open;
  Query.First;
  FOR I:=0 TO Query.RecordCount - 1 Do
    Begin
      TableNo[I]:=Query.FieldByName('DictMID_').AsInteger;
      Query.Next;
    End;
  Query.Close;

  AdoDictA.Close;
  AdoDictA.SQL.Clear;
  AdoDictA.SQL.Add('Select DictMid_,FieldName_,FieldNote_,FieldType_ From Bill_DataDictLine where (DictMID_=:DictMIDA OR DictMID_=:DictMIDB)');
  AdoDictA.SQL.Add(' And FieldNote_<>'+'''建立日期'''+' '+' And FieldName_ in ('+'''CustName'''+','+'''UserName_'''+','+'''CreateD_'''+','+'''CustCountry'''+','+'''CustProvince'''+','+'''CustCity'''+','+'''CustRegion'''+','+'''CustRate'''+','+'''CustType'''+','+'''CustSource'''+','+'''CustTrade'''+','+'''CustCredit'''+')');
  AdoDictA.Parameters.ParamByName('DictMIDA').Value:=TableNo[0];
  AdoDictA.Parameters.ParamByName('DictMIDB').Value:=TableNo[1];
  AdoDictA.Prepared;
  AdoDictA.Open;
  AdoDictB.Close;
  AdoDictB.SQL.Clear;
  AdoDictB.SQL.Add('Select DictMid_,FieldName_,FieldNote_,FieldType_ From Bill_DataDictLine where (DictMID_=:DictMIDA OR DictMID_=:DictMIDB)');
  AdoDictB.SQL.Add(' And FieldNote_<>'+'''建立日期'''+' '+' And FieldName_ in ('+'''CustName'''+','+'''UserName_'''+','+'''CreateD_'''+','+'''CustCountry'''+','+'''CustProvince'''+','+'''CustCity'''+','+'''CustRegion'''+','+'''CustRate'''+','+'''CustType'''+','+'''CustSource'''+','+'''CustTrade'''+','+'''CustCredit'''+')');
  AdoDictB.Parameters.ParamByName('DictMIDA').Value:=TableNo[0];
  AdoDictB.Parameters.ParamByName('DictMIDB').Value:=TableNo[1];
  AdoDictB.Prepared;
  AdoDictB.Open;

  CBA.ListSource:=DSDictA;
  CBA.ListField:='FieldNote_';
  CBA.KeyField:= 'FieldNote_';

  CBB.ListSource:=DSDictB;
  CBB.ListField:='FieldNote_';
  CBB.KeyField:= 'FieldNote_';
end;

procedure TFrm_Count.GrdCustClassCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);

Procedure ShowCust;
Begin
  With DatabaseModule Do
    Begin
          Main_Frm.M_Frm_CustManager.Click;

          AdoCust.Close;
          AdoCust.SQL.Clear;
          AdoCust.SQL.Add('Select a.DeptID_,a.CustNum,a.CustID,a.CustName,a.CustPhone,a.CustCountry,a.CustProvince,a.CustCity,a.CustRegion,a.CustRate,a.CustState,a.CustType,a.CustSource,a.CustTrade,a.CustCredit');
          AdoCust.SQL.Add(',a.CustAddress,a.CustPostCard,a.CustMemo,a.CustHomePage,a.CustNextDate,a.CustLastDate,a.CreateD_,a.CreateBy_,a.UpdateD_,a.UpdateBy_,a.BelongID,b.UserName_');
          AdoCust.SQL.Add(' From Customer a,Users_ b where a.CustName=:Custname And a.BelongID=b.UserID_');
          IF LSaleLine=True Then
            AdoCust.Parameters.ParamByName('CustName').Value:=LAdoCust.FieldByName('CustName').AsString;
          IF LSaleList=True Then
            AdoCust.Parameters.ParamByName('CustName').Value:=LAdoCust.FieldByName('SCustName').AsString;
          AdoCust.Prepared;
          AdoCust.Open;
          AdoCust.First;
    End;
End;
begin
  inherited;
  IF (LSaleline=True) Then
    Begin
      IF RBCust.Checked=True Then  ShowCust;
    End;
  IF LSaleList=True Then ShowCust;

end;

procedure TFrm_Count.GrdCustClassCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
Var
  LSQLText:String;
  I:Integer;
begin
  inherited;

    IF LSaleLine=True Then
      Begin
        IF RBCust.Checked Then
          Begin
            LSQLText:= 'Select c.ProdName,c.SaleTotal From Customer b,SaleMaste a,SaleDetail c Where a.IFCheck='+'1'+' ' +
                     'And a.CustID=B.CustID And a.SaleID=C.SaleID And a.CustID='+' '+LAdoCust.FieldByName('CustID').AsString+' '+SQLText;
            LAdoShow.Close;
            LAdoShow.SQL.Clear;
            LAdoShow.SQL.Add(LSQLText);
            LAdoShow.Prepared;
            LAdoShow.Open;
            
            IF GrdShow.ColumnCount<>0 Then  GrdShow.ClearItems;

            FOR I:=0 TO LDSShow.DataSet.FieldCount - 1 Do
              Begin
                GrdShow.CreateColumn;
                GrdShow.Columns[I].Name:='ShowColumns'+IntToStr(I);
              End;

            GrdShow.DataController.DataSource:=LDSShow;
            GrdShow.Columns[0].Caption:='产品';
            GrdShow.Columns[0].DataBinding;
            GrdShow.Columns[0].DataBinding.FieldName:='ProdName';
            GrdShow.Columns[0].DataBinding.ValueType:='String';

            GrdShow.Columns[1].Caption:='金额';
            GrdShow.Columns[1].DataBinding;
            GrdShow.Columns[1].DataBinding.FieldName:='SaleTotal';
            GrdShow.Columns[1].DataBinding.ValueType:='Float';
          End;
        IF RBProd.Checked Then
          Begin
            LSQLText:= 'Select DISTINCT(b.CustName) From Customer b,SaleMaste a,SaleDetail c Where a.IFCheck='+'1'+' ' +
                     'And a.CustID=B.CustID And a.SaleID=C.SaleID And c.ProdID='+' '+LAdoCust.FieldByName('ProdID').AsString+' '+SQLText;
            LAdoShow.Close;
            LAdoShow.SQL.Clear;
            LAdoShow.SQL.Add(LSQLText);
            LAdoShow.Prepared;
            LAdoShow.Open;

            IF GrdShow.ColumnCount<>0 Then  GrdShow.ClearItems;

            FOR I:=0 TO LDSShow.DataSet.FieldCount - 1 Do
              Begin
                GrdShow.CreateColumn;
                GrdShow.Columns[I].Name:='ShowColumns'+IntToStr(I);
              End;

            GrdShow.DataController.DataSource:=LDSShow;
            GrdShow.Columns[0].Caption:='客户名称';
            GrdShow.Columns[0].DataBinding;
            GrdShow.Columns[0].DataBinding.FieldName:='CustName';
            GrdShow.Columns[0].DataBinding.ValueType:='String';
            GrdShow.Columns[0].Width:=150;
          End;  
      End;



     
end;

procedure TFrm_Count.EXCEL1Click(Sender: TObject);
begin
  inherited;
  IF SaveDlg.Execute Then
    ExportGridToExcel(SaveDlg.FileName ,GridCount);
end;

end.
