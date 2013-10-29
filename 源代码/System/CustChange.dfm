inherited Frm_Move: TFrm_Move
  Left = 168
  Top = 8
  Width = 732
  Height = 563
  BorderIcons = [biSystemMenu]
  Caption = #23458#25143#36164#26009#36716#31227
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 714
    Height = 526
    Align = alClient
    TabOrder = 4
    ClientRectBottom = 525
    ClientRectLeft = 1
    ClientRectRight = 713
    ClientRectTop = 1
  end
  object EdtUserO: TcxButtonEdit [1]
    Left = 72
    Top = 8
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 5
    OnClick = EdtUserOClick
    Width = 225
  end
  object cxGrid1: TcxGrid [2]
    Left = 8
    Top = 32
    Width = 289
    Height = 481
    TabOrder = 6
    LookAndFeel.NativeStyle = False
    object GrdCustO: TcxGridDBTableView
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
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdCustO
    end
  end
  object cxLabel1: TcxLabel [3]
    Left = 16
    Top = 8
    Caption = #21407#29992#25143#65306
    Transparent = True
  end
  object EdtUserN: TcxButtonEdit [4]
    Left = 464
    Top = 8
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 8
    OnClick = EdtUserNClick
    Width = 233
  end
  object cxLabel2: TcxLabel [5]
    Left = 408
    Top = 8
    Caption = #26032#29992#25143#65306
    Transparent = True
  end
  object cxGrid2: TcxGrid [6]
    Left = 400
    Top = 32
    Width = 297
    Height = 481
    TabOrder = 10
    LookAndFeel.NativeStyle = False
    object GrdCustN: TcxGridDBTableView
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
      GridView = GrdCustN
    end
  end
  object cxButton6: TcxButton [7]
    Left = 312
    Top = 392
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 11
    OnClick = cxButton6Click
  end
  object cxButton5: TcxButton [8]
    Left = 312
    Top = 352
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 12
    OnClick = cxButton5Click
  end
  object cxButton4: TcxButton [9]
    Left = 312
    Top = 256
    Width = 75
    Height = 25
    Caption = '<<'
    TabOrder = 13
    OnClick = cxButton4Click
  end
  object cxButton3: TcxButton [10]
    Left = 312
    Top = 208
    Width = 75
    Height = 25
    Caption = '<'
    TabOrder = 14
    OnClick = cxButton3Click
  end
  object cxButton2: TcxButton [11]
    Left = 312
    Top = 160
    Width = 75
    Height = 25
    Caption = '>>'
    TabOrder = 15
    OnClick = cxButton2Click
  end
  object cxButton1: TcxButton [12]
    Left = 312
    Top = 112
    Width = 75
    Height = 25
    Caption = '>'
    TabOrder = 16
    OnClick = cxButton1Click
  end
  inherited xpmn1: TXPMenu
    Left = 360
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 392
    Top = 8
  end
  inherited imList: TImageList
    Left = 392
    Top = 41
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 328
    Top = 40
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
    Left = 328
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 360
    Top = 40
  end
  object LAdoCustO: TbainaADOQuery
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
    Left = 112
    Top = 184
  end
  object LAdoCustN: TbainaADOQuery
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
    Left = 536
    Top = 176
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
    Left = 96
    Top = 16
  end
  object LDSCustO: TDataSource
    DataSet = LAdoCustO
    Left = 112
    Top = 224
  end
  object LDSCustN: TDataSource
    DataSet = LAdoCustN
    Left = 536
    Top = 216
  end
  object LDSUser: TDataSource
    DataSet = LAdoUser
    Left = 136
    Top = 16
  end
  object LAdoCust: TbainaADOQuery
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
    Left = 376
    Top = 304
  end
  object LAdoUpdate: TbainaADOQuery
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
    Left = 344
    Top = 304
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
    Left = 368
    Top = 456
  end
  object AddType: TbainaADOQuery
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
    Left = 424
    Top = 424
  end
end
