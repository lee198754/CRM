inherited Frm_Cash: TFrm_Cash
  Left = 360
  Top = 153
  Width = 644
  Height = 378
  Caption = #27424#27454#20914#38144
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtCust: TcxTextEdit [0]
    Left = 152
    Top = 48
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 4
    Text = 'EdtCust'
    Width = 369
  end
  object EdtSaleMoney: TcxTextEdit [1]
    Left = 152
    Top = 88
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 5
    Text = '0'
    Width = 121
  end
  object EdtFactMoney: TcxTextEdit [2]
    Left = 400
    Top = 88
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 6
    Text = '0'
    Width = 121
  end
  object EdtCash: TcxTextEdit [3]
    Left = 400
    Top = 128
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    TabOrder = 7
    Text = '0'
    Width = 121
  end
  object EdtCancelMoney: TcxTextEdit [4]
    Left = 152
    Top = 128
    Properties.OnChange = EdtCancelMoneyPropertiesChange
    TabOrder = 8
    Text = '0'
    Width = 121
  end
  object cxLabel1: TcxLabel [5]
    Left = 72
    Top = 52
    Caption = #23458#25143#21517#31216#65306
  end
  object cxLabel2: TcxLabel [6]
    Left = 72
    Top = 92
    Caption = #24212#25910#37329#39069#65306
  end
  object cxLabel3: TcxLabel [7]
    Left = 336
    Top = 92
    Caption = #24050#25910#37329#39069
  end
  object cxLabel4: TcxLabel [8]
    Left = 336
    Top = 132
    Caption = #21487#20914#37329#39069
  end
  object cxLabel5: TcxLabel [9]
    Left = 72
    Top = 132
    Caption = #21463#35753#37329#39069#65306
  end
  object cxLabel6: TcxLabel [10]
    Left = 280
    Top = 92
    Caption = #20803
  end
  object cxLabel7: TcxLabel [11]
    Left = 528
    Top = 92
    Caption = #20803
  end
  object cxLabel8: TcxLabel [12]
    Left = 528
    Top = 132
    Caption = #20803
  end
  object cxLabel9: TcxLabel [13]
    Left = 280
    Top = 132
    Caption = #20803
  end
  object cxMemo1: TcxMemo [14]
    Left = 152
    Top = 208
    Lines.Strings = (
      '')
    TabOrder = 18
    Height = 89
    Width = 369
  end
  object cxLabel10: TcxLabel [15]
    Left = 96
    Top = 208
    Caption = #22791#27880#65306
  end
  object BtnSure: TcxButton [16]
    Left = 152
    Top = 312
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 20
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [17]
    Left = 448
    Top = 312
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 21
    OnClick = BtnExitClick
  end
  object cxLabel11: TcxLabel [18]
    Left = 336
    Top = 172
    Caption = #26412#27425#20914#27454
  end
  object FactCash: TcxTextEdit [19]
    Left = 400
    Top = 168
    Properties.ReadOnly = False
    Properties.OnChange = FactCashPropertiesChange
    Style.Color = clWhite
    TabOrder = 23
    Text = '0'
    Width = 121
  end
  inherited xpmn1: TXPMenu
    Left = 272
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 240
    Top = 8
  end
  inherited imList: TImageList
    Left = 336
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 368
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
    Left = 304
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 400
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
    Left = 560
    Top = 56
  end
end
