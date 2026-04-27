unit uProdutoModel;

interface
type
  TProdutoModel = class
  private
    FIdProduto: Integer;
    FNome: string;
    FCodBarra: string;
    FEstoque: Integer;
    FValorUnitario: Currency;
    FAtivo: Boolean;
  public
    property IdProduto: Integer read FIdProduto write FIdProduto;
    property Nome: string read FNome write FNome;
    property CodBarra: string read FCodBarra write FCodBarra;
    property Estoque: Integer read FEstoque write FEstoque;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;
    property Ativo: Boolean read FAtivo write FAtivo;

    constructor Create; overload;
  end;

implementation

{ TProdutoModel }

constructor TProdutoModel.Create;
begin
  inherited Create;

end;

end.
