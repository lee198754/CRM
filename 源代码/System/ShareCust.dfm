inherited Frm_ShareCust: TFrm_ShareCust
  Left = 342
  Top = 104
  Width = 454
  Height = 500
  Caption = #20849#20139#23458#25143
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 21
    Width = 36
    Height = 13
    Caption = #37096#38376#65306
  end
  object Label2: TLabel [1]
    Left = 217
    Top = 248
    Width = 24
    Height = 13
    Caption = #22791#27880
  end
  object User: TcxGrid [2]
    Left = 8
    Top = 40
    Width = 185
    Height = 361
    TabOrder = 4
    object UserDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = LDSUser
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object UserDBTableView1Column1: TcxGridDBColumn
        Caption = #21487#36873#29992#25143
        DataBinding.FieldName = 'UserName_'
      end
    end
    object UserLevel1: TcxGridLevel
      GridView = UserDBTableView1
    end
  end
  object ShareUser: TcxGrid [3]
    Left = 248
    Top = 40
    Width = 178
    Height = 193
    TabOrder = 5
    object ShareUserDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = LDSUserTemp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      object ShareUserDBTableView1Column1: TcxGridDBColumn
        Caption = #20849#20139#29992#25143
        DataBinding.FieldName = 'UserName'
      end
    end
    object ShareUserLevel1: TcxGridLevel
      GridView = ShareUserDBTableView1
    end
  end
  object BtnSure: TBitBtn [4]
    Left = 80
    Top = 416
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = BtnSureClick
  end
  object BtnExit: TBitBtn [5]
    Left = 304
    Top = 416
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = BtnExitClick
  end
  object CBXDeptName: TcxLookupComboBox [6]
    Left = 48
    Top = 16
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'DeptID_'
    Properties.ListColumns = <
      item
        Caption = #37096#38376#21517#31216
        Fixed = True
        FieldName = 'DeptName_'
      end>
    Properties.ListSource = LDSDept
    Properties.OnChange = cxLookupComboBox1PropertiesChange
    TabOrder = 8
    Width = 145
  end
  object BitBtn3: TBitBtn [7]
    Left = 200
    Top = 88
    Width = 41
    Height = 25
    Caption = '>'
    TabOrder = 9
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn [8]
    Left = 200
    Top = 152
    Width = 41
    Height = 25
    Caption = '<'
    TabOrder = 10
    OnClick = BitBtn4Click
  end
  object Memo1: TMemo [9]
    Left = 248
    Top = 248
    Width = 177
    Height = 153
    ScrollBars = ssVertical
    TabOrder = 11
  end
  inherited xpmn1: TXPMenu
    Left = 280
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 208
    Top = 40
  end
  inherited imList: TImageList
    Left = 376
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 408
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
    Left = 312
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 344
    Top = 8
  end
  object DSShareCust: TDataSource
    DataSet = DataBaseModule.AdoShareCust
    Left = 392
    Top = 384
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
    Left = 72
    Top = 88
  end
  object LDSUser: TDataSource
    DataSet = LAdoUser
    Left = 72
    Top = 128
  end
  object LAdoDept: TbainaADOQuery
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
    Left = 208
    Top = 8
  end
  object LDSDept: TDataSource
    DataSet = LAdoDept
    Left = 240
    Top = 8
  end
  object LUserTemp: TbainaADOQuery
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
    Left = 312
    Top = 160
  end
  object LDSUserTemp: TDataSource
    DataSet = LUserTemp
    Left = 312
    Top = 200
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
    Left = 208
    Top = 296
  end
end
