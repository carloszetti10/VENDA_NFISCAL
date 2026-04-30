unit uVendaService;

interface
uses
  iVendaService, iVendaDAO, uVendaModel,System.Generics.Collections,
  ZConnection, uException,ZDataset, IProdutoDAO, uProdutoDao;
type
   TVendaService = class(TInterfacedObject, IVendaServiceInterface)
   private
   FVendaDAO : IVendaDAOO;
   FProdutoDAO: IProdutoDAOO;
   FConexao: TZConnection;
   public
     procedure IInserirVenda(Venda: TVendaModel);
     procedure IAlterarVenda(Venda: TVendaModel);
     procedure ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
     constructor Create(AVendaDao: IVendaDAOO; AProdutoDao: IProdutoDAOO;
      AConexao: TZConnection);
   end;

implementation

{ TVendaService }

constructor TVendaService.Create(AVendaDao: IVendaDAOO;
  AProdutoDao: IProdutoDAOO; AConexao: TZConnection);
begin
  FConexao:= AConexao;
  FProdutoDAO:= AProdutoDao;
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
  FProdutoDAO.ListarPorNomeTela(Q, Nome);
end;

end.
