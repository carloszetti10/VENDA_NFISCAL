unit iVendaService;

interface
uses
 uVendaModel, System.Generics.Collections,ZDataset, uUsuarioModel,uItemVendaModel;
type
    IVendaServiceInterface = interface
    Function  IIniciarVenda(IdUsuario: Integer): Integer;
    procedure IAlterarVenda(Venda: TVendaModel);
    procedure ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
    function  UpdateCliente(IdCliente: Integer; IdVenda: Integer): Integer;
    function  UpdateFuncionario(IdFunc: Integer; IdVenda: Integer): Integer;
    procedure CancelarVenda(IdVenda: Integer);
    procedure AdicionarItemVenda(Item: TItemVendaModel);
    procedure ListarNaTelaGridVenda(Q: TZQuery; IdVenda: Integer);
    function CalcularTotalVenda(IdVenda: Integer): Currency;
   end;

implementation

end.
