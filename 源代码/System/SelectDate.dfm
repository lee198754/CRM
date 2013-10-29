object Frm_SelectDate: TFrm_SelectDate
  Left = 316
  Top = 264
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26085#26399#36873#25321
  ClientHeight = 93
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object BeginDate: TcxDateEdit
    Left = 80
    Top = 16
    Properties.ReadOnly = False
    TabOrder = 0
    Width = 121
  end
  object EndDate: TcxDateEdit
    Left = 280
    Top = 16
    Properties.ReadOnly = False
    TabOrder = 1
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 16
    Caption = #36215#22987#26085#26399#65306
  end
  object cxLabel2: TcxLabel
    Left = 208
    Top = 16
    Caption = #32467#26463#26085#26399#65306
  end
  object cxButton1: TcxButton
    Left = 200
    Top = 56
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 320
    Top = 56
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 5
    OnClick = cxButton2Click
  end
end
