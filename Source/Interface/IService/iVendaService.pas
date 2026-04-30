unit iVendaService;

interface
uses
 uVendaModel, System.Generics.Collections,ZDataset;
type
    IVendaServiceInterface = interface
    procedure IInserirVenda(Venda: TVendaModel);
    procedure IAlterarVenda(Venda: TVendaModel);
    procedure ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
   end;

implementation

end.
