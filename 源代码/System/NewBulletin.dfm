inherited Frm_NewBulletin: TFrm_NewBulletin
  Left = 417
  Top = 239
  Width = 526
  Height = 640
  Caption = #21457#24067#26032#20844#21578
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton [0]
    Left = 256
    Top = 344
    Width = 57
    Height = 30
    Caption = '>'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton [1]
    Left = 256
    Top = 384
    Width = 57
    Height = 30
    Caption = '>>'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton [2]
    Left = 256
    Top = 424
    Width = 57
    Height = 30
    Caption = '<'
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton [3]
    Left = 256
    Top = 464
    Width = 57
    Height = 30
    Caption = '<<'
    OnClick = SpeedButton4Click
  end
  object EdtTitle: TcxTextEdit [4]
    Left = 8
    Top = 32
    TabOrder = 4
    Width = 281
  end
  object EdtContent: TcxMemo [5]
    Left = 8
    Top = 80
    TabOrder = 5
    Height = 161
    Width = 505
  end
  object cxLabel1: TcxLabel [6]
    Left = 8
    Top = 8
    Caption = #26631#39064#65306
  end
  object cxGrid1: TcxGrid [7]
    Left = 8
    Top = 280
    Width = 233
    Height = 273
    TabOrder = 7
    LookAndFeel.NativeStyle = False
    object GrdUser: TcxGridDBTableView
      OnDblClick = SpeedButton1Click
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
      GridView = GrdUser
    end
  end
  object cxGrid2: TcxGrid [8]
    Left = 328
    Top = 280
    Width = 185
    Height = 273
    TabOrder = 8
    LookAndFeel.NativeStyle = False
    object GrdReadUser: TcxGridDBTableView
      OnDblClick = SpeedButton3Click
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
    object cxGrid2Level1: TcxGridLevel
      GridView = GrdReadUser
    end
  end
  object cxLabel2: TcxLabel [9]
    Left = 8
    Top = 56
    Caption = #20869#23481#65306
  end
  object cxLabel3: TcxLabel [10]
    Left = 8
    Top = 256
    Caption = #36873#25321#21487#20197#38405#35835#27492#20844#21578#30340#29992#25143#65306
  end
  object BtnSure: TcxButton [11]
    Left = 136
    Top = 568
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 11
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [12]
    Left = 328
    Top = 568
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 12
    OnClick = BtnExitClick
  end
  inherited xpmn1: TXPMenu
    Left = 144
  end
  inherited actlst1: TActionList
    Left = 216
    Top = 88
  end
  inherited imList: TImageList
    Left = 416
    Top = 105
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 472
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
    Left = 304
    Top = 112
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 424
    Top = 192
  end
  object LReadUser: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    LockType = ltBatchOptimistic
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
    Left = 400
    Top = 248
  end
  object LBulletin: TbainaADOQuery
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
    Left = 352
    Top = 32
  end
  object LUser: TbainaADOQuery
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
    Left = 24
    Top = 352
  end
  object LDSUser: TDataSource
    DataSet = LUser
    Left = 24
    Top = 392
  end
  object LDSReadUser: TDataSource
    DataSet = LReadUser
    Left = 440
    Top = 248
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
    Left = 24
    Top = 160
  end
end
