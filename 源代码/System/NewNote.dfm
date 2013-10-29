inherited Frm_NewNote: TFrm_NewNote
  Left = 393
  Top = 128
  Width = 467
  Height = 376
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36890#35759#24405#35774#32622
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtName: TcxTextEdit [0]
    Left = 88
    Top = 9
    TabOrder = 3
    Text = 'EdtName'
    Width = 121
  end
  object cxLabel1: TcxLabel [1]
    Left = 40
    Top = 11
    Caption = #22995#21517#65306
  end
  object cxLabel2: TcxLabel [2]
    Left = 256
    Top = 11
    Caption = #24615#21035#65306
  end
  object cxLabel3: TcxLabel [3]
    Left = 40
    Top = 39
    Caption = #29983#26085#65306
  end
  object cxLabel4: TcxLabel [4]
    Left = 40
    Top = 68
    Caption = #37096#38376#65306
  end
  object cxLabel5: TcxLabel [5]
    Left = 256
    Top = 68
    Caption = #32844#21153#65306
  end
  object cxLabel6: TcxLabel [6]
    Left = 16
    Top = 98
    Caption = #24037#20316#30005#35805#65306
  end
  object cxLabel7: TcxLabel [7]
    Left = 232
    Top = 98
    Caption = #23478#24237#30005#35805#65306
  end
  object cxLabel8: TcxLabel [8]
    Left = 40
    Top = 127
    Caption = #25163#26426#65306
  end
  object cxLabel9: TcxLabel [9]
    Left = 48
    Top = 156
    Caption = 'QQ'#65306
  end
  object cxLabel10: TcxLabel [10]
    Left = 256
    Top = 156
    Caption = #37038#31665#65306
  end
  object cxLabel11: TcxLabel [11]
    Left = 40
    Top = 187
    Caption = #22320#22336#65306
  end
  object cxLabel12: TcxLabel [12]
    Left = 40
    Top = 211
    Caption = #22791#27880#65306
  end
  object EdtSex: TcxComboBox [13]
    Left = 304
    Top = 9
    Properties.Items.Strings = (
      #30007
      #22899)
    TabOrder = 4
    Text = 'EdtSex'
    Width = 121
  end
  object EdtBirthday: TcxDateEdit [14]
    Left = 88
    Top = 37
    TabOrder = 7
    Width = 121
  end
  object EdtDpart: TcxButtonEdit [15]
    Left = 88
    Top = 66
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 9
    Text = 'EdtDpart'
    OnClick = EdtDpartClick
    Width = 121
  end
  object EdtDuty: TcxButtonEdit [16]
    Left = 304
    Top = 66
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 10
    Text = 'EdtDuty'
    OnClick = EdtDutyClick
    Width = 121
  end
  object EdtWPhone: TcxTextEdit [17]
    Left = 88
    Top = 96
    TabOrder = 13
    Text = 'EdtWPhone'
    Width = 121
  end
  object EdtFPhone: TcxTextEdit [18]
    Left = 304
    Top = 96
    TabOrder = 14
    Text = 'EdtFPhone'
    Width = 121
  end
  object EdtMobile: TcxTextEdit [19]
    Left = 88
    Top = 125
    TabOrder = 17
    Text = 'EdtMobile'
    Width = 121
  end
  object EdtICQ: TcxTextEdit [20]
    Left = 88
    Top = 154
    TabOrder = 19
    Text = 'EdtICQ'
    Width = 121
  end
  object EdtEmail: TcxTextEdit [21]
    Left = 304
    Top = 154
    TabOrder = 20
    Text = 'EdtEmail'
    Width = 121
  end
  object EdtAddress: TcxTextEdit [22]
    Left = 88
    Top = 183
    TabOrder = 23
    Text = 'EdtAddress'
    Width = 337
  end
  object EdtMemo: TcxMemo [23]
    Left = 88
    Top = 211
    Lines.Strings = (
      'cxMemo1')
    TabOrder = 26
    Height = 89
    Width = 337
  end
  object BtnSure: TcxButton [24]
    Left = 224
    Top = 312
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 27
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [25]
    Left = 344
    Top = 312
    Width = 75
    Height = 25
    Caption = #36864#20986
    TabOrder = 28
    OnClick = BtnExitClick
  end
  inherited xpmn1: TXPMenu
    Top = 232
  end
  inherited actlst1: TActionList
    Left = 152
    Top = 232
  end
  inherited imList: TImageList
    Left = 248
    Top = 233
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 280
    Top = 232
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
    Left = 216
    Top = 232
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 312
    Top = 232
  end
end
