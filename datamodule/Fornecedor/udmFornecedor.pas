unit udmFornecedor;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TdmFornecedor = class(TDataModule)
    ztbFornecedor: TZTable;
    ztbFornecedorFO_ID: TFloatField;
    ztbFornecedorFO_RAZAO_SOCIAL: TWideStringField;
    ztbFornecedorFO_NOME_FANTASIA: TWideStringField;
    ztbFornecedorFO_CNPJ: TWideStringField;
    ztbFornecedorFO_SITUACAO: TWideStringField;
    ztbFornecedorFO_DATA_CADASTRO: TDateTimeField;
    ztbFornecedorFO_DATA_INATIVO: TDateTimeField;
    ztbFornecedorFO_TELEFONE: TWideStringField;
    ztbFornecedorFO_EMAIL: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFornecedor: TdmFornecedor;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

end.
