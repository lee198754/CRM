inherited Report_Frm: TReport_Frm
  Left = 411
  Top = 293
  Width = 306
  Height = 344
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #33258#23450#20041#25253#34920
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxpgcntrl1: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 288
    Height = 300
    ActivePage = cxtbsht1
    Align = alClient
    TabOrder = 0
    ClientRectBottom = 296
    ClientRectLeft = 2
    ClientRectRight = 284
    ClientRectTop = 22
    object cxtbsht1: TcxTabSheet
      Caption = #33258#23450#20041#25253#34920
      ImageIndex = 0
      object cxgrd1: TcxGrid
        Left = 0
        Top = 40
        Width = 282
        Height = 234
        Align = alClient
        BevelKind = bkFlat
        TabOrder = 1
        LevelTabs.Style = 8
        LookAndFeel.Kind = lfOffice11
        object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsReport
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          object cxgrdbclmnGrid1DBTableView1RpName: TcxGridDBColumn
            DataBinding.FieldName = 'RpName'
            MinWidth = 283
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.ShowCaption = False
            Width = 283
          end
        end
        object cxgrdlvlGrid1Level1: TcxGridLevel
          GridView = cxgrdbtblvwGrid1DBTableView1
        end
      end
      object cxgrpbx2: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        TabOrder = 0
        Height = 40
        Width = 282
        object btn1: TcxButton
          Left = 132
          Top = 12
          Width = 39
          Height = 22
          Caption = #26032#22686
          TabOrder = 1
          OnClick = btn1Click
          LookAndFeel.Kind = lfOffice11
        end
        object btn2: TcxButton
          Left = 173
          Top = 12
          Width = 36
          Height = 22
          Caption = #21024#38500
          TabOrder = 2
          OnClick = btn2Click
          LookAndFeel.Kind = lfOffice11
        end
        object btn4: TcxButton
          Left = 211
          Top = 12
          Width = 40
          Height = 22
          Caption = #20462#25913
          TabOrder = 3
          OnClick = btn4Click
          LookAndFeel.Kind = lfOffice11
        end
        object btn5: TcxButton
          Left = 255
          Top = 12
          Width = 36
          Height = 22
          Caption = #20445#23384
          TabOrder = 4
          OnClick = btn5Click
          LookAndFeel.Kind = lfOffice11
        end
        object cxdbtxtdt1: TcxDBTextEdit
          Left = 2
          Top = 12
          DataBinding.DataField = 'RpName'
          DataBinding.DataSource = dsReport
          TabOrder = 0
          Width = 127
        end
      end
    end
  end
  object bndqryRepDataSet: TbainaADOQuery
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
    Left = 234
    Top = 214
    object strngfldbndqry1RpName: TStringField
      DisplayLabel = #25253#34920#21517#31216
      FieldName = 'RpName'
      Size = 30
    end
    object strngfldRepDataSetModuName: TStringField
      FieldName = 'ModuName'
      Size = 30
    end
    object blbfldRepDataSetRpData: TBlobField
      FieldName = 'RpData'
    end
  end
  object dsReport: TDataSource
    DataSet = bndqryRepDataSet
    Left = 234
    Top = 142
  end
  object frxrprtReport: TfrxReport
    Version = '4.3'
    DataSetName = 'frxdbdtst1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39562.699995833310000000
    ReportOptions.LastChange = 39562.699995833310000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    Left = 168
    Top = 88
  end
  object frxdsgnr1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    Restrictions = []
    RTLLanguage = False
    Left = 264
    Top = 240
  end
  object frxchrtbjct1: TfrxChartObject
    Left = 264
    Top = 176
  end
  object frxbrcdbjct1: TfrxBarCodeObject
    Left = 264
    Top = 72
  end
  object frxlbjct1: TfrxOLEObject
    Left = 232
    Top = 176
  end
  object frxrchbjct1: TfrxRichObject
    Left = 232
    Top = 72
  end
  object frxcrsbjct1: TfrxCrossObject
    Left = 232
    Top = 112
  end
  object frxchckbxbjct1: TfrxCheckBoxObject
    Left = 264
    Top = 208
  end
  object frxbxcmpnts1: TfrxIBXComponents
    Left = 264
    Top = 144
  end
  object frxdbxcmpnts1: TfrxDBXComponents
    Left = 264
    Top = 112
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    Left = 24
    Top = 80
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    Left = 24
    Top = 112
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    Left = 24
    Top = 144
  end
  object frxDBDataset4: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    Left = 64
    Top = 80
  end
  object frxDBDataset5: TfrxDBDataset
    UserName = 'frxDBDataset5'
    CloseDataSource = False
    Left = 64
    Top = 112
  end
  object frxDBDataset6: TfrxDBDataset
    UserName = 'frxDBDataset6'
    CloseDataSource = False
    Left = 64
    Top = 144
  end
  object frxDBDataset7: TfrxDBDataset
    UserName = 'frxDBDataset7'
    CloseDataSource = False
    Left = 24
    Top = 176
  end
  object frxDBDataset8: TfrxDBDataset
    UserName = 'frxDBDataset8'
    CloseDataSource = False
    Left = 64
    Top = 176
  end
  object frxDBDataset9: TfrxDBDataset
    UserName = 'frxDBDataset9'
    CloseDataSource = False
    Left = 104
    Top = 80
  end
  object frxDBDataset10: TfrxDBDataset
    Enabled = False
    UserName = 'frxDBDataset10'
    CloseDataSource = False
    Left = 104
    Top = 112
  end
end
