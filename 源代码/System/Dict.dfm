inherited Frm_Dict: TFrm_Dict
  Left = 557
  Top = 1
  Width = 432
  Height = 474
  BorderIcons = [biSystemMenu]
  Caption = #22522#30784#36164#26009
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 173
    Top = 24
    Width = 48
    Height = 13
    Caption = #20445#25252#26399#38480
    Visible = False
  end
  object BitBtn1: TBitBtn [1]
    Left = 288
    Top = 128
    Width = 75
    Height = 25
    Caption = #22686#21152
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn [2]
    Left = 288
    Top = 176
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn [3]
    Left = 288
    Top = 224
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 7
    OnClick = BitBtn3Click
  end
  object DictName: TcxTextEdit [4]
    Left = 8
    Top = 16
    TabOrder = 1
    OnKeyDown = DictNameKeyDown
    Width = 161
  end
  object BitBtn4: TBitBtn [5]
    Left = 288
    Top = 344
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 8
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn [6]
    Left = 288
    Top = 304
    Width = 75
    Height = 25
    Caption = #36873#25321
    TabOrder = 9
    OnClick = BitBtn5Click
  end
  object cxGrid1: TcxGrid [7]
    Left = 8
    Top = 40
    Width = 265
    Height = 345
    TabOrder = 10
    object GrdDict: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdDictCellClick
      OnCellDblClick = GrdDictCellDblClick
      DataController.DataSource = DSDict
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
  object EdtLimit: TcxTextEdit [8]
    Left = 224
    Top = 16
    TabOrder = 11
    Visible = False
    Width = 49
  end
  inherited xpmn1: TXPMenu
    Left = 288
    Top = 96
  end
  inherited actlst1: TActionList
    Left = 256
    Top = 56
  end
  inherited imList: TImageList
    Left = 288
    Top = 57
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 320
    Top = 56
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
    Left = 344
    Top = 56
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 256
    Top = 96
  end
  object DSDict: TDataSource
    DataSet = DataBaseModule.AdoDict
    Left = 320
    Top = 96
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
    Left = 304
    Top = 264
  end
end
