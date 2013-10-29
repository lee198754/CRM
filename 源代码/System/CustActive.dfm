inherited Frm_CustActive: TFrm_CustActive
  Left = 360
  Top = 22
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #36319#36827#27963#21160#23433#25490
  ClientHeight = 552
  ClientWidth = 631
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 631
    Height = 552
    ActivePage = cxTabSheet1
    Align = alClient
    LookAndFeel.NativeStyle = False
    TabOrder = 4
    ClientRectBottom = 551
    ClientRectLeft = 1
    ClientRectRight = 630
    ClientRectTop = 21
    object cxTabSheet1: TcxTabSheet
      Caption = #36319#36827#27963#21160
      ImageIndex = 0
      object EdtType: TcxComboBox
        Left = 424
        Top = 92
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #26080
          #21830#19994
          #31169#20154
          #37325#35201
          #20241#20551
          #29983#26085
          #33410#26085
          #30005#35805
          #24517#39035#21442#21152
          #21153#24517#20934#22791)
        TabOrder = 0
        Width = 129
      end
      object cxLabel5: TcxLabel
        Left = 352
        Top = 96
        Caption = #27963#21160#31867#22411#65306
        Transparent = True
      end
      object EdtTopic: TcxTextEdit
        Left = 120
        Top = 32
        TabOrder = 2
        Text = 'EdtTopic'
        Width = 433
      end
      object cxLabel1: TcxLabel
        Left = 64
        Top = 36
        Caption = #20027#39064#65306
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 52
        Top = 64
        Caption = #32852#31995#20154#65306
        Transparent = True
      end
      object EdtContact: TcxComboBox
        Left = 120
        Top = 60
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 5
        Width = 137
      end
      object cxLabel8: TcxLabel
        Left = 40
        Top = 96
        Caption = #27963#21160#22330#25152#65306
        Transparent = True
      end
      object EdtPlace: TcxButtonEdit
        Left = 120
        Top = 92
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 7
        Text = 'EdtPlace'
        OnClick = EdtPlaceClick
        Width = 137
      end
      object EdtBegin: TcxDateEdit
        Left = 120
        Top = 124
        TabOrder = 8
        Width = 137
      end
      object cxLabel6: TcxLabel
        Left = 40
        Top = 128
        Caption = #24320#22987#26085#26399#65306
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 40
        Top = 152
        Caption = #27963#21160#20869#23481#65306
        Transparent = True
      end
      object EdtContext: TcxMemo
        Left = 120
        Top = 152
        Lines.Strings = (
          'EdtContext')
        TabOrder = 11
        Height = 89
        Width = 505
      end
      object EdtEnd: TcxDateEdit
        Left = 424
        Top = 124
        TabOrder = 12
        Width = 129
      end
      object BtnSave: TcxButton
        Left = 352
        Top = 488
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 13
        OnClick = BtnSaveClick
      end
      object BtnExit: TcxButton
        Left = 480
        Top = 488
        Width = 75
        Height = 25
        Caption = #36864#20986
        TabOrder = 14
        OnClick = BtnExitClick
      end
      object cxLabel7: TcxLabel
        Left = 352
        Top = 128
        Caption = #32467#26463#26085#26399#65306
        Transparent = True
      end
      object CBIFFinish: TCheckBox
        Left = 424
        Top = 8
        Width = 97
        Height = 17
        Caption = #26159#21542#23436#25104
        Enabled = False
        TabOrder = 16
      end
      object cxLabel16: TcxLabel
        Left = 352
        Top = 64
        Caption = #27963#21160#26041#24335#65306
        Transparent = True
      end
      object EdtMode: TcxButtonEdit
        Left = 424
        Top = 60
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 18
        Text = 'EdtMode'
        OnClick = EdtModeClick
        Width = 129
      end
      object Panel1: TPanel
        Left = 8
        Top = 288
        Width = 617
        Height = 185
        BevelOuter = bvLowered
        TabOrder = 19
        object cxLabel17: TcxLabel
          Left = 32
          Top = 24
          Caption = #36153#29992#31867#22411#65306
        end
        object ExpendType: TcxButtonEdit
          Left = 96
          Top = 20
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 1
          OnClick = ExpendTypeClick
          Width = 121
        end
        object cxLabel19: TcxLabel
          Left = 32
          Top = 88
          Caption = #36153#29992#37329#39069#65306
        end
        object ExpendMoney: TcxTextEdit
          Left = 96
          Top = 84
          TabOrder = 3
          Text = '0'
          Width = 121
        end
        object ExpendMan: TcxButtonEdit
          Left = 96
          Top = 148
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          TabOrder = 4
          OnClick = ExpendManClick
          Width = 121
        end
        object cxLabel18: TcxLabel
          Left = 20
          Top = 152
          Caption = #36153#29992#21457#29983#20154#65306
          Transparent = True
        end
        object cxGrid1: TcxGrid
          Left = 320
          Top = 8
          Width = 289
          Height = 169
          TabOrder = 6
          object GrdExpend: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = GrdExpendCellClick
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
            GridView = GrdExpend
          end
        end
        object BtnAdd: TcxButton
          Left = 232
          Top = 56
          Width = 75
          Height = 25
          Caption = '---->>>'
          TabOrder = 7
          OnClick = BtnAddClick
        end
        object BtnDel: TcxButton
          Left = 232
          Top = 112
          Width = 75
          Height = 25
          Caption = '<<<----'
          TabOrder = 8
          OnClick = BtnDelClick
        end
      end
      object cxLabel20: TcxLabel
        Left = 40
        Top = 12
        Caption = #27963#21160#32534#21495#65306
        Transparent = True
      end
      object ActiveNum: TcxTextEdit
        Left = 120
        Top = 8
        TabOrder = 21
        Text = 'ActiveNum'
        Width = 137
      end
      object EdtBTime: TcxTimeEdit
        Left = 256
        Top = 124
        EditValue = 0.000000000000000000
        TabOrder = 22
        Width = 73
      end
      object EdtETime: TcxTimeEdit
        Left = 552
        Top = 124
        EditValue = 0.000000000000000000
        TabOrder = 23
        Width = 73
      end
      object Panel2: TPanel
        Left = 8
        Top = 244
        Width = 617
        Height = 41
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 24
        object cxLabel21: TcxLabel
          Left = 32
          Top = 16
          Caption = #23458#25143#31561#32423#65306
          Transparent = True
        end
        object CustRate: TcxButtonEdit
          Left = 104
          Top = 12
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 1
          OnClick = CustRateClick
          Width = 109
        end
        object cxLabel22: TcxLabel
          Left = 232
          Top = 16
          Caption = #23458#25143#29366#24577#65306
          Transparent = True
        end
        object CustState: TcxButtonEdit
          Left = 296
          Top = 12
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 3
          OnClick = CustStateClick
          Width = 109
        end
        object cxLabel23: TcxLabel
          Left = 424
          Top = 16
          Caption = #20449#29992#31561#32423#65306
          Transparent = True
        end
        object CustCredit: TcxButtonEdit
          Left = 484
          Top = 12
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          TabOrder = 5
          OnClick = CustCreditClick
          Width = 109
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #26085#31243#23433#25490
      ImageIndex = 1
      OnShow = cxTabSheet2Show
      object Bevel1: TBevel
        Left = 16
        Top = 130
        Width = 609
        Height = 2
      end
      object DayTopic: TcxTextEdit
        Left = 120
        Top = 16
        TabOrder = 0
        Text = 'EdtTopic'
        Width = 433
      end
      object cxLabel2: TcxLabel
        Left = 48
        Top = 20
        Caption = #20027#39064#65306
        Transparent = True
      end
      object cxLabel9: TcxLabel
        Left = 368
        Top = 56
        Caption = #32852#31995#20154#65306
        Transparent = True
      end
      object DayContact: TcxComboBox
        Left = 424
        Top = 52
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 3
        Width = 129
      end
      object cxLabel10: TcxLabel
        Left = 48
        Top = 96
        Caption = #27963#21160#22330#25152#65306
        Transparent = True
      end
      object DayPlace: TcxButtonEdit
        Left = 120
        Top = 92
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 5
        Text = 'EdtPlace'
        OnClick = EdtPlaceClick
        Width = 129
      end
      object DayType: TcxComboBox
        Left = 424
        Top = 92
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #26080
          #21830#19994
          #31169#20154
          #37325#35201
          #20241#20551
          #29983#26085
          #33410#26085
          #30005#35805
          #24517#39035#21442#21152
          #21153#24517#20934#22791)
        TabOrder = 6
        Width = 129
      end
      object cxLabel11: TcxLabel
        Left = 356
        Top = 96
        Caption = #27963#21160#31867#22411#65306
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 48
        Top = 152
        Caption = #24320#22987#26102#38388#65306
        Transparent = True
      end
      object Daybegindate: TcxDateEdit
        Left = 120
        Top = 148
        TabOrder = 9
        Width = 129
      end
      object cxLabel13: TcxLabel
        Left = 48
        Top = 184
        Caption = #32467#26463#26102#38388#65306
        Transparent = True
      end
      object DayEndDate: TcxDateEdit
        Left = 120
        Top = 180
        TabOrder = 11
        Width = 129
      end
      object cxLabel14: TcxLabel
        Left = 48
        Top = 248
        Caption = #27963#21160#20869#23481#65306
        Transparent = True
      end
      object DayMemo: TcxMemo
        Left = 120
        Top = 248
        Lines.Strings = (
          'EdtContext')
        TabOrder = 13
        Height = 89
        Width = 441
      end
      object IFAllDay: TcxCheckBox
        Left = 432
        Top = 160
        Caption = #26159#21542#20840#22825#20107#20214
        TabOrder = 14
        Transparent = True
        OnClick = IFAllDayClick
        Width = 97
      end
      object DaybeginTime: TcxTimeEdit
        Left = 264
        Top = 148
        EditValue = 0.000000000000000000
        Properties.TimeFormat = tfHourMin
        TabOrder = 15
        Width = 81
      end
      object DayEndTime: TcxTimeEdit
        Left = 264
        Top = 180
        EditValue = 0.000000000000000000
        Properties.TimeFormat = tfHourMin
        TabOrder = 16
        Width = 81
      end
      object DayStart: TcxComboBox
        Left = 120
        Top = 216
        Enabled = False
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          '10'#20998#38047
          '30'#20998#38047
          '1'#23567#26102
          '2'#23567#26102
          '3'#23567#26102
          '4'#23567#26102)
        TabOrder = 17
        Width = 129
      end
      object BtnSure: TcxButton
        Left = 352
        Top = 352
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 18
        OnClick = BtnSureClick
      end
      object BtnCancel: TcxButton
        Left = 480
        Top = 352
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 19
        OnClick = BtnCancelClick
      end
      object IFWarn: TcxCheckBox
        Left = 56
        Top = 216
        Caption = #25552#37266
        TabOrder = 20
        OnClick = IFWarnClick
        Width = 57
      end
      object cxLabel15: TcxLabel
        Left = 48
        Top = 56
        Caption = #20844#21496#65306
        Transparent = True
      end
      object DayCompany: TcxTextEdit
        Left = 120
        Top = 52
        TabOrder = 22
        Text = 'EdtTopic'
        Width = 233
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 296
    Top = 200
  end
  inherited actlst1: TActionList
    Left = 328
    Top = 200
  end
  inherited imList: TImageList
    Left = 392
    Top = 201
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 424
    Top = 200
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
    Left = 360
    Top = 200
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Top = 112
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
    Left = 304
    Top = 80
  end
  object LAdoExpend: TbainaADOQuery
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
    Left = 377
    Top = 365
  end
  object LDSExpend: TDataSource
    DataSet = LAdoExpend
    Left = 377
    Top = 397
  end
  object LAdoUser: TbainaADOQuery
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
    Left = 241
    Top = 453
  end
  object LDSUser: TDataSource
    DataSet = LAdoUser
    Left = 281
    Top = 453
  end
end
