unit IProdutoService;

interface
uses
 uProdutoModel, ZDataset;
type
    IProdutoServiceInterface = interface
    procedure Inserir(Produto: TProdutoModel);
    function Atualizar(Produto: TProdutoModel): Boolean;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    procedure BaixarEstoque(id: integer; quant :Currency);
   end;

implementation

end.
