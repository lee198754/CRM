inherited Frm_NewContract: TFrm_NewContract
  Left = 353
  Top = 136
  Height = 466
  Caption = #21512#21516#20449#24687
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtNum: TcxTextEdit [0]
    Left = 496
    Top = 40
    TabOrder = 4
    Text = 'EdtNum'
    Width = 121
  end
  object cxLabel1: TcxLabel [1]
    Left = 416
    Top = 44
    Caption = #21512#21516#32534#21495#65306
  end
  object EdtName: TcxTextEdit [2]
    Left = 144
    Top = 40
    TabOrder = 6
    Text = 'EdtName'
    Width = 201
  end
  object cxLabel2: TcxLabel [3]
    Left = 72
    Top = 44
    Caption = #21512#21516#21517#31216#65306
  end
  object EdtContent: TcxMemo [4]
    Left = 72
    Top = 240
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 8
    Height = 121
    Width = 553
  end
  object cxLabel3: TcxLabel [5]
    Left = 392
    Top = 80
    Caption = #31614#32422#26041#36127#36131#20154#65306
  end
  object cxLabel4: TcxLabel [6]
    Left = 428
    Top = 216
    Caption = #36127#36131#20154#65306
  end
  object cxLabel5: TcxLabel [7]
    Left = 416
    Top = 112
    Caption = #31614#35746#26085#26399#65306
  end
  object cxLabel6: TcxLabel [8]
    Left = 48
    Top = 176
    Caption = #21512#21516#29983#25928#26085#26399#65306
  end
  object cxLabel7: TcxLabel [9]
    Left = 392
    Top = 176
    Caption = #21512#21516#32467#26463#26085#26399#65306
  end
  object cxLabel8: TcxLabel [10]
    Left = 72
    Top = 112
    Caption = #21512#21516#37329#39069#65306
  end
  object cxLabel9: TcxLabel [11]
    Left = 416
    Top = 144
    Caption = #25191#34892#24773#20917#65306
  end
  object cxLabel10: TcxLabel [12]
    Left = 72
    Top = 216
    Caption = #21512#21516#20869#23481#65306
  end
  object cxLabel11: TcxLabel [13]
    Left = 84
    Top = 80
    Caption = #31614#32422#26041#65306
  end
  object cxLabel12: TcxLabel [14]
    Left = 72
    Top = 144
    Caption = #21512#21516#31867#22411#65306
  end
  object EdtMoney: TcxTextEdit [15]
    Left = 144
    Top = 108
    Properties.OnChange = EdtMoneyPropertiesChange
    TabOrder = 19
    Text = 'EdtMoney'
    Width = 105
  end
  object EdtType: TcxButtonEdit [16]
    Left = 144
    Top = 140
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 20
    Text = 'EdtType'
    OnClick = EdtTypeClick
    Width = 121
  end
  object EdtExecute: TcxButtonEdit [17]
    Left = 496
    Top = 140
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 21
    Text = 'EdtExecute'
    OnClick = EdtExecuteClick
    Width = 121
  end
  object EdtBeginDate: TcxDateEdit [18]
    Left = 144
    Top = 172
    TabOrder = 22
    Width = 121
  end
  object EdtDate: TcxDateEdit [19]
    Left = 496
    Top = 108
    TabOrder = 23
    Width = 121
  end
  object EdtEndDate: TcxDateEdit [20]
    Left = 496
    Top = 172
    TabOrder = 24
    Width = 121
  end
  object EdtCust: TcxButtonEdit [21]
    Left = 144
    Top = 76
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 25
    Text = 'EdtCust'
    OnClick = EdtCustClick
    Width = 201
  end
  object EdtContact: TcxButtonEdit [22]
    Left = 496
    Top = 76
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 26
    Text = 'EdtContact'
    OnClick = EdtContactClick
    Width = 121
  end
  object cxLabel13: TcxLabel [23]
    Left = 250
    Top = 112
    Caption = #20803
  end
  object BtnSave: TcxButton [24]
    Left = 392
    Top = 384
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 28
    OnClick = BtnSaveClick
  end
  object BtnExit: TcxButton [25]
    Left = 544
    Top = 384
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 29
    OnClick = BtnExitClick
  end
  object EdtMan: TcxButtonEdit [26]
    Left = 496
    Top = 212
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 30
    Text = 'EdtMan'
    OnClick = EdtManClick
    Width = 121
  end
  inherited xpmn1: TXPMenu
    Left = 8
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 8
    Top = 40
  end
  inherited imList: TImageList
    Left = 8
    Top = 105
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 8
    Top = 136
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
    Left = 8
    Top = 72
  end
  object DSCust: TDataSource
    DataSet = AdoCust
    Left = 352
    Top = 72
  end
  object DSContact: TDataSource
    DataSet = AdoContact
    Left = 624
    Top = 72
  end
  object DSContract: TDataSource
    DataSet = DataBaseModule.AdoContract
    Left = 352
    Top = 160
  end
  object AdoCust: TbainaADOQuery
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
    Left = 352
    Top = 40
  end
  object AdoContact: TbainaADOQuery
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
    Left = 624
    Top = 40
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
    Top = 160
  end
end
