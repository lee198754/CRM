inherited Frm_NewSaleList: TFrm_NewSaleList
  Left = 196
  Top = 120
  Width = 619
  Height = 403
  BorderIcons = [biSystemMenu]
  Caption = #22686#21152#21830#21697
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxpgcntrl1: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 601
    Height = 366
    ActivePage = cxtbsht1
    Align = alClient
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    ClientRectBottom = 366
    ClientRectRight = 601
    ClientRectTop = 24
    object cxtbsht1: TcxTabSheet
      Caption = #21830#21697#21015#34920
      ImageIndex = 0
      object BtnAdd: TcxButton
        Left = 336
        Top = 296
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 11
        OnClick = BtnAddClick
      end
      object BtnExit: TcxButton
        Left = 496
        Top = 296
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 22
        OnClick = BtnExitClick
      end
      object cxGrid1: TcxGrid
        Left = 6
        Top = 3
        Width = 249
        Height = 326
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object GrdProd: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = GrdProdCellClick
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
          GridView = GrdProd
        end
      end
      object cxLabel1: TcxLabel
        Left = 262
        Top = 18
        Caption = #21830#21697#21517#31216#65306
        Transparent = True
      end
      object cxLabel10: TcxLabel
        Left = 402
        Top = 106
        Caption = #20803
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 582
        Top = 106
        Caption = #20803
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 582
        Top = 135
        Caption = #20803
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 262
        Top = 48
        Caption = #21830#21697#31867#21035#65306
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 433
        Top = 77
        Caption = #21830#21697#21333#20301#65306
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 262
        Top = 77
        Caption = #21830#21697#25968#37327#65306
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 262
        Top = 106
        Caption = #21830#21697#21806#20215#65306
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 262
        Top = 135
        Caption = #21830#21697#25240#25187#65306
        Transparent = True
      end
      object cxLabel7: TcxLabel
        Left = 433
        Top = 135
        Caption = #21830#21697#24635#39069#65306
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 433
        Top = 106
        Caption = #23454#38469#21806#20215#65306
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 402
        Top = 135
        Caption = '%'
        Transparent = True
      end
      object EdtAmount: TcxTextEdit
        Left = 328
        Top = 75
        Properties.OnChange = EdtAmountPropertiesChange
        TabOrder = 3
        Text = '0'
        Width = 73
      end
      object EdtFactPrice: TcxTextEdit
        Left = 496
        Top = 104
        Properties.OnChange = EdtFactPricePropertiesChange
        TabOrder = 6
        Text = '0'
        Width = 80
      end
      object EdtProdName: TcxTextEdit
        Left = 328
        Top = 16
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 180
      end
      object EdtProdType: TcxTextEdit
        Left = 328
        Top = 46
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 2
        Width = 180
      end
      object EdtSaleAgio: TcxTextEdit
        Left = 328
        Top = 133
        Properties.OnChange = EdtSaleAgioPropertiesChange
        TabOrder = 7
        Text = '100'
        Width = 73
      end
      object EdtSaleMoney: TcxTextEdit
        Left = 496
        Top = 133
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 8
        Text = '0'
        Width = 80
      end
      object EdtSalePrice: TcxTextEdit
        Left = 328
        Top = 104
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 5
        Text = '0'
        Width = 73
      end
      object EdtUnit: TcxTextEdit
        Left = 496
        Top = 75
        ParentColor = True
        Properties.ReadOnly = True
        TabOrder = 4
        Width = 49
      end
      object cxLabel13: TcxLabel
        Left = 262
        Top = 175
        Caption = #30452#25509#25104#26412#65306
        Transparent = True
      end
      object cxLabel14: TcxLabel
        Left = 430
        Top = 175
        Caption = #38646#26143#25104#26412#65306
        Transparent = True
      end
      object EdtMainCost: TcxTextEdit
        Left = 328
        Top = 171
        TabOrder = 25
        Text = '0'
        Width = 73
      end
      object EdtOtherCost: TcxTextEdit
        Left = 496
        Top = 171
        TabOrder = 26
        Text = '0'
        Width = 81
      end
      object cxMemo1: TcxMemo
        Left = 328
        Top = 200
        TabOrder = 27
        Height = 89
        Width = 249
      end
      object cxLabel15: TcxLabel
        Left = 286
        Top = 199
        Caption = #22791#27880#65306
        Transparent = True
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 456
    Top = 65528
  end
  inherited actlst1: TActionList
    Left = 416
    Top = 0
  end
  inherited imList: TImageList
    Left = 536
    Top = 65521
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 568
    Top = 65520
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
    Left = 488
    Top = 65520
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 584
    Top = 65528
  end
  object LAdoProd: TbainaADOQuery
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
    Left = 320
    Top = 65528
  end
  object LDSProd: TDataSource
    DataSet = LAdoProd
    Left = 360
    Top = 65528
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
    Left = 616
  end
end
