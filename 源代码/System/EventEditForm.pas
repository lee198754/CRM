unit EventEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxSchedulerEventEditor, Menus, cxLookAndFeelPainters,
  cxGraphics, cxLabel, cxButtonEdit, cxCheckComboBox, cxMemo,
  cxDropDownEdit, cxCheckBox, cxSpinEdit, cxTimeEdit, cxCalendar,
  cxMaskEdit, cxImageComboBox, cxTextEdit, StdCtrls, cxControls,
  cxContainer, cxEdit, cxGroupBox, ExtCtrls, cxButtons, DB, ADODB,
  bainaADOQuery;

type
  TFrm_EventEdit = class(TcxSchedulerEventEditorForm)
    EdtCust: TcxButtonEdit;
    EdtUser: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    LAdoCust: TbainaADOQuery;
    LAdoContact: TbainaADOQuery;
    LDSCust: TDataSource;
    LDSContact: TDataSource;
    procedure EdtCustClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtUserClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure LoadEventValuesIntoControls; override;
    procedure UpdateEventValuesFromControls; override;
  
  public
    { Public declarations }
  end;

var
  Frm_EventEdit: TFrm_EventEdit;

implementation

uses
  cxSchedulerDialogs, DataBase, PublicClass, Search, Contract;



{$R *.dfm}

{ TFrm_EventEdit }

procedure TFrm_EventEdit.LoadEventValuesIntoControls;
begin
  inherited LoadEventValuesIntoControls;

  Case PNActive OF
  1:Begin
      DeStart.Date:=Date;
      DeEnd.Date:=Date;
      
      EdtCust.EditValue:=DatabaseModule.AdoCust.FieldByName('CustName').AsString;
      EdtUser.EditValue:=DatabaseModule.AdoActive.FieldByName('ContactName').AsString;

    End;
  2:Begin
      DeStart.Date:=Date;
      DeEnd.Date:=Date;
      EdtCust.EditValue:=DatabaseModule.AdoContract.FieldByName('CustName').AsString;
      EdtUser.EditValue:=DatabaseModule.AdoActive.FieldByName('ContactName').AsString;
    End;
  Else
    Begin
      EdtCust.EditValue:=Event.GetCustomFieldValueByName('CustName');
      EdtUser.EditValue:=Event.GetCustomFieldValueByName('ContactName');
    End;
  End;
  FModified:=True;
end;

procedure TFrm_EventEdit.UpdateEventValuesFromControls;
begin
  inherited UpdateEventValuesFromControls;
  
  IF PNActive=1 Then
    Begin
      Event.SetCustomFieldValueByName('CustID',DatabaseModule.AdoCust.FieldByName('CustID').AsInteger);
    End
  Else
    Begin
      IF PNActive=2 Then  Event.SetCustomFieldValueByName('CustID',DatabaseModule.AdoContract.FieldByName('CustID').AsInteger)
      Else
        Begin
          IF Not (EdtCust.Text='') Then Event.SetCustomFieldValueByName('CustID',LAdoCust.FieldByName('CustID').AsInteger);
        End;
    End;
  IF Not (EdtUser.Text='') Then Event.SetCustomFieldValueByName('ContactName',EdtUser.EditValue);
  IF Not (EdtCust.Text='') Then Event.SetCustomFieldValueByName('CustName',EdtCust.EditValue);
  Event.SetCustomFieldValueByName('CreateBy_',DatabaseModule.dtclsData.UserID_);
  Event.SetCustomFieldValueByName('CreateD_',Date);
  Event.SetCustomFieldValueByName('BelongID',DatabaseModule.dtclsData.UserID_);

  FModified:=True;  
end;

procedure TFrm_EventEdit.EdtCustClick(Sender: TObject);
begin
  inherited;
  IF PNActive=1 Then Exit;
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=LDSCust;
  Frm_Search.GrdSearch.Columns[0].Caption:='客户名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='CustName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_EventEdit';
  Frm_search.ShowModal;
  EdtCust.Text:=LAdoCust.FieldByName('CustName').AsString;
end;

procedure TFrm_EventEdit.FormCreate(Sender: TObject);
begin
  inherited;
  LAdoCust.Close;
  LAdoCust.SQL.Clear;
  LAdoCust.SQL.Add('Select CustID,CustName From Customer where BelongID=:UserID');
  LAdoCust.Parameters.ParamByName('UserID').Value:=DatabaseModule.dtclsData.UserID_;
  LAdoCust.Prepared;
  LAdoCust.Open;
end;

procedure TFrm_EventEdit.EdtUserClick(Sender: TObject);
begin
  inherited;
  IF (EdtCust.Text='') OR (PNActive=1) Then Exit;
  LAdoContact.Close;
  LAdoContact.SQL.Clear;
  LAdoContact.SQL.Add('Select CustID,ContactName From Contact where CustID=:CustID');
  LAdoContact.Parameters.ParamByName('CustID').Value:=LAdoCust.FieldByName('CustID').AsInteger;
  LAdoContact.Prepared;
  LAdoContact.Open;
  
  Frm_Search:=TFrm_Search.Create(Self);
  Frm_Search.GrdSearch.CreateColumn;
  Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';
  Frm_Search.GrdSearch.DataController.DataSource:=LDSContact;
  Frm_Search.GrdSearch.Columns[0].Caption:='联系人名称';
  Frm_Search.GrdSearch.Columns[0].DataBinding;
  Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='ContactName';
  Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
  Frm_Search.FrmName:='Frm_EventEdit';
  Frm_search.ShowModal;

  EdtUser.Text:=LAdoContact.FieldByName('ContactName').AsString;
end;

procedure TFrm_EventEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PNActive:=0;
end;

initialization
  cxEventEditorClass := TFrm_EventEdit;

end.
