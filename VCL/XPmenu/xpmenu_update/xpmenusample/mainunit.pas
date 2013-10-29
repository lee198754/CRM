unit mainunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMenu, StdCtrls, Buttons, ExtCtrls, Menus, ImgList, ComCtrls,
  ToolWin,shellapi;

type
  TForm1 = class(TForm)
    ControlBar1: TControlBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton23: TToolButton;
    ToolButton3: TToolButton;
    ToolButton16: TToolButton;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton27: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton39: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton38: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton44: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton37: TToolButton;
    ToolButton35: TToolButton;
    ToolButton43: TToolButton;
    ToolButton36: TToolButton;
    ToolBar4: TToolBar;
    ToolButton4: TToolButton;
    ToolButton28: TToolButton;
    ToolButton40: TToolButton;
    ToolButton42: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    ToolButton50: TToolButton;
    ToolButton51: TToolButton;
    ToolButton52: TToolButton;
    ToolButton53: TToolButton;
    ToolButton54: TToolButton;
    ToolButton55: TToolButton;
    ToolBar3: TToolBar;
    ToolButton19: TToolButton;
    ToolButton18: TToolButton;
    ToolButton17: TToolButton;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    FileMenu: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FilePrintItem: TMenuItem;
    N4: TMenuItem;
    FileExitItem: TMenuItem;
    EditMenu: TMenuItem;
    EditUndoItem: TMenuItem;
    N2: TMenuItem;
    EditCutItem: TMenuItem;
    Copy2: TMenuItem;
    EditCopyItem: TMenuItem;
    EditPasteItem: TMenuItem;
    PasteSpecial1: TMenuItem;
    PastasHyperlink1: TMenuItem;
    N5: TMenuItem;
    Fill1: TMenuItem;
    Down1: TMenuItem;
    Right1: TMenuItem;
    Up1: TMenuItem;
    Left1: TMenuItem;
    OtherCopy1: TMenuItem;
    All1: TMenuItem;
    miEditFont: TMenuItem;
    View1: TMenuItem;
    Normal1: TMenuItem;
    PageBreak1: TMenuItem;
    PrintLayout1: TMenuItem;
    Outline1: TMenuItem;
    N3: TMenuItem;
    TaskPane1: TMenuItem;
    ToolBars1: TMenuItem;
    A1: TMenuItem;
    Ruler1: TMenuItem;
    DocumentMap1: TMenuItem;
    N6: TMenuItem;
    HeaderandFooter1: TMenuItem;
    Footnotes1: TMenuItem;
    Markip1: TMenuItem;
    FullScreen1: TMenuItem;
    Zoom1: TMenuItem;
    AAAA1: TMenuItem;
    sssssss1: TMenuItem;
    LanguageMenu: TMenuItem;
    LanguageEnglish: TMenuItem;
    LanguageFrench: TMenuItem;
    dddddddd1: TMenuItem;
    fffffffffffffff1: TMenuItem;
    N444444441: TMenuItem;
    rrrrrrrrrrrrrrr1: TMenuItem;
    gggggggggg1: TMenuItem;
    ggggggggggggg1: TMenuItem;
    LanguageGerman: TMenuItem;
    WordCount1: TMenuItem;
    AuotoSummary1: TMenuItem;
    Speech1: TMenuItem;
    N7: TMenuItem;
    TrackChanges1: TMenuItem;
    CompareandMerge1: TMenuItem;
    OnlineCollaboration1: TMenuItem;
    Bbbb1: TMenuItem;
    Cccc2: TMenuItem;
    N8: TMenuItem;
    LettersandMailings1: TMenuItem;
    Cccc1: TMenuItem;
    N9: TMenuItem;
    ToolsontheWeb1: TMenuItem;
    HelpMenu: TMenuItem;
    HelpItem: TMenuItem;
    OtherHelp1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    XPMenu1: TXPMenu;
    PopupMenu1: TPopupMenu;
    Undo1: TMenuItem;
    N10: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    OfficeClipboard1: TMenuItem;
    Paste1: TMenuItem;
    PasteSpecial2: TMenuItem;
    PasteasHyperlink1: TMenuItem;
    N11: TMenuItem;
    Fill2: TMenuItem;
    Down2: TMenuItem;
    Right2: TMenuItem;
    Up2: TMenuItem;
    Left2: TMenuItem;
    Clear1: TMenuItem;
    All2: TMenuItem;
    Find1: TMenuItem;
    Button4: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  bitbtn2.Enabled:=not bitbtn2.Enabled;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  speedbutton2.Enabled:=not speedbutton2.Enabled;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  shellexecute(handle,'open','http://www.tommstudio.com/',nil,nil,sw_normal);
end;

end.
