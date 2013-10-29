inherited Frm_SoundManager: TFrm_SoundManager
  Left = 347
  Top = 234
  Width = 786
  Height = 572
  Caption = 'Frm_SoundManager'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel [0]
    Left = 0
    Top = 0
    Width = 778
    Height = 504
    Align = alClient
    TabOrder = 4
    object cxpgcntrl1: TcxPageControl
      Left = 1
      Top = 1
      Width = 776
      Height = 502
      ActivePage = cxtbsht1
      Align = alClient
      TabOrder = 0
      ClientRectBottom = 501
      ClientRectLeft = 1
      ClientRectRight = 775
      ClientRectTop = 21
      object cxtbsht1: TcxTabSheet
        Caption = #24405#38899#22238#25918
        ImageIndex = 0
        object cxgrd1: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 480
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            OnCellClick = cxgrdbtblvwGrid1DBTableView1CellClick
            DataController.DataSource = ds1
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            object cxgrdbclmnGrid1DBTableView1FLocalNum: TcxGridDBColumn
              Caption = #26412#22320#21495#30721
              DataBinding.FieldName = 'FLocalNum'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1FRemoteNum: TcxGridDBColumn
              Caption = #23545#26041#21495#30721
              DataBinding.FieldName = 'FRemoteNum'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1way: TcxGridDBColumn
              Caption = #26041#21521
              DataBinding.FieldName = 'way'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1CustName: TcxGridDBColumn
              Caption = #23458#25143#21517#31216
              DataBinding.FieldName = 'CustName'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1CustPhone: TcxGridDBColumn
              Caption = #30005#35805
              DataBinding.FieldName = 'CustPhone'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1ContactName: TcxGridDBColumn
              Caption = #32852#31995#20154
              DataBinding.FieldName = 'ContactName'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1ContactFamilyphone: TcxGridDBColumn
              Caption = #30452#32447#30005#35805
              DataBinding.FieldName = 'ContactFamilyphone'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1ContactWorkPhone: TcxGridDBColumn
              Caption = #24037#20316#30005#35805
              DataBinding.FieldName = 'ContactWorkPhone'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1ContactMobile: TcxGridDBColumn
              Caption = #25163#26426
              DataBinding.FieldName = 'ContactMobile'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1FDTStart: TcxGridDBColumn
              Caption = #26102#38388
              DataBinding.FieldName = 'FDTStart'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1FLong: TcxGridDBColumn
              Caption = #36890#35805#26102#38271
              DataBinding.FieldName = 'FLong'
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1FIO: TcxGridDBColumn
              DataBinding.FieldName = 'FIO'
              Visible = False
              Width = 80
            end
            object cxgrdbclmnGrid1DBTableView1FFile: TcxGridDBColumn
              Caption = #25991#20214
              DataBinding.FieldName = 'FFile'
              Width = 80
            end
          end
          object cxgrdlvlGrid1Level1: TcxGridLevel
            GridView = cxgrdbtblvwGrid1DBTableView1
          end
        end
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 504
    Width = 778
    Height = 41
    Align = alBottom
    TabOrder = 5
    object lbl1: TLabel
      Left = 308
      Top = 15
      Width = 108
      Height = 13
      AutoSize = False
      Caption = #26381#21153#22120#22320#22336'/'#22495#21517
    end
    object cbb1: TComboBox
      Left = 412
      Top = 11
      Width = 101
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '127.0.0.1')
    end
    object MediaPlayer1: TMediaPlayer
      Left = 17
      Top = 7
      Width = 85
      Height = 30
      VisibleButtons = [btPlay, btPause, btStop]
      TabOrder = 1
    end
    object TrackBar1: TTrackBar
      Left = 107
      Top = 11
      Width = 196
      Height = 25
      TabOrder = 2
      TickMarks = tmBoth
      TickStyle = tsNone
      OnChange = TrackBar1Change
    end
    object Panel3: TPanel
      Left = 723
      Top = 3
      Width = 200
      Height = 34
      TabOrder = 3
      Visible = False
      object TMNC_OCXX1: TTMNC_OCXX
        Left = 17
        Top = -1
        Width = 171
        Height = 33
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnCallIn = TMNC_OCXX1CallIn
        OnConnect = TMNC_OCXX1Connect
        OnDisConnect = TMNC_OCXX1DisConnect
        ControlData = {
          545046300A54544D4E435F4F43585809544D4E435F4F435858044C6566740211
          03546F7002FF05576964746803AB000648656967687402210D41637469766543
          6F6E74726F6C070C4D65646961506C61796572310743617074696F6E0609544D
          4E435F4F43585805436F6C6F720709636C42746E466163650C466F6E742E4368
          6172736574070F44454641554C545F434841525345540A466F6E742E436F6C6F
          72070C636C57696E646F77546578740B466F6E742E48656967687402F509466F
          6E742E4E616D65060D4D532053616E732053657269660A466F6E742E5374796C
          650B000E4F6C644372656174654F72646572080D506978656C73506572496E63
          6802600A54657874486569676874020D0000}
      end
    end
    object btn3: TcxButton
      Left = 523
      Top = 8
      Width = 74
      Height = 25
      Caption = #26029#24320
      TabOrder = 4
      OnClick = btn3Click
    end
    object cxButton1: TcxButton
      Left = 610
      Top = 8
      Width = 74
      Height = 25
      Caption = #21047#26032
      TabOrder = 5
      OnClick = cxButton1Click
    end
    object btn4: TcxButton
      Left = 522
      Top = 8
      Width = 74
      Height = 25
      Caption = #36830#25509
      TabOrder = 6
      OnClick = btn4Click
    end
  end
  inherited xpmn1: TXPMenu
    Left = 264
    Top = 48
  end
  inherited actlst1: TActionList
    Top = 56
  end
  inherited imList: TImageList
    Top = 49
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 376
    Top = 48
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
    Top = 48
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Top = 48
  end
  object cxlkndflcntrlr1: TcxLookAndFeelController
    Kind = lfFlat
    NativeStyle = True
    Left = 227
    Top = 215
  end
  object bndqrySound: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select r.FLocalNum ,r.FRemoteNum,r.FDTStart,r.FLong,r.FIO,r.FFil' +
        'e,'
      
        'cm.CustName,cm.CustPhone,c.ContactName, c.ContactWorkPhone ,c.Co' +
        'ntactFamilyphone,'
      
        'c.ContactMobile,way =case when FIO = 0 then '#39#21628#20837#39' when FIO = 1 th' +
        'en '#39#21628#20986#39'end'
      ' from racall r'
      'left outer join contact c'
      'on r.FRemoteNum  = c.ContactWorkPhone '
      'or r.FRemoteNum  = c.ContactFamilyphone '
      'or r.FRemoteNum  = c.ContactMobile '
      'left outer join customer  s'
      'on r.FRemoteNum = s. CustPhone '
      'left outer join customer cm'
      'on  cm.CustID = c.CustID or cm.CustID = s.CustID'
      '')
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
    Left = 202
    Top = 287
  end
  object ds1: TDataSource
    DataSet = bndqrySound
    Left = 162
    Top = 287
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 328
    Top = 288
  end
  object TempQry: TADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <
      item
        Name = 'UserID'
        Size = -1
        Value = Null
      end
      item
        Name = 'TelNo'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from Users_ u '
      'left outer join UserTel t'
      'on u.UserCode_ = t.userid'
      'where u.UserID_ = :UserID '
      'and  t.Telphone= :TelNo')
    Left = 233
    Top = 289
  end
  object LookQry: TADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <
      item
        Name = 'Telphone'
        Size = -1
        Value = Null
      end
      item
        Name = 'Telphone1'
        Size = -1
        Value = Null
      end
      item
        Name = 'Telphone2'
        Size = -1
        Value = Null
      end
      item
        Name = 'Telphone3'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from Customer s '
      'left outer join Contact c'
      'on s.CustID = c.CustID'
      'where s.CustPhone = :Telphone'
      'or  c.ContactWorkPhone = :Telphone1'
      'or  c.ContactFamilyphone = :Telphone2'
      'or  c.ContactMobile = :Telphone3')
    Left = 261
    Top = 289
  end
  object CustQry: TADOQuery
    Connection = DataBaseModule.dtclsData
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'Telphone'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select * from TempTable'
      '')
    Left = 297
    Top = 290
    object CustQryIndexID: TBCDField
      FieldName = 'IndexID'
      ReadOnly = True
      Precision = 10
      Size = 0
    end
    object CustQryCustomerID: TStringField
      FieldName = 'CustomerID'
    end
    object CustQryCustomerName: TStringField
      FieldName = 'CustomerName'
    end
    object CustQryTelphone: TStringField
      FieldName = 'Telphone'
    end
    object CustQryFax: TStringField
      FieldName = 'Fax'
    end
    object CustQryLinkMan: TStringField
      FieldName = 'LinkMan'
    end
    object CustQryaddress: TStringField
      FieldName = 'address'
      Size = 50
    end
    object CustQryNet: TStringField
      FieldName = 'Net'
    end
    object CustQryLocalNum: TStringField
      FieldName = 'LocalNum'
    end
    object CustQryCallInNum: TStringField
      FieldName = 'CallInNum'
    end
    object CustQryTelDataTime: TStringField
      FieldName = 'TelDataTime'
    end
  end
end
