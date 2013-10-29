inherited Frm_PreService: TFrm_PreService
  Left = 230
  Top = 55
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #32500#25252#39044#32422
  ClientHeight = 560
  ClientWidth = 869
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 121
    Top = 0
    Height = 560
  end
  object TVPre: TcxTreeView [1]
    Left = 0
    Top = 0
    Width = 121
    Height = 560
    Align = alLeft
    TabOrder = 4
    Images = imList
    Items.Data = {
      040000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      06D0C2D4A4D4BC1F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      00000006D2D1B0B2C5C51F0000000000000000000000FFFFFFFFFFFFFFFF0000
      00000000000006D2D1CDEAB3C91F0000000000000000000000FFFFFFFFFFFFFF
      FF000000000000000006D2D1C9F3BACB}
    OnChange = TVPreChange
  end
  object Panel1: TPanel [2]
    Left = 124
    Top = 0
    Width = 745
    Height = 560
    Align = alClient
    TabOrder = 5
    object Splitter2: TSplitter
      Left = 1
      Top = 349
      Width = 743
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 743
      Height = 280
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object GrdPre: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = GrdPreCellClick
        OnCellDblClick = GrdPreCellDblClick
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ShowColumnFilterButtons = sfbAlways
        OnColumnSizeChanged = GrdPreColumnSizeChanged
        OnCustomDrawColumnHeader = GrdPreCustomDrawColumnHeader
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GrdPre
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 1
      Top = 352
      Width = 743
      Height = 207
      ActivePage = cxTabSheet3
      Align = alBottom
      LookAndFeel.NativeStyle = False
      Style = 10
      TabOrder = 1
      OnChange = cxPageControl1Change
      ClientRectBottom = 207
      ClientRectRight = 743
      ClientRectTop = 19
      object cxTabSheet1: TcxTabSheet
        Caption = #32500#25252#36807#31243
        ImageIndex = 0
        object cxGrid2: TcxGrid
          Left = 0
          Top = 0
          Width = 481
          Height = 188
          Align = alLeft
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdProc: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = GrdProcCellClick
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
            GridView = GrdProc
          end
        end
        object cxDBMemo2: TcxDBMemo
          Left = 481
          Top = 0
          Align = alClient
          DataBinding.DataSource = DSSerProc
          TabOrder = 1
          Height = 188
          Width = 262
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = #32500#25252#36153#29992
        ImageIndex = 1
        object cxGrid3: TcxGrid
          Left = 0
          Top = 0
          Width = 743
          Height = 188
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdExpend: TcxGridDBTableView
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
          object cxGrid3Level1: TcxGridLevel
            GridView = GrdExpend
          end
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = #32500#25252#20154#21592
        ImageIndex = 2
        object cxGrid4: TcxGrid
          Left = 0
          Top = 0
          Width = 743
          Height = 188
          Align = alClient
          TabOrder = 0
          object GrdSelect: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
          end
          object cxGrid4Level1: TcxGridLevel
            GridView = GrdSelect
          end
        end
      end
    end
    object cxDBMemo1: TcxDBMemo
      Left = 1
      Top = 281
      Align = alBottom
      DataBinding.DataSource = DSService
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextStyle = [fsBold]
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Height = 68
      Width = 743
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
  end
  inherited cxLookAndFeelController1: TcxLookAndFeelController
    Left = 592
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 312
    Top = 128
  end
  object DSService: TDataSource
    DataSet = DataBaseModule.AdoPreService
    Left = 40
    Top = 80
  end
  object PreService: TbainaADOQuery
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
    Left = 40
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 516
    Top = 72
    object N1: TMenuItem
      Caption = #39044#32422#24405#20837
      OnClick = N1Click
    end
    object N7: TMenuItem
      Caption = #39044#32422#32534#36753
      OnClick = N7Click
    end
    object N18: TMenuItem
      Caption = #39044#32422#21024#38500
      OnClick = N18Click
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object N20: TMenuItem
      Caption = #20154#21592#23433#25490
      OnClick = N20Click
    end
    object N24: TMenuItem
      Caption = #20154#21592#20462#25913
      OnClick = N24Click
    end
    object N25: TMenuItem
      Caption = #20154#21592#21024#38500
      OnClick = N25Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #23457#26680
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #21462#28040#23457#26680
      OnClick = N5Click
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #32500#25252#23436#25104
      OnClick = N3Click
    end
    object N17: TMenuItem
      Caption = #21462#28040#23436#25104
      OnClick = N17Click
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #26032#24314#32500#25252#35760#24405
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #32534#36753#32500#25252#35760#24405
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #21024#38500#32500#25252#35760#24405
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #26032#22686#32500#25252#36153#29992
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #32534#36753#32500#25252#36153#29992
      OnClick = N14Click
    end
    object N15: TMenuItem
      Caption = #21024#38500#32500#25252#36153#29992
      OnClick = N15Click
    end
  end
  object DSSerProc: TDataSource
    DataSet = DataBaseModule.AdoSerProc
    Left = 148
    Top = 312
  end
  object DSExpend: TDataSource
    DataSet = DataBaseModule.AdoExpend
    Left = 204
    Top = 312
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
    Left = 204
    Top = 240
  end
  object LDSSelect: TDataSource
    DataSet = DataBaseModule.AdoSelect
    Left = 308
    Top = 312
  end
end
