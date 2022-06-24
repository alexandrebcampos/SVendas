program SistemaVendas;

uses
  Vcl.Forms,
  ufrmPrincipal in 'view\Principal\ufrmPrincipal.pas' {frmPrincipal},
  udmConexao in 'datamodule\Conexao\udmConexao.pas' {dmConexao: TDataModule},
  udmLogin in 'datamodule\Login\udmLogin.pas' {dmLogin: TDataModule},
  ufrmControleAcesso in 'view\Controle_Acesso\ufrmControleAcesso.pas' {frmControleAcesso},
  udmCliente in 'datamodule\Cliente\udmCliente.pas' {dmCliente: TDataModule},
  ufrmModelo in 'view\Modelo\ufrmModelo.pas' {frmModelo},
  ufrmCadCliente in 'view\Cadastros\Cliente\ufrmCadCliente.pas' {frmCadCliente},
  udmFuncionario in 'datamodule\Funcionario\udmFuncionario.pas' {dmFuncionario: TDataModule},
  ufrmCadFuncionario in 'view\Cadastros\Funcionario\ufrmCadFuncionario.pas' {frmCadFuncionario},
  udmFornecedor in 'datamodule\Fornecedor\udmFornecedor.pas' {dmFornecedor: TDataModule},
  ufrmCadFornecedor in 'view\Cadastros\Fornecedor\ufrmCadFornecedor.pas' {frmCadFornecedor},
  udmProduto in 'datamodule\Produto\udmProduto.pas' {dmProduto: TDataModule},
  ufrmSobre in 'view\Ajuda\Sobre\ufrmSobre.pas' {frmSobre},
  ufrmCadProduto in 'view\Cadastros\Produto\ufrmCadProduto.pas' {frmCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmLogin, dmLogin);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TdmFuncionario, dmFuncionario);
  Application.CreateForm(TdmFornecedor, dmFornecedor);
  Application.CreateForm(TdmProduto, dmProduto);
  Application.Run;
end.
