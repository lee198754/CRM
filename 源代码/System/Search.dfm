inherited Frm_Search: TFrm_Search
  Left = 347
  Top = 170
  Width = 419
  Height = 516
  BorderIcons = [biSystemMenu]
  Caption = #25628#32034
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxpgcntrl1: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 401
    Height = 479
    ActivePage = cxtbsht1
    Align = alClient
    Images = imList
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    ClientRectBottom = 479
    ClientRectRight = 401
    ClientRectTop = 25
    object cxtbsht1: TcxTabSheet
      Caption = #25628#32034
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 8
        Top = 0
        Width = 385
        Height = 401
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        object GrdSearch: TcxGridDBTableView
          OnDblClick = BtnSureClick
          NavigatorButtons.ConfirmDelete = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.ShowColumnFilterButtons = sfbAlways
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = GrdSearch
        end
      end
      object BtnExit: TcxButton
        Left = 224
        Top = 416
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        OnClick = BtnExitClick
      end
      object BtnSure: TcxButton
        Left = 112
        Top = 416
        Width = 75
        Height = 25
        Caption = #36873#25321
        TabOrder = 2
        OnClick = BtnSureClick
      end
    end
  end
  inherited xpmn1: TXPMenu
    Left = 360
    Top = 120
  end
  inherited actlst1: TActionList
    Left = 360
    Top = 160
  end
  inherited imList: TImageList
    Left = 360
    Top = 33
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 360
    Top = 72
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
    Left = 360
    Top = 200
  end
  object AdoUser: TbainaADOQuery
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
    Left = 368
    Top = 240
  end
  object DSUser: TDataSource
    DataSet = AdoUser
    Left = 368
    Top = 280
  end
end
