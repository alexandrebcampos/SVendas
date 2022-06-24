unit ufrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModelo, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadCliente = class(TfrmModelo)
    Label1: TLabel;
    Label2: TLabel;
    dbeCPF: TDBEdit;
    Label3: TLabel;
    dbeNome: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeEmail: TDBEdit;
    Label6: TLabel;
    dbeTel: TDBEdit;
    Label7: TLabel;
    dbeCel: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbeNascimento: TDBEdit;
    Label10: TLabel;
    dbeDataCadastro: TDBEdit;
    Label11: TLabel;
    dbeDataInativo: TDBEdit;
    cbxSituacao: TDBComboBox;
    cbxSexo: TDBComboBox;
    cbxOperadora: TDBComboBox;
    btnChecaCPF: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure sbRodapeModeloDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure btnChecaCPFClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure LimpaCampos;
    procedure VerificaCPF;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

const
  msgEdit = 'Dados editado com sucesso!';
  msgSave = 'Dados inseridos com sucesso!';
  cpf = 'CPF já cadastrado!';
  msg = 'Campo Obrigatório!';

implementation

{$R *.dfm}

uses udmCliente;

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
      btnChecaCPF.Enabled := True;
    dbeCPF.Enabled := true;
end;

procedure TfrmCadCliente.btnChecaCPFClick(Sender: TObject);
begin
  VerificaCPF;

end;

procedure TfrmCadCliente.btnEditarClick(Sender: TObject);
begin
  inherited;
  if dsTabela.DataSet.State in [dsBrowse, dsEdit, dsInsert] then
  begin
    if dmCliente.ztbClienteC_SITUACAO.Value = 'INATIVO' then
    begin
      dmCliente.ztbClienteC_DATA_INATIVO.Value := now;
    end;

    dsTabela.DataSet.Post;
     dsTabela.DataSet.Close;
    ShowMessage(msgEdit);
  end
  else
  begin
    abort;
  end;

end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
begin
  inherited;
    btnChecaCPF.Enabled := true;
    dbeCPF.Enabled := true;
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
    btnChecaCPF.Enabled := true;
    dbeCPF.Enabled := true;
    dbeCPF.SetFocus;
end;

procedure TfrmCadCliente.btnOKClick(Sender: TObject);
begin
  inherited;
    btnChecaCPF.Enabled := False;
    dbeCPF.Enabled := false;
end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
begin
  inherited;
   if ((cbxSituacao.Text = EmptyStr) or (dbeCPF.Text = EmptyStr) or
   (dbeNome.Text = EmptyStr) or (cbxSexo.Text = EmptyStr) or
   (dbeEmail.Text = EmptyStr) or (dbeTel.Text = EmptyStr) or
   (dbeCel.Text = EmptyStr) or (cbxOperadora.Text = EmptyStr) or
   (dbeNascimento.Text = EmptyStr)) then
   begin
      ShowMessage('Preencha todos os campos!');
      gbDados.Enabled := true;
      btnCancelar.Enabled := true;
   end
   else
   begin
        if dsTabela.DataSet.State in [dsBrowse, dsInsert] then
        begin
          if dmCliente.ztbClienteC_SITUACAO.Value = 'ATIVO' then
          begin
            dmCliente.ztbClienteC_DATA_CADASTRO.Value := now;
          end;

          dsTabela.DataSet.Post;
           dsTabela.DataSet.Close;
          ShowMessage(msgSave);
          btnSalvar.Enabled := false;
        end
        else
        begin
          abort;
        end;
   end;

end;

procedure TfrmCadCliente.LimpaCampos;
begin
  cbxSituacao.ItemIndex := -1;
  dbeCPF.Clear;
  dbeNome.Clear;
  cbxSexo.ItemIndex := -1;
  dbeEmail.Clear;
  dbeTel.Clear;
  dbeCel.Clear;
  cbxOperadora.ItemIndex := -1;
  dbeNascimento.Clear;
  dbeDataCadastro.Clear;
  dbeDataInativo.Clear;
end;

procedure TfrmCadCliente.sbRodapeModeloDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  inherited;
  with sbRodapeModelo.Canvas do
  begin
    if Panel.Index = 0 then
    begin
      Font.Size := 9;
      Font.Name := 'Verdana';
      Font.Style := [fsBold];
      TextOut(Rect.Left + 55 + Font.Size, Rect.Top + 1, Panel.Text);
    end;
  end;
end;

procedure TfrmCadCliente.VerificaCPF;
begin
  with dmCliente.zqrVerificaCPF do
  begin
    Close;
    Params[0].AsString := dbeCPF.Text;
    Open;

    if RecordCount > 0 then
    begin
      ShowMessage(cpf);
    end
    else
    begin
      abort;
    end;
  end;
end;

end.
