inherited Frm_Supply: TFrm_Supply
  Left = 276
  Top = 69
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #20379#24212#21830#36164#26009
  ClientHeight = 598
  ClientWidth = 858
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 208
    Top = 64
    Width = 16
    Height = 13
    Caption = 'lbl1'
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 169
    Height = 598
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    Locked = True
    TabOrder = 1
    object TreeView: TcxTreeView
      Left = 0
      Top = 104
      Width = 169
      Height = 494
      Align = alClient
      TabOrder = 0
      OnClick = TreeViewClick
      Items.Data = {
        0100000021000000000000000000000001000000FFFFFFFF000000000D000000
        08CED2B5C4B2E9D1B02B000000000000000000000002000000FFFFFFFF000000
        000000000012B1BED4C2D0C2B5C7BCC7B5C4B9A9D3A6C9CC2B00000000000000
        0000000002000000FFFFFFFF000000000000000012B1BED4C2D0E8C1AACFB5B5
        C4B9A9D3A6C9CC2B000000000000000000000002000000FFFFFFFF0000000000
        00000012B1BED4C2D2D1C1AACFB5B5C4B9A9D3A6C9CC2B000000000000000000
        000002000000FFFFFFFF000000000000000012B1BED6DCD0C2B5C7BCC7B5C4B9
        A9D3A6C9CC2B000000000000000000000002000000FFFFFFFF00000000000000
        0012B1BED6DCD0E8C1AACFB5B5C4B9A9D3A6C9CC2B0000000000000000000000
        02000000FFFFFFFF000000000000000012B1BED6DCD2D1C1AACFB5B5C4B9A9D3
        A6C9CC2B000000000000000000000002000000FFFFFFFF000000000000000012
        BDF1CCECD0C2B5C7BCC7B5C4B9A9D3A6C9CC2B00000000000000000000000200
        0000FFFFFFFF000000000000000012BDF1CCECD0E8C1AACFB5B5C4B9A9D3A6C9
        CC2B000000000000000000000002000000FFFFFFFF000000000000000012BDF1
        CCECD2D1C1AACFB5B5C4B9A9D3A6C9CC2F000000000000000000000016000000
        FFFFFFFF000000000000000016D7D4B6A8D2E5B2E9D1B0CEB4C1AACFB5B9A9D3
        A6C9CC2F000000000000000000000016000000FFFFFFFF000000000000000016
        D7D4B6A8D2E5B2E9D1B0D0C2B5C7BCC7B9A9D3A6C9CC2F000000000000000000
        000016000000FFFFFFFF000000000000000016D7D4B6A8D2E5B2E9D1B0D0E8C1
        AACFB5B9A9D3A6C9CC2F000000000000000000000016000000FFFFFFFF000000
        000000000016D7D4B6A8D2E5B2E9D1B0D2D1C1AACFB5B9A9D3A6C9CC}
      ReadOnly = True
      SortType = stData
      StateImages = imList
      OnChange = TreeViewChange
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 169
      Height = 104
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object ProdFind: TcxTextEdit
        Left = 3
        Top = 20
        TabOrder = 0
        OnKeyUp = ProdFindKeyUp
        Width = 118
      end
      object cxButton2: TcxButton
        Left = 123
        Top = 17
        Width = 41
        Height = 25
        Caption = #20135#21697
        TabOrder = 1
        WordWrap = True
        OnClick = cxButton2Click
      end
      object SupplyFind: TcxTextEdit
        Left = 4
        Top = 64
        TabOrder = 2
        OnKeyUp = SupplyFindKeyUp
        Width = 116
      end
      object cxButton3: TcxButton
        Left = 123
        Top = 61
        Width = 41
        Height = 25
        Caption = #21830#23478
        TabOrder = 3
        WordWrap = True
        OnClick = cxButton3Click
      end
    end
  end
  object Panel3: TPanel [2]
    Left = 177
    Top = 0
    Width = 681
    Height = 598
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 4
    object CustSon: TcxPageControl
      Left = 0
      Top = 373
      Width = 681
      Height = 225
      ActivePage = TabContact
      Align = alBottom
      LookAndFeel.NativeStyle = False
      Style = 10
      TabOrder = 1
      TabSlants.Kind = skCutCorner
      OnChange = CustSonChange
      ClientRectBottom = 225
      ClientRectRight = 681
      ClientRectTop = 19
      object TabContact: TcxTabSheet
        Caption = #32852#31995#20154
        ImageIndex = 0
        OnShow = CustSonChange
        object cxGrid2: TcxGrid
          Left = 0
          Top = 0
          Width = 681
          Height = 206
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdContact: TcxGridDBTableView
            PopupMenu = PopupMenu1
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = GrdContactCellDblClick
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
            GridView = GrdContact
          end
        end
      end
      object cxtbsht1: TcxTabSheet
        Caption = #30005#35805#26469#24448
        ImageIndex = 9
        TabVisible = False
        object cxgrd1: TcxGrid
          Left = 0
          Top = 0
          Width = 681
          Height = 165
          Align = alClient
          TabOrder = 0
          object cxgrdbtblvwGrid11DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = cxgrdbtblvwGrid11DBTableView1CellClick
            DataController.DataSource = ds1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
            object cxgrdbclmnGrid11DBTableView1FLocalNum: TcxGridDBColumn
              Caption = #26412#22320#21495#30721
              DataBinding.FieldName = 'FLocalNum'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1FRemoteNum: TcxGridDBColumn
              Caption = #23545#26041#21495#30721
              DataBinding.FieldName = 'FRemoteNum'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1way: TcxGridDBColumn
              Caption = #26041#21521
              DataBinding.FieldName = 'way'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1CustName: TcxGridDBColumn
              Caption = #23458#25143#21517#31216
              DataBinding.FieldName = 'CustName'
              Width = 133
            end
            object cxgrdbclmnGrid11DBTableView1CustPhone: TcxGridDBColumn
              Caption = #30005#35805
              DataBinding.FieldName = 'CustPhone'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1ContactName: TcxGridDBColumn
              Caption = #32852#31995#20154
              DataBinding.FieldName = 'ContactName'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1ContactWorkPhone: TcxGridDBColumn
              Caption = #24037#20316#30005#35805
              DataBinding.FieldName = 'ContactWorkPhone'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1ContactFamilyphone: TcxGridDBColumn
              Caption = #30452#32447#30005#35805
              DataBinding.FieldName = 'ContactFamilyphone'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1ContactMobile: TcxGridDBColumn
              Caption = #25163#26426
              DataBinding.FieldName = 'ContactMobile'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1FDTStart: TcxGridDBColumn
              Caption = #26102#38388
              DataBinding.FieldName = 'FDTStart'
              Width = 106
            end
            object cxgrdbclmnGrid11DBTableView1FLong: TcxGridDBColumn
              Caption = #36890#35805#26102#38271
              DataBinding.FieldName = 'FLong'
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1FIO: TcxGridDBColumn
              DataBinding.FieldName = 'FIO'
              Visible = False
              Width = 80
            end
            object cxgrdbclmnGrid11DBTableView1FFile: TcxGridDBColumn
              Caption = #25991#20214
              DataBinding.FieldName = 'FFile'
              Width = 250
            end
          end
          object cxgrdlvlGrid11Level1: TcxGridLevel
            GridView = cxgrdbtblvwGrid11DBTableView1
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 165
          Width = 681
          Height = 41
          Align = alBottom
          TabOrder = 1
          object Label1: TLabel
            Left = 308
            Top = 15
            Width = 108
            Height = 13
            AutoSize = False
            Caption = #26381#21153#22120#22320#22336'/'#22495#21517
          end
          object cbb1: TComboBox
            Left = 412
            Top = 11
            Width = 101
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              '127.0.0.1')
          end
          object mp1: TMediaPlayer
            Left = 17
            Top = 7
            Width = -2
            Height = 30
            VisibleButtons = [btPlay, btPause, btStop]
            TabOrder = 1
          end
          object TrackBar1: TTrackBar
            Left = 107
            Top = 11
            Width = 196
            Height = 25
            TabOrder = 2
            TickMarks = tmBoth
            TickStyle = tsNone
            OnChange = TrackBar1Change
          end
          object Panel4: TPanel
            Left = 723
            Top = 3
            Width = 200
            Height = 34
            TabOrder = 3
            Visible = False
            object TMNC_OCXX1: TTMNC_OCXX
              Left = 17
              Top = -1
              Width = 171
              Height = 33
              ParentColor = False
              ParentFont = False
              TabOrder = 0
              OnConnect = TMNC_OCXX1Connect
              OnDisConnect = TMNC_OCXX1DisConnect
              ControlData = {
                545046300A54544D4E435F4F43585809544D4E435F4F435858044C6566740211
                03546F7002FF05576964746803AB000648656967687402210D41637469766543
                6F6E74726F6C070C4D65646961506C61796572310743617074696F6E0609544D
                4E435F4F43585805436F6C6F720709636C42746E466163650C466F6E742E4368
                6172736574070F44454641554C545F434841525345540A466F6E742E436F6C6F
                72070C636C57696E646F77546578740B466F6E742E48656967687402F509466F
                6E742E4E616D65060D4D532053616E732053657269660A466F6E742E5374796C
                650B000E4F6C644372656174654F72646572080D506978656C73506572496E63
                6802600A54657874486569676874020D0000}
            end
          end
          object btn3: TcxButton
            Left = 523
            Top = 8
            Width = 74
            Height = 25
            Caption = #26029#24320
            TabOrder = 4
            OnClick = btn3Click
          end
          object cxButton1: TcxButton
            Left = 610
            Top = 8
            Width = 74
            Height = 25
            Caption = #21047#26032
            TabOrder = 5
            OnClick = cxButton1Click
          end
          object btn4: TcxButton
            Left = 522
            Top = 8
            Width = 74
            Height = 25
            Caption = #36830#25509
            TabOrder = 6
            OnClick = btn4Click
          end
        end
      end
      object TabActive: TcxTabSheet
        Caption = #27963#21160#35760#24405
        ImageIndex = 1
        object cxGrid3: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
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
          object cxGrid3Level1: TcxGridLevel
            GridView = GrdActive
          end
        end
      end
      object TabSalePre: TcxTabSheet
        Caption = #20379#24212#21830#20135#21697
        ImageIndex = 5
        object cxGrid8: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdPre: TcxGridDBTableView
            PopupMenu = PopupMenu1
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = GrdPreCellDblClick
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
          end
          object cxGridLevel5: TcxGridLevel
            GridView = GrdPre
          end
        end
      end
      object TabExpend: TcxTabSheet
        Caption = #30456#20851#36153#29992
        ImageIndex = 2
        TabVisible = False
        object cxGrid5: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
          Align = alClient
          PopupMenu = PopupMenu1
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdExpend: TcxGridDBTableView
            PopupMenu = PopupMenu1
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = GrdExpendCellDblClick
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
            GridView = GrdExpend
          end
        end
      end
      object TabSale: TcxTabSheet
        Caption = #37319#36141#35760#24405
        ImageIndex = 3
        TabVisible = False
        object cxGrid6: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdSale: TcxGridDBTableView
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
          object cxGridLevel3: TcxGridLevel
            GridView = GrdSale
          end
        end
      end
      object TabContract: TcxTabSheet
        Caption = #30456#20851#21512#21516
        ImageIndex = 4
        TabVisible = False
        object cxGrid7: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object GrdContract: TcxGridDBTableView
            PopupMenu = PopupMenu1
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = GrdContractCellDblClick
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
          end
          object cxGridLevel4: TcxGridLevel
            GridView = GrdContract
          end
        end
      end
      object TabFile: TcxTabSheet
        Caption = #30456#20851#25991#26723
        ImageIndex = 6
        object cxGrid9: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
          Hint = #21452#20987#36827#20837#25991#20214#31649#29702#20013#24515
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
          object cxGridLevel6: TcxGridLevel
            GridView = GrdFile
          end
        end
      end
      object TabService: TcxTabSheet
        Caption = #32500#25252#35760#24405
        ImageIndex = 8
        TabVisible = False
        object cxGrid10: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
          Align = alClient
          TabOrder = 0
          object GrdService: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellDblClick = GrdServiceCellDblClick
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.GroupByBox = False
          end
          object cxGrid10Level1: TcxGridLevel
            GridView = GrdService
          end
        end
      end
      object TabHistory: TcxTabSheet
        Caption = #27963#21160#21382#21490
        ImageIndex = 8
        object cxGrid4: TcxGrid
          Left = 0
          Top = 0
          Width = 679
          Height = 206
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
    object cxSplitter2: TcxSplitter
      Left = 0
      Top = 365
      Width = 681
      Height = 8
      HotZoneClassName = 'TcxXPTaskBarStyle'
      AlignSplitter = salBottom
      PositionAfterOpen = 20
      MinSize = 20
      Control = CustSon
    end
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 681
      Height = 365
      Align = alClient
      PopupMenu = PopupMenu2
      TabOrder = 2
      LookAndFeel.NativeStyle = False
      object GrdCust: TcxGridDBTableView
        PopupMenu = PopupMenu2
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = GrdCustCellClick
        OnCellDblClick = GrdCustCellDblClick
        DataController.DataSource = DSCust
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'CustName'
            Column = GrdCustColumn3
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.Footer = True
        OptionsView.ShowColumnFilterButtons = sfbAlways
        object GrdCustColumn1: TcxGridDBColumn
          Caption = #24402#23646#20154
          DataBinding.FieldName = 'Username_'
          Width = 80
        end
        object GrdCustColumn2: TcxGridDBColumn
          Caption = #20379#24212#21830#32534#21495
          DataBinding.FieldName = 'CustNum'
          Width = 80
        end
        object GrdCustColumn3: TcxGridDBColumn
          Caption = #20379#24212#21830#21517#31216
          DataBinding.FieldName = 'CustName'
          Width = 150
        end
        object GrdCustColumn4: TcxGridDBColumn
          Caption = #30005#35805
          DataBinding.FieldName = 'CustPhone'
          Width = 80
        end
        object GrdCustColumn5: TcxGridDBColumn
          Caption = #22320#22336
          DataBinding.FieldName = 'CustAddress'
          Width = 200
        end
        object GrdCustColumn6: TcxGridDBColumn
          Caption = #32593#22336
          DataBinding.FieldName = 'CustHomePage'
          PropertiesClassName = 'TcxHyperLinkEditProperties'
          Width = 80
        end
        object GrdCustColumn7: TcxGridDBColumn
          Caption = #19979#27425#32852#31995#26102#38388
          DataBinding.FieldName = 'CustNextDate'
          Width = 80
        end
        object GrdCustColumn8: TcxGridDBColumn
          Caption = #26368#21518#32852#31995#26102#38388
          DataBinding.FieldName = 'CustLastDate'
          Width = 80
        end
        object GrdCustColumn9: TcxGridDBColumn
          Caption = #22269#23478
          DataBinding.FieldName = 'CustCountry'
          Width = 80
        end
        object GrdCustColumn10: TcxGridDBColumn
          Caption = #30465#20221
          DataBinding.FieldName = 'CustProvince'
          Width = 80
        end
        object GrdCustColumn11: TcxGridDBColumn
          Caption = #22478#24066
          DataBinding.FieldName = 'CustCity'
          Width = 80
        end
        object GrdCustColumn12: TcxGridDBColumn
          Caption = #38215#21306
          DataBinding.FieldName = 'CustRegion'
          Width = 80
        end
        object GrdCustColumn13: TcxGridDBColumn
          Caption = #31561#32423
          DataBinding.FieldName = 'CustRate'
          Width = 80
        end
        object GrdCustColumn25: TcxGridDBColumn
          Caption = #24615#36136
          DataBinding.FieldName = 'CustKind'
        end
        object GrdCustColumn14: TcxGridDBColumn
          Caption = #29366#24577
          DataBinding.FieldName = 'CustState'
          Width = 80
        end
        object GrdCustColumn15: TcxGridDBColumn
          Caption = #31867#22411
          DataBinding.FieldName = 'CustType'
          Width = 80
        end
        object GrdCustColumn16: TcxGridDBColumn
          Caption = #26469#28304
          DataBinding.FieldName = 'CustSource'
          Width = 80
        end
        object GrdCustColumn17: TcxGridDBColumn
          Caption = #34892#19994#31867#22411
          DataBinding.FieldName = 'CustTrade'
          Width = 80
        end
        object GrdCustColumn18: TcxGridDBColumn
          Caption = #20449#29992#39069#24230
          DataBinding.FieldName = 'CustCredit'
          Width = 80
        end
        object GrdCustColumn19: TcxGridDBColumn
          Caption = #37038#32534
          DataBinding.FieldName = 'CustPostCard'
          Width = 80
        end
        object GrdCustColumn20: TcxGridDBColumn
          Caption = #22791#27880
          DataBinding.FieldName = 'CustMemo'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 80
        end
        object GrdCustColumn21: TcxGridDBColumn
          Caption = #24314#31435#26085#26399
          DataBinding.FieldName = 'CreateD_'
          Width = 80
        end
        object GrdCustColumn22: TcxGridDBColumn
          Caption = #24314#31435#20154
          DataBinding.FieldName = 'CreateBy_'
        end
        object GrdCustColumn23: TcxGridDBColumn
          Caption = #20462#25913#20154
          DataBinding.FieldName = 'UpdateBy_'
        end
        object GrdCustColumn24: TcxGridDBColumn
          Caption = #20462#25913#26085#26399
          DataBinding.FieldName = 'UpdateD_'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GrdCust
      end
    end
    object RBShareCust: TcxRadioButton
      Left = 352
      Top = 8
      Width = 89
      Height = 17
      Caption = #26435#38480#20379#24212#21830
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = RBShareCustClick
      Transparent = True
    end
    object RBMyCust: TcxRadioButton
      Left = 248
      Top = 8
      Width = 89
      Height = 17
      Caption = #25105#30340#20379#24212#21830
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      TabStop = True
      OnClick = RBMyCustClick
      Transparent = True
    end
  end
  object cxSplitter1: TcxSplitter [3]
    Left = 169
    Top = 0
    Width = 8
    Height = 598
    HotZoneClassName = 'TcxXPTaskBarStyle'
    PositionAfterOpen = 20
    MinSize = 20
    Control = Panel1
  end
  inherited xpmn1: TXPMenu
    Left = 696
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 728
    Top = 8
  end
  inherited imList: TImageList
    Left = 792
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 824
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
    Left = 760
    Top = 8
  end
  object DSCust: TDataSource
    DataSet = DataBaseModule.AdoSupply
    Left = 216
    Top = 72
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 768
    Top = 112
    object N4: TMenuItem
      Caption = #26032#22686#20379#24212#21830#32852#31995#20154
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #32534#36753#20379#24212#21830#32852#31995#20154
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21024#38500#20379#24212#21830#32852#31995#20154
      OnClick = N6Click
    end
    object N9: TMenuItem
      Caption = #26032#24314#27963#21160
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #32534#36753#27963#21160
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #21024#38500#27963#21160
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Caption = #27963#21160#23436#25104
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #28155#21152#21040#26085#31243#23433#25490
      OnClick = N14Click
    end
    object N16: TMenuItem
      Caption = #26032#24314#21512#21516
      OnClick = N16Click
    end
    object N17: TMenuItem
      Caption = #32534#36753#21512#21516
      OnClick = N17Click
    end
    object N18: TMenuItem
      Caption = #21024#38500#21512#21516
      OnClick = N18Click
    end
    object N20: TMenuItem
      Caption = #36827#20837#25991#20214#31649#29702#20013#24515
      OnClick = N20Click
    end
    object N21: TMenuItem
      Caption = #25171#24320#25991#20214
      OnClick = N21Click
    end
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
    object N19: TMenuItem
      Caption = #26032#22686#20379#24212#21830#20135#21697
      OnClick = N19Click
    end
    object N22: TMenuItem
      Caption = #32534#36753#20379#24212#21830#20135#21697
      OnClick = N22Click
    end
    object N23: TMenuItem
      Caption = #21024#38500#20379#24212#21830#20135#21697
      OnClick = N23Click
    end
  end
  object DSContact: TDataSource
    DataSet = DataBaseModule.AdoContact
    Left = 180
    Top = 312
  end
  object DSActive: TDataSource
    DataSet = DataBaseModule.AdoActive
    Left = 233
    Top = 312
  end
  object DSExpend: TDataSource
    DataSet = DataBaseModule.AdoExpend
    Left = 369
    Top = 312
  end
  object DSSale: TDataSource
    DataSet = LAdoSale
    Left = 417
    Top = 312
  end
  object DSContract: TDataSource
    DataSet = DataBaseModule.AdoContract
    Left = 473
    Top = 312
  end
  object DSPre: TDataSource
    DataSet = DataBaseModule.AdoPre
    Left = 313
    Top = 312
  end
  object DSFile: TDataSource
    DataSet = DataBaseModule.CustFile
    Left = 537
    Top = 312
  end
  object PopupMenu2: TPopupMenu
    Left = 721
    Top = 112
    object N7: TMenuItem
      Caption = #26032#22686#20379#24212#21830#36164#26009
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #32534#36753#20379#24212#21830#36164#26009
      OnClick = N8Click
    end
    object N15: TMenuItem
      Caption = #21024#38500#20379#24212#21830#36164#26009
      OnClick = N15Click
    end
    object N29: TMenuItem
      Caption = '-'
    end
    object N27: TMenuItem
      Caption = #40664#35748#36755#20837#35774#32622
      Visible = False
      OnClick = N27Click
    end
    object N30: TMenuItem
      Caption = #26174#31034'/'#38544#34255#21015
      Visible = False
      OnClick = N30Click
    end
    object N26: TMenuItem
      Caption = '-'
    end
    object N24: TMenuItem
      Caption = #23548#20986#20379#24212#21830#36164#26009
      OnClick = N24Click
    end
    object N25: TMenuItem
      Caption = #23548#20837#20379#24212#21830#36164#26009
      Visible = False
      OnClick = N25Click
    end
    object N31: TMenuItem
      Caption = #21047#26032#20379#24212#21830#36164#26009
      OnClick = N31Click
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object N33: TMenuItem
      Caption = #25340#38899#37325#32622
      OnClick = N33Click
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
    Left = 577
    Top = 200
  end
  object dlgSave1: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 401
    Top = 128
  end
  object LAdoExpend: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      'Select * From Expend')
    TableName = 'Expend'
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
    Left = 297
    Top = 272
  end
  object LAdoSale: TbainaADOQuery
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
    Left = 361
    Top = 272
  end
  object LAdoCust: TbainaADOQuery
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
    Left = 217
    Top = 120
  end
  object LAdoService: TbainaADOQuery
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
    Left = 593
    Top = 272
  end
  object LDSService: TDataSource
    DataSet = LAdoService
    Left = 593
    Top = 312
  end
  object bndqryTelQry: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'cm.CustID'
        Attributes = [paSigned, paNullable]
        DataType = ftBCD
        Precision = 10
        Size = 19
        Value = Null
      end>
    SQL.Strings = (
      
        'select r.FLocalNum ,r.FRemoteNum,r.FDTStart,r.FLong,r.FIO,r.FFil' +
        'e,'
      
        'cm.CustName,cm.CustPhone,c.ContactName, c.ContactWorkPhone ,c.Co' +
        'ntactFamilyphone,'
      
        'c.ContactMobile,way =case when FIO = 0 then '#39#21628#20837#39' when FIO = 1 th' +
        'en '#39#21628#20986#39'end'
      ' from racall r'
      'left outer join contact c'
      'on r.FRemoteNum  = c.ContactWorkPhone '
      'or r.FRemoteNum  = c.ContactFamilyphone '
      'or r.FRemoteNum  = c.ContactMobile '
      'left outer join customer  s'
      'on r.FRemoteNum = s. CustPhone '
      'left outer join customer cm'
      'on  cm.CustID = c.CustID or cm.CustID = s.CustID'
      'where cm.CustID = :cm.CustID')
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
    Top = 431
  end
  object ds1: TDataSource
    DataSet = bndqryTelQry
    Left = 378
    Top = 431
  end
  object DSDict: TDataSource
    DataSet = DataBaseModule.AdoDict
    Left = 225
    Top = 192
  end
  object AdoRegion: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    LockType = ltBatchOptimistic
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
    Left = 513
    Top = 88
  end
  object tmr1: TTimer
    Enabled = False
    OnTimer = tmr1Timer
    Left = 256
    Top = 432
  end
end
