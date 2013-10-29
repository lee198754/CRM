unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, ToolWin, Grids, DBGrids, ExtCtrls, StdCtrls,
  Menus, WinSkinStore, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, cxLookAndFeelPainters, cxRadioGroup,
  cxCheckBox, cxGroupBox, cxButtons, cxMaskEdit, cxButtonEdit, cxContainer,
  cxTextEdit, WinSkinData, FileCtrl;

type
  TForm1 = class(TForm)
    DirectoryListBox2: TDirectoryListBox;
    FileListBox1: TFileListBox;
    DriveComboBox1: TDriveComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TmpCount:Integer;
  end;

var
  Form1: TForm1;

implementation

uses SkinForm;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TmpCount:=0;
end;

procedure TForm1.FileListBox1Click(Sender: TObject);
var
  TmpFile:String;
begin
  IF (Form2<>Nil) And (Assigned(Form2)) Then
    Form2.Close;
  Form2:=TForm2.Create(Self);
  TmpFile:=FileListBox1.FileName;
  Form2.SkinData1.SkinFile:=TmpFile;
  Form2.SkinData1.Active:=True;
  Form2.Show;
end;

end.
