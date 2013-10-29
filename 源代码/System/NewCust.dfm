inherited Frm_NewCust: TFrm_NewCust
  Left = 194
  Top = 108
  Width = 777
  Height = 554
  BorderIcons = [biSystemMenu]
  Caption = #26032#22686#21830#23478
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnSure: TcxButton [0]
    Left = 512
    Top = 480
    Width = 89
    Height = 25
    Caption = #20445#23384#24182#36864#20986
    TabOrder = 4
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [1]
    Left = 656
    Top = 480
    Width = 89
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = BtnExitClick
  end
  object cxButton1: TcxButton [2]
    Left = 360
    Top = 479
    Width = 89
    Height = 25
    Caption = #20445#23384#24182#26032#22686
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object CustNum: TcxTextEdit [3]
    Left = 96
    Top = 16
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 7
    Text = 'CustNum'
    Width = 121
  end
  object cxLabel1: TcxLabel [4]
    Left = 32
    Top = 20
    Caption = #23458#25143#32534#21495#65306
    Transparent = True
  end
  object cxLabel2: TcxLabel [5]
    Left = 32
    Top = 52
    Caption = #23458#25143#21517#31216#65306
    Transparent = True
  end
  object cxLabel3: TcxLabel [6]
    Left = 288
    Top = 112
    Caption = #22269#23478#65306
    Transparent = True
  end
  object cxLabel4: TcxLabel [7]
    Left = 56
    Top = 144
    Caption = #30465#20221#65306
    Transparent = True
  end
  object cxLabel5: TcxLabel [8]
    Left = 288
    Top = 144
    Caption = #22478#24066#65306
    Transparent = True
  end
  object cxLabel6: TcxLabel [9]
    Left = 56
    Top = 176
    Caption = #38215#21306#65306
    Transparent = True
  end
  object cxLabel7: TcxLabel [10]
    Left = 56
    Top = 112
    Caption = #37038#32534#65306
    Transparent = True
  end
  object cxLabel8: TcxLabel [11]
    Left = 56
    Top = 240
    Caption = #22320#22336#65306
    Transparent = True
  end
  object cxLabel9: TcxLabel [12]
    Left = 288
    Top = 176
    Caption = #32593#22336#65306
    Transparent = True
  end
  object CustName: TcxTextEdit [13]
    Left = 96
    Top = 48
    ImeMode = imOpen
    Properties.ImeMode = imOpen
    Properties.OnChange = CustNamePropertiesChange
    TabOrder = 17
    Text = 'CustName'
    Width = 289
  end
  object CustCountry: TcxButtonEdit [14]
    Left = 344
    Top = 108
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 18
    Text = 'CustCountry'
    OnClick = CustCountryClick
    Width = 153
  end
  object CustProv: TcxButtonEdit [15]
    Left = 96
    Top = 140
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 19
    Text = 'CustProv'
    OnClick = CustProvClick
    Width = 145
  end
  object CustCity: TcxButtonEdit [16]
    Left = 344
    Top = 140
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 20
    Text = 'CustCity'
    OnClick = CustCityClick
    Width = 153
  end
  object CustZip: TcxTextEdit [17]
    Left = 96
    Top = 108
    ImeMode = imClose
    Properties.ImeMode = imClose
    TabOrder = 21
    Text = 'CustZip'
    Width = 145
  end
  object CustAdd: TcxTextEdit [18]
    Left = 96
    Top = 236
    ImeMode = imOpen
    Properties.ImeMode = imOpen
    TabOrder = 22
    Text = 'CustAdd'
    Width = 401
  end
  object CustRegion: TcxButtonEdit [19]
    Left = 96
    Top = 172
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 23
    Text = 'CustRegion'
    OnClick = CustRegionClick
    Width = 145
  end
  object CustNextDate: TcxDateEdit [20]
    Left = 96
    Top = 208
    TabOrder = 24
    Width = 145
  end
  object CustLastDate: TcxDateEdit [21]
    Left = 344
    Top = 208
    TabOrder = 25
    Width = 153
  end
  object cxLabel14: TcxLabel [22]
    Left = 8
    Top = 212
    Caption = #19979#27425#32852#31995#26102#38388#65306
    Transparent = True
  end
  object cxLabel16: TcxLabel [23]
    Left = 248
    Top = 212
    Caption = #26368#21518#32852#31995#26102#38388#65306
    Transparent = True
  end
  object cxLabel19: TcxLabel [24]
    Left = 56
    Top = 80
    Caption = #30005#35805#65306
    Transparent = True
  end
  object CustPhone: TcxTextEdit [25]
    Left = 96
    Top = 76
    ImeMode = imClose
    Properties.ImeMode = imClose
    TabOrder = 29
    Text = 'CustPhone'
    Width = 401
  end
  object cxLabel13: TcxLabel [26]
    Left = 528
    Top = 48
    Caption = #23458#25143#31561#32423#65306
    Transparent = True
  end
  object CustRate: TcxButtonEdit [27]
    Left = 600
    Top = 44
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 31
    Text = 'cxButtonEdit1'
    OnClick = CustRateClick
    Width = 145
  end
  object cxLabel11: TcxLabel [28]
    Left = 528
    Top = 144
    Caption = #23458#25143#24615#36136#65306
    Transparent = True
  end
  object CustSource: TcxButtonEdit [29]
    Left = 600
    Top = 204
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 33
    Text = 'cxButtonEdit2'
    OnClick = CustSourceClick
    Width = 145
  end
  object CustTrade: TcxButtonEdit [30]
    Left = 600
    Top = 172
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 34
    Text = 'cxButtonEdit4'
    OnClick = CustTradeClick
    Width = 145
  end
  object cxLabel12: TcxLabel [31]
    Left = 528
    Top = 176
    Caption = #23458#25143#34892#19994#65306
    Transparent = True
  end
  object CustType: TcxButtonEdit [32]
    Left = 600
    Top = 76
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 36
    Text = 'cxButtonEdit3'
    OnClick = CustTypeClick
    Width = 145
  end
  object cxLabel10: TcxLabel [33]
    Left = 528
    Top = 80
    Caption = #23458#25143#31867#22411#65306
    Transparent = True
  end
  object cxLabel17: TcxLabel [34]
    Left = 528
    Top = 112
    Caption = #23458#25143#29366#24577#65306
    Transparent = True
  end
  object CustState: TcxButtonEdit [35]
    Left = 600
    Top = 108
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 39
    Text = 'cxButtonEdit1'
    OnClick = CustStateClick
    Width = 145
  end
  object cxLabel15: TcxLabel [36]
    Left = 528
    Top = 240
    Caption = #20449#29992#39069#24230#65306
    Transparent = True
  end
  object CustCredit: TcxButtonEdit [37]
    Left = 600
    Top = 236
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 41
    Text = 'cxButtonEdit2'
    OnClick = CustCreditClick
    Width = 145
  end
  object cxLabel18: TcxLabel [38]
    Left = 56
    Top = 264
    Caption = #22791#27880#65306
    Transparent = True
  end
  object CustMemo: TcxMemo [39]
    Left = 96
    Top = 264
    Lines.Strings = (
      'CustMemo')
    TabOrder = 43
    Height = 105
    Width = 649
  end
  object CustWeb: TcxHyperLinkEdit [40]
    Left = 344
    Top = 172
    TabOrder = 44
    Text = 'CustWeb'
    Width = 153
  end
  object cxGrid1: TcxGrid [41]
    Left = 96
    Top = 376
    Width = 649
    Height = 97
    TabOrder = 45
    object GrdSame: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdSame
    end
  end
  object cxLabel20: TcxLabel [42]
    Left = 32
    Top = 376
    Caption = #30456#20284#23458#25143#65306
    Transparent = True
  end
  object CustKind: TcxButtonEdit [43]
    Left = 600
    Top = 140
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 47
    OnClick = CustKindClick
    Width = 145
  end
  object cxLabel21: TcxLabel [44]
    Left = 528
    Top = 208
    Caption = #23458#25143#26469#28304#65306
    Transparent = True
  end
  object CustPY: TcxTextEdit [45]
    Left = 384
    Top = 48
    ImeMode = imOpen
    Properties.ImeMode = imOpen
    Properties.ReadOnly = True
    TabOrder = 49
    Width = 113
  end
  inherited xpmn1: TXPMenu
    Left = 656
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 688
    Top = 8
  end
  inherited imList: TImageList
    Left = 592
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 624
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Visible = False
    end
  end
  inherited cxLookAndFeelController1: TcxLookAndFeelController
    Left = 720
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 368
    Top = 296
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
    Left = 448
    Top = 295
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
    Left = 408
    Top = 295
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
    Left = 328
    Top = 295
  end
  object LAdoDict: TbainaADOQuery
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
    Left = 292
    Top = 296
  end
  object LDSSame: TDataSource
    DataSet = Query
    Left = 336
    Top = 408
  end
end
