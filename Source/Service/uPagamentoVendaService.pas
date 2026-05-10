unit uPagamentoVendaService;

interface

uses
  iPagamentoVendaService, iPagamentoVendaDAO,
  uPagamentoVendaModel, uException,ZDataset;
type
  TPagamentoVendaService = class(TInterfacedObject, IPagamentoVendaIntefaceService)
  private
    FDao: IPagamentoVendaDAOO;
  public
    constructor Create(ADao: IPagamentoVendaDAOO);
    procedure SalvarPagamento(AItem: TPagamentoVendaModel);
    procedure CarregarFormaPag(QRY: TZQuery);
    procedure CarregarPagamentoVenda(QRY: TZQuery; Id: Integer);
    procedure GerarParcelas(AIdVenda: Integer; AIdPagamento: Integer; AValorVenda: Currency; AQuantidadeParcelas: Integer);
  end;

implementation

{ TPagamentoVendaService }


procedure TPagamentoVendaService.CarregarFormaPag(QRY: TZQuery);
begin
  FDao.FindByAllFormaPag(QRY);
end;

procedure TPagamentoVendaService.CarregarPagamentoVenda(QRY: TZQuery; Id: Integer);
begin
  FDao.FindByAllPagamentoVenda(QRY, Id);
end;

constructor TPagamentoVendaService.Create(ADao: IPagamentoVendaDAOO);
begin
  FDao := ADao;
end;

procedure TPagamentoVendaService.GerarParcelas(AIdVenda: Integer;AIdPagamento: Integer;AValorVenda: Currency;AQuantidadeParcelas: Integer);
var
  Pagamento: TPagamentoVendaModel;
  i: Integer;
  ValorParcela: Currency;
begin

  // remove parcelas antigas
  FDAO.DeleteByVenda(AIdVenda);
  ValorParcela := AValorVenda / AQuantidadeParcelas;

  for i := 1 to AQuantidadeParcelas do
  begin
    Pagamento := TPagamentoVendaModel.Create;
    try
      Pagamento.IdVenda := AIdVenda;
      Pagamento.IdPagamento := AIdPagamento;
      Pagamento.Parcela := i;
      Pagamento.Valor := ValorParcela;

      FDAO.Insert(Pagamento);

    finally
      Pagamento.Free;
    end;
  end;
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
