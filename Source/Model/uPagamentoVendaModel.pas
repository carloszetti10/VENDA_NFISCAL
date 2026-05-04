unit uPagamentoVendaModel;

interface

type
  TPagamentoVendaModel = class
  private
    FIdVenda: Integer;
    FIdPagamento: Integer;
    FParcela: Integer;
    FValor: Currency;
  public
    property IdVenda: Integer read FIdVenda write FIdVenda;
    property IdPagamento: Integer read FIdPagamento write FIdPagamento;
    property Parcela: Integer read FParcela write FParcela;
    property Valor: Currency read FValor write FValor;

    constructor Create;
  end;

implementation

{ TPagamentoVendaModel }

constructor TPagamentoVendaModel.Create;
begin
  inherited;
end;

end.
