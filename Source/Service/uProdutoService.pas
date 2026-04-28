unit uProdutoService;

interface
uses
  IProdutoService,SysUtils,uProdutoModel,uException,IProdutoDAO,ZDataset,Vcl.Forms,Vcl.Dialogs;
type
   TProdutoService = class(TInterfacedObject, IProdutoServiceInterface)
   private
   FProdutoDAO : IProdutoDAOO;
   public
     procedure Inserir(Produto: TProdutoModel);
     procedure Alterar(Produto: TProdutoModel);
     constructor Create(AProdDao: IProdutoDAOO);
   end;

implementation

{ TProdutoService }

constructor TProdutoService.Create(AProdDao: IProdutoDAOO);
begin
  inherited Create;
  FProdutoDAO:= AProdDao;
end;

procedure TProdutoService.Alterar(Produto: TProdutoModel);
begin

end;

procedure TProdutoService.Inserir(Produto: TProdutoModel);
var
  Prod: TProdutoModel;
begin
  Prod := nil;
  try
    if not Trim(Produto.CodBarra).IsEmpty then
    prod := FProdutoDAO.FindByCodBarra(Produto.CodBarra);
    //verificar se o cod de barra ja está cadastrado
    if Prod <> nil then
      raise EAppException.Create('Codigo de barra já cadastrado no produto: '+Prod.Nome);
    FProdutoDAO.Insert(Produto);
  except
  on E: EAppException do
    raise;
  on Ex: Exception do
    raise EInfraException.Create('Error: '+ Ex.Message);
  end;
end;

end.
