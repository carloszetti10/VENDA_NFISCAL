unit iVendaDAO;

interface
uses
   uVendaModel,ZDataset, ZAbstractConnection, ZConnection, uUsuarioModel;
type
    IVendaDAOO = interface
    function  Insert(IdUsuario: Integer): Integer;
    function  FindByID(cod: Integer): TVendaModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    function  UpdateCliente(IdCliente: Integer; IdVenda: Integer): Integer;
    function  UpdateFuncionario(IdFunc: Integer; IdVenda: Integer): Integer;
    procedure UpdateStatus(IdVenda: Integer; status: TStatusVenda);
    function  CalcularTotalVenda(IdVenda: Integer): Currency;
    procedure UpdateValorVenda(Venda: TVendaModel);
    procedure ListarPorPeriodoStatus(Q: TZQuery; DataInicial, DataFinal: TDate;Status: Integer);
   end;

implementation

end.
