inherited Frm_ServiceRecord: TFrm_ServiceRecord
  Left = 349
  Top = 148
  Width = 695
  Height = 487
  BorderIcons = [biSystemMenu]
  Caption = #32500#25252#35760#24405
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid [0]
    Left = 8
    Top = 8
    Width = 250
    Height = 265
    TabOrder = 4
    object GrdMan: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = GrdMan
    end
  end
  object cxGrid2: TcxGrid [1]
    Left = 264
    Top = 8
    Width = 417
    Height = 265
    TabOrder = 5
    object GrdRecord: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellClick = GrdRecordCellClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = GrdRecord
    end
  end
  object cxDBMemo1: TcxDBMemo [2]
    Left = 8
    Top = 280
    Properties.ReadOnly = True
    TabOrder = 6
    Height = 169
    Width = 673
  end
  inherited xpmn1: TXPMenu
    Left = 264
    Top = 288
  end
  inherited actlst1: TActionList
    Left = 232
    Top = 288
  end
  inherited imList: TImageList
    Left = 360
    Top = 289
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 392
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
    Left = 296
    Top = 288
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 328
    Top = 288
  end
  object LAdoMan: TbainaADOQuery
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
    Left = 40
    Top = 56
  end
  object LAdoRecord: TbainaADOQuery
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
    Left = 376
    Top = 56
  end
  object LDSMan: TDataSource
    DataSet = LAdoMan
    Left = 40
    Top = 96
  end
  object LDSRecord: TDataSource
    DataSet = LAdoRecord
    Left = 376
    Top = 96
  end
end
