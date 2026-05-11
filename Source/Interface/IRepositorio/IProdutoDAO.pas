unit IProdutoDAO;

interface
uses
   uProdutoModel,ZDataset, ZAbstractConnection, ZConnection;
type
    IProdutoDAOO = interface
    function  FindByCodBarra(cod: string): TProdutoModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    procedure BaixarEstoque(id: integer; quant :Currency);
    function  FIndByID(Id: Integer): TProdutoModel;


    function Inserir(Produto: TProdutoModel): Boolean;
    function Atualizar(Produto: TProdutoModel): Boolean;
    function Apagar(Id: Integer): Boolean;
    procedure AdicionarEstoque(Id: Integer;Quant: Currency);
   end;

implementation

end.
