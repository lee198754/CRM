unit TMNC_OCX_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2013/7/31 14:06:37 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\lpj\Work\CRM\VCL\ocx\TMNC_OCX.ocx (1)
// LIBID: {D186FA4C-415B-4D86-A642-213FCF661A2C}
// LCID: 0
// Helpfile: 
// HelpString: TMNC_OCX Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  TMNC_OCXMajorVersion = 1;
  TMNC_OCXMinorVersion = 0;

  LIBID_TMNC_OCX: TGUID = '{D186FA4C-415B-4D86-A642-213FCF661A2C}';

  IID_ITMNC_OCXX: TGUID = '{7F9A12C3-5326-44DC-9EE2-B1AF9CD77871}';
  DIID_ITMNC_OCXXEvents: TGUID = '{60CB1E50-EF6D-4C4F-A36A-0860E1352059}';
  CLASS_TMNC_OCXX: TGUID = '{E94560D6-0ADA-4303-83C3-1FC615519DC3}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ITMNC_OCXX = interface;
  ITMNC_OCXXDisp = dispinterface;
  ITMNC_OCXXEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  TMNC_OCXX = ITMNC_OCXX;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPUserType1 = ^IFontDisp; {*}


// *********************************************************************//
// Interface: ITMNC_OCXX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7F9A12C3-5326-44DC-9EE2-B1AF9CD77871}
// *********************************************************************//
  ITMNC_OCXX = interface(IDispatch)
    ['{7F9A12C3-5326-44DC-9EE2-B1AF9CD77871}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure EC_Connect(const sHost: WideString); safecall;
    procedure EC_DisConnect; safecall;
    procedure EC_StartMonitor(iCh: Integer); safecall;
    procedure EC_StopMonitor; safecall;
    procedure EC_PlayFile(const sFile: WideString); safecall;
    procedure EC_PlayFileEx(const sHost: WideString; const sFile: WideString); safecall;
    procedure EC_StopPlay; safecall;
    procedure EC_DownLoadFile(const sFileName: WideString; const sSaveTo: WideString); safecall;
    procedure EC_DownLoadFileEx(const sHost: WideString; const sFileName: WideString; 
                                const sSaveTo: WideString); safecall;
    procedure EC_SetLoginInfo(const UserCode: WideString; const Password: WideString); safecall;
    procedure EC_SetLimitedTel(const TelNum: WideString; const UserCode: WideString); safecall;
    procedure EC_SoftDialOut(const PhoneNumFrom: WideString; const PhoneNumTo: WideString); safecall;
    procedure EC_StopSoftDialOut(const PhoneNumFrom: WideString); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  ITMNC_OCXXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7F9A12C3-5326-44DC-9EE2-B1AF9CD77871}
// *********************************************************************//
  ITMNC_OCXXDisp = dispinterface
    ['{7F9A12C3-5326-44DC-9EE2-B1AF9CD77871}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
    procedure EC_Connect(const sHost: WideString); dispid 217;
    procedure EC_DisConnect; dispid 220;
    procedure EC_StartMonitor(iCh: Integer); dispid 221;
    procedure EC_StopMonitor; dispid 222;
    procedure EC_PlayFile(const sFile: WideString); dispid 218;
    procedure EC_PlayFileEx(const sHost: WideString; const sFile: WideString); dispid 226;
    procedure EC_StopPlay; dispid 228;
    procedure EC_DownLoadFile(const sFileName: WideString; const sSaveTo: WideString); dispid 219;
    procedure EC_DownLoadFileEx(const sHost: WideString; const sFileName: WideString; 
                                const sSaveTo: WideString); dispid 227;
    procedure EC_SetLoginInfo(const UserCode: WideString; const Password: WideString); dispid 223;
    procedure EC_SetLimitedTel(const TelNum: WideString; const UserCode: WideString); dispid 224;
    procedure EC_SoftDialOut(const PhoneNumFrom: WideString; const PhoneNumTo: WideString); dispid 225;
    procedure EC_StopSoftDialOut(const PhoneNumFrom: WideString); dispid 229;
  end;

// *********************************************************************//
// DispIntf:  ITMNC_OCXXEvents
// Flags:     (4096) Dispatchable
// GUID:      {60CB1E50-EF6D-4C4F-A36A-0860E1352059}
// *********************************************************************//
  ITMNC_OCXXEvents = dispinterface
    ['{60CB1E50-EF6D-4C4F-A36A-0860E1352059}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
    procedure OnCallIn(const LocalNum: WideString; const CallInNum: WideString); dispid 209;
    procedure OnCallOut(const LocalNum: WideString; const CallOutNum: WideString); dispid 210;
    procedure OnRecFile(const LocalNum: WideString; const RecFile: WideString; 
                        const DateTime: WideString; IO: SYSINT; Len: SYSINT; 
                        const RemoteNum: WideString); dispid 211;
    procedure OnConnect(const sHost: WideString); dispid 212;
    procedure OnDisConnect(const sHost: WideString); dispid 213;
    procedure OnNoAnswer(const LocalNum: WideString; const CallID: WideString); dispid 214;
    procedure OnFilePlayEnd; dispid 215;
    procedure OnLeaveMessage(const LocalNum: WideString; const lmFile: WideString; 
                             const DateTime: WideString; Len: SYSINT; const RemoteNum: WideString); dispid 216;
    procedure OnPlayClick(var sHost: WideString; var sFile: WideString); dispid 217;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTMNC_OCXX
// Help String      : TMNC_OCXX Control
// Default Interface: ITMNC_OCXX
// Def. Intf. DISP? : No
// Event   Interface: ITMNC_OCXXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TTMNC_OCXXOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;
  TTMNC_OCXXOnCallIn = procedure(ASender: TObject; const LocalNum: WideString; 
                                                   const CallInNum: WideString) of object;
  TTMNC_OCXXOnCallOut = procedure(ASender: TObject; const LocalNum: WideString; 
                                                    const CallOutNum: WideString) of object;
  TTMNC_OCXXOnRecFile = procedure(ASender: TObject; const LocalNum: WideString; 
                                                    const RecFile: WideString; 
                                                    const DateTime: WideString; IO: SYSINT; 
                                                    Len: SYSINT; const RemoteNum: WideString) of object;
  TTMNC_OCXXOnConnect = procedure(ASender: TObject; const sHost: WideString) of object;
  TTMNC_OCXXOnDisConnect = procedure(ASender: TObject; const sHost: WideString) of object;
  TTMNC_OCXXOnNoAnswer = procedure(ASender: TObject; const LocalNum: WideString; 
                                                     const CallID: WideString) of object;
  TTMNC_OCXXOnLeaveMessage = procedure(ASender: TObject; const LocalNum: WideString; 
                                                         const lmFile: WideString; 
                                                         const DateTime: WideString; Len: SYSINT; 
                                                         const RemoteNum: WideString) of object;
  TTMNC_OCXXOnPlayClick = procedure(ASender: TObject; var sHost: WideString; var sFile: WideString) of object;

  TTMNC_OCXX = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TTMNC_OCXXOnKeyPress;
    FOnPaint: TNotifyEvent;
    FOnCallIn: TTMNC_OCXXOnCallIn;
    FOnCallOut: TTMNC_OCXXOnCallOut;
    FOnRecFile: TTMNC_OCXXOnRecFile;
    FOnConnect: TTMNC_OCXXOnConnect;
    FOnDisConnect: TTMNC_OCXXOnDisConnect;
    FOnNoAnswer: TTMNC_OCXXOnNoAnswer;
    FOnFilePlayEnd: TNotifyEvent;
    FOnLeaveMessage: TTMNC_OCXXOnLeaveMessage;
    FOnPlayClick: TTMNC_OCXXOnPlayClick;
    FIntf: ITMNC_OCXX;
    function  GetControlInterface: ITMNC_OCXX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure EC_Connect(const sHost: WideString);
    procedure EC_DisConnect;
    procedure EC_StartMonitor(iCh: Integer);
    procedure EC_StopMonitor;
    procedure EC_PlayFile(const sFile: WideString);
    procedure EC_PlayFileEx(const sHost: WideString; const sFile: WideString);
    procedure EC_StopPlay;
    procedure EC_DownLoadFile(const sFileName: WideString; const sSaveTo: WideString);
    procedure EC_DownLoadFileEx(const sHost: WideString; const sFileName: WideString; 
                                const sSaveTo: WideString);
    procedure EC_SetLoginInfo(const UserCode: WideString; const Password: WideString);
    procedure EC_SetLimitedTel(const TelNum: WideString; const UserCode: WideString);
    procedure EC_SoftDialOut(const PhoneNumFrom: WideString; const PhoneNumTo: WideString);
    procedure EC_StopSoftDialOut(const PhoneNumFrom: WideString);
    property  ControlInterface: ITMNC_OCXX read GetControlInterface;
    property  DefaultInterface: ITMNC_OCXX read GetControlInterface;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property  ParentColor;
    property  ParentFont;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TTMNC_OCXXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
    property OnCallIn: TTMNC_OCXXOnCallIn read FOnCallIn write FOnCallIn;
    property OnCallOut: TTMNC_OCXXOnCallOut read FOnCallOut write FOnCallOut;
    property OnRecFile: TTMNC_OCXXOnRecFile read FOnRecFile write FOnRecFile;
    property OnConnect: TTMNC_OCXXOnConnect read FOnConnect write FOnConnect;
    property OnDisConnect: TTMNC_OCXXOnDisConnect read FOnDisConnect write FOnDisConnect;
    property OnNoAnswer: TTMNC_OCXXOnNoAnswer read FOnNoAnswer write FOnNoAnswer;
    property OnFilePlayEnd: TNotifyEvent read FOnFilePlayEnd write FOnFilePlayEnd;
    property OnLeaveMessage: TTMNC_OCXXOnLeaveMessage read FOnLeaveMessage write FOnLeaveMessage;
    property OnPlayClick: TTMNC_OCXXOnPlayClick read FOnPlayClick write FOnPlayClick;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TTMNC_OCXX.InitControlData;
const
  CEventDispIDs: array [0..16] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0, $000000D1, $000000D2, $000000D3, $000000D4,
    $000000D5, $000000D6, $000000D7, $000000D8, $000000D9);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{E94560D6-0ADA-4303-83C3-1FC615519DC3}';
    EventIID: '{60CB1E50-EF6D-4C4F-A36A-0860E1352059}';
    EventCount: 17;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TTMNC_OCXX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ITMNC_OCXX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTMNC_OCXX.GetControlInterface: ITMNC_OCXX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TTMNC_OCXX.EC_Connect(const sHost: WideString);
begin
  DefaultInterface.EC_Connect(sHost);
end;

procedure TTMNC_OCXX.EC_DisConnect;
begin
  DefaultInterface.EC_DisConnect;
end;

procedure TTMNC_OCXX.EC_StartMonitor(iCh: Integer);
begin
  DefaultInterface.EC_StartMonitor(iCh);
end;

procedure TTMNC_OCXX.EC_StopMonitor;
begin
  DefaultInterface.EC_StopMonitor;
end;

procedure TTMNC_OCXX.EC_PlayFile(const sFile: WideString);
begin
  DefaultInterface.EC_PlayFile(sFile);
end;

procedure TTMNC_OCXX.EC_PlayFileEx(const sHost: WideString; const sFile: WideString);
begin
  DefaultInterface.EC_PlayFileEx(sHost, sFile);
end;

procedure TTMNC_OCXX.EC_StopPlay;
begin
  DefaultInterface.EC_StopPlay;
end;

procedure TTMNC_OCXX.EC_DownLoadFile(const sFileName: WideString; const sSaveTo: WideString);
begin
  DefaultInterface.EC_DownLoadFile(sFileName, sSaveTo);
end;

procedure TTMNC_OCXX.EC_DownLoadFileEx(const sHost: WideString; const sFileName: WideString; 
                                       const sSaveTo: WideString);
begin
  DefaultInterface.EC_DownLoadFileEx(sHost, sFileName, sSaveTo);
end;

procedure TTMNC_OCXX.EC_SetLoginInfo(const UserCode: WideString; const Password: WideString);
begin
  DefaultInterface.EC_SetLoginInfo(UserCode, Password);
end;

procedure TTMNC_OCXX.EC_SetLimitedTel(const TelNum: WideString; const UserCode: WideString);
begin
  DefaultInterface.EC_SetLimitedTel(TelNum, UserCode);
end;

procedure TTMNC_OCXX.EC_SoftDialOut(const PhoneNumFrom: WideString; const PhoneNumTo: WideString);
begin
  DefaultInterface.EC_SoftDialOut(PhoneNumFrom, PhoneNumTo);
end;

procedure TTMNC_OCXX.EC_StopSoftDialOut(const PhoneNumFrom: WideString);
begin
  DefaultInterface.EC_StopSoftDialOut(PhoneNumFrom);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TTMNC_OCXX]);
end;

end.
