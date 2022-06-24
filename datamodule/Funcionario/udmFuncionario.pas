unit udmFuncionario;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TdmFuncionario = class(TDataModule)
    ztbFuncionario: TZTable;
    ztbFuncionarioF_ID: TFloatField;
    ztbFuncionarioF_NOME: TWideStringField;
    ztbFuncionarioF_USUARIO: TWideStringField;
    ztbFuncionarioF_SENHA: TWideStringField;
    ztbFuncionarioF_SITUACAO: TWideStringField;
    ztbFuncionarioF_DATA_CADASTRO: TDateTimeField;
    ztbFuncionarioF_DATA_INATIVO: TDateTimeField;
    ztbFuncionarioF_SEXO: TWideStringField;
    ztbFuncionarioF_FUNCAO: TWideStringField;
    zqrVerificaSituacao: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFuncionario: TdmFuncionario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

end.
