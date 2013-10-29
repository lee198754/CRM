inherited Frm_Receive: TFrm_Receive
  Left = 533
  Top = 38
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #23458#25143#39044#25910#27454#35774#32622
  ClientHeight = 225
  ClientWidth = 292
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtArrearage: TcxTextEdit [0]
    Left = 120
    Top = 72
    Properties.ReadOnly = True
    Properties.OnChange = EdtArrearagePropertiesChange
    Style.Color = clBtnFace
    TabOrder = 4
    Text = '0'
    Width = 105
  end
  object cxLabel1: TcxLabel [1]
    Left = 48
    Top = 72
    Caption = #26399#21021#27424#27454#65306
  end
  object EdtCust: TcxButtonEdit [2]
    Left = 120
    Top = 40
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    Properties.ReadOnly = True
    TabOrder = 6
    OnClick = EdtCustClick
    Width = 121
  end
  object cxLabel2: TcxLabel [3]
    Left = 48
    Top = 40
    Caption = #36873#25321#23458#25143#65306
  end
  object BtnSure: TcxButton [4]
    Left = 56
    Top = 184
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 8
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [5]
    Left = 168
    Top = 184
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 9
    OnClick = BtnExitClick
  end
  object cxLabel3: TcxLabel [6]
    Left = 224
    Top = 74
    Caption = #20803
  end
  object EdtReceive: TcxTextEdit [7]
    Left = 120
    Top = 136
    Properties.OnChange = EdtArrearagePropertiesChange
    TabOrder = 11
    Text = '0'
    Width = 105
  end
  object cxLabel4: TcxLabel [8]
    Left = 48
    Top = 136
    Caption = #26412#27425#25910#27454#65306
  end
  object cxLabel5: TcxLabel [9]
    Left = 224
    Top = 106
    Caption = #20803
  end
  object EdtCash: TcxTextEdit [10]
    Left = 120
    Top = 104
    Properties.ReadOnly = True
    Properties.OnChange = EdtArrearagePropertiesChange
    Style.Color = clBtnFace
    TabOrder = 14
    Text = '0'
    Width = 105
  end
  object cxLabel6: TcxLabel [11]
    Left = 60
    Top = 104
    Caption = #39044#30041#27454#65306
  end
  object cxLabel7: TcxLabel [12]
    Left = 224
    Top = 138
    Caption = #20803
  end
  inherited xpmn1: TXPMenu
    Left = 80
    Top = 0
  end
  inherited actlst1: TActionList
    Left = 48
    Top = 0
  end
  inherited imList: TImageList
    Left = 144
    Top = 1
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 208
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
    Left = 112
    Top = 0
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 176
    Top = 0
  end
  object LAdoArrearage: TbainaADOQuery
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
    Top = 128
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
    Left = 16
    Top = 88
  end
  object LDSCust: TDataSource
    DataSet = LAdoCust
    Left = 16
    Top = 56
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
    Left = 256
    Top = 128
  end
end
