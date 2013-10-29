inherited Frm_Expend: TFrm_Expend
  Left = 123
  Top = 84
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #36153#29992#31649#29702
  ClientHeight = 582
  ClientWidth = 913
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid [0]
    Left = 0
    Top = 41
    Width = 913
    Height = 541
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 4
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object GrdExpend: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = GrdExpendCellDblClick
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
      OnColumnSizeChanged = GrdExpendColumnSizeChanged
      OnCustomDrawColumnHeader = GrdExpendCustomDrawColumnHeader
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdExpend
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 913
    Height = 41
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object RBNotCheck: TcxRadioButton
      Left = 16
      Top = 16
      Width = 65
      Height = 17
      Caption = #26410#23457#26680
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RBNotCheckClick
      Transparent = True
    end
    object RBCheck: TcxRadioButton
      Left = 96
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
      TabOrder = 1
      OnClick = RBCheckClick
      Transparent = True
    end
    object FDate: TcxDateEdit
      Left = 256
      Top = 12
      TabOrder = 2
      Width = 113
    end
    object EDate: TcxDateEdit
      Left = 400
      Top = 12
      TabOrder = 3
      Width = 113
    end
    object cxLabel1: TcxLabel
      Left = 184
      Top = 16
      Caption = #36153#29992#26085#26399#20174
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
      TabOrder = 6
      OnClick = cxButton1Click
    end
  end
  inherited actlst1: TActionList
    Top = 96
    inherited actDel: TAction
      OnExecute = nil
    end
    inherited actModify: TAction
      OnExecute = nil
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Visible = False
    end
  end
  object DSExpend: TDataSource
    DataSet = DataBaseModule.AdoExpend
    Left = 40
    Top = 160
  end
  object Query: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      'Select * From Expend')
    TableName = 'Expend'
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
    Left = 560
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 224
    object N1: TMenuItem
      Caption = #26032#22686#36153#29992
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#36153#29992
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#36153#29992
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #23457#26680#36153#29992
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #25968#25454#23548#20986
      OnClick = N9Click
    end
    object N8: TMenuItem
      Caption = #21047#26032
      OnClick = N8Click
    end
  end
  object LAdoExpend: TbainaADOQuery
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
    Left = 608
    Top = 144
  end
  object SaveDlg: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 624
    Top = 232
  end
end
