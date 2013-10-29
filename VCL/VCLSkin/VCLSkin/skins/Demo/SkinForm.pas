unit SkinForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  Buttons, ComCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGroupBox, cxButtons, cxPC, Grids, DBGrids, ExtCtrls, StdCtrls,
  cxRadioGroup, cxCheckBox, cxMaskEdit, cxButtonEdit, cxContainer,
  cxTextEdit, WinSkinData, ToolWin;

type
  TForm2 = class(TForm)
    CoolBar1: TCoolBar;
    SkinData1: TSkinData;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N2: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N3: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    cxTextEdit2: TcxTextEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxCheckBox2: TcxCheckBox;
    cxRadioButton2: TcxRadioButton;
    ListBox1: TListBox;
    TabSheet3: TTabSheet;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxTextEdit1: TcxTextEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxButton1: TcxButton;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxCheckBox1: TcxCheckBox;
    cxRadioButton1: TcxRadioButton;
    PB: TProgressBar;
    StatusBar1: TStatusBar;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ToolBar1: TToolBar;
    TrackBar1: TTrackBar;
    MonthCalendar1: TMonthCalendar;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  I:Integer;
begin
  FOR I:=1 TO PB.Max DO
    Begin
      PB.Position:=PB.Position+1;
    End;
end;

end.
