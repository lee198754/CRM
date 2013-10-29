inherited Frm_Bulletin: TFrm_Bulletin
  Left = 308
  Top = 211
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #20844#21578#26495
  ClientHeight = 616
  ClientWidth = 913
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 384
    Width = 913
    Height = 232
    Align = alBottom
    TabOrder = 4
    object Panel2: TPanel
      Left = 704
      Top = 1
      Width = 208
      Height = 230
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 0
      object cxGrid2: TcxGrid
        Left = 2
        Top = 2
        Width = 204
        Height = 226
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object GrdBulletinList: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = GrdBulletinList
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 230
      Align = alClient
      TabOrder = 1
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 701
        Height = 68
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        object EdtTitle: TcxDBTextEdit
          Left = 64
          Top = 8
          DataBinding.DataSource = LDSBulletin
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 337
        end
        object EdtMan: TcxDBTextEdit
          Left = 64
          Top = 40
          DataBinding.DataSource = LDSBulletin
          Properties.ReadOnly = True
          TabOrder = 1
          Width = 113
        end
        object EdtDate: TcxDBDateEdit
          Left = 248
          Top = 40
          DataBinding.DataSource = LDSBulletin
          Properties.ReadOnly = True
          TabOrder = 2
          Width = 153
        end
        object cxLabel1: TcxLabel
          Left = 16
          Top = 12
          Caption = #26631#39064#65306
        end
        object cxLabel2: TcxLabel
          Left = 4
          Top = 44
          Caption = #21457#24067#20154#65306
        end
        object cxLabel3: TcxLabel
          Left = 184
          Top = 44
          Caption = #21457#24067#26102#38388#65306
          Transparent = True
        end
      end
      object EdtContent: TcxDBMemo
        Left = 1
        Top = 69
        Align = alClient
        DataBinding.DataSource = LDSBulletin
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        TabOrder = 1
        Height = 160
        Width = 701
      end
    end
  end
  object cxGrid1: TcxGrid [1]
    Left = 0
    Top = 0
    Width = 913
    Height = 384
    Align = alClient
    TabOrder = 5
    LookAndFeel.NativeStyle = False
    object GrdBulletin: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdBulletinCellClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.ShowColumnFilterButtons = sfbAlways
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdBulletin
    end
  end
  inherited xpmn1: TXPMenu
    Left = 32
    Top = 72
  end
  inherited actlst1: TActionList
    Left = 128
    Top = 48
  end
  inherited imList: TImageList
    Left = 248
    Top = 49
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 328
    Top = 48
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
    Left = 208
    Top = 48
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 288
    Top = 48
  end
  object LAdoBulletin: TbainaADOQuery
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
    Left = 272
    Top = 344
  end
  object LDSBulletin: TDataSource
    DataSet = LAdoBulletin
    Left = 312
    Top = 344
  end
  object LAdoBulletinList: TbainaADOQuery
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
    Left = 416
    Top = 344
  end
  object LDSBulletinList: TDataSource
    DataSet = LAdoBulletinList
    Left = 464
    Top = 344
  end
  object PopupMenu1: TPopupMenu
    Left = 472
    Top = 160
    object N1: TMenuItem
      Caption = #21457#24067#20844#21578
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#20844#21578
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#20844#21578
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = #21047#26032
      OnClick = N5Click
    end
  end
  object Timer1: TTimer
    Interval = 300000
    OnTimer = Timer1Timer
    Left = 560
    Top = 256
  end
end
