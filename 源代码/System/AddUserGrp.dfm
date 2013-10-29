inherited Frm_UserGrpAdd: TFrm_UserGrpAdd
  Left = 658
  Top = 164
  Width = 313
  Height = 225
  Caption = #29992#25143#32452
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxTextEdit1: TcxTextEdit [0]
    Left = 128
    Top = 24
    TabOrder = 0
    Width = 121
  end
  object cxTextEdit2: TcxTextEdit [1]
    Left = 128
    Top = 64
    TabOrder = 1
    Width = 121
  end
  object cxLabel1: TcxLabel [2]
    Left = 40
    Top = 28
    Caption = #29992#25143#32452#32534#21495#65306
  end
  object cxLabel2: TcxLabel [3]
    Left = 40
    Top = 68
    Caption = #29992#25143#32452#21517#31216#65306
  end
  object BitBtn1: TBitBtn [4]
    Left = 48
    Top = 144
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn [5]
    Left = 176
    Top = 144
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object cxCheckBox1: TCheckBox [6]
    Left = 128
    Top = 104
    Width = 97
    Height = 17
    Caption = #26159#21542#21551#29992#32452
    TabOrder = 6
  end
  object UserGrpM: TbainaADOQuery
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
    Top = 96
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
    Left = 80
    Top = 96
  end
end
