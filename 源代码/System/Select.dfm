inherited Frm_Select: TFrm_Select
  Left = 489
  Top = 434
  Width = 408
  Height = 254
  Caption = #20154#21592#23433#25490
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtMain: TcxButtonEdit [0]
    Left = 128
    Top = 104
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 4
    OnClick = EdtMainClick
    Width = 193
  end
  object cxLabel1: TcxLabel [1]
    Left = 40
    Top = 108
    Caption = #32500#25252#20154#21592#65306
  end
  object BtnSure: TcxButton [2]
    Left = 128
    Top = 184
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [3]
    Left = 248
    Top = 184
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = BtnExitClick
  end
  object EdtCust: TcxTextEdit [4]
    Left = 128
    Top = 48
    Enabled = False
    TabOrder = 8
    Width = 193
  end
  object cxLabel2: TcxLabel [5]
    Left = 40
    Top = 52
    Caption = #23458#25143#65306
  end
  object CBIFMain: TCheckBox [6]
    Left = 128
    Top = 144
    Width = 121
    Height = 17
    Caption = #26159#21542#20027#32500#25252#20154#21592
    TabOrder = 10
  end
  inherited xpmn1: TXPMenu
    Left = 8
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 40
    Top = 8
  end
  inherited imList: TImageList
    Left = 104
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 136
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
    Left = 72
    Top = 8
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
    Left = 208
    Top = 8
  end
  object LDSUser: TDataSource
    DataSet = LAdoUser
    Left = 248
    Top = 8
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
    Left = 360
    Top = 72
  end
end
