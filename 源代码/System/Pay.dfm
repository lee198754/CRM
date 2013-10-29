inherited Frm_Pay: TFrm_Pay
  Left = 194
  Top = 317
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #25910#27454#31649#29702
  ClientHeight = 631
  ClientWidth = 1004
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid [0]
    Left = 0
    Top = 41
    Width = 1004
    Height = 366
    Align = alClient
    TabOrder = 4
    LookAndFeel.NativeStyle = False
    object GrdSaleM: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdSaleMCellClick
      DataController.DataSource = LDSSaleM
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ShowColumnFilterButtons = sfbAlways
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdSaleM
    end
  end
  object cxGrid2: TcxGrid [1]
    Left = 0
    Top = 407
    Width = 1004
    Height = 224
    Align = alBottom
    TabOrder = 5
    LookAndFeel.NativeStyle = False
    object GrdPay: TcxGridDBTableView
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
      GridView = GrdPay
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 1004
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
      Caption = #23436#25104#26085#26399#20174
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
    object RBNotFinish: TcxRadioButton
      Left = 32
      Top = 16
      Width = 57
      Height = 17
      Caption = #26410#25910#23436
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = True
      OnClick = RBNotFinishClick
      Transparent = True
    end
    object RBFinish: TcxRadioButton
      Left = 96
      Top = 16
      Width = 57
      Height = 17
      Caption = #24050#25910#23436
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = RBFinishClick
      Transparent = True
    end
  end
  inherited xpmn1: TXPMenu
    Left = 408
    Top = 56
  end
  inherited actlst1: TActionList
    Left = 376
    Top = 56
  end
  inherited imList: TImageList
    Left = 472
    Top = 57
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 504
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
    Left = 440
    Top = 56
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 536
    Top = 56
  end
  object LAdoSaleM: TbainaADOQuery
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
    Left = 368
    Top = 136
  end
  object LAdoPayList: TbainaADOQuery
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
    Left = 456
    Top = 496
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
    Left = 48
    Top = 304
  end
  object LDSSaleM: TDataSource
    DataSet = LAdoSaleM
    Left = 408
    Top = 144
  end
  object PopupMenu1: TPopupMenu
    Left = 616
    Top = 144
    object N2: TMenuItem
      Caption = #21047#26032
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #20914#38144#23458#25143#27424#27454
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #25968#25454#23548#20986
      OnClick = N4Click
    end
  end
  object LDSPayList: TDataSource
    DataSet = LAdoPayList
    Left = 504
    Top = 496
  end
  object SaveDlg: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 688
    Top = 216
  end
end
