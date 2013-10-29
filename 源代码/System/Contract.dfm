inherited Frm_Contract: TFrm_Contract
  Left = 118
  Top = 84
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #21512#21516#31649#29702
  ClientHeight = 602
  ClientWidth = 893
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 341
    Width = 893
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object cxGrid1: TcxGrid [1]
    Left = 0
    Top = 0
    Width = 893
    Height = 341
    Align = alClient
    TabOrder = 4
    LookAndFeel.NativeStyle = False
    object GrdContractM: TcxGridDBTableView
      PopupMenu = PopupMenu2
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdContractMCellClick
      OnCellDblClick = GrdContractMCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ShowColumnFilterButtons = sfbAlways
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdContractM
    end
  end
  object ContractSon: TcxPageControl [2]
    Left = 0
    Top = 344
    Width = 893
    Height = 258
    ActivePage = TabActive
    Align = alBottom
    LookAndFeel.NativeStyle = False
    Style = 10
    TabOrder = 5
    OnChange = ContractSonChange
    ClientRectBottom = 258
    ClientRectRight = 893
    ClientRectTop = 19
    object TabMessage: TcxTabSheet
      Caption = #20250#31614#20449#24687
      ImageIndex = 0
      TabVisible = False
    end
    object TabActive: TcxTabSheet
      Caption = #27963#21160#35760#24405
      ImageIndex = 1
      OnShow = ContractSonChange
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 893
        Height = 239
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object GrdActive: TcxGridDBTableView
          PopupMenu = PopupMenu1
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = GrdActiveCellDblClick
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
          GridView = GrdActive
        end
      end
    end
    object TabSale: TcxTabSheet
      Caption = #30456#20851#38144#21806
      ImageIndex = 2
      TabVisible = False
      object cxGrid5: TcxGrid
        Left = 0
        Top = 0
        Width = 893
        Height = 239
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object GrdSale: TcxGridDBTableView
          PopupMenu = PopupMenu1
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel3: TcxGridLevel
          GridView = GrdSale
        end
      end
    end
    object TabFile: TcxTabSheet
      Caption = #21512#21516#25991#26723
      ImageIndex = 3
      OnShow = TabFileShow
      object cxGrid4: TcxGrid
        Left = 0
        Top = 0
        Width = 893
        Height = 239
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object GrdFile: TcxGridDBTableView
          PopupMenu = PopupMenu1
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
        object cxGridLevel2: TcxGridLevel
          GridView = GrdFile
        end
      end
    end
    object TabHistory: TcxTabSheet
      Caption = #27963#21160#21382#21490
      ImageIndex = 4
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 893
        Height = 239
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object GrdHistory: TcxGridDBTableView
          PopupMenu = PopupMenu1
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = GrdActiveCellDblClick
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
        end
        object cxGridLevel1: TcxGridLevel
          GridView = GrdHistory
        end
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 528
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 560
    Top = 8
  end
  inherited imList: TImageList
    Left = 624
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 656
    Top = 8
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Visible = False
    end
    inherited BTCancel: TdxBarLargeButton
      Visible = ivNever
    end
    inherited BTSave: TdxBarLargeButton
      Visible = ivNever
    end
  end
  inherited cxLookAndFeelController1: TcxLookAndFeelController
    Left = 592
    Top = 8
  end
  object AdoContractM: TbainaADOQuery
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
    Left = 80
    Top = 112
  end
  object DSContract: TDataSource
    DataSet = DataBaseModule.AdoContract
    Left = 80
    Top = 152
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 136
    object N5: TMenuItem
      Caption = #26032#24314#27963#21160
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #32534#36753#27963#21160
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21024#38500#27963#21160
      OnClick = N7Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #28155#21152#21040#26085#31243#23433#25490
      OnClick = N12Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #36827#20837#25991#26723#31649#29702#20013#24515
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #25171#24320#25991#20214
      OnClick = N10Click
    end
  end
  object DSActive: TDataSource
    DataSet = DataBaseModule.AdoActive
    Left = 80
    Top = 304
  end
  object DSFile: TDataSource
    DataSet = DataBaseModule.ContractFile
    Left = 192
    Top = 304
  end
  object dlgSave1: TSaveDialog
    Left = 336
    Top = 120
  end
  object PopupMenu2: TPopupMenu
    Left = 456
    Top = 128
    object N1: TMenuItem
      Caption = #26032#22686#21512#21516
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#21512#21516
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#21512#21516
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #23457#26680
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N14Click
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Caption = #23548#20986
      OnClick = N16Click
    end
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
    Left = 424
    Top = 224
  end
end
