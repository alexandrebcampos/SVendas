unit ufrmCadFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModelo, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadFuncionario = class(TfrmModelo)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeNome: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeUsuario: TDBEdit;
    Label6: TLabel;
    dbeSenha: TDBEdit;
    Label7: TLabel;
    dbeDataCadastro: TDBEdit;
    Label8: TLabel;
    dbeDataInativo: TDBEdit;
    cbxSituacao: TDBComboBox;
    cbxSexo: TDBComboBox;
    cbxFuncao: TDBComboBox;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

const
  msgEdit = 'Dados editado com sucesso!';
  msgSave = 'Dados inseridos com sucesso!';

implementation

{$R *.dfm}

uses udmFuncionario;

procedure TfrmCadFuncionario.btnEditarClick(Sender: TObject);
begin
  inherited;
  if dsTabela.DataSet.State in [dsBrowse, dsEdit, dsInsert] then
  begin
    if dmFuncionario.ztbFuncionarioF_SITUACAO.Value = 'INATIVO' then
    begin
      dmFuncionario.ztbFuncionarioF_DATA_INATIVO.Value := now;
    end;

    dsTabela.DataSet.Post;
     dsTabela.DataSet.Close;
    ShowMessage(msgEdit);
  end
  else
  begin
    ShowMessage('Favor executar uma operação.');
  end;

end;

procedure TfrmCadFuncionario.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if ((cbxSituacao.Text = EmptyStr) or (cbxFuncao.Text = EmptyStr) or
      (dbeNome.Text = EmptyStr) or (cbxSexo.Text = EmptyStr) or
      (dbeUsuario.Text = EmptyStr) or (dbeSenha.Text = EmptyStr)) then
  begin
       ShowMessage('Preencha todos os campos!');
      gbDados.Enabled := true;
       btnCancelar.Enabled := true;
  end
  else
  begin
      if dsTabela.DataSet.State in [dsBrowse, dsInsert] then
      begin
        if dmFuncionario.ztbFuncionarioF_SITUACAO.Value = 'ATIVO' then
        begin
          dmFuncionario.ztbFuncionarioF_DATA_CADASTRO.Value := now;
        end;

        dsTabela.DataSet.Post;
         dsTabela.DataSet.Close;
        ShowMessage(msgSave);
        btnSalvar.Enabled := false;
      end
      else
      begin
        ShowMessage('Favor executar uma operação.');
      end;
  end;
end;

end.
