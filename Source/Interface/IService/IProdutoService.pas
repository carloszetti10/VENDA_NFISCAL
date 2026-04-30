unit IProdutoService;

interface
uses
 uProdutoModel, ZDataset;
type
    IProdutoServiceInterface = interface
    procedure Inserir(Produto: TProdutoModel);
    procedure Alterar(Produto: TProdutoModel);
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;

implementation

end.
