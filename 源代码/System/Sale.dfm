inherited Frm_SaleManage: TFrm_SaleManage
  Left = 299
  Top = 108
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #38144#21806#31649#29702
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 246
    Width = 674
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object cxGrid1: TcxGrid [1]
    Left = 0
    Top = 41
    Width = 674
    Height = 205
    Align = alClient
    TabOrder = 4
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GrdSaleM: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdSaleMCellClick
      OnCellDblClick = GrdSaleMCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      OnColumnSizeChanged = GrdSaleMColumnSizeChanged
      OnCustomDrawColumnHeader = GrdSaleMCustomDrawColumnHeader
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdSaleM
    end
  end
  object cxGrid2: TcxGrid [2]
    Left = 0
    Top = 249
    Width = 674
    Height = 190
    Align = alBottom
    TabOrder = 5
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    object GrdSaleD: TcxGridDBTableView
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
      OnColumnSizeChanged = GrdSaleDColumnSizeChanged
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = GrdSaleD
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 0
    Width = 674
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object FDate: TcxDateEdit
      Left = 256
      Top = 12
      TabOrder = 0
      Width = 113
    end
    object EDate: TcxDateEdit
      Left = 400
      Top = 12
      TabOrder = 1
      Width = 113
    end
    object cxLabel1: TcxLabel
      Left = 184
      Top = 16
      Caption = #38144#21806#26085#26399#20174
    end
    object cxLabel2: TcxLabel
      Left = 376
      Top = 16
      Caption = #33267
    end
    object cxButton1: TcxButton
      Left = 520
      Top = 8
      Width = 49
      Height = 25
      Caption = #30830#23450
      TabOrder = 4
      OnClick = cxButton1Click
    end
    object RBCheck: TcxRadioButton
      Left = 80
      Top = 16
      Width = 65
      Height = 17
      Caption = #24050#23457#26680
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = RBCheckClick
      Transparent = True
    end
    object RBNotCheck: TcxRadioButton
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = #26410#23457#26680
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      TabStop = True
      OnClick = RBNotCheckClick
      Transparent = True
    end
  end
  inherited xpmn1: TXPMenu
    Left = 288
    Top = 40
  end
  inherited actlst1: TActionList
    Left = 240
    Top = 40
  end
  inherited imList: TImageList
    Left = 368
    Top = 41
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 448
    Top = 40
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
    Left = 328
    Top = 40
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 408
    Top = 40
  end
  object DSSaleM: TDataSource
    DataSet = DataBaseModule.AdoSale
    Left = 248
    Top = 176
  end
  object LDSSaleD: TDataSource
    DataSet = DataBaseModule.AdoSaleList
    Left = 168
    Top = 344
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 96
    object N1: TMenuItem
      Caption = #26032#24314#38144#21806#21333
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#38144#21806#21333
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#38144#21806#21333
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #23457#26680#38144#21806#21333
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #25968#25454#23548#20986
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #21047#26032
      OnClick = N9Click
    end
  end
  object query: TbainaADOQuery
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
    Left = 448
    Top = 96
  end
  object SaveDlg: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 432
    Top = 152
  end
end
