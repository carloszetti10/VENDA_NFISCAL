unit uFaturamentoService;

interface
uses
  iVendaService, iVendaDAO, uVendaModel,System.Generics.Collections,
  ZConnection, uException,ZDataset, IProdutoService, uProdutoService,
  uUsuarioModel, iItemVendaService, uItemVendaModel,uAppServiceConexao,System.SysUtils,
  iFaturamentoService, iPagamentoVendaService;
type
   TFaturamentoService = class(TInterfacedObject, IFaturamentoServiceInterface)
   private
     FVendaServive : IVendaServiceInterface;
     FProdutoService: IProdutoServiceInterface;
     FItemVendaService: IItemVendaServiceInterface;
     FPagamentoService: IPagamentoVendaIntefaceService;
   public
     procedure CancelarVenda(IdVenda: Integer);
     procedure FaturarVenda(IdVenda: Integer);
     function  BuscarVendaPoId(IdVenda: Integer): TVendaModel;

     procedure ListarNaTelaGridItemVenda(Q: TZQuery; IdVenda: Integer);
     procedure ListarNaTelaGridVenda(Q: TZQuery; DataInicial, DataFinal: TDate; Status: TStatusVenda);
     procedure ListarNaTelaGridPagto(Q: TZQuery; IdVenda: Integer);
     constructor Create(AVendaServ: IVendaServiceInterface; AProdService: IProdutoServiceInterface;
     AItemVendaServ:IItemVendaServiceInterface;  APagService: IPagamentoVendaIntefaceService);
   end;

implementation



{ TFaturamentoService }

constructor TFaturamentoService.Create(AVendaServ: IVendaServiceInterface;
  AProdService: IProdutoServiceInterface;
  AItemVendaServ: IItemVendaServiceInterface; APagService: IPagamentoVendaIntefaceService);
begin
  FVendaServive := AVendaServ;
  FProdutoService := AProdService;
  FItemVendaService := AItemVendaServ;
  FPagamentoService := APagService;
end;

procedure TFaturamentoService.FaturarVenda(IdVenda: Integer);
var
  Con: TZConnection;
  ListProd: TObjectList<TItemVendaModel>;
  Item: TItemVendaModel;
begin
  Con := AppServiceConexao.getConexao;
  ListProd := nil;

  try
    Con.StartTransaction;

    try
      ListProd := FItemVendaService.ListarProdutosPorVenda(IdVenda);

      if not Assigned(ListProd) or (ListProd.Count = 0) then
        raise Exception.Create('Nenhum produto encontrado na venda.');

      // baixa estoque
      for Item in ListProd do
      begin
        FProdutoService.BaixarEstoque(Item.IdProduto,Item.Quantidade);
      end;

      // altera status da venda
      FVendaServive.AlterarStatusVenda(IdVenda,TStatusVenda.svFaturada);
      Con.Commit;
    except
      begin
        Con.Rollback;
        raise;
      end;
    end;
  finally
    ListProd.Free;
  end;
end;

function TFaturamentoService.BuscarVendaPoId(IdVenda: Integer): TVendaModel;
begin

end;

procedure TFaturamentoService.CancelarVenda(IdVenda: Integer);
var
  Con: TZConnection;
  ListProd: TObjectList<TItemVendaModel>;
  Item: TItemVendaModel;
begin
  Con := AppServiceConexao.getConexao;
  ListProd := nil;

  try
    Con.StartTransaction;

    try
      // busca produtos da venda
      ListProd := FItemVendaService.ListarProdutosPorVenda(IdVenda);

      if not Assigned(ListProd) or (ListProd.Count = 0) then
        raise Exception.Create('Nenhum produto encontrado na venda.');

      // devolve estoque
      for Item in ListProd do
      begin
        FProdutoService.AdicionarEstoque(
          Item.IdProduto,
          Item.Quantidade
        );
      end;

      // altera status para cancelado
      FVendaServive.AlterarStatusVenda(IdVenda,TStatusVenda.svCancelado);
      Con.Commit;
    except
      on E: Exception do
      begin
        Con.Rollback;
        raise Exception.Create(
          'Erro ao cancelar venda: ' + E.Message
        );
      end;
    end;
  finally
    ListProd.Free;
  end;
end;



procedure TFaturamentoService.ListarNaTelaGridItemVenda(Q: TZQuery;
  IdVenda: Integer);
begin
  FItemVendaService.ListarProdutoVenda(Q, IdVenda);
end;

procedure TFaturamentoService.ListarNaTelaGridPagto(Q: TZQuery;
  IdVenda: Integer);
begin
  FPagamentoService.CarregarPagamentoVenda(Q, IdVenda);
end;

procedure TFaturamentoService.ListarNaTelaGridVenda(Q: TZQuery; DataInicial, DataFinal: TDate; Status: TStatusVenda);
begin

  // validação de datas
  if DataInicial > DataFinal then
    raise EAppException.Create('Data inicial não pode ser maior que a data final.');

  FVendaServive.ListarNaTelaGridVendaFaturamento(Q, DataInicial, DataFinal, Status);
end;



end.
