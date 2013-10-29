inherited Frm_EventEdit: TFrm_EventEdit
  Left = 425
  Top = 127
  Caption = #20107#20214
  ClientHeight = 401
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlButtons: TPanel
    Top = 363
  end
  inherited pnlCaption: TPanel
    Height = 96
    inherited lbLocation: TLabel
      Top = 70
    end
    inherited lbLabel: TLabel
      Left = 296
      Top = 70
    end
    inherited teLocation: TcxTextEdit
      Top = 66
    end
    inherited icbLabel: TcxImageComboBox
      Top = 66
    end
    object EdtCust: TcxButtonEdit
      Left = 78
      Top = 40
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 3
      OnClick = EdtCustClick
      Width = 213
    end
    object EdtUser: TcxButtonEdit
      Left = 362
      Top = 40
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 4
      OnClick = EdtUserClick
      Width = 153
    end
    object cxLabel1: TcxLabel
      Left = 11
      Top = 44
      Caption = #23458#25143#21517#31216#65306
    end
    object cxLabel2: TcxLabel
      Left = 304
      Top = 44
      Caption = #32852#31995#20154#65306
    end
  end
  inherited pnlTime: TPanel
    Top = 137
    Height = 72
  end
  inherited pnlRecurrenceInfo: TPanel
    Top = 209
  end
  inherited pnlPlaceHolder: TPanel
    Top = 292
  end
  inherited pnlMessage: TPanel
    Top = 335
    Height = 28
    inherited Bevel1: TBevel
      Top = 20
    end
    inherited meMessage: TcxMemo
      Height = 2
    end
  end
  inherited pnlResource: TPanel
    Top = 249
  end
  object LAdoCust: TbainaADOQuery
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
    Left = 336
    Top = 169
  end
  object LAdoContact: TbainaADOQuery
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
    Left = 384
    Top = 169
  end
  object LDSCust: TDataSource
    DataSet = LAdoCust
    Left = 336
    Top = 209
  end
  object LDSContact: TDataSource
    DataSet = LAdoContact
    Left = 384
    Top = 209
  end
end
