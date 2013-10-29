object Frm_HideSelect: TFrm_HideSelect
  Left = 279
  Top = 147
  Width = 356
  Height = 430
  BorderIcons = [biSystemMenu]
  Caption = #36873#25321#26174#31034#21015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 403
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 250
      Height = 403
      Align = alLeft
      TabOrder = 0
      object GrdSelect: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = LDSHideSelect
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object GrdSelectColumn1: TcxGridDBColumn
          Caption = #26174#31034#21015
          DataBinding.FieldName = 'IFSelect'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Width = 80
        end
        object GrdSelectColumn2: TcxGridDBColumn
          Caption = #21517#31216
          DataBinding.FieldName = 'LineCaption'
          Width = 150
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = GrdSelect
      end
    end
    object cxButton1: TcxButton
      Left = 264
      Top = 312
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object BtnExit: TcxButton
      Left = 264
      Top = 376
      Width = 75
      Height = 25
      Caption = #36864#20986
      TabOrder = 2
      OnClick = BtnExitClick
    end
  end
  object LAdoHideSelect: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    Parameters = <
      item
        Name = 'BelongID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select  HSelecttable,HSelectLine,IFSelect,LineCaption,BelongID F' +
        'rom HideSelect Where HSelectTable='#39'Customer'#39'  And BelongID=:Belo' +
        'ngID')
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
    Left = 272
    Top = 72
  end
  object LDSHideSelect: TDataSource
    DataSet = LAdoHideSelect
    Left = 272
    Top = 112
  end
  object Query: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
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
    Left = 272
    Top = 152
  end
end
