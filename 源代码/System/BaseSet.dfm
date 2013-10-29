object Frm_BaseSet: TFrm_BaseSet
  Left = 286
  Top = 97
  Width = 526
  Height = 430
  Caption = #22522#30784#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 403
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = #23458#25143#31561#32423
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 24
      Top = 56
      Width = 75
      Height = 25
      Caption = #23458#25143#31867#22411
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 24
      Top = 96
      Width = 75
      Height = 25
      Caption = #23458#25143#29366#24577
      TabOrder = 2
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 24
      Top = 136
      Width = 75
      Height = 25
      Caption = #23458#25143#24615#36136
      TabOrder = 3
      OnClick = cxButton4Click
    end
    object cxButton5: TcxButton
      Left = 24
      Top = 176
      Width = 75
      Height = 25
      Caption = #23458#25143#34892#19994
      TabOrder = 4
      OnClick = cxButton5Click
    end
    object cxButton6: TcxButton
      Left = 24
      Top = 256
      Width = 75
      Height = 25
      Caption = #20449#29992#39069#24230
      TabOrder = 5
      OnClick = cxButton6Click
    end
    object cxButton7: TcxButton
      Left = 24
      Top = 352
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 6
      OnClick = cxButton7Click
    end
    object cxButton8: TcxButton
      Left = 24
      Top = 216
      Width = 75
      Height = 25
      Caption = #23458#25143#26469#28304
      TabOrder = 7
      OnClick = cxButton8Click
    end
    object cxButton9: TcxButton
      Left = 24
      Top = 296
      Width = 75
      Height = 25
      Caption = #21306#22495#20195#30721
      TabOrder = 8
      OnClick = cxButton9Click
    end
  end
  object Panel2: TPanel
    Left = 129
    Top = 0
    Width = 389
    Height = 403
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Panelarea: TPanel
      Left = 72
      Top = 96
      Width = 241
      Height = 201
      TabOrder = 0
      Visible = False
      object Label1: TLabel
        Left = 32
        Top = 32
        Width = 36
        Height = 13
        Caption = #22269#23478#65306
      end
      object Label2: TLabel
        Left = 32
        Top = 72
        Width = 36
        Height = 13
        Caption = #30465#20221#65306
      end
      object Label3: TLabel
        Left = 32
        Top = 116
        Width = 36
        Height = 13
        Caption = #22478#24066#65306
      end
      object Label4: TLabel
        Left = 32
        Top = 156
        Width = 36
        Height = 13
        Caption = #38215#21306#65306
      end
      object CustCountry: TcxButtonEdit
        Left = 68
        Top = 28
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 0
        OnClick = CustCountryClick
        Width = 141
      end
      object CustProv: TcxButtonEdit
        Left = 68
        Top = 68
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 1
        OnClick = CustProvClick
        Width = 141
      end
      object CustCity: TcxButtonEdit
        Left = 68
        Top = 108
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 2
        OnClick = CustCityClick
        Width = 141
      end
      object CustRegion: TcxButtonEdit
        Left = 68
        Top = 148
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        TabOrder = 3
        OnClick = CustRegionClick
        Width = 141
      end
    end
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
    Left = 177
    Top = 40
  end
end
