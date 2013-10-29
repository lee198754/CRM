object TelManagerFrm: TTelManagerFrm
  Left = 394
  Top = 208
  Width = 254
  Height = 153
  Caption = #30005#35805#21495#30721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 217
    Height = 21
    TabOrder = 1
  end
  object BitBtn3: TBitBtn
    Left = 160
    Top = 72
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 8
    Caption = #30005#35805#21495#30721
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
    Left = 96
    Top = 56
  end
end
