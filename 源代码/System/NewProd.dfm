inherited Frm_NewCode: TFrm_NewCode
  Left = 313
  Top = 150
  Width = 637
  Height = 490
  Caption = #21830#21697#20195#30721
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel [0]
    Left = 16
    Top = 48
    Caption = #20135#21697#31867#22411#65306
  end
  object cxLabel2: TcxLabel [1]
    Left = 16
    Top = 16
    Caption = #20135#21697#32534#30721#65306
  end
  object cxLabel3: TcxLabel [2]
    Left = 264
    Top = 16
    Caption = #20135#21697#21517#31216#65306
  end
  object cxLabel4: TcxLabel [3]
    Left = 264
    Top = 48
    Caption = #20135#21697#35268#26684#65306
  end
  object cxLabel5: TcxLabel [4]
    Left = 16
    Top = 112
    Caption = #20135#21697#36827#20215#65306
  end
  object cxLabel6: TcxLabel [5]
    Left = 264
    Top = 112
    Caption = #20135#21697#21806#20215#65306
  end
  object cxLabel7: TcxLabel [6]
    Left = 16
    Top = 80
    Caption = #20135#21697#25968#37327#65306
  end
  object cxLabel8: TcxLabel [7]
    Left = 16
    Top = 144
    Caption = #20135#21697#25551#36848#65306
  end
  object EdtCode: TcxTextEdit [8]
    Left = 96
    Top = 12
    TabOrder = 12
    Width = 121
  end
  object EdtUnit: TcxButtonEdit [9]
    Left = 344
    Top = 76
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 13
    OnClick = EdtUnitClick
    Width = 121
  end
  object cxLabel9: TcxLabel [10]
    Left = 264
    Top = 80
    Caption = #20135#21697#21333#20301#65306
  end
  object EdtType: TcxTextEdit [11]
    Left = 96
    Top = 44
    TabOrder = 15
    Width = 121
  end
  object Edtcount: TcxTextEdit [12]
    Left = 96
    Top = 76
    Properties.OnChange = EdtcountPropertiesChange
    TabOrder = 16
    Width = 121
  end
  object EdtPrice: TcxTextEdit [13]
    Left = 96
    Top = 108
    Properties.OnChange = EdtPricePropertiesChange
    TabOrder = 17
    Width = 121
  end
  object EdtSalePrice: TcxTextEdit [14]
    Left = 344
    Top = 108
    Properties.OnChange = EdtSalePricePropertiesChange
    TabOrder = 18
    Width = 121
  end
  object EdtMemo: TcxMemo [15]
    Left = 96
    Top = 144
    Lines.Strings = (
      'EdtMemo')
    TabOrder = 19
    Height = 105
    Width = 473
  end
  object BtnSure: TcxButton [16]
    Left = 368
    Top = 416
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 20
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [17]
    Left = 488
    Top = 416
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 21
    OnClick = BtnExitClick
  end
  object EdtName: TcxButtonEdit [18]
    Left = 344
    Top = 8
    Properties.AutoSelect = False
    Properties.Buttons = <
      item
        Kind = bkEllipsis
      end>
    Properties.OnButtonClick = EdtNamePropertiesButtonClick
    TabOrder = 22
    Width = 225
  end
  object EdtSpec: TcxButtonEdit [19]
    Left = 344
    Top = 40
    Properties.Buttons = <
      item
        Kind = bkEllipsis
      end>
    TabOrder = 23
    OnClick = EdtSpecClick
    Width = 121
  end
  object Panel1: TPanel [20]
    Left = 96
    Top = 248
    Width = 473
    Height = 161
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 24
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 471
      Height = 159
      Align = alClient
      Center = True
      PopupMenu = PopupMenu1
      Proportional = True
    end
  end
  object cxLabel10: TcxLabel [21]
    Left = 16
    Top = 256
    Caption = #20135#21697#22270#29255#65306
  end
  inherited xpmn1: TXPMenu
    Left = 128
    Top = 416
  end
  inherited actlst1: TActionList
    Left = 0
    Top = 416
  end
  inherited imList: TImageList
    Left = 64
    Top = 417
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 96
    Top = 416
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
    Left = 32
    Top = 416
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 160
    Top = 416
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
    Left = 544
    Top = 40
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
    Left = 504
    Top = 72
  end
  object LDSProd: TDataSource
    DataSet = LAdoProd
    Left = 544
    Top = 72
  end
  object LAdoSpec: TbainaADOQuery
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
    Left = 504
    Top = 104
  end
  object LDSSpec: TDataSource
    DataSet = LAdoSpec
    Left = 544
    Top = 104
  end
  object PopupMenu1: TPopupMenu
    Left = 472
    Top = 272
    object N1: TMenuItem
      Caption = #23548#20837#22270#29255
      OnClick = N1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = '*.jpeg;*.jpg|*.jpeg;*.jpg'
    Left = 288
    Top = 280
  end
end
