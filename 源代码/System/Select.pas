unit Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDataFrom, cxLookAndFeels, dxBar, dxBarExtItems, cxClasses,
  ImgList, ActnList, XPMenu, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxGraphics, cxDropDownEdit, DB, ADODB,
  bainaADOQuery, cxCheckBox;

type
  TFrm_Select = class(TBaseData_Frm)
    EdtMain: TcxButtonEdit;
    cxLabel1: TcxLabel;
    BtnSure: TcxButton;
    BtnExit: TcxButton;
    EdtCust: TcxTextEdit;
    cxLabel2: TcxLabel;
    LAdoUser: TbainaADOQuery;
    LDSUser: TDataSource;
    CBIFMain: TCheckBox;
    Query: TbainaADOQuery;
    procedure EdtMainClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSureClick(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    OldSelect:String;
  public
    { Public declarations }
  end;

var
  Frm_Select: TFrm_Select;

implementation

uses DataBase, Search, NewExpend, PreService, PublicClass;

{$R *.dfm}

procedure TFrm_Select.EdtMainClick(Sender: TObject);
begin
  inherited;
      Frm_Search:=TFrm_Search.Create(Self);
      Frm_Search.GrdSearch.CreateColumn;
      Frm_Search.GrdSearch.Columns[0].Name:='SearchColumns0';

      Frm_Search.GrdSearch.Columns[0].Caption:='名称';

      LAdoUser.Close;
      LAdoUser.SQL.Clear;
      LAdoUser.SQL.Add('Select UserID_,UserName_ From Users_ Where DeptID_=:DeptID');
      LAdoUser.Parameters.ParamByName('DeptID').Value:=Databasemodule.dtclsData.DeptID_;
      LAdoUser.Prepared;
      LAdoUser.Open;

      Frm_Search.GrdSearch.DataController.DataSource:=Frm_Select.LDSUser;
      Frm_Search.GrdSearch.Columns[0].DataBinding;
      Frm_Search.GrdSearch.Columns[0].DataBinding.FieldName:='UserName_';
      Frm_Search.GrdSearch.Columns[0].DataBinding.ValueType:='String';
      Frm_Search.FrmName:='Frm_Select';
      Frm_search.ShowModal;
end;

procedure TFrm_Select.FormCreate(Sender: TObject);
begin
  inherited;
  With DatabaseModule Do
    Begin
      IF AdoPreService.State=DSBrowse Then
        Begin
          IF Not (AdoPreService.IsEmpty) Then
            Begin
              IF (AdoPreService.FieldByName('IFCheck').AsBoolean=Boolean(0)) Then //(AdoPreService.FieldByName('IFSelect').AsBoolean=Boolean(0)) And 
                Begin
                  IF ISAdd=True Then
                    Begin
                      IF AdoPreService.FieldByName('BelongID').AsInteger>0 Then CBIFMain.Enabled:=False;
                      EdtCust.Text:=AdoPreService.FieldByName('CustName').AsString;
                    End;
                  IF (ISEdit=True) And (Not AdoSelect.IsEmpty) Then
                    Begin
                      OldSelect:=AdoSelect.FieldByName('SelectUser').AsString;
                      EdtCust.Text:=AdoPreService.FieldByName('CustName').AsString;
                      EdtMain.Text:=AdoSelect.FieldByName('SelectUser').AsString;
                      CBIFMain.Checked:=AdoSelect.FieldByName('IFMain').AsBoolean;
                    End;
                End;
            End;
        End;
    End;
end;

procedure TFrm_Select.BtnSureClick(Sender: TObject);
begin
  inherited;
  IF (EdtCust.Text<>'') And (EdtMain.Text<>'') Then
    Begin
      With DatabaseModule Do
        Begin
          DtClsData.BeginTrans;
          Try
          IF ISAdd=True Then
            Begin

              IF CBIFMain.Checked Then
                Begin
                  IF AdoPreService.FieldByName('BelongID').AsString='' Then
                    Begin
                      AdoPreService.Edit;
                      AdoPreService.FieldByName('BelongID').AsInteger:=LAdoUser.FieldByName('UserID_').AsInteger;
                      AdoPreService.FieldByName('IFSelect').AsBoolean:=Boolean(1);
                      AdoPreService.Post;
                    End
                  Else
                    Begin
                      Application.MessageBox('主维护人员已设定','提示',MB_OK+MB_Iconwarning);
                      DtClsData.RollbackTrans;
                      Exit;
                    End;
                End;



              AdoSelect.Append;
              AdoSelect.FieldByName('ServiceNum').AsInteger:=AdoPreService.FieldByName('ServiceID').AsInteger;
              AdoSelect.FieldByName('Selectuser').AsString:= EdtMain.Text;
              AdoSelect.FieldByName('UserID').AsInteger:= LAdoUser.FieldBYname('UserID_').AsInteger;
              IF CBIFMain.Checked Then AdoSelect.FieldByName('IFMain').AsBoolean:=Boolean(1)
              Else AdoSelect.FieldByName('IFMain').AsBoolean:=Boolean(0);
              AdoSelect.FieldByName('CreateBy_').AsString:=DtclsData.UserName_;
              AdoSelect.FieldByName('CreateD_').AsDateTime:=Date;
              AdoSelect.Post;
              DtclsData.CommitTrans;
              EdtMain.Text:='';
              CBIFMain.Checked:=False;
            End;
          IF ISEdit=True Then
            Begin
              IF OldSelect<>EdtMain.Text Then
                Begin
                  Query.Close;
                  Query.SQL.Clear;
                  Query.SQL.Add('Select * From SelectUser Where SelectUser=:SelectUser And ServiceNum=:ServiceNum');
                  Query.Parameters.ParamByName('SelectUser').Value:=EdtMain.Text;
                  Query.Parameters.ParamByName('ServiceNum').Value:=AdoPreService.FieldByName('ServiceID').AsInteger;
                  Query.Prepared;
                  Query.Open;
                  IF Query.IsEmpty Then
                    Begin
                      IF CBIFMain.Checked Then
                        Begin
                          IF AdoPreService.FieldByName('BelongID').AsString<>'' Then
                            Begin
                              IF Not (AdoPreService.FieldByName('BelongID').AsInteger=LAdoUser.FieldByName('UserID_').AsInteger) Then
                                Begin
                                  Application.MessageBox('主维护人员已经设定,如要重新安排,请先修改主维护人员.','提示',MB_OK+MB_Iconwarning);
                                  DtclsData.RollbackTrans;
                                  Exit;
                                End;
                            End
                          Else
                            Begin
                              AdoPreService.Edit;
                              AdoPreService.FieldByName('BelongID').AsInteger:=LAdoUser.FieldByName('UserID_').AsInteger;
                              AdoPreservice.FieldByName('IFSelect').AsBoolean:=Boolean(1);
                              AdoPreService.Post;
                            End;
                        End;
                    End
                  Else
                    Begin
                      Application.MessageBox('该维护人员已在维护列表中','提示',MB_OK+MB_Iconwarning);
                      DtclsData.RollbackTrans;
                      Exit;
                    End;
                End
              Else
                Begin
                  IF CBIFMain.Checked Then
                    Begin
                          IF AdoPreService.FieldByName('BelongID').AsString<>'' Then
                            Begin
                              IF Not (AdoPreService.FieldByName('BelongID').AsInteger=AdoSelect.FieldByName('UserID').AsInteger) Then
                                Begin
                                  Application.MessageBox('主维护人员已经设定,如要重新安排,请先修改主维护人员.','提示',MB_OK+MB_Iconwarning);
                                  DtclsData.RollbackTrans;
                                  Exit;
                                End;
                            End
                          Else
                            Begin
                              AdoPreService.Edit;
                              AdoPreService.FieldByName('BelongID').AsInteger:=AdoSelect.FieldByName('UserID').AsInteger;
                              AdoPreservice.FieldByName('IFSelect').AsBoolean:=Boolean(1);
                              AdoPreService.Post;
                            End;
                    End
                  Else
                    Begin
                          IF AdoPreService.FieldByName('BelongID').AsString<>'' Then
                            Begin
                              IF AdoPreService.FieldByName('BelongID').AsInteger=AdoSelect.FieldByName('UserID').AsInteger Then
                                Begin
                                  AdoPreService.Edit;
                                  AdoPreService.FieldByName('BelongID').AsString:='';
                                  AdoPreService.FieldByName('IFSelect').AsBoolean:=Boolean(0);
                                  AdoPreService.Post;
                                End;
                            End;
                    End;
                End;

              AdoSelect.Edit;
              AdoSelect.FieldByName('Selectuser').AsString:= EdtMain.Text;
              IF CBIFMain.Checked Then AdoSelect.FieldByName('IFMain').AsBoolean:=Boolean(1)
              Else AdoSelect.FieldByName('IFMain').AsBoolean:=Boolean(0);
              AdoSelect.FieldByName('UpdateBy_').AsString:=DtclsData.UserName_;
              AdoSelect.FieldByName('UpdateD_').AsDateTime:=Date;
              AdoSelect.Post;
              DtclsData.CommitTrans;
              BtnExit.Click;
            End;
          Except
            DtclsData.RollbackTrans;
            Raise
          End;
        End;
    End
  Else Application.MessageBox('请选择要维护的客户和维护人员','提示',MB_OK+MB_Iconwarning);
end;

procedure TFrm_Select.BtnExitClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFrm_Select.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ISAdd:=False;
  ISEdit:=False;
  Action:=CaFree;
end;

end.
