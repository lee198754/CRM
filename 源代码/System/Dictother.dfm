inherited Frm_Dictother: TFrm_Dictother
  Left = 354
  Top = 138
  Width = 402
  Height = 441
  BorderIcons = [biSystemMenu]
  Caption = #22522#30784#36164#26009
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn [0]
    Left = 298
    Top = 133
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn [1]
    Left = 298
    Top = 181
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn [2]
    Left = 298
    Top = 229
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 6
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn [3]
    Left = 298
    Top = 349
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 7
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn [4]
    Left = 298
    Top = 309
    Width = 75
    Height = 25
    Caption = #36873#25321
    TabOrder = 8
    OnClick = BitBtn5Click
  end
  object cxGrid1: TcxGrid [5]
    Left = 18
    Top = 45
    Width = 265
    Height = 345
    TabOrder = 9
    object GrdDict: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdDictCellClick
      OnCellDblClick = GrdDictCellDblClick
      DataController.DataSource = DSDictOther
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdDict
    end
  end
  object DictName: TcxTextEdit [6]
    Left = 18
    Top = 21
    TabOrder = 10
    Width = 265
  end
  inherited xpmn1: TXPMenu
    Left = 298
    Top = 101
  end
  inherited actlst1: TActionList
    Left = 266
    Top = 61
  end
  inherited imList: TImageList
    Left = 298
    Top = 62
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 330
    Top = 61
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
    Left = 354
    Top = 61
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 266
    Top = 101
  end
  object DSDictOther: TDataSource
    DataSet = DataBaseModule.AdoDictOther
    Left = 330
    Top = 101
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
    Left = 314
    Top = 269
  end
end
