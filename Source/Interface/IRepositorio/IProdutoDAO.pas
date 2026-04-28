unit IProdutoDAO;

interface
uses
   uProdutoModel;
type
    IProdutoDAOO = interface
    procedure Insert(Produto: TProdutoModel);
    procedure Update(Produto: TProdutoModel);
    function  FindByCodBarra(cod: string): TProdutoModel;
   end;

implementation

end.
