inherited Search_Frm: TSearch_Frm
  Left = 279
  Top = 195
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = ''
  ClientHeight = 354
  ClientWidth = 578
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cxgrpbx1: TcxGroupBox [0]
    Left = 0
    Top = 0
    Align = alClient
    Style.BorderStyle = ebsFlat
    TabOrder = 0
    Height = 312
    Width = 578
    object cxgrd1: TcxGrid
      Left = 2
      Top = 18
      Width = 574
      Height = 292
      Align = alClient
      TabOrder = 0
      object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = ds1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxgrdlvlGrid1Level1: TcxGridLevel
        GridView = cxgrdbtblvwGrid1DBTableView1
      end
    end
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 0
    Top = 312
    Align = alBottom
    Style.BorderStyle = ebsFlat
    TabOrder = 1
    Height = 42
    Width = 578
    object btn1: TcxButton
      Left = 384
      Top = 12
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
    end
    object btn2: TcxButton
      Left = 464
      Top = 12
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
      OnClick = btn2Click
      LookAndFeel.Kind = lfOffice11
    end
  end
  object bndqry1: TbainaADOQuery
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
    Left = 152
    Top = 40
  end
  object ds1: TDataSource
    DataSet = bndqry1
    Left = 280
    Top = 64
  end
end
