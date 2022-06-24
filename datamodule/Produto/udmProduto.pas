unit udmProduto;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TdmProduto = class(TDataModule)
    ztbProduto: TZTable;
    ztbProdutoP_ID: TFloatField;
    ztbProdutoFO_ID: TFloatField;
    ztbProdutoP_VL_UNIT: TFloatField;
    ztbProdutoP_DESCRICAO: TWideStringField;
    ztbProdutoP_SITUACAO: TWideStringField;
    ztbProdutoP_QUANTIDADE: TFloatField;
    ztbProdutoP_VL_TOTAL: TFloatField;
    ztbProdutoP_DATA_CADASTRO: TDateTimeField;
    ztbProdutoP_DATA_INATIVO: TDateTimeField;
    ztbProdutoP_FOTO: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProduto: TdmProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

end.
