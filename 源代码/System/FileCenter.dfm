inherited Frm_FileCenter: TFrm_FileCenter
  Left = 334
  Top = 165
  Width = 788
  Height = 525
  BorderIcons = [biSystemMenu]
  Caption = #25991#20214#20013#24515
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TVFileType: TdxDBTreeView [0]
    Left = 0
    Top = 0
    Width = 185
    Height = 498
    RightClickSelect = True
    ShowNodeHint = True
    DataSource = DSFileType
    RootValue = Null
    SeparatedSt = ' - '
    RaiseOnError = True
    ReadOnly = True
    Indent = 19
    OnChange = TVFileTypeChange
    Align = alLeft
    ParentColor = False
    Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 4
    PopupMenu = PopupMenu1
    Images = imList
  end
  object cxGrid1: TcxGrid [1]
    Left = 193
    Top = 0
    Width = 587
    Height = 498
    Align = alClient
    TabOrder = 5
    LookAndFeel.NativeStyle = False
    object GrdFile: TcxGridDBTableView
      PopupMenu = PopupMenu2
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = GrdFileCellDblClick
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
      GridView = GrdFile
    end
  end
  object Panel1: TPanel [2]
    Left = 288
    Top = 176
    Width = 289
    Height = 113
    TabOrder = 6
    Visible = False
    object BtnSure: TcxButton
      Left = 54
      Top = 72
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 0
      OnClick = BtnSureClick
    end
    object EdtType: TcxTextEdit
      Left = 120
      Top = 24
      TabOrder = 1
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 48
      Top = 28
      Caption = #25991#20214#31867#21035#65306
    end
    object BtnExit: TcxButton
      Left = 168
      Top = 72
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = BtnExitClick
    end
  end
  object cxSplitter1: TcxSplitter [3]
    Left = 185
    Top = 0
    Width = 8
    Height = 498
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 29
    PositionAfterOpen = 20
    MinSize = 20
    Control = TVFileType
  end
  inherited xpmn1: TXPMenu
    Left = 656
    Top = 136
  end
  inherited actlst1: TActionList
    Left = 656
    Top = 104
  end
  inherited imList: TImageList
    Left = 656
    Top = 41
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
  end
  inherited cxLookAndFeelController1: TcxLookAndFeelController
    Left = 656
    Top = 72
  end
  object AdoFileType: TbainaADOQuery
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
    Top = 72
  end
  object DSFileType: TDataSource
    DataSet = AdoFileType
    Left = 80
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 80
    Top = 168
    object N1: TMenuItem
      Caption = #26032#24314#25991#20214#20998#31867
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913#25991#20214#20998#31867
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#25991#20214#20998#31867
      OnClick = N3Click
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
    Left = 80
    Top = 216
  end
  object OpenDialog1: TOpenDialog
    Left = 400
    Top = 72
  end
  object PopupMenu2: TPopupMenu
    Left = 256
    Top = 104
    object N4: TMenuItem
      Caption = #23548#20837#25991#20214
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #25171#24320#25991#20214
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #25991#20214#37325#21629#21517
      Visible = False
    end
    object N7: TMenuItem
      Caption = #21024#38500#35760#24405
      OnClick = N7Click
    end
  end
  object DSFile: TDataSource
    DataSet = DataBaseModule.AdoFile
    Left = 328
    Top = 96
  end
  object SaveDialog1: TSaveDialog
    Left = 456
    Top = 72
  end
  object LCustFile: TbainaADOQuery
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
    Top = 224
  end
end
