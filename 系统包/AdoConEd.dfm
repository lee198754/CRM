object ConnEditForm: TConnEditForm
  Left = 196
  Top = 114
  BorderStyle = bsDialog
  ClientHeight = 185
  ClientWidth = 472
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 202
    Top = 151
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 290
    Top = 151
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object HelpButton: TButton
    Left = 376
    Top = 151
    Width = 75
    Height = 25
    Caption = #24110#21161
    TabOrder = 2
    OnClick = HelpButtonClick
  end
  object SourceofConnection: TGroupBox
    Tag = 2201
    Left = 5
    Top = 4
    Width = 461
    Height = 136
    Caption = #25968#25454#28304#35774#32622
    TabOrder = 3
    object UseDataLinkFile: TRadioButton
      Tag = 2203
      Left = 10
      Top = 21
      Width = 226
      Height = 20
      Caption = #20351#29992#36830#25509#25991#20214#36830#25509#25968#25454#28304
      TabOrder = 0
      OnClick = SourceButtonClick
    end
    object DataLinkFile: TComboBox
      Tag = 2206
      Left = 28
      Top = 42
      Width = 332
      Height = 21
      ItemHeight = 13
      Sorted = True
      TabOrder = 1
    end
    object Browse: TButton
      Tag = 2209
      Left = 370
      Top = 39
      Width = 75
      Height = 25
      Caption = #27983#35272
      TabOrder = 2
      OnClick = BrowseClick
    end
    object UseConnectionString: TRadioButton
      Tag = 2202
      Left = 10
      Top = 73
      Width = 226
      Height = 20
      Caption = #20351#29992#36830#25509#23383#31526#20018#36830#25509#25968#25454#28304
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = SourceButtonClick
    end
    object ConnectionString: TEdit
      Tag = 2205
      Left = 28
      Top = 94
      Width = 332
      Height = 21
      TabOrder = 4
    end
    object Build: TButton
      Tag = 2208
      Left = 370
      Top = 92
      Width = 75
      Height = 25
      Caption = #24314#31435
      TabOrder = 5
      OnClick = BuildClick
    end
  end
end
