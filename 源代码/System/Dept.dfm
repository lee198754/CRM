inherited Frm_Dept: TFrm_Dept
  Left = 433
  Top = 379
  Width = 254
  Height = 153
  Caption = #37096#38376#36164#26009
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn [0]
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit [1]
    Left = 16
    Top = 32
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object BitBtn3: TBitBtn [2]
    Left = 160
    Top = 72
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object cxLabel1: TcxLabel [3]
    Left = 16
    Top = 8
    Caption = #37096#38376#21517#31216
  end
  object Query: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <>
    SQL.Strings = (
      '')
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
    Left = 144
    Top = 72
  end
end
