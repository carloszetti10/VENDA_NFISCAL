unit IProdutoService;

interface
uses
 uProdutoModel, ZDataset;
type
    IProdutoServiceInterface = interface
    procedure Inserir(Produto: TProdutoModel);
    function Atualizar(Produto: TProdutoModel): Boolean;
    function BuscarPorId(ID: Integer): TProdutoModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    procedure BaixarEstoque(id: integer; quant :Currency);
   end;

implementation

end.
