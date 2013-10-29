inherited Frm_Pre: TFrm_Pre
  Left = 412
  Top = 68
  Width = 620
  Caption = #39044#32422#24405#20837
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel [0]
    Left = 40
    Top = 48
    Caption = #23458#25143#21517#31216#65306
  end
  object cxLabel2: TcxLabel [1]
    Left = 40
    Top = 16
    Caption = #32500#25252#21333#21495#65306
  end
  object cxLabel3: TcxLabel [2]
    Left = 40
    Top = 80
    Caption = #26381#21153#36153#29992#65306
  end
  object cxLabel4: TcxLabel [3]
    Left = 384
    Top = 48
    Caption = #32852#31995#20154#65306
  end
  object cxLabel5: TcxLabel [4]
    Left = 16
    Top = 112
    Caption = #39044#32422#32500#25252#26085#26399#65306
  end
  object cxLabel6: TcxLabel [5]
    Left = 348
    Top = 112
    Caption = #39044#32422#23436#25104#26085#26399#65306
  end
  object cxLabel7: TcxLabel [6]
    Left = 16
    Top = 144
    Caption = #23454#38469#23436#25104#26085#26399#65306
  end
  object cxLabel9: TcxLabel [7]
    Left = 40
    Top = 285
    Caption = #38382#39064#25551#36848#65306
  end
  object EdtCust: TcxButtonEdit [8]
    Left = 112
    Top = 44
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Style.ButtonStyle = btsDefault
    TabOrder = 12
    Text = 'EdtCust'
    OnClick = EdtCustClick
    Width = 169
  end
  object EdtNum: TcxTextEdit [9]
    Left = 112
    Top = 12
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 13
    Text = 'EdtNum'
    Width = 121
  end
  object EdtMoney: TcxTextEdit [10]
    Left = 112
    Top = 76
    TabOrder = 14
    Text = '0'
    Width = 121
  end
  object EdtBDate: TcxDateEdit [11]
    Left = 112
    Top = 108
    TabOrder = 15
    Width = 121
  end
  object EdtFDate: TcxDateEdit [12]
    Left = 448
    Top = 108
    TabOrder = 16
    Width = 121
  end
  object EdtFFDate: TcxDateEdit [13]
    Left = 112
    Top = 140
    TabOrder = 17
    Width = 121
  end
  object EdtMemo: TcxMemo [14]
    Left = 112
    Top = 285
    Lines.Strings = (
      'EdtMemo')
    TabOrder = 18
    Height = 105
    Width = 457
  end
  object BtnSure: TcxButton [15]
    Left = 376
    Top = 408
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 19
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [16]
    Left = 496
    Top = 408
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 20
    OnClick = BtnExitClick
  end
  object EdtMan: TcxTextEdit [17]
    Left = 448
    Top = 44
    TabOrder = 21
    Text = 'EdtMan'
    Width = 121
  end
  object cxLabel8: TcxLabel [18]
    Left = 232
    Top = 80
    Caption = #20803
  end
  object EdtIFFinish: TCheckBox [19]
    Left = 448
    Top = 144
    Width = 97
    Height = 17
    Caption = #26159#21542#23436#25104
    Enabled = False
    TabOrder = 23
  end
  object cxLabel10: TcxLabel [20]
    Left = 372
    Top = 80
    Caption = #32852#31995#26041#24335#65306
  end
  object EdtMode: TcxButtonEdit [21]
    Left = 448
    Top = 76
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    Style.ButtonStyle = btsDefault
    TabOrder = 25
    Text = 'EdtMode'
    OnClick = EdtModeClick
    Width = 121
  end
  object cxLabel11: TcxLabel [22]
    Left = 40
    Top = 173
    Caption = #20132#36890#32447#36335#65306
  end
  object Trafic: TcxMemo [23]
    Left = 112
    Top = 173
    Lines.Strings = (
      'Trafic')
    TabOrder = 27
    Height = 68
    Width = 457
  end
  object cxLabel12: TcxLabel [24]
    Left = 40
    Top = 253
    Caption = #23458#25143#22320#22336#65306
  end
  object EdtAdd: TcxTextEdit [25]
    Left = 112
    Top = 252
    TabOrder = 29
    Text = 'EdtAdd'
    Width = 457
  end
  inherited xpmn1: TXPMenu
    Left = 408
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 440
    Top = 8
  end
  inherited imList: TImageList
    Left = 504
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 536
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
    Left = 472
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 376
    Top = 8
  end
  object LAdoService: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      'Select * From Service')
    TableName = 'Service'
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
    Left = 312
    Top = 301
  end
  object LAdoCust: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      'Select * From ')
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
    Left = 288
    Top = 8
  end
  object LDSCust: TDataSource
    DataSet = LAdoCust
    Left = 320
    Top = 8
  end
  object LDSService: TDataSource
    DataSet = LAdoService
    Left = 352
    Top = 301
  end
end
