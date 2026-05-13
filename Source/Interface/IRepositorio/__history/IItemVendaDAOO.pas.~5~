unit IItemVendaDAOO;


interface
uses
  uClienteModel, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, uItemVendaModel,System.Generics.Collections;
type
    IItemVendaDAO = interface
    procedure Insert(AItem: TItemVendaModel);
    procedure Update(AItem: TItemVendaModel);
    procedure Deletar(IdVenda, IdProduto: Integer);
    procedure ListarPorVenda(Q: TZQuery; IdVenda: Integer);
    function  FindByItemVenda(AItem: TItemVendaModel): TItemVendaModel;
    function  ListarProdutosPorVenda(IdVenda: Integer): TObjectList<TItemVendaModel>;
   end;

implementation

end.
