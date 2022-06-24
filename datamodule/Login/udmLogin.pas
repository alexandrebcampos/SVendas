unit udmLogin;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset, ZDataset;

type
  TdmLogin = class(TDataModule)
    zqrLogin: TZReadOnlyQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLogin: TdmLogin;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConexao;

{$R *.dfm}

end.
