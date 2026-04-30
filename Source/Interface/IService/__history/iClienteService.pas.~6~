unit iClienteService;

interface
uses
  uClienteModel, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;
type
    IClienteServiceInterface = interface
    procedure Inserir(Cliente: TClienteModel);
    procedure Alterar(ID: Integer);
    function BuscarPorId(ID: Integer): TClienteModel;
    function  ListarPorNome(Nome: string): TZQuery;
    function ListarVazia: TZQuery;
   end;

implementation

end.

