inherited EMailSet_Frm: TEMailSet_Frm
  Left = 314
  Top = 130
  Width = 491
  Height = 324
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #37038#20214#35774#32622
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl [0]
    Left = 0
    Top = 0
    Width = 483
    Height = 297
    ActivePage = ts1
    Align = alClient
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ts1: TTabSheet
      Caption = #37038#20214#26381#21153#22120#35774#32622
      object lbl1: TLabel
        Left = 24
        Top = 19
        Width = 39
        Height = 13
        Caption = #29992#25143#21517
      end
      object lbl2: TLabel
        Left = 24
        Top = 48
        Width = 26
        Height = 13
        Caption = #23494#30721
      end
      object Label1: TLabel
        Left = 24
        Top = 78
        Width = 78
        Height = 13
        Caption = #30005#23376#37038#20214#22320#22336
      end
      object Label2: TLabel
        Left = 24
        Top = 109
        Width = 93
        Height = 13
        Caption = 'SMTP'#26381#21153#22120#22320#22336
      end
      object Label3: TLabel
        Left = 24
        Top = 139
        Width = 93
        Height = 13
        Caption = 'POP3'#26381#21153#22120#22320#22336
      end
      object lbl3: TLabel
        Left = 384
        Top = 109
        Width = 26
        Height = 13
        Caption = #31471#21475
      end
      object Label4: TLabel
        Left = 384
        Top = 139
        Width = 26
        Height = 13
        Caption = #31471#21475
      end
      object dbedtUsername: TDBEdit
        Left = 67
        Top = 17
        Width = 121
        Height = 21
        DataField = 'Username'
        DataSource = ds1
        TabOrder = 0
      end
      object dbedtPwd: TDBEdit
        Left = 67
        Top = 46
        Width = 121
        Height = 21
        DataField = 'Pwd'
        DataSource = ds1
        PasswordChar = '*'
        TabOrder = 1
      end
      object dbedtEMail: TDBEdit
        Left = 123
        Top = 76
        Width = 250
        Height = 21
        DataField = 'EMail'
        DataSource = ds1
        TabOrder = 2
      end
      object dbedtSMTP: TDBEdit
        Left = 123
        Top = 105
        Width = 250
        Height = 21
        DataField = 'SMTP'
        DataSource = ds1
        TabOrder = 3
      end
      object dbedtPOP3: TDBEdit
        Left = 123
        Top = 135
        Width = 250
        Height = 21
        DataField = 'POP3'
        DataSource = ds1
        TabOrder = 5
      end
      object dbedtSmtp_port: TDBEdit
        Left = 411
        Top = 105
        Width = 40
        Height = 21
        DataField = 'Smtp_port'
        DataSource = ds1
        TabOrder = 4
      end
      object dbedtpop3_port: TDBEdit
        Left = 411
        Top = 135
        Width = 40
        Height = 21
        DataField = 'pop3_port'
        DataSource = ds1
        TabOrder = 6
      end
      object dbchkIsBackUP: TDBCheckBox
        Left = 24
        Top = 168
        Width = 257
        Height = 17
        Caption = #26159#21542#22312#26381#21153#22120#20013#22791#20221
        DataField = 'IsBackUP'
        DataSource = ds1
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbchkAuthenticate: TDBCheckBox
        Left = 24
        Top = 192
        Width = 257
        Height = 17
        Caption = #21457#36865#26102#26159#21542#38656#35201#36827#34892#26381#21153#22120#39564#35777
        DataField = 'Authenticate'
        DataSource = ds1
        TabOrder = 8
        ValueChecked = 'atLogin'
        ValueUnchecked = 'atnone'
      end
      object btn1: TBitBtn
        Left = 152
        Top = 224
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 9
        OnClick = btn1Click
      end
      object btn2: TBitBtn
        Left = 248
        Top = 224
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 10
        OnClick = btn2Click
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 328
    Top = 8
  end
  object ds1: TDataSource
    DataSet = EMail_Frm.qryEml_set
    Left = 268
    Top = 16
  end
end
