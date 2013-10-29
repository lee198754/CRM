object ScreeFrm: TScreeFrm
  Left = 267
  Top = 182
  AutoScroll = False
  Caption = #26469#30005#24377#23631
  ClientHeight = 243
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 243
    Align = alClient
    TabOrder = 0
    object cxgrd1: TcxGrid
      Left = 1
      Top = 1
      Width = 570
      Height = 241
      Align = alClient
      TabOrder = 0
      object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = cxgrdbtblvwGrid1DBTableView1CellDblClick
        DataController.DataSource = ds1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object cxgrdbclmnGrid1DBTableView1LocalNum: TcxGridDBColumn
          Caption = #26412#22320#21495#30721
          DataBinding.FieldName = 'LocalNum'
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1CallInNum: TcxGridDBColumn
          Caption = #23545#26041#21495#30721
          DataBinding.FieldName = 'CallInNum'
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1CustomerName: TcxGridDBColumn
          Caption = #23458#25143#21517#31216
          DataBinding.FieldName = 'CustomerName'
          Width = 120
        end
        object cxgrdbclmnGrid1DBTableView1Telphone: TcxGridDBColumn
          Caption = #30005#35805#21495#30721
          DataBinding.FieldName = 'Telphone'
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1LinkMan: TcxGridDBColumn
          Caption = #32852#31995#20154
          DataBinding.FieldName = 'LinkMan'
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1TelDataTime: TcxGridDBColumn
          Caption = #26102#38388
          DataBinding.FieldName = 'TelDataTime'
          Width = 120
        end
        object cxgrdbclmnGrid1DBTableView1address: TcxGridDBColumn
          Caption = #22320#22336
          DataBinding.FieldName = 'address'
          Width = 250
        end
        object cxgrdbclmnGrid1DBTableView1IndexID: TcxGridDBColumn
          DataBinding.FieldName = 'IndexID'
          Visible = False
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1CustomerID: TcxGridDBColumn
          DataBinding.FieldName = 'CustomerID'
          Visible = False
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1Fax: TcxGridDBColumn
          DataBinding.FieldName = 'Fax'
          Visible = False
          Width = 80
        end
        object cxgrdbclmnGrid1DBTableView1Net: TcxGridDBColumn
          DataBinding.FieldName = 'Net'
          Visible = False
          Width = 80
        end
      end
      object cxgrdlvlGrid1Level1: TcxGridLevel
        GridView = cxgrdbtblvwGrid1DBTableView1
      end
    end
  end
  object ds1: TDataSource
    DataSet = Frm_SoundManager.CustQry
    Left = 248
    Top = 152
  end
end
