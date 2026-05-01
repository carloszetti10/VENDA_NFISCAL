unit uVendaService;

interface
uses
  iVendaService, iVendaDAO, uVendaModel,System.Generics.Collections,
  ZConnection, uException,ZDataset, IProdutoService, uProdutoService;
type
   TVendaService = class(TInterfacedObject, IVendaServiceInterface)
   private
   FVendaDAO : IVendaDAOO;
   FProdutoService: IProdutoServiceInterface;
   public
     procedure IInserirVenda(Venda: TVendaModel);
     procedure IAlterarVenda(Venda: TVendaModel);
     procedure ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
     constructor Create(AVendaDao: IVendaDAOO; AProdutoService: IProdutoServiceInterface);
   end;

implementation

{ TVendaService }

constructor TVendaService.Create(AVendaDao: IVendaDAOO;
 AProdutoService: IProdutoServiceInterface);
begin
  FProdutoService:= AProdutoService;
  FVendaDAO:= AVendaDao;
end;

procedure TVendaService.IAlterarVenda(Venda: TVendaModel);
begin

end;

procedure TVendaService.IInserirVenda(Venda: TVendaModel);
begin

end;

procedure TVendaService.ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
begin
  FProdutoService.ListarPorNomeTela(Q,Nome);
end;

end.
