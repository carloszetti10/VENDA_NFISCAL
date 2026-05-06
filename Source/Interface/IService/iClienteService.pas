unit iClienteService;

interface
uses
  uClienteModel, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;
type
    IClienteServiceInterface = interface
    procedure Inserir(Cliente: TClienteModel);
    procedure Alterar(Cliente: TClienteModel);
    function BuscarPorId(ID: Integer): TClienteModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;

implementation

end.

