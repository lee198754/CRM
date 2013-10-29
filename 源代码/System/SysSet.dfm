inherited Frm_SysSet: TFrm_SysSet
  Left = 191
  Top = 257
  Width = 607
  Height = 401
  Caption = #31995#32479#36873#39033
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl [0]
    Left = 0
    Top = 0
    Width = 599
    Height = 333
    ActivePage = tstab1
    Align = alClient
    TabOrder = 0
    object tstab1: TTabSheet
      Caption = #22522#26412#36873#39033
      object lbl1: TLabel
        Left = 16
        Top = 17
        Width = 60
        Height = 13
        Caption = #27880#20876#20844#21496#65306
      end
      object lbl2: TLabel
        Left = 456
        Top = 17
        Width = 72
        Height = 13
        Caption = #27880#20876#29992#25143#25968#65306
      end
      object edtCompanyName: TEdit
        Left = 80
        Top = 13
        Width = 369
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtOnLineUserCount: TEdit
        Left = 528
        Top = 13
        Width = 49
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 48
        Width = 577
        Height = 65
        Caption = #20849#20139#25991#20214#22841#35774#32622
        TabOrder = 2
        object Label1: TLabel
          Left = 5
          Top = 33
          Width = 60
          Height = 13
          Caption = #20849#20139#36335#24452#65306
        end
        object Label2: TLabel
          Left = 305
          Top = 33
          Width = 48
          Height = 13
          Caption = #29992#25143#21517#65306
        end
        object Label3: TLabel
          Left = 453
          Top = 33
          Width = 36
          Height = 13
          Caption = #23494#30721#65306
        end
        object sharepath: TcxTextEdit
          Left = 72
          Top = 25
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 225
        end
        object shareuser: TcxTextEdit
          Left = 352
          Top = 25
          Properties.ReadOnly = True
          TabOrder = 1
          Width = 89
        end
        object sharepwd: TcxTextEdit
          Left = 488
          Top = 25
          Properties.EchoMode = eemPassword
          Properties.PasswordChar = '*'
          Properties.ReadOnly = True
          TabOrder = 2
          Width = 81
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 128
        Width = 577
        Height = 65
        Caption = #35821#38899#26381#21153#22120'IP'#35774#32622
        TabOrder = 3
        object Label4: TLabel
          Left = 5
          Top = 33
          Width = 58
          Height = 13
          Caption = #26381#21153#22120'IP'#65306
        end
        object ShareIP: TcxTextEdit
          Left = 72
          Top = 25
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 225
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 208
        Width = 577
        Height = 49
        Caption = #20445#30041#23567#25968#28857#20301#25968
        TabOrder = 4
        object Label5: TLabel
          Left = 9
          Top = 20
          Width = 48
          Height = 13
          Caption = #23567#25968#20301#25968
        end
        object Label6: TLabel
          Left = 106
          Top = 20
          Width = 12
          Height = 13
          Caption = #20301
        end
        object EdtDigit: TEdit
          Left = 72
          Top = 16
          Width = 33
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
      end
    end
  end
  object pnl1: TPanel [1]
    Left = 0
    Top = 333
    Width = 599
    Height = 41
    Align = alBottom
    TabOrder = 4
    object btn1: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = btn2Click
    end
    object btn3: TButton
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = #20462#25913
      TabOrder = 0
      OnClick = btn3Click
    end
  end
  inherited xpmn1: TXPMenu
    Left = 264
    Top = 288
  end
  inherited actlst1: TActionList
    Left = 176
    Top = 288
  end
  inherited imList: TImageList
    Left = 384
    Top = 289
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 472
    Top = 288
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
    Left = 344
    Top = 288
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 416
    Top = 288
  end
end
