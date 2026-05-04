unit iPagamentoVendaService;

interface

uses
  uPagamentoVendaModel;

type
  IPagamentoVendaIntefaceService = interface
    procedure SalvarPagamento(AItem: TPagamentoVendaModel);
  end;

implementation

end.
