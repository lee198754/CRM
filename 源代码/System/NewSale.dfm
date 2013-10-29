inherited Frm_SaleMake: TFrm_SaleMake
  Left = 231
  Top = 174
  Width = 760
  Height = 525
  BorderIcons = [biSystemMenu]
  Caption = #38144#21806#21046#21333
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid [0]
    Left = 12
    Top = 108
    Width = 713
    Height = 182
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GrdSaleD: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdSaleD
    end
  end
  object BtnExit: TcxButton [1]
    Left = 648
    Top = 446
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = BtnExitClick
  end
  object BtnSure: TcxButton [2]
    Left = 504
    Top = 446
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 6
    OnClick = BtnSureClick
  end
  object cxLabel1: TcxLabel [3]
    Left = 328
    Top = 16
    Caption = #21830#21697#38144#21806
    ParentFont = False
    Style.Font.Charset = GB2312_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = #23435#20307
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.BorderStyle = ebsOffice11
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
  end
  object cxLabel2: TcxLabel [4]
    Left = 8
    Top = 82
    Caption = #23458#25143#21517#31216#65306
    Transparent = True
  end
  object cxLabel3: TcxLabel [5]
    Left = 364
    Top = 82
    Caption = #38144#21806#26085#26399#65306
    Transparent = True
  end
  object cxLabel4: TcxLabel [6]
    Left = 176
    Top = 55
    Caption = #21407#22987#31080#25454#21495#65306
    Transparent = True
  end
  object cxLabel5: TcxLabel [7]
    Left = 8
    Top = 55
    Caption = #38144#21806#21333#21495#65306
    Transparent = True
  end
  object cxLabel6: TcxLabel [8]
    Left = 12
    Top = 293
    Caption = #22791#27880#65306
    Transparent = True
  end
  object cxLabel7: TcxLabel [9]
    Left = 12
    Top = 384
    Caption = #38144#21806#37329#39069#65306
    Transparent = True
  end
  object cxLabel8: TcxLabel [10]
    Left = 568
    Top = 384
    Caption = #24402#23646#20154#65306
    Transparent = True
  end
  object EdtCust: TcxButtonEdit [11]
    Left = 76
    Top = 80
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 15
    Text = 'EdtCust'
    OnClick = EdtCustClick
    Width = 277
  end
  object EdtDate: TcxDateEdit [12]
    Left = 428
    Top = 80
    TabOrder = 16
    Width = 121
  end
  object EdtMemo: TcxMemo [13]
    Left = 12
    Top = 312
    Lines.Strings = (
      'EdtMemo')
    Style.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.Kind = lfOffice11
    TabOrder = 17
    Height = 62
    Width = 714
  end
  object EdtSaleID: TcxTextEdit [14]
    Left = 76
    Top = 51
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 18
    Text = 'EdtSaleID'
    Width = 97
  end
  object EdtSaleMoney: TcxTextEdit [15]
    Left = 76
    Top = 380
    Properties.ReadOnly = True
    Properties.OnChange = EdtSaleMoneyPropertiesChange
    TabOrder = 19
    Text = 'EdtSaleMoney'
    Width = 73
  end
  object EdtSaleNum: TcxTextEdit [16]
    Left = 256
    Top = 51
    TabOrder = 20
    Text = 'EdtSaleNum'
    Width = 97
  end
  object EdtUser: TcxButtonEdit [17]
    Left = 624
    Top = 380
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 21
    Text = 'EdtUser'
    OnClick = EdtUserClick
    Width = 97
  end
  object cxLabel9: TcxLabel [18]
    Left = 12
    Top = 416
    Caption = #30452#25509#25104#26412#65306
    Transparent = True
  end
  object cxLabel10: TcxLabel [19]
    Left = 150
    Top = 416
    Caption = #38646#26143#25104#26412#65306
    Transparent = True
  end
  object cxLabel11: TcxLabel [20]
    Left = 278
    Top = 416
    Caption = #20323#37329#65306
    Transparent = True
  end
  object cxLabel12: TcxLabel [21]
    Left = 374
    Top = 416
    Caption = #22351#24080#65306
    Transparent = True
  end
  object cxLabel13: TcxLabel [22]
    Left = 478
    Top = 416
    Caption = #31246#37329#65306
    Transparent = True
  end
  object cxLabel14: TcxLabel [23]
    Left = 580
    Top = 416
    Caption = #27611#21033#65306
    Transparent = True
  end
  object cxLabel15: TcxLabel [24]
    Left = 556
    Top = 82
    Caption = #21333#25454#31867#21035#65306
    Transparent = True
  end
  object EdtMainCost: TcxTextEdit [25]
    Left = 76
    Top = 412
    Properties.ReadOnly = True
    Properties.OnChange = EdtMainCostPropertiesChange
    TabOrder = 29
    Text = '0'
    Width = 73
  end
  object EdtOtherCost: TcxTextEdit [26]
    Left = 216
    Top = 412
    Properties.ReadOnly = True
    Properties.OnChange = EdtOtherCostPropertiesChange
    TabOrder = 30
    Text = '0'
    Width = 57
  end
  object EdtCommission: TcxTextEdit [27]
    Left = 320
    Top = 412
    Properties.OnChange = EdtCommissionPropertiesChange
    TabOrder = 31
    Text = '0'
    Width = 49
  end
  object EdtBadDebt: TcxTextEdit [28]
    Left = 416
    Top = 412
    Properties.OnChange = EdtBadDebtPropertiesChange
    TabOrder = 32
    Text = '0'
    Width = 57
  end
  object EdtTax: TcxTextEdit [29]
    Left = 520
    Top = 412
    Properties.OnChange = EdtTaxPropertiesChange
    TabOrder = 33
    Text = '0'
    Width = 57
  end
  object EdtProfit: TcxTextEdit [30]
    Left = 624
    Top = 412
    TabOrder = 34
    Text = '0'
    Width = 97
  end
  object EdtReceiptType: TcxButtonEdit [31]
    Left = 624
    Top = 78
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 35
    OnClick = EdtReceiptTypeClick
    Width = 97
  end
  object cxButton2: TcxButton [32]
    Left = 352
    Top = 447
    Width = 75
    Height = 25
    Caption = #21015#21360
    TabOrder = 36
    OnClick = cxButton2Click
  end
  object cxLabel16: TcxLabel [33]
    Left = 376
    Top = 55
    Caption = #21046#21333#20154#65306
    Transparent = True
  end
  object cxLabel17: TcxLabel [34]
    Left = 568
    Top = 55
    Caption = #23457#26680#20154#65306
    Transparent = True
  end
  object EdtMakeMan: TcxTextEdit [35]
    Left = 428
    Top = 51
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 39
    Width = 97
  end
  object EdtCheckMan: TcxTextEdit [36]
    Left = 624
    Top = 51
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 40
    Width = 93
  end
  inherited xpmn1: TXPMenu
    Left = 72
    Top = 0
  end
  inherited actlst1: TActionList
    Left = 320
    Top = 0
  end
  inherited imList: TImageList
    Left = 136
    Top = 1
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 168
    Top = 0
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
    Left = 104
    Top = 0
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 200
    Top = 0
  end
  object LAdoUser: TbainaADOQuery
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
    Left = 432
    Top = 328
  end
  object LAdoCust: TbainaADOQuery
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
    Left = 248
  end
  object LDSCust: TDataSource
    DataSet = LAdoCust
    Left = 288
  end
  object LDSUser: TDataSource
    DataSet = LAdoUser
    Left = 472
    Top = 328
  end
  object DSSaleList: TDataSource
    DataSet = DataBaseModule.AdoSaleList
    Left = 416
    Top = 192
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
    Left = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 176
    object N1: TMenuItem
      Caption = #28155#21152#21830#21697
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913#21830#21697
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#21830#21697
      OnClick = N3Click
    end
  end
end
