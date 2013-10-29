unit Day;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, dxBar, cxLookAndFeels, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, Menus, cxStyles, cxGraphics, cxEdit,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerDateNavigator, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxControls,
  cxSchedulerDBStorage, DB;

type
  TFrm_Day = class(TBaseData_Frm)
    cxScheduler1: TcxScheduler;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Day: TFrm_Day;

implementation

uses DataBase, MainFrm;

{$R *.dfm}

end.
