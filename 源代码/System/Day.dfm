inherited Frm_Day: TFrm_Day
  Left = 313
  Top = 167
  VertScrollBar.Range = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = #26085#31243#23433#25490
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object cxScheduler1: TcxScheduler [0]
    Left = 0
    Top = 0
    Width = 688
    Height = 446
    DateNavigator.RowCount = 2
    ViewDay.Active = True
    Align = alClient
    DialogsLookAndFeel.NativeStyle = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OptionsView.WorkDays = [dSunday, dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday]
    Storage = Main_Frm.Storage
    TabOrder = 4
    Splitters = {
      20020000FB000000AF020000000100001B0200000100000020020000BD010000}
    StoredClientBounds = {0100000001000000AF020000BD010000}
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Visible = False
    end
  end
  inherited dxbrpmn1: TdxBarPopupMenu
    Left = 256
    Top = 160
  end
end
