object Form1: TForm1
  Left = 8
  Top = 271
  Width = 505
  Height = 450
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox2: TDirectoryListBox
    Left = 8
    Top = 32
    Width = 225
    Height = 385
    FileList = FileListBox1
    ItemHeight = 16
    TabOrder = 0
  end
  object FileListBox1: TFileListBox
    Left = 240
    Top = 8
    Width = 249
    Height = 409
    ItemHeight = 13
    Mask = '*.skn'
    TabOrder = 1
    OnClick = FileListBox1Click
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 8
    Width = 225
    Height = 19
    DirList = DirectoryListBox2
    TabOrder = 2
  end
end
