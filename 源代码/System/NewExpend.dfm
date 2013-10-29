inherited Frm_NewExpend: TFrm_NewExpend
  Left = 470
  Top = 141
  Width = 515
  Height = 344
  Caption = #26032#22686#36153#29992
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel [0]
    Left = 40
    Top = 32
    Caption = #23458#25143#21517#31216#65306
  end
  object cxLabel2: TcxLabel [1]
    Left = 40
    Top = 72
    Caption = #36153#29992#31867#22411#65306
  end
  object cxLabel3: TcxLabel [2]
    Left = 40
    Top = 112
    Caption = #36153#29992#37329#39069#65306
  end
  object cxLabel4: TcxLabel [3]
    Left = 280
    Top = 112
    Caption = #21457#29983#26085#26399#65306
  end
  object cxLabel5: TcxLabel [4]
    Left = 40
    Top = 144
    Caption = #22791#27880#65306
  end
  object EdtName: TcxButtonEdit [5]
    Left = 112
    Top = 28
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = False
    TabOrder = 9
    OnClick = EdtNameClick
    Width = 353
  end
  object EdtType: TcxButtonEdit [6]
    Left = 112
    Top = 68
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 10
    OnClick = EdtTypeClick
    Width = 121
  end
  object EdtMoney: TcxTextEdit [7]
    Left = 112
    Top = 108
    Properties.OnChange = EdtMoneyPropertiesChange
    TabOrder = 11
    Text = '0'
    Width = 121
  end
  object EdtDate: TcxDateEdit [8]
    Left = 344
    Top = 108
    TabOrder = 12
    Width = 121
  end
  object EdtMemo: TcxMemo [9]
    Left = 112
    Top = 144
    TabOrder = 13
    Height = 105
    Width = 353
  end
  object cxLabel6: TcxLabel [10]
    Left = 264
    Top = 72
    Caption = #36153#29992#21457#29983#20154#65306
  end
  object EdtMan: TcxButtonEdit [11]
    Left = 344
    Top = 68
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 15
    OnClick = EdtManClick
    Width = 121
  end
  object BtnSure: TcxButton [12]
    Left = 272
    Top = 272
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 16
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [13]
    Left = 384
    Top = 272
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 17
    OnClick = BtnExitClick
  end
  inherited xpmn1: TXPMenu
    Left = 56
    Top = 264
  end
  inherited actlst1: TActionList
    Left = 88
    Top = 264
  end
  inherited imList: TImageList
    Left = 152
    Top = 265
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 184
    Top = 264
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
    Left = 120
    Top = 264
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
    Left = 40
    Top = 160
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
    Left = 472
    Top = 72
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
    Left = 472
    Top = 32
  end
  object LDSCust: TDataSource
    DataSet = LAdoCust
    Left = 472
    Top = 8
  end
  object LDSUser: TDataSource
    DataSet = LAdoUser
    Left = 472
    Top = 112
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
    Left = 232
    Top = 264
  end
end
