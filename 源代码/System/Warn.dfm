inherited Frm_Warn: TFrm_Warn
  Left = 441
  Top = 390
  Width = 560
  Height = 294
  Caption = #27963#21160#26085#31243#25552#37266
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GrdWarn: TStringGrid [0]
    Left = 24
    Top = 16
    Width = 506
    Height = 209
    ColCount = 3
    Ctl3D = False
    DefaultColWidth = 165
    FixedColor = clSkyBlue
    FixedCols = 0
    RowCount = 8
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
  end
  inherited xpmn1: TXPMenu
    Left = 344
    Top = 56
  end
  inherited actlst1: TActionList
    Left = 384
    Top = 56
  end
  inherited imList: TImageList
    Left = 464
    Top = 57
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 504
    Top = 56
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
    Left = 424
    Top = 56
  end
  object DSWarn: TDataSource
    DataSet = DataBaseModule.AdoWarn
    Left = 504
    Top = 8
  end
end
