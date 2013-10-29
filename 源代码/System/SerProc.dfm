inherited Frm_SerProc: TFrm_SerProc
  Left = 613
  Top = 347
  Width = 641
  Height = 285
  Caption = #32500#25252#36807#31243
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtMemo: TcxMemo [0]
    Left = 8
    Top = 32
    Lines.Strings = (
      'EdtMemo')
    TabOrder = 4
    Height = 161
    Width = 617
  end
  object cxLabel1: TcxLabel [1]
    Left = 8
    Top = 8
    Caption = #32500#25252#35760#24405#65306
  end
  object Panel1: TPanel [2]
    Left = 8
    Top = 194
    Width = 617
    Height = 201
    BevelOuter = bvLowered
    TabOrder = 6
    Visible = False
    object cxLabel17: TcxLabel
      Left = 32
      Top = 32
      Caption = #36153#29992#31867#22411#65306
    end
    object ExpendType: TcxButtonEdit
      Left = 96
      Top = 28
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 1
      OnClick = ExpendTypeClick
      Width = 121
    end
    object cxLabel19: TcxLabel
      Left = 32
      Top = 96
      Caption = #36153#29992#37329#39069#65306
    end
    object ExpendMoney: TcxTextEdit
      Left = 96
      Top = 92
      TabOrder = 3
      Text = '0'
      Width = 121
    end
    object ExpendMan: TcxButtonEdit
      Left = 96
      Top = 156
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 121
    end
    object cxLabel18: TcxLabel
      Left = 20
      Top = 160
      Caption = #36153#29992#21457#29983#20154#65306
    end
    object cxGrid1: TcxGrid
      Left = 320
      Top = 16
      Width = 289
      Height = 169
      TabOrder = 6
      object GrdExpend: TcxGridDBTableView
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
        GridView = GrdExpend
      end
    end
    object BtnAdd: TcxButton
      Left = 232
      Top = 64
      Width = 75
      Height = 25
      Caption = '---->>>'
      TabOrder = 7
      OnClick = BtnAddClick
    end
    object BtnDel: TcxButton
      Left = 232
      Top = 120
      Width = 75
      Height = 25
      Caption = '<<<----'
      TabOrder = 8
      OnClick = BtnDelClick
    end
  end
  object BtnSure: TcxButton [3]
    Left = 192
    Top = 216
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 7
    OnClick = BtnSureClick
  end
  object BtnExit: TcxButton [4]
    Left = 400
    Top = 216
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 8
    OnClick = BtnExitClick
  end
  inherited xpmn1: TXPMenu
    Left = 104
    Top = 8
  end
  inherited actlst1: TActionList
    Left = 176
    Top = 8
  end
  inherited imList: TImageList
    Left = 320
    Top = 9
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 392
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
    Left = 248
    Top = 8
  end
  object DSSerProc: TDataSource
    DataSet = DataBaseModule.AdoSerProc
    Left = 64
    Top = 288
  end
  object LAdoExpend: TbainaADOQuery
    Connection = DataBaseModule.dtclsData
    LockType = ltBatchOptimistic
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
    Left = 377
    Top = 261
  end
  object LDSExpend: TDataSource
    DataSet = LAdoExpend
    Left = 377
    Top = 293
  end
end
