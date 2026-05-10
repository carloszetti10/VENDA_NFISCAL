unit uPagamentoVendaService;

interface

uses
  iPagamentoVendaService, iPagamentoVendaDAO,
  uPagamentoVendaModel, uException;

type
  TPagamentoVendaService = class(TInterfacedObject, IPagamentoVendaIntefaceService)
  private
    FDao: IPagamentoVendaDAOO;
  public
    constructor Create(ADao: IPagamentoVendaDAOO);
    procedure SalvarPagamento(AItem: TPagamentoVendaModel);
  end;

implementation

{ TPagamentoVendaService }

constructor TPagamentoVendaService.Create(ADao: IPagamentoVendaDAOO);
begin
  FDao := ADao;
end;

procedure TPagamentoVendaService.SalvarPagamento(AItem: TPagamentoVendaModel);
begin
  if AItem.IdVenda <= 0 then
    raise EAppException.Create('Venda inválida');

  if AItem.IdPagamento <= 0 then
    raise EAppException.Create('Forma de pagamento inválida');

  if AItem.Valor <= 0 then
    raise EAppException.Create('Valor inválido');


  if AItem.Parcela <= 0 then
    AItem.Parcela := 1;

  FDao.Insert(AItem);
end;

end.
