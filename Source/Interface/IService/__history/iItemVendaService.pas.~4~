unit iItemVendaService;

interface
uses
 uVendaModel, System.Generics.Collections,ZDataset, uItemVendaModel;
type
    IItemVendaServiceInterface = interface
    procedure ListarProdutoVenda(Q: TZQuery; IdVenda: Integer);
    procedure InserirItem(AItem: TItemVendaModel);
    procedure RemoverItemDaVenda(Quant: Currency; ItemVenda: TItemVendaModel);
    function  ListarProdutosPorVenda(IdVenda: Integer): TObjectList<TItemVendaModel>;
   end;

implementation

end.
