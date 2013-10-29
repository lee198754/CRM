inherited Frm_ProdCode: TFrm_ProdCode
  Left = 178
  Top = 116
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #21830#21697#20195#30721
  ClientHeight = 549
  ClientWidth = 828
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid [0]
    Left = 177
    Top = 0
    Width = 651
    Height = 549
    Align = alClient
    PopupMenu = PopupMenu2
    TabOrder = 4
    LookAndFeel.NativeStyle = False
    object GrdProd: TcxGridDBTableView
      PopupMenu = PopupMenu2
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = GrdProdCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OnColumnSizeChanged = GrdProdColumnSizeChanged
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdProd
    end
  end
  object Panel1: TPanel [1]
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
      Left = 48
      Top = 28
      Caption = #21830#21697#31867#21035#65306
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
  object cxSplitter1: TcxSplitter [2]
    Left = 169
    Top = 0
    Width = 8
    Height = 549
    HotZoneClassName = 'TcxXPTaskBarStyle'
    PositionAfterOpen = 18
    MinSize = 18
    Control = Panel2
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 0
    Width = 169
    Height = 549
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 7
    object TVProdType: TdxDBTreeView
      Left = 0
      Top = 0
      Width = 169
      Height = 508
      RightClickSelect = True
      ShowNodeHint = True
      ToolTips = False
      DataSource = DSProdCode
      KeyField = 'prodselfid'
      ListField = 'prodtype'
      ParentField = 'parentid'
      RootValue = Null
      SeparatedSt = ' - '
      RaiseOnError = True
      ReadOnly = True
      Indent = 19
      Align = alClient
      ParentColor = False
      ParentCtl3D = False
      Ctl3D = True
      Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
      SortType = stText
      SelectedIndex = -1
      TabOrder = 0
      OnClick = TVProdTypeClick
      PopupMenu = PopupMenu1
      Images = imList
    end
    object Panel3: TPanel
      Left = 0
      Top = 508
      Width = 169
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel3'
      TabOrder = 1
      object cxButton1: TcxButton
        Left = 0
        Top = 0
        Width = 169
        Height = 41
        Caption = #26174#31034#20840#37096#20135#21697
        TabOrder = 0
        OnClick = cxButton1Click
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFBC90868B4131883F31863D30843B2F82392F80372E7D352E7B332D
          79312D78302D762E2C742C2C742C2C732D2D753032793538AE878AFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF97503DF2EADCEFE5D3ECDFCAE9D9C1E5D4B8E2
          CFAFE0CAA7DDC6A0DBC29AD9BF96D9BF95D9BF95D9C096DAC199DDC59FDFC8A4
          7A383AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A533EF5EFE4F2EADCEFE4
          D3ECDFC9E9D9C0E5D4B7E2CFAFDFCAA7DDC6A0DBC29AD9BF96D9BF95D3B891C7
          AC89C4A98DCDB498743234FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9E563F
          F8F3ECF5EFE4F2E9DBEFE4D2ECDEC9E8D9C0E5D3B7DBC5A7CAB192C1A485C0A2
          81BE9F7CB1917198745E8E6959A78878855353FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA15941FBF7F2F8F3EBF5EEE3F2E9DBEFE4D2EBDEC8E8D8BFCFB99F
          A3826E8B66548B645089634E82594669AFAA36ADA9385253886261B09696A081
          81B8A1A1FF00FFFF00FFFF00FFA45C42FDFBF8FAF7F2F8F3EBF5EEE3F2E9DAE8
          DAC8D5C2AFB599885FDBFD0DDBD563344C6299F9C0988769AFF8356EA96E261D
          6137354A6FA32C9CF9524A5CFF00FFFF00FFFF00FFA75F43FEFEFDFCFBF8FAF7
          F2F8F3EAF5EEE2DBCBBEAB8F838C675D5EDCFD0DDCD564334B2C9AF82B9AF78B
          CDF7D5969024948F26D1FB2993F92B9BF7514B5CA88C8CFF00FFFF00FFAA6343
          FFFFFFFEFEFDFCFBF8FAF7F1F7F2EAD6C6BDC261617C42427C4B4B0DFEFE12C6
          CB6537522AA6F78BAAF5AAB2F43B5A8F3B5A90ADE6F8FFE6F2884D5C501F1FB0
          9696FF00FFAE6544FFFFFFFFFFFFFEFDFDFCFAF7FAF6F1D8CAC27F4349379CFC
          389BFB773F4E64C5FCF8FBFAAFFAF700FAF680FBF596FBF80DFCF90ED2FA4B3E
          614B79C64DD3FE723C44FF00FFB16745FFFFFFFFFFFFFFFFFFFEFDFCFCFAF7DB
          CDC87F434A399DFC399BFC68B5FDCDFDFD00BCCE711D1D70272A6D262A6C231A
          9684A248FBFA4A79634B79C64CC9FEE8C7C3FF00FFB46A46FFFFFFFFFFFFFFFF
          FFFFFFFFFEFDFCE4DBD8369DFDF0F7FC3C9AFCDEFDFD19FDFDB0B9CFBC9691EE
          E1E1A369697F40393560A2BDF0F94AF0F6CFF0EF4BEFED4C5453FF00FFB76D46
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F3F2439BFC4299FC4099D7419BFCFFFD
          FDAFB6D0BC948FEEDFDFA46B6B7E4038AF96A228F9F973DEF7744144743C38FF
          00FFFF00FFB97047FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBE4DAD8
          784E5B78C9FCBEFDFCBDD5D1BD918EEBDBDAA56C6C7E4139AF96A08BFAF810DE
          F851476EFF00FFFF00FFFF00FFBC7247FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F3F162B1FBC4E6FB00E6FB41BEBBBC8E8BEAD2D2AF6D6D804339
          435A94B3C8F86DE1F86C766FFF00FFFF00FFFF00FFBE7447FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F2F1589EFB849DE0D88F88B38E8AD3
          B0B0B29293824554BA776782A8D4AFA8CCFF00FFFF00FFFF00FFFF00FFC17748
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFCFB
          F8F5F2F0B28F8DECE6E6ECC7C7845C56F1EBEAFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFC37849FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFBFDFCFAF6F3F2D7A0A0BD8989F6F3F2F0E5E1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC57C4BFFFFFFFFFEFEFFFEFEFFFEFEFFFEFEFF
          FEFEFFFEFEFFFEFEFFFEFEFFFEFEFFFEFDFEFDFCFEFDFCFEFDFDFEFDFCFCF9F5
          C99F90FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC97F50EDF8FD0091F00443
          82E3EFF5006FC2044382E3EFF5006FC2044382E3EFF50B75C5255C93EBF3F75E
          A3D86680A0FAF7F3A75F43FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCA8251
          F6FBFD5AC5F8035CA2E5F3F91AA7F4035CA2E5F3F91AA7F4035CA2E5F3F91AA7
          F40960A4E7F4F930AFF5214878FAF8F5A55938FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFDEB192E3CFBF98DDFB0278CBE3EDF055C2F80278CBE2EDF055C2F8
          0278CBE2EDF055C2F80278CBE1ECF052C0F7064788C49B85CC9F8AFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93DBF9149FEEFF00FF65C8F714
          9FEEFF00FF65C8F7149FEEFF00FF65C8F7149FEEFF00FF63C7F7147DC3FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 648
    Top = 48
  end
  inherited actlst1: TActionList
    Left = 648
    Top = 80
  end
  inherited imList: TImageList
    Left = 648
    Top = 145
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 648
    Top = 176
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
    Left = 648
    Top = 112
  end
  object AdoProdtype: TbainaADOQuery
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
    Left = 64
    Top = 80
  end
  object DSProdCode: TDataSource
    DataSet = AdoProdtype
    Left = 64
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 64
    Top = 176
    object N1: TMenuItem
      Caption = #26032#22686#21830#21697#31867#21035
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913#21830#21697#31867#21035
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#21830#21697#31867#21035
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
    Left = 64
    Top = 224
  end
  object DSProd: TDataSource
    DataSet = DataBaseModule.AdoProd
    Left = 336
    Top = 120
  end
  object PopupMenu2: TPopupMenu
    Left = 552
    Top = 64
    object N4: TMenuItem
      Caption = #26032#22686#21830#21697
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #32534#36753#21830#21697
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21024#38500#21830#21697
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = #25968#25454#23548#20986
      OnClick = N8Click
    end
  end
  object dlgSave1: TSaveDialog
    Left = 312
    Top = 64
  end
end
