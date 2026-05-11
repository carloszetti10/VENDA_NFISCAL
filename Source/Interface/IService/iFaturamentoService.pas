unit iFaturamentoService;

interface
uses
 uVendaModel, System.Generics.Collections,ZDataset, uUsuarioModel,uItemVendaModel;
type
    IFaturamentoServiceInterface = interface
    procedure CancelarVenda(IdVenda: Integer);
    procedure FaturarVenda(IdVenda: Integer);
    function  BuscarVendaPoId(IdVenda: Integer): TVendaModel;
    procedure ListarNaTelaGridVenda(Q: TZQuery; DataInicial, DataFinal: TDate; Status: TStatusVenda);
    procedure ListarNaTelaGridItemVenda(Q: TZQuery; IdVenda: Integer);
    procedure ListarNaTelaGridPagto(Q: TZQuery; IdVenda: Integer);
    end;

implementation

end.
