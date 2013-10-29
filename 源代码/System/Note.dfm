inherited Frm_Note: TFrm_Note
  Left = 433
  Top = 258
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #36890#35759#24405
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NoteType: TdxDBTreeView [0]
    Left = 0
    Top = 0
    Width = 153
    Height = 456
    ShowNodeHint = True
    DataSource = LDSNoteType
    RootValue = Null
    SeparatedSt = ' - '
    RaiseOnError = True
    Indent = 19
    OnChange = NoteTypeChange
    Align = alLeft
    ParentColor = False
    Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
    SelectedIndex = -1
    TabOrder = 1
    PopupMenu = PopupMenu1
    Images = imList
  end
  object cxGrid1: TcxGrid [1]
    Left = 161
    Top = 0
    Width = 523
    Height = 456
    Align = alClient
    TabOrder = 3
    object GrdNote: TcxGridDBTableView
      PopupMenu = PopupMenu2
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = GrdNoteCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.GridLines = glNone
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdNote
    end
  end
  object Panel1: TPanel [2]
    Left = 288
    Top = 176
    Width = 289
    Height = 113
    TabOrder = 5
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
      Left = 40
      Top = 28
      Caption = #36890#35759#24405#31867#21035#65306
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
    Left = 153
    Top = 0
    Width = 8
    Height = 456
    HotZoneClassName = 'TcxXPTaskBarStyle'
    PositionAfterOpen = 18
    MinSize = 18
  end
  inherited xpmn1: TXPMenu
    Left = 528
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 496
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
    Left = 560
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 656
    Top = 8
  end
  object LAdoNoteType: TbainaADOQuery
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
    Left = 72
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 88
    object N1: TMenuItem
      Caption = #26032#24314#20998#31867
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913#20998#31867
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#20998#31867
      OnClick = N3Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 472
    Top = 112
    object N4: TMenuItem
      Caption = #26032#22686
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #20462#25913
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21024#38500
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #23548#20986
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #25171#21360
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
    Left = 600
    Top = 216
  end
  object LDSNoteType: TDataSource
    DataSet = LAdoNoteType
    Left = 72
    Top = 144
  end
  object DSNote: TDataSource
    DataSet = DataBaseModule.AdoPre
    Left = 376
    Top = 104
  end
  object DlgSave1: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 528
    Top = 112
  end
end
