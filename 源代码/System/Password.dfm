inherited Frm_Password: TFrm_Password
  Left = 497
  Top = 135
  Width = 367
  Height = 283
  Caption = #23494#30721#20462#25913
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ComboDept: TcxComboBox [0]
    Left = 160
    Top = 24
    OnFocusChanged = ComboDeptFocusChanged
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 0
    Width = 121
  end
  object ComboUser: TcxComboBox [1]
    Left = 160
    Top = 56
    Properties.DropDownListStyle = lsFixedList
    TabOrder = 1
    Width = 121
  end
  object cxLabel1: TcxLabel [2]
    Left = 80
    Top = 28
    Caption = #37096#38376#65306
  end
  object cxLabel2: TcxLabel [3]
    Left = 68
    Top = 60
    Caption = #29992#25143#21517#65306
  end
  object cxLabel3: TcxLabel [4]
    Left = 68
    Top = 92
    Caption = #21407#23494#30721#65306
  end
  object cxLabel4: TcxLabel [5]
    Left = 68
    Top = 124
    Caption = #26032#23494#30721#65306
  end
  object BitBtn1: TBitBtn [6]
    Left = 72
    Top = 200
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn [7]
    Left = 208
    Top = 200
    Width = 75
    Height = 25
    Caption = #24674#22797#40664#35748
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object cxLabel5: TcxLabel [8]
    Left = 44
    Top = 156
    Caption = #30830#35748#26032#23494#30721#65306
  end
  object EdtUser: TcxTextEdit [9]
    Left = 160
    Top = 56
    TabOrder = 9
    Text = 'EdtUser'
    Width = 121
  end
  object OldPassword: TEdit [10]
    Left = 160
    Top = 88
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 10
  end
  object FNewPassword: TEdit [11]
    Left = 160
    Top = 120
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 11
  end
  object SNewPassword: TEdit [12]
    Left = 160
    Top = 152
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 12
  end
  object QueryDept: TbainaADOQuery
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
    Left = 16
    Top = 8
  end
  object QueryUser: TbainaADOQuery
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
    Left = 16
    Top = 48
  end
end
