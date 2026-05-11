unit uVendaService;

interface
uses
  iVendaService, iVendaDAO, uVendaModel,System.Generics.Collections,
  ZConnection, uException,ZDataset, IProdutoService, uProdutoService,
  uUsuarioModel, iItemVendaService, uItemVendaModel,uAppServiceConexao,System.SysUtils;
type
   TVendaService = class(TInterfacedObject, IVendaServiceInterface)
   private
   FVendaDAO : IVendaDAOO;
   FProdutoService: IProdutoServiceInterface;
   FItemVendaService: IItemVendaServiceInterface;
   public
     Function IIniciarVenda(IdUsuario: Integer):Integer;
     procedure ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
     procedure ListarNaTelaGridVenda(Q: TZQuery; IdVenda: Integer);
     constructor Create(AVendaDao: IVendaDAOO; AProdutoService: IProdutoServiceInterface; AItemVendaService: IItemVendaServiceInterface);
     function  BuscarVendaPoId(IdVenda: Integer): TVendaModel;

     {===== ATUALIZAÇÃO VENDA ====}
     function UpdateCliente(IdCliente: Integer; IdVenda: Integer): Integer;
     function UpdateFuncionario(IdFunc: Integer; IdVenda: Integer): Integer;
     procedure AdicionarItemVenda(Item: TItemVendaModel);
     procedure RemoverItemVenda(Quant: Currency; ItemVenda: TItemVendaModel);
     function CalcularTotalVenda(IdVenda: Integer): Currency;
     procedure AtualizarValorVenda(Venda: TVendaModel);
     procedure AlterarStatusVenda(Id: Integer; Status: TStatusVenda);
     {===== CANCELAR VENDA ====}
     procedure CancelarVenda(IdVenda: Integer);


     {===== FATURAMENTO ====}

     procedure ListarNaTelaGridVendaFaturamento(Q: TZQuery; DataInicial, DataFinal: TDate; Status: TStatusVenda);
   end;

implementation

{ TVendaService }


{ ================== CONSTRUTOR ================== }
constructor TVendaService.Create(AVendaDao: IVendaDAOO; AProdutoService: IProdutoServiceInterface;AItemVendaService: IItemVendaServiceInterface );
begin
  FProdutoService:= AProdutoService;
  FVendaDAO:= AVendaDao;
  FItemVendaService:= AItemVendaService;
end;


{ ================== INICIAR VENDA ================== }
function TVendaService.IIniciarVenda(IdUsuario: Integer): Integer;
begin
  Result:= FVendaDAO.Insert(IdUsuario);
end;

procedure TVendaService.ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
begin
  FProdutoService.ListarPorNomeTela(Q,Nome);
end;

procedure TVendaService.ListarNaTelaGridVenda(Q: TZQuery; IdVenda: Integer);
begin
  FItemVendaService.ListarProdutoVenda(Q, IdVenda);
end;


procedure TVendaService.RemoverItemVenda(Quant: Currency;
  ItemVenda: TItemVendaModel);
begin
  FItemVendaService.RemoverItemDaVenda(Quant, ItemVenda);
end;

procedure TVendaService.AdicionarItemVenda(Item: TItemVendaModel);


begin
  //ver se ja tem

  //inserir
  FItemVendaService.InserirItem(Item);
end;


{ ================== ATUALIZAR VENDA CLIENTE/VENDEDOR ================== }
function TVendaService.UpdateCliente(IdCliente, IdVenda: Integer): Integer;
begin
  Result := FVendaDAO.UpdateCliente(IdCliente, IdVenda);
end;

function TVendaService.UpdateFuncionario(IdFunc, IdVenda: Integer): Integer;
begin
  Result := FVendaDAO.UpdateFuncionario(IdFunc, IdVenda);
end;


procedure TVendaService.AlterarStatusVenda(Id: Integer; Status: TStatusVenda);
begin
  FVendaDAO.UpdateStatus(Id, Status);
end;

procedure TVendaService.AtualizarValorVenda(Venda: TVendaModel);
begin
  FVendaDAO.UpdateValorVenda(Venda);
end;

function TVendaService.BuscarVendaPoId(IdVenda: Integer): TVendaModel;
begin
   result := FVendaDAO.FindByID(IdVenda);
end;

function TVendaService.CalcularTotalVenda(IdVenda: Integer): Currency;
begin
  Result := FVendaDAO.CalcularTotalVenda(IdVenda);
end;

{===== CANCELAR VENDA ====}
procedure TVendaService.CancelarVenda(IdVenda: Integer);
begin
  FVendaDAO.UpdateStatus(IdVenda, svCancelado);
end;

{===== FATURAMENTO ====}
procedure TVendaService.ListarNaTelaGridVendaFaturamento(Q: TZQuery;
  DataInicial, DataFinal: TDate; Status: TStatusVenda);
begin
  FVendaDAO.ListarPorPeriodoStatus(Q,DataInicial, DataFinal, Ord(Status));
end;



end.
