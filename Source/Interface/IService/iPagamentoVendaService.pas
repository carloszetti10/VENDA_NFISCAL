unit iPagamentoVendaService;

interface

uses
  uPagamentoVendaModel,ZDataset;

type
  IPagamentoVendaIntefaceService = interface
    procedure SalvarPagamento(AItem: TPagamentoVendaModel);
    procedure CarregarFormaPag(QRY: TZQuery);
    procedure CarregarPagamentoVenda(QRY: TZQuery; Id: Integer);
    procedure GerarParcelas(AIdVenda: Integer; AIdPagamento: Integer; AValorVenda: Currency; AQuantidadeParcelas: Integer);
  end;

implementation

end.
