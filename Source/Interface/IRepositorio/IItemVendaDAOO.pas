unit IItemVendaDAOO;


interface
uses
  uClienteModel, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, uItemVendaModel;
type
    IItemVendaDAO = interface
    procedure Insert(AItem: TItemVendaModel);
    procedure Update(AItem: TItemVendaModel);
    procedure Deletar(IdVenda, IdProduto: Integer);
    procedure ListarPorVenda(Q: TZQuery; IdVenda: Integer);
   end;

implementation

end.
