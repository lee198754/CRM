inherited Frm_CustContact: TFrm_CustContact
  Left = 291
  Top = 162
  Width = 704
  Height = 445
  Caption = #23458#25143#32852#31995#20154
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel [0]
    Left = 32
    Top = 24
    Caption = #32852#31995#20154#65306
  end
  object ContactName: TcxTextEdit [1]
    Left = 96
    Top = 20
    TabOrder = 1
    Text = 'ContactName'
    Width = 121
  end
  object cxLabel2: TcxLabel [2]
    Left = 256
    Top = 24
    Caption = #24615#21035#65306
  end
  object cxLabel3: TcxLabel [3]
    Left = 256
    Top = 64
    Caption = #32844#21153#65306
  end
  object cxLabel4: TcxLabel [4]
    Left = 480
    Top = 24
    Caption = #29983#26085#65306
  end
  object cxLabel5: TcxLabel [5]
    Left = 480
    Top = 104
    Caption = #24037#20316#30005#35805#65306
  end
  object cxLabel6: TcxLabel [6]
    Left = 256
    Top = 104
    Caption = #30452#32447#30005#35805#65306
  end
  object cxLabel7: TcxLabel [7]
    Left = 32
    Top = 104
    Caption = #25163#26426#65306
  end
  object cxLabel8: TcxLabel [8]
    Left = 248
    Top = 144
    Caption = 'QQ/MSN'#21495#65306
  end
  object cxLabel9: TcxLabel [9]
    Left = 480
    Top = 144
    Caption = #37038#31665#65306
  end
  object cxLabel10: TcxLabel [10]
    Left = 32
    Top = 184
    Caption = #22320#22336#65306
  end
  object cxLabel11: TcxLabel [11]
    Left = 32
    Top = 224
    Caption = #22791#27880#65306
  end
  object ContactSex: TcxComboBox [12]
    Left = 320
    Top = 20
    Properties.Items.Strings = (
      #30007
      #22899)
    TabOrder = 2
    Text = 'ContactSex'
    Width = 121
  end
  object ContactDuty: TcxButtonEdit [13]
    Left = 320
    Top = 60
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 5
    Text = 'ContactDuty'
    OnClick = ContactDutyClick
    Width = 121
  end
  object ContactBirthday: TcxDateEdit [14]
    Left = 544
    Top = 20
    TabOrder = 3
    Width = 121
  end
  object Contactwork: TcxTextEdit [15]
    Left = 544
    Top = 100
    TabOrder = 9
    Text = 'Contactwork'
    Width = 121
  end
  object ContactFamily: TcxTextEdit [16]
    Left = 320
    Top = 100
    TabOrder = 8
    Text = 'ContactFamily'
    Width = 121
  end
  object ContactMobil: TcxTextEdit [17]
    Left = 96
    Top = 100
    TabOrder = 7
    Text = 'ContactMobil'
    Width = 121
  end
  object ContactQQ: TcxTextEdit [18]
    Left = 320
    Top = 140
    TabOrder = 11
    Text = 'ContactQQ'
    Width = 121
  end
  object ContactEmail: TcxTextEdit [19]
    Left = 544
    Top = 140
    TabOrder = 12
    Text = 'ContactEmail'
    Width = 121
  end
  object ContactAdd: TcxTextEdit [20]
    Left = 96
    Top = 180
    TabOrder = 13
    Text = 'ContactAdd'
    Width = 569
  end
  object ContactMemo: TcxMemo [21]
    Left = 96
    Top = 224
    Lines.Strings = (
      'ContactMemo')
    TabOrder = 14
    Height = 121
    Width = 569
  end
  object cxLabel12: TcxLabel [22]
    Left = 32
    Top = 64
    Caption = #37096#38376#65306
  end
  object ContactDept: TcxButtonEdit [23]
    Left = 96
    Top = 60
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 4
    Text = 'ContactDept'
    OnClick = ContactDeptClick
    Width = 121
  end
  object BtnAdd: TcxButton [24]
    Left = 96
    Top = 368
    Width = 75
    Height = 25
    Caption = #26032#22686
    TabOrder = 30
    Visible = False
    OnClick = BtnAddClick
  end
  object BtnEdit: TcxButton [25]
    Left = 200
    Top = 368
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 31
    Visible = False
    OnClick = BtnEditClick
  end
  object BtnSave: TcxButton [26]
    Left = 448
    Top = 368
    Width = 91
    Height = 25
    Caption = #20445#23384#24182#36864#20986
    TabOrder = 32
    OnClick = BtnSaveClick
  end
  object BtnClose: TcxButton [27]
    Left = 568
    Top = 368
    Width = 91
    Height = 25
    Caption = #36864#20986
    TabOrder = 33
    OnClick = BtnCloseClick
  end
  object cxLabel13: TcxLabel [28]
    Left = 32
    Top = 144
    Caption = #20256#30495#65306
  end
  object EdtFax: TcxTextEdit [29]
    Left = 96
    Top = 140
    TabOrder = 10
    Text = 'ContactFax'
    Width = 121
  end
  object ContactValue: TcxButtonEdit [30]
    Left = 544
    Top = 60
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 6
    Text = 'ContactValue'
    OnClick = ContactValueClick
    Width = 121
  end
  object cxLabel14: TcxLabel [31]
    Left = 480
    Top = 64
    Caption = #20154#29289#23646#24615#65306
  end
  object BtnSaveAdd: TcxButton [32]
    Left = 328
    Top = 368
    Width = 89
    Height = 25
    Caption = #20445#23384#24182#26032#22686
    TabOrder = 36
    OnClick = BtnSaveAddClick
  end
  inherited xpmn1: TXPMenu
    Left = 288
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 320
    Top = 8
  end
  inherited imList: TImageList
    Left = 384
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
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
    Left = 352
    Top = 8
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 344
    Top = 208
  end
  object DSContact: TDataSource
    DataSet = DataBaseModule.AdoContact
    Left = 248
    Top = 8
  end
end
