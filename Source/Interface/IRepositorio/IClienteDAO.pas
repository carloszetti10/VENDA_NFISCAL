unit IClienteDAO;

interface
uses
  uClienteModel, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;
type
    IClienteDAOO = interface
    procedure Insert(Cliente: TClienteModel);
    procedure Update(Cliente: TClienteModel);
    function  FindByDocumento(Docum: string): TClienteModel;
    function  FindByID(ID: Integer): TClienteModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;

implementation

end.
