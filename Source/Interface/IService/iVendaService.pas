unit iVendaService;

interface
uses
 uVendaModel, System.Generics.Collections,ZDataset, uUsuarioModel,uItemVendaModel;
type
    IVendaServiceInterface = interface
    Function  IIniciarVenda(IdUsuario: Integer): Integer;
    procedure ListarNaTelaGridEstoque(Q: TZQuery; Nome: string);
    function  UpdateCliente(IdCliente: Integer; IdVenda: Integer): Integer;
    function  UpdateFuncionario(IdFunc: Integer; IdVenda: Integer): Integer;
    procedure CancelarVenda(IdVenda: Integer);
    procedure AdicionarItemVenda(Item: TItemVendaModel);
    procedure ListarNaTelaGridVenda(Q: TZQuery; IdVenda: Integer);
    function  CalcularTotalVenda(IdVenda: Integer): Currency;
    function  BuscarVendaPoId(IdVenda: Integer): TVendaModel;
    procedure RemoverItemVenda(Quant: Currency; ItemVenda: TItemVendaModel);
    procedure AtualizarValorVenda(Venda: TVendaModel);
    procedure AlterarStatusVenda(Id: Integer; Status: TStatusVenda);

    procedure ListarNaTelaGridVendaFaturamento(Q: TZQuery; DataInicial, DataFinal: TDate; Status: TStatusVenda);
   end;

implementation

end.
