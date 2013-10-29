inherited Frm_User: TFrm_User
  Left = 241
  Top = 137
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #29992#25143#31649#29702
  ClientHeight = 598
  ClientWidth = 858
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView1: TTreeView [0]
    Left = 0
    Top = 0
    Width = 121
    Height = 598
    Hint = #21491#38190#31649#29702#37096#38376#36164#26009
    Align = alLeft
    Color = clWhite
    Images = imList
    Indent = 19
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    OnClick = TreeView1Click
  end
  object Panel1: TPanel [1]
    Left = 121
    Top = 0
    Width = 737
    Height = 598
    Align = alClient
    TabOrder = 5
    object GridUser: TcxGrid
      Left = 1
      Top = 1
      Width = 735
      Height = 305
      Align = alClient
      TabOrder = 0
      LookAndFeel.NativeStyle = False
      object UserView: TcxGridDBTableView
        PopupMenu = PopupMenu2
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = UserViewCellClick
        DataController.DataSource = DSUser
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.GroupByBox = False
        OnColumnSizeChanged = UserViewColumnSizeChanged
        OnCustomDrawColumnHeader = UserViewCustomDrawColumnHeader
        object UserViewColumn1: TcxGridDBColumn
          Caption = #29992#25143#32534#21495
          DataBinding.FieldName = 'usercode_'
          Width = 60
        end
        object UserViewColumn2: TcxGridDBColumn
          Caption = #22995#21517
          DataBinding.FieldName = 'username_'
          Width = 60
        end
        object UserViewColumn3: TcxGridDBColumn
          Caption = #24615#21035
          DataBinding.FieldName = 'usersex_'
          Width = 30
        end
        object UserViewColumn4: TcxGridDBColumn
          Caption = #32844#21153
          DataBinding.FieldName = 'userduty_'
          Width = 80
        end
        object UserViewColumn5: TcxGridDBColumn
          Caption = #37096#38376
          DataBinding.FieldName = 'deptname_'
          Width = 60
        end
        object UserViewColumn6: TcxGridDBColumn
          Caption = #21551#29992
          DataBinding.FieldName = 'isenable_'
          Width = 30
        end
        object UserViewColumn7: TcxGridDBColumn
          Caption = #29983#26085
          DataBinding.FieldName = 'userbirthday_'
          Width = 60
        end
        object UserViewColumn8: TcxGridDBColumn
          Caption = #20837#32844#26085#26399
          DataBinding.FieldName = 'userindate_'
          Width = 60
        end
        object UserViewColumn9: TcxGridDBColumn
          Caption = #31163#32844#26085#26399
          DataBinding.FieldName = 'useroutdate_'
          Width = 60
        end
        object UserViewColumn10: TcxGridDBColumn
          Caption = #24037#20316#30005#35805
          DataBinding.FieldName = 'workphone_'
          Width = 80
        end
        object UserViewColumn11: TcxGridDBColumn
          Caption = #23478#24237#30005#35805
          DataBinding.FieldName = 'familyphone_'
          Width = 80
        end
        object UserViewColumn12: TcxGridDBColumn
          Caption = #25163#26426
          DataBinding.FieldName = 'usermobile_'
          Width = 80
        end
        object UserViewColumn13: TcxGridDBColumn
          Caption = #36523#20221#35777
          DataBinding.FieldName = 'useridcard_'
          Width = 80
        end
        object UserViewColumn14: TcxGridDBColumn
          Caption = #22320#22336
          DataBinding.FieldName = 'useraddress_'
          Width = 80
        end
      end
      object GridUserLevel1: TcxGridLevel
        GridView = UserView
      end
    end
    object PageControl1: TcxPageControl
      Left = 1
      Top = 306
      Width = 735
      Height = 249
      ActivePage = TabSheet1
      Align = alBottom
      Style = 10
      TabOrder = 1
      ClientRectBottom = 249
      ClientRectRight = 735
      ClientRectTop = 19
      object TabSheet1: TcxTabSheet
        Caption = #22522#26412#20449#24687
        object SpeedButton3: TSpeedButton
          Left = 648
          Top = 40
          Width = 23
          Height = 22
          Flat = True
          Visible = False
          OnClick = SpeedButton3Click
        end
        object UserNum: TcxTextEdit
          Left = 98
          Top = 41
          Properties.ReadOnly = False
          Style.Color = clBtnFace
          TabOrder = 0
          Width = 121
        end
        object UserName: TcxTextEdit
          Left = 322
          Top = 41
          Properties.ReadOnly = False
          Style.Color = clBtnFace
          TabOrder = 1
          Width = 121
        end
        object cxLabel1: TcxLabel
          Left = 26
          Top = 45
          Caption = #29992#25143#32534#21495#65306
        end
        object cxLabel2: TcxLabel
          Left = 262
          Top = 45
          Caption = #29992#25143#21517#65306
        end
        object cxLabel3: TcxLabel
          Left = 50
          Top = 88
          Caption = #37096#38376#65306
        end
        object cxLabel4: TcxLabel
          Left = 482
          Top = 45
          Caption = #24615#21035#65306
        end
        object cxLabel5: TcxLabel
          Left = 274
          Top = 88
          Caption = #32844#21153#65306
        end
        object cxLabel7: TcxLabel
          Left = 18
          Top = 132
          Caption = #20837#32844#26085#26399#65306
        end
        object cxLabel8: TcxLabel
          Left = 250
          Top = 132
          Caption = #31163#32844#26085#26399#65306
        end
        object UserSystem: TcxCheckBox
          Left = 528
          Top = 128
          Caption = #26159#21542#31995#32479#31649#29702#21592
          TabOrder = 13
          Visible = False
          Width = 121
        end
        object UserStop: TcxCheckBox
          Left = 528
          Top = 88
          Caption = #26159#21542#21551#29992
          TabOrder = 10
          Width = 121
        end
        object UserSex: TcxComboBox
          Left = 528
          Top = 41
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #30007
            #22899)
          Properties.ReadOnly = False
          Style.Color = clBtnFace
          TabOrder = 2
          Width = 121
        end
        object UserDept: TcxComboBox
          Left = 96
          Top = 84
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = UserDeptPropertiesChange
          Style.Color = clBtnFace
          TabOrder = 6
          Width = 121
        end
        object UserIn: TcxDateEdit
          Left = 96
          Top = 128
          Style.Color = clBtnFace
          TabOrder = 11
          Width = 121
        end
        object UserOut: TcxDateEdit
          Left = 320
          Top = 128
          Style.Color = clBtnFace
          TabOrder = 12
          Width = 121
        end
        object UserDuty: TcxButtonEdit
          Left = 320
          Top = 84
          Properties.Buttons = <
            item
              Default = True
              Kind = bkEllipsis
            end>
          Properties.ReadOnly = True
          Style.Color = clBtnFace
          TabOrder = 7
          OnClick = UserDutyClick
          Width = 121
        end
      end
      object TabSheet2: TcxTabSheet
        Caption = #35814#32454#20449#24687
        ImageIndex = 1
        object UserCard: TcxTextEdit
          Left = 272
          Top = 8
          Style.Color = clBtnFace
          TabOrder = 1
          Width = 361
        end
        object UserWPhone: TcxTextEdit
          Left = 80
          Top = 40
          Style.Color = clBtnFace
          TabOrder = 2
          Width = 113
        end
        object UserFPhone: TcxTextEdit
          Left = 272
          Top = 40
          Style.Color = clBtnFace
          TabOrder = 3
          Width = 113
        end
        object cxLabel6: TcxLabel
          Left = 32
          Top = 12
          Caption = #29983#26085#65306
        end
        object cxLabel9: TcxLabel
          Left = 8
          Top = 44
          Caption = #24037#20316#30005#35805#65306
        end
        object cxLabel10: TcxLabel
          Left = 200
          Top = 44
          Caption = #23478#24237#30005#35805#65306
        end
        object cxLabel11: TcxLabel
          Left = 32
          Top = 73
          Caption = #25163#26426#65306
        end
        object cxLabel12: TcxLabel
          Left = 230
          Top = 73
          Caption = 'ICQ'#65306
        end
        object cxLabel13: TcxLabel
          Left = 416
          Top = 73
          Caption = #37038#31665#65306
        end
        object cxLabel14: TcxLabel
          Left = 212
          Top = 12
          Caption = #36523#20221#35777#65306
        end
        object cxLabel15: TcxLabel
          Left = 32
          Top = 104
          Caption = #22320#22336#65306
        end
        object cxLabel17: TcxLabel
          Left = 32
          Top = 136
          Caption = #22791#27880#65306
        end
        object UserICQ: TcxTextEdit
          Left = 272
          Top = 69
          Style.Color = clBtnFace
          TabOrder = 9
          Width = 113
        end
        object UserMobil: TcxTextEdit
          Left = 80
          Top = 69
          Style.Color = clBtnFace
          TabOrder = 8
          Width = 113
        end
        object UserEmail: TcxTextEdit
          Left = 464
          Top = 69
          Style.Color = clBtnFace
          TabOrder = 10
          Width = 169
        end
        object UserAddress: TcxTextEdit
          Left = 80
          Top = 100
          Style.Color = clBtnFace
          TabOrder = 14
          Width = 553
        end
        object UserMemo: TcxMemo
          Left = 80
          Top = 136
          Style.Color = clBtnFace
          TabOrder = 17
          Height = 81
          Width = 553
        end
        object UserBirthday: TcxDateEdit
          Left = 80
          Top = 8
          Style.Color = clBtnFace
          TabOrder = 0
          Width = 113
        end
      end
      object cxtbsht1: TcxTabSheet
        Caption = #30005#35805#21015#34920
        ImageIndex = 2
        object cxgrd1: TcxGrid
          Left = 0
          Top = 0
          Width = 735
          Height = 230
          Align = alClient
          TabOrder = 0
          object cxgrdbtblvwGrid2DBTableView1: TcxGridDBTableView
            PopupMenu = pm1
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = ds1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellMultiSelect = True
            OptionsView.GroupByBox = False
            object cxgrdbclmnGrid2DBTableView1IndexId: TcxGridDBColumn
              DataBinding.FieldName = 'IndexId'
              Visible = False
            end
            object cxgrdbclmnGrid2DBTableView1UserID: TcxGridDBColumn
              DataBinding.FieldName = 'UserID'
              Visible = False
            end
            object cxgrdbclmnGrid2DBTableView1Telphone: TcxGridDBColumn
              Caption = #30005#35805#21495#30721
              DataBinding.FieldName = 'Telphone'
              Width = 80
            end
          end
          object cxgrdlvlGrid2Level1: TcxGridLevel
            GridView = cxgrdbtblvwGrid2DBTableView1
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 555
      Width = 735
      Height = 42
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object BtnSave: TcxButton
        Left = 246
        Top = 8
        Width = 75
        Height = 25
        Action = actSave
        TabOrder = 0
        Visible = False
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
          00009C3100009C3100009C3100009C3100009C310000FF00FF00FF00FF009C31
          0000CE630000CE6300009C310000E7E7E700CE6300009C310000E7E7E700E7E7
          E700E7E7E7009C310000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE630000CE6300009C310000E7E7E700CE6300009C310000E7E7E700E7E7
          E700E7E7E7009C310000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE630000CE6300009C310000E7E7E700CE6300009C310000E7E7E700E7E7
          E700E7E7E7009C310000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE630000CE6300009C310000E7E7E700E7E7E700E7E7E700E7E7E700E7E7
          E700E7E7E7009C310000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE630000CE630000CE6300009C3100009C3100009C3100009C3100009C31
          00009C310000CE630000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE630000CE630000CE630000CE630000CE630000CE630000CE630000CE63
          0000CE630000CE630000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE630000CE6300009C3100009C3100009C3100009C3100009C3100009C31
          00009C3100009C310000CE630000CE6300009C310000FF00FF00FF00FF009C31
          0000CE6300009C310000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF009C310000CE6300009C310000FF00FF00FF00FF009C31
          0000CE6300009C310000FFFFFF009C3100009C3100009C3100009C3100009C31
          00009C310000FFFFFF009C310000CE6300009C310000FF00FF00FF00FF009C31
          0000CE6300009C310000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF009C310000CE6300009C310000FF00FF00FF00FF009C31
          0000E7E7E7009C310000FFFFFF009C3100009C3100009C3100009C3100009C31
          00009C310000FFFFFF009C3100009C3100009C310000FF00FF00FF00FF009C31
          0000CE6300009C310000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF009C310000CE6300009C310000FF00FF00FF00FF009C31
          00009C3100009C3100009C3100009C3100009C3100009C3100009C3100009C31
          00009C3100009C3100009C3100009C3100009C310000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
      object BtnCancel: TcxButton
        Left = 422
        Top = 8
        Width = 75
        Height = 25
        Action = actundo
        TabOrder = 1
        Visible = False
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00CE9C63009C310000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF009C3100009C3100009C3100009C3100009C310000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF009C310000CE9C6300FF00FF00FF00FF00FF00FF00FF00
          FF009C3100009C3100009C3100009C310000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF009C310000FF00FF00FF00FF00FF00FF00FF00
          FF009C3100009C3100009C310000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF009C310000FF00FF00FF00FF00FF00FF00FF00
          FF009C3100009C310000FF00FF009C310000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF009C310000FF00FF00FF00FF00FF00FF00FF00
          FF009C310000FF00FF00FF00FF00FF00FF009C3100009C310000FF00FF00FF00
          FF00FF00FF00FF00FF009C310000CE9C6300FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009C3100009C31
          00009C3100009C310000CE9C6300FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 568
    Top = 40
  end
  inherited actlst1: TActionList
    Left = 536
    Top = 40
  end
  inherited imList: TImageList
    Left = 600
    Top = 41
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 704
    Top = 40
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Visible = False
    end
    inherited BTFind: TdxBarLargeButton
      Visible = ivNever
    end
    inherited BTRefresh: TdxBarLargeButton
      Visible = ivNever
    end
    inherited BTCheck: TdxBarLargeButton
      Visible = ivNever
    end
    inherited BTuncheck: TdxBarLargeButton
      Visible = ivNever
    end
  end
  inherited cxLookAndFeelController1: TcxLookAndFeelController
    Left = 648
    Top = 40
  end
  object DSQuery: TDataSource
    DataSet = DataBaseModule.AdoQuery
    Left = 760
    Top = 40
  end
  object DSUser: TDataSource
    DataSet = DataBaseModule.AdoUser
    Left = 809
    Top = 39
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
    Left = 857
    Top = 7
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 169
    Top = 143
    object N1: TMenuItem
      Caption = #26032#22686#37096#38376
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #32534#36753#37096#38376
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21024#38500#37096#38376
      OnClick = N3Click
    end
  end
  object QueryUser: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      'Select * From Users_')
    TableName = 'Users_'
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
    Left = 913
    Top = 7
  end
  object dlgSave1: TSaveDialog
    Filter = '*.xls|*.xls'
    Left = 545
    Top = 183
  end
  object DeleteQuery: TbainaADOQuery
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
    Left = 281
    Top = 91
  end
  object PopupMenu2: TPopupMenu
    Left = 265
    Top = 203
    object N4: TMenuItem
      Action = actAdd
      Caption = #26032#22686#29992#25143
    end
    object N5: TMenuItem
      Action = actModify
      Caption = #20462#25913#29992#25143
    end
    object N6: TMenuItem
      Action = actDel
      Caption = #21024#38500#29992#25143
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = actExport
      Caption = #23548#20986#36164#26009
    end
  end
  object bndqry1: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforePost = bndqry1BeforePost
    Parameters = <
      item
        Name = 'UserID'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select * from UserTel'
      'where UserID = :UserID')
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
    Left = 266
    Top = 469
  end
  object ds1: TDataSource
    DataSet = bndqry1
    Left = 298
    Top = 469
  end
  object pm1: TPopupMenu
    Left = 346
    Top = 461
    object N9: TMenuItem
      Caption = #26032#22686
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #32534#36753
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #21024#38500
      OnClick = N11Click
    end
  end
  object LAdoHideSelect: TbainaADOQuery
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
    Left = 521
    Top = 112
  end
end
