unit ufrmModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmModelo = class(TForm)
    sbRodapeModelo: TStatusBar;
    pnlBtnFechar: TPanel;
    btnFechar: TBitBtn;
    pgcPrincipal: TPageControl;
    tbsDados: TTabSheet;
    tbsPesquisar: TTabSheet;
    pnlBtnsdados: TPanel;
    btnLocalizar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnNovo: TBitBtn;
    gbDados: TGroupBox;
    dsTabela: TDataSource;
    pnlBtnPesq: TPanel;
    btnCancelarPesq: TBitBtn;
    btnOK: TBitBtn;
    gbFiltro: TGroupBox;
    gbRegistro: TGroupBox;
    lbFiltro: TLabel;
    edtFiltro: TButtonedEdit;
    btnPesquisar: TBitBtn;
    imgEdit: TImageList;
    dbgRegistro: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarPesqClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgRegistroTitleClick(Column: TColumn);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgRegistroCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModelo: TfrmModelo;
  CampoFiltro : string;

implementation

{$R *.dfm}

procedure TfrmModelo.btnCancelarClick(Sender: TObject);
begin
  if dsTabela.DataSet.State in [dsBrowse, dsEdit, dsInsert] then
  begin
    dsTabela.DataSet.Cancel;
    dsTabela.DataSet.Refresh;
    dsTabela.DataSet.Open;
    dsTabela.DataSet.Close;
    gbDados.Enabled := false;
    btnSalvar.Enabled := false;
    btnExcluir.Enabled := false;
    btnCancelar.Enabled := false;
    btnEditar.Enabled := false;
    btnNovo.Enabled := true;
    gbDados.Enabled := false;
  end
  else
  begin
    ShowMessage('Favor executar uma operação.');
  end;
end;

procedure TfrmModelo.btnCancelarPesqClick(Sender: TObject);
begin
  pgcPrincipal.ActivePage := tbsDados;
  tbsPesquisar.TabVisible := false;
  tbsPesquisar.Visible := false;
  tbsDados.TabVisible := true;
  tbsDados.Visible := true;
end;

procedure TfrmModelo.btnEditarClick(Sender: TObject);
begin
    btnSalvar.Enabled := false;
    btnExcluir.Enabled := false;
    btnCancelar.Enabled := false;
    btnEditar.Enabled := false;
    btnNovo.Enabled := true;
    gbDados.Enabled := false;
end;

procedure TfrmModelo.btnExcluirClick(Sender: TObject);
begin
    if dsTabela.DataSet.State in [dsBrowse, dsEdit] then
    begin
      if MessageBox(Application.Handle, Pchar('Deseja mesmo excluir esse registro?'), Pchar('Confirmação de Exclusão'), MB_YESNO+MB_ICONQUESTION) = ID_YES then
      begin
          dsTabela.DataSet.Delete;
          dsTabela.DataSet.Refresh;
          dsTabela.DataSet.close;
         btnSalvar.Enabled := false;
         btnExcluir.Enabled := false;
         btnCancelar.Enabled := false;
         btnEditar.Enabled := false;
         btnNovo.Enabled := true;
         gbDados.Enabled := false;
      end;
    end
    else
    begin
      ShowMessage('Favor localize um registro para excluir.');
    end;
end;

procedure TfrmModelo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModelo.btnLocalizarClick(Sender: TObject);
begin
  pgcPrincipal.ActivePage := tbsPesquisar;
  tbsPesquisar.TabVisible := true;
  tbsPesquisar.Visible := true;
  edtFiltro.Clear;
  btnPesquisar.Enabled := false;
  btnOK.Enabled := false;
  tbsDados.TabVisible := false;
  tbsDados.Visible := false;

end;

procedure TfrmModelo.btnNovoClick(Sender: TObject);
begin
  dsTabela.DataSet.Open;
  dsTabela.DataSet.Append;
  gbDados.Enabled := true;
  btnSalvar.Enabled := true;
  btnExcluir.Enabled := false;
  btnCancelar.Enabled := true;
end;

procedure TfrmModelo.btnOKClick(Sender: TObject);
begin
    pgcPrincipal.ActivePage := tbsDados;
    btnExcluir.Enabled := true;
    btnCancelar.Enabled := true;
    btnEditar.Enabled := true;
    btnNovo.Enabled := false;
    btnSalvar.Enabled := false;
    gbDados.Enabled := true;
    tbsPesquisar.TabVisible := false;
    tbsPesquisar.Visible := false;
    tbsDados.TabVisible := true;
    tbsDados.Visible := true;
end;

procedure TfrmModelo.btnPesquisarClick(Sender: TObject);
begin
  if dsTabela.DataSet.FieldByName(CampoFiltro) is TWideStringField then
  begin
    dsTabela.DataSet.Filter := CampoFiltro+' like ' + QuotedStr('*'+ edtFiltro.Text+'*');
  end
  else
  begin
    dsTabela.DataSet.Filter := CampoFiltro+' = ' +  edtFiltro.Text;
  end;

  dsTabela.DataSet.Filtered := true;
  dsTabela.DataSet.Open;
end;

procedure TfrmModelo.btnSalvarClick(Sender: TObject);
begin
    btnExcluir.Enabled := false;
    btnCancelar.Enabled := false;
    gbDados.Enabled := false;
end;

procedure TfrmModelo.dbgRegistroCellClick(Column: TColumn);
begin
  btnOK.Enabled := true;
end;

procedure TfrmModelo.dbgRegistroTitleClick(Column: TColumn);
begin
    lbFiltro.Caption := Column.Title.Caption+':';
  edtFiltro.Clear;
  CampoFiltro := Column.FieldName;

  edtFiltro.SetFocus;
end;

procedure TfrmModelo.edtFiltroChange(Sender: TObject);
begin
  if Length(edtFiltro.Text) = 0 then
  begin
    btnPesquisar.Enabled := false;
    btnOK.Enabled := False;
    dsTabela.DataSet.Filtered := False;
    dsTabela.DataSet.Close;
  end
  else
  begin
    btnPesquisar.Enabled := true;
  end;
end;

procedure TfrmModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := nil;
end;

procedure TfrmModelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    Self.Close;
  end;
end;

procedure TfrmModelo.FormShow(Sender: TObject);
begin
  lbFiltro.Caption := dbgRegistro.Columns[0].Title.Caption+':';
  edtFiltro.Clear;
  CampoFiltro := dbgRegistro.Columns[0].FieldName;

  dsTabela.DataSet.Filtered := false;

  pgcPrincipal.ActivePage := tbsDados;
end;

end.
