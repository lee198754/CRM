inherited Frm_Default: TFrm_Default
  Left = 468
  Top = 154
  Width = 516
  Height = 309
  Caption = #40664#35748#39033#35774#32622
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel [0]
    Left = 16
    Top = 48
    Caption = #22269#23478#65306
  end
  object cxLabel2: TcxLabel [1]
    Left = 168
    Top = 48
    Caption = #30465#20221#65306
  end
  object cxLabel3: TcxLabel [2]
    Left = 344
    Top = 48
    Caption = #22478#24066#65306
  end
  object cxLabel4: TcxLabel [3]
    Left = 16
    Top = 104
    Caption = #31561#32423#65306
  end
  object cxLabel5: TcxLabel [4]
    Left = 168
    Top = 104
    Caption = #26469#28304#65306
  end
  object cxLabel6: TcxLabel [5]
    Left = 344
    Top = 104
    Caption = #34892#19994#65306
  end
  object cxLabel7: TcxLabel [6]
    Left = 16
    Top = 160
    Caption = #31867#22411#65306
  end
  object cxLabel8: TcxLabel [7]
    Left = 168
    Top = 160
    Caption = #29366#24577#65306
  end
  object cxLabel9: TcxLabel [8]
    Left = 320
    Top = 160
    Caption = #20449#29992#31561#32423#65306
  end
  object BtnSure: TcxButton [9]
    Left = 216
    Top = 216
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 13
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [10]
    Left = 384
    Top = 216
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 14
    OnClick = BtnExitClick
  end
  object cxComboBox1: TcxComboBox [11]
    Left = 56
    Top = 44
    Properties.DropDownListStyle = lsFixedList
    Properties.ReadOnly = False
    TabOrder = 15
    Width = 97
  end
  object cxComboBox2: TcxComboBox [12]
    Left = 208
    Top = 44
    TabOrder = 16
    Width = 97
  end
  object cxComboBox3: TcxComboBox [13]
    Left = 384
    Top = 44
    TabOrder = 17
    Width = 97
  end
  object cxComboBox4: TcxComboBox [14]
    Left = 56
    Top = 100
    TabOrder = 18
    Width = 97
  end
  object cxComboBox5: TcxComboBox [15]
    Left = 208
    Top = 100
    TabOrder = 19
    Width = 97
  end
  object cxComboBox6: TcxComboBox [16]
    Left = 384
    Top = 100
    TabOrder = 20
    Width = 97
  end
  object cxComboBox7: TcxComboBox [17]
    Left = 56
    Top = 156
    TabOrder = 21
    Width = 97
  end
  object cxComboBox8: TcxComboBox [18]
    Left = 208
    Top = 156
    TabOrder = 22
    Width = 97
  end
  object cxComboBox9: TcxComboBox [19]
    Left = 384
    Top = 156
    TabOrder = 23
    Width = 97
  end
  inherited xpmn1: TXPMenu
    Left = 160
    Top = 0
  end
  inherited actlst1: TActionList
    Left = 120
    Top = 0
  end
  inherited imList: TImageList
    Left = 280
    Top = 1
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 320
    Top = 0
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
    Left = 200
    Top = 0
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 240
    Top = 0
  end
  object LAdoDict: TbainaADOQuery
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
    Left = 56
    Top = 200
  end
  object LDSDict: TDataSource
    DataSet = LAdoDict
    Left = 96
    Top = 200
  end
end
