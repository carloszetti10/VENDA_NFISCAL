unit iPagamentoVendaDAO;

interface

uses
  uPagamentoVendaModel,ZDataset;

type
  IPagamentoVendaDAOO = interface

    procedure Insert(AItem: TPagamentoVendaModel);
    procedure FindByAllFormaPag(QRY: TZQuery);
    procedure FindByAllPagamentoVenda(QRY: TZQuery; Id: Integer);
    procedure DeleteByVenda(AIdVenda: Integer);
  end;

implementation

end.
