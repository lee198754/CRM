object Frm_ImportData: TFrm_ImportData
  Left = 292
  Top = 125
  BorderStyle = bsDialog
  Caption = #23458#25143#36164#26009#23548#20837
  ClientHeight = 417
  ClientWidth = 671
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 18
    Top = 380
    Width = 39
    Height = 13
    Caption = #21551#22987#34892':'
  end
  object Label1: TLabel
    Left = 147
    Top = 380
    Width = 27
    Height = 13
    Caption = #34892#25968':'
  end
  object lbl3: TLabel
    Left = 270
    Top = 380
    Width = 27
    Height = 13
    Caption = #21015#25968':'
  end
  object lbl1: TLabel
    Left = 30
    Top = 14
    Width = 94
    Height = 13
    Caption = #35831#36873#25321'EXCEL'#25991#20214
  end
  object cxButtonEdit1: TcxButtonEdit
    Left = 127
    Top = 11
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = cxButtonEdit1PropertiesButtonClick
    TabOrder = 0
    Width = 513
  end
  object cxGrid1: TcxGrid
    Left = 27
    Top = 37
    Width = 612
    Height = 308
    TabOrder = 1
    LookAndFeel.NativeStyle = False
    object cxGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = ds2
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxgrdbclmnGridDBTableView1FieldName_1: TcxGridDBColumn
        DataBinding.FieldName = 'FieldName_'
        Visible = False
      end
      object cxgrdbclmnGridDBTableView1FieldNote_1: TcxGridDBColumn
        Caption = #30446#26631#21015#21517
        DataBinding.FieldName = 'FieldNote_'
        Width = 113
      end
      object cxgrdbclmnGridDBTableView1selectvalue: TcxGridDBColumn
        Caption = #28304#21015#21517
        DataBinding.FieldName = 'selectvalue'
        PropertiesClassName = 'TcxComboBoxProperties'
      end
      object cxgrdbclmnGridDBTableView1FieldType_1: TcxGridDBColumn
        Caption = #31867#22411
        DataBinding.FieldName = 'FieldType_'
      end
      object cxgrdbclmnGridDBTableView1FieldLen_1: TcxGridDBColumn
        Caption = #38271#24230
        DataBinding.FieldName = 'FieldLen_'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object btn3: TcxButton
    Left = 477
    Top = 374
    Width = 75
    Height = 25
    Caption = #23548#20837
    TabOrder = 2
    OnClick = btn3Click
  end
  object btn4: TcxButton
    Left = 386
    Top = 374
    Width = 75
    Height = 25
    Caption = #39044#35272
    TabOrder = 3
    OnClick = btn4Click
  end
  object btn5: TcxButton
    Left = 568
    Top = 374
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 4
    OnClick = btn5Click
  end
  object cxtxtdt1: TcxTextEdit
    Left = 63
    Top = 375
    Enabled = False
    TabOrder = 5
    Text = '2'
    Width = 69
  end
  object cxTextEdit1: TcxTextEdit
    Left = 182
    Top = 375
    Enabled = False
    TabOrder = 6
    Text = '1'
    Width = 69
  end
  object cxtxtdt2: TcxTextEdit
    Left = 301
    Top = 375
    Enabled = False
    TabOrder = 7
    Text = '0'
    Width = 69
  end
  object PB: TProgressBar
    Left = 27
    Top = 344
    Width = 611
    Height = 16
    TabOrder = 8
  end
  object qry2: TADOQuery
    Connection = DataBaseModule.dtclsData
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select dl.FieldName_ ,dl.FieldNote_ ,dl.selectvalue ,dl.FieldTyp' +
        'e_ ,dl.FieldLen_ '
      'from DataDictMast dm , bill_DataDictLine dl'
      'where dm.DictMID_ = dl.DictMID_ and dm.TableName_ = '#39'customer'#39
      
        'and  dl.FieldName_ in ( '#39'CustName'#39','#39'CustPhone'#39','#39'CustPostCard'#39','#39'C' +
        'ustAddress'#39' ,'#39'CustHomepage'#39','#39'CustCountry'#39','#39'CustProvince'#39' ,'
      
        #39'CustCity'#39','#39'CustRegion'#39','#39'Custstate'#39' ,'#39'CustType'#39','#39'CustSource'#39','#39'Cu' +
        'stTrade'#39','#39'CustCredit'#39' ,'#39'CustMemo'#39','#39'CustRate'#39')')
    Left = 488
    Top = 144
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 272
    Top = 208
  end
  object dlgOpen1: TOpenDialog
    Left = 176
    Top = 208
  end
  object ADOQuery1: TADOQuery
    Connection = DataBaseModule.dtclsData
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'update bill_DataDictLine set selectvalue = '#39#39)
    Left = 336
    Top = 208
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    Kind = lfOffice11
    NativeStyle = True
    Left = 88
    Top = 208
  end
  object NewCust: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      'Select * From Customer')
    TableName = 'Customer'
    isMainQuery = True
    FieldOption.PriceFieldName = 'Price'
    FieldOption.SumPriceFieldName = 'sumprice'
    FieldOption.DeptFieldName = 'DeptID_'
    FieldOption.BelongFieldName = 'BelongID'
    FieldOption.CreatedByFieldName = 'CreatedBy'
    FieldOption.CheckFieldName = 'IFCheck'
    FieldOption.CheckByFieldName = 'CheckMan'
    FieldOption.CheckdateFieldName = 'CheckDate'
    AllowPriceAcc = False
    AllowDeleteOrModifyAcc = False
    AllowCheckAcc = False
    Left = 328
    Top = 143
  end
  object InsertQry: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#22269#23478#39', CustCountry,1,'#39'CustCountry'#39' from customer where Cus' +
        'tCountry not in (select context  from dict where fieldname = '#39#22269#23478 +
        #39')'
      'and CustCountry <> '#39#39' '
      'group by CustCountry '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#30465#20221#39', CustProvince ,1,'#39'CustProvince'#39' from customer where ' +
        'CustProvince  not in (select context  from dict where fieldname ' +
        '= '#39#30465#20221#39')'
      'and CustProvince <> '#39#39
      'group by CustProvince '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#22478#24066#39', CustCity ,1,'#39'CustCity'#39' from customer where CustCity' +
        '  not in (select context  from dict where fieldname = '#39#22478#24066#39')'
      'and CustCity <> '#39#39
      'group by  CustCity '
      ''
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#38215#21306#39', CustRegion ,1,'#39'CustRegion'#39' from customer where Cust' +
        'Region  not in (select context  from dict where fieldname = '#39#38215#21306#39 +
        ')'
      'and CustRegion <> '#39#39' '
      'group by CustRegion '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#23458#25143#29366#24577#39', Custstate ,1,'#39'CustState'#39' from customer where Cust' +
        'state  not in (select context  from dict where fieldname = '#39#23458#25143#29366#24577 +
        #39')'
      'and Custstate <> '#39#39
      'group by Custstate  '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#23458#25143#31867#22411#39', CustType ,1,'#39'CustType'#39'  from customer where CustT' +
        'ype  not in (select context  from dict where fieldname = '#39#23458#25143#31867#22411#39')'
      'and CustType <> '#39#39
      'group by  CustType '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#23458#25143#26469#28304#39', CustSource ,1,'#39'CustSource'#39' from customer where Cu' +
        'stSource  not in (select context  from dict where fieldname = '#39#23458 +
        #25143#26469#28304#39')'
      'and CustSource <> '#39#39
      'group by  CustSource '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#23458#25143#34892#19994#39', CustTrade ,1,'#39'CustTrade'#39' from customer where Cust' +
        'Trade  not in (select context  from dict where fieldname = '#39#23458#25143#34892#19994 +
        #39')'
      'and CustTrade <> '#39#39
      'group by CustTrade '
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#20449#29992#39069#24230#39', CustCredit ,1,'#39'CustCredit'#39' from customer where Cu' +
        'stCredit  not in (select context  from dict where fieldname = '#39#20449 +
        #29992#39069#24230#39')'
      'and CustCredit  <> '#39#39
      'group by CustCredit'
      ''
      ''
      ''
      'insert into dict(fieldname ,context,IFCust,FactTableName)'
      
        'select '#39#23458#25143#31561#32423#39', CustRate ,1,'#39'CustRate'#39' from customer where CustRa' +
        'te  not in (select context  from dict where fieldname = '#39#23458#25143#31561#32423#39')'
      'and CustRate  <> '#39#39
      'group by CustRate'
      ''
      '')
    isMainQuery = False
    FieldOption.PriceFieldName = 'Price'
    FieldOption.SumPriceFieldName = 'sumprice'
    FieldOption.DeptFieldName = 'DeptID_'
    FieldOption.BelongFieldName = 'BelongID'
    FieldOption.CreatedByFieldName = 'CreatedBy'
    FieldOption.CheckFieldName = 'IFCheck'
    FieldOption.CheckByFieldName = 'CheckMan'
    FieldOption.CheckdateFieldName = 'CheckDate'
    AllowPriceAcc = False
    AllowDeleteOrModifyAcc = False
    AllowCheckAcc = False
    Left = 432
    Top = 208
  end
  object LAdoArrearage: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    isMainQuery = False
    FieldOption.PriceFieldName = 'Price'
    FieldOption.SumPriceFieldName = 'sumprice'
    FieldOption.DeptFieldName = 'DeptID_'
    FieldOption.BelongFieldName = 'BelongID'
    FieldOption.CreatedByFieldName = 'CreatedBy'
    FieldOption.CheckFieldName = 'IFCheck'
    FieldOption.CheckByFieldName = 'CheckMan'
    FieldOption.CheckdateFieldName = 'CheckDate'
    AllowPriceAcc = False
    AllowDeleteOrModifyAcc = False
    AllowCheckAcc = False
    Left = 416
    Top = 144
  end
  object Query: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    isMainQuery = False
    FieldOption.PriceFieldName = 'Price'
    FieldOption.SumPriceFieldName = 'sumprice'
    FieldOption.DeptFieldName = 'DeptID_'
    FieldOption.BelongFieldName = 'BelongID'
    FieldOption.CreatedByFieldName = 'CreatedBy'
    FieldOption.CheckFieldName = 'IFCheck'
    FieldOption.CheckByFieldName = 'CheckMan'
    FieldOption.CheckdateFieldName = 'CheckDate'
    AllowPriceAcc = False
    AllowDeleteOrModifyAcc = False
    AllowCheckAcc = False
    Left = 552
    Top = 192
  end
end
