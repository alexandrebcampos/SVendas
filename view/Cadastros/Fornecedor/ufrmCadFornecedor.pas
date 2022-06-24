unit ufrmCadFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmModelo, Data.DB, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadFornecedor = class(TfrmModelo)
    Label1: TLabel;
    Label2: TLabel;
    dbeCNPJ: TDBEdit;
    Label3: TLabel;
    dbeRazaoSocial: TDBEdit;
    Label4: TLabel;
    dbeNomeFantasia: TDBEdit;
    Label5: TLabel;
    dbeTel: TDBEdit;
    Label6: TLabel;
    dbeEmail: TDBEdit;
    Label7: TLabel;
    dbeDataCadastro: TDBEdit;
    Label8: TLabel;
    dbeDataInativo: TDBEdit;
    cbxSituacao: TDBComboBox;
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFornecedor: TfrmCadFornecedor;

const
  msgEdit = 'Dados editado com sucesso!';
  msgSave = 'Dados inseridos com sucesso!';

implementation

{$R *.dfm}

uses udmFornecedor;

procedure TfrmCadFornecedor.btnEditarClick(Sender: TObject);
begin
  inherited;
   if dsTabela.DataSet.State in [dsBrowse, dsEdit, dsInsert] then
  begin
    if dmFornecedor.ztbFornecedorFO_SITUACAO.Value = 'INATIVO' then
    begin
      dmFornecedor.ztbFornecedorFO_DATA_INATIVO.Value := now;
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

procedure TfrmCadFornecedor.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if ((cbxSituacao.Text = EmptyStr) or (dbeCNPJ.Text = EmptyStr) or (dbeRazaoSocial.Text = EmptyStr) or
      (dbeNomeFantasia.Text = EmptyStr) or (dbeTel.Text = EmptyStr) or (dbeEmail.Text = EmptyStr)) then
  begin
      ShowMessage('Preencha todos os campos!');
      gbDados.Enabled := true;
       btnCancelar.Enabled := true;
  end
  else
  begin

      if dsTabela.DataSet.State in [dsBrowse, dsInsert] then
      begin
        if dmFornecedor.ztbFornecedorFO_SITUACAO.Value = 'ATIVO' then
        begin
          dmFornecedor.ztbFornecedorFO_DATA_CADASTRO.Value := now;
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
