unit udmCliente;

interface

uses
  System.SysUtils, System.Classes, ZAbstractTable, ZDataset, Data.DB,
  ZAbstractRODataset, ZAbstractDataset;

type
  TdmCliente = class(TDataModule)
    zqrVerificaCPF: TZQuery;
    ztbCliente: TZTable;
    ztbClienteC_ID: TFloatField;
    ztbClienteC_NOME: TWideStringField;
    ztbClienteC_CPF: TWideStringField;
    ztbClienteC_DATANASCI: TDateTimeField;
    ztbClienteC_SITUACAO: TWideStringField;
    ztbClienteC_DATA_CADASTRO: TDateTimeField;
    ztbClienteC_DATA_INATIVO: TDateTimeField;
    ztbClienteC_SEXO: TWideStringField;
    ztbClienteC_TEL: TWideStringField;
    ztbClienteC_EMAIL: TWideStringField;
    ztbClienteC_CEL: TWideStringField;
    ztbClienteC_OPERADORA: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCliente: TdmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

end.
