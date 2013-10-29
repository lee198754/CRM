inherited Frm_SalePre: TFrm_SalePre
  Left = 292
  Top = 221
  Width = 568
  Height = 418
  Caption = #38144#21806#39044#27979
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnSure: TcxButton [0]
    Left = 304
    Top = 328
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [1]
    Left = 432
    Top = 328
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = BtnExitClick
  end
  object cxLabel1: TcxLabel [2]
    Left = 48
    Top = 40
    Caption = #20135#21697#21517#31216#65306
  end
  object cxLabel2: TcxLabel [3]
    Left = 48
    Top = 80
    Caption = #20135#21697#21333#20215#65306
  end
  object cxLabel3: TcxLabel [4]
    Left = 320
    Top = 80
    Caption = #39044#27979#25968#37327#65306
  end
  object cxLabel4: TcxLabel [5]
    Left = 48
    Top = 120
    Caption = #39044#27979#37329#39069#65306
  end
  object cxLabel5: TcxLabel [6]
    Left = 48
    Top = 160
    Caption = #39044#27979#26085#26399#65306
  end
  object cxLabel6: TcxLabel [7]
    Left = 320
    Top = 160
    Caption = #23436#25104#26085#26399#65306
  end
  object cxLabel7: TcxLabel [8]
    Left = 320
    Top = 120
    Caption = #21487#33021#24615#65306
  end
  object cxLabel8: TcxLabel [9]
    Left = 56
    Top = 200
    Caption = #22791#27880#65306
  end
  object EdtName: TcxButtonEdit [10]
    Left = 120
    Top = 40
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 14
    Text = 'EdtName'
    OnClick = EdtNameClick
    Width = 193
  end
  object EdtPrice: TcxTextEdit [11]
    Left = 120
    Top = 76
    Properties.OnChange = EdtPricePropertiesChange
    TabOrder = 15
    Text = 'EdtPrice'
    OnExit = EdtPriceExit
    Width = 105
  end
  object EdtPreCount: TcxTextEdit [12]
    Left = 392
    Top = 76
    Properties.OnChange = EdtPreCountPropertiesChange
    TabOrder = 16
    Text = 'EdtPreCount'
    OnExit = EdtPreCountExit
    Width = 121
  end
  object EdtMoney: TcxTextEdit [13]
    Left = 120
    Top = 116
    Enabled = False
    Properties.OnChange = EdtMoneyPropertiesChange
    TabOrder = 17
    Text = 'EdtMoney'
    Width = 105
  end
  object EdtPreDate: TcxDateEdit [14]
    Left = 120
    Top = 156
    TabOrder = 18
    Width = 121
  end
  object EdtFinishdate: TcxDateEdit [15]
    Left = 392
    Top = 156
    TabOrder = 19
    Width = 121
  end
  object EdtMemo: TcxMemo [16]
    Left = 120
    Top = 200
    Lines.Strings = (
      'EdtMemo')
    TabOrder = 20
    Height = 89
    Width = 393
  end
  object cxLabel9: TcxLabel [17]
    Left = 224
    Top = 80
    Caption = #20803
  end
  object cxLabel10: TcxLabel [18]
    Left = 224
    Top = 120
    Caption = #20803
  end
  object cxLabel11: TcxLabel [19]
    Left = 504
    Top = 120
    Caption = '%'
  end
  object EdtPossible: TcxComboBox [20]
    Left = 392
    Top = 116
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '0'
      '10'
      '20'
      '30'
      '40'
      '50'
      '60'
      '70'
      '80'
      '90'
      '100')
    TabOrder = 24
    Width = 113
  end
  inherited xpmn1: TXPMenu
    Left = 64
    Top = 304
  end
  inherited actlst1: TActionList
    Left = 96
    Top = 304
  end
  inherited imList: TImageList
    Left = 160
    Top = 305
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 192
    Top = 304
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
    Left = 128
    Top = 304
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
    Left = 272
    Top = 80
  end
  object LDSProd: TDataSource
    DataSet = LAdoProd
    Left = 272
    Top = 112
  end
end
