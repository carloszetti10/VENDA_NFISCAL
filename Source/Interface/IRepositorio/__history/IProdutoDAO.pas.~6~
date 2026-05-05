unit IProdutoDAO;

interface
uses
   uProdutoModel,ZDataset, ZAbstractConnection, ZConnection;
type
    IProdutoDAOO = interface
    procedure Insert(Produto: TProdutoModel);
    procedure Update(Produto: TProdutoModel);
    function  FindByCodBarra(cod: string): TProdutoModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    procedure BaixarEstoque(id: integer; quant :Currency);
   end;

implementation

end.
