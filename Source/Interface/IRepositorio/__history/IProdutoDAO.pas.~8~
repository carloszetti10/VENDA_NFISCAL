unit IProdutoDAO;

interface
uses
   uProdutoModel,ZDataset, ZAbstractConnection, ZConnection;
type
    IProdutoDAOO = interface
    function  FindByCodBarra(cod: string): TProdutoModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    procedure BaixarEstoque(id: integer; quant :Currency);



    function Inserir(Produto: TProdutoModel): Boolean;
    function Atualizar(Produto: TProdutoModel): Boolean;
    function Apagar(Id: Integer): Boolean;
    function Selecionar(Id: Integer): TProdutoModel;
   end;

implementation

end.
