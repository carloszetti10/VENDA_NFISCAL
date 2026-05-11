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
     function Atualizar(Produto: TProdutoModel): Boolean;
     function BuscarPorId(ID: Integer): TProdutoModel;
     constructor Create(AProdDao: IProdutoDAOO);
     procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
     procedure BaixarEstoque(id: integer; quant :Currency);
   end;

implementation

{ TProdutoService }

procedure TProdutoService.BaixarEstoque(id: integer; quant: Currency);
begin
  FProdutoDAO.BaixarEstoque(id,quant);
end;
function TProdutoService.BuscarPorId(ID: Integer): TProdutoModel;
begin
   Result:= FProdutoDAO.FIndByID(ID);
end;

constructor TProdutoService.Create(AProdDao: IProdutoDAOO);
begin
  inherited Create;
  FProdutoDAO:= AProdDao;
end;
function TProdutoService.Atualizar(Produto: TProdutoModel): Boolean;
begin
  if Produto.IdProduto = 0 then
    raise EAppException.Create('Produto não encontrado.');
     Result := FProdutoDAO.Atualizar(Produto);
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
    FProdutoDAO.Inserir(Produto);
  except
  on E: EAppException do
    raise;
  on Ex: Exception do
    raise EInfraException.Create('Error: '+ Ex.Message);
  end;
end;
procedure TProdutoService.ListarPorNomeTela(Q: TZQuery; Nome: string);
begin
  FProdutoDAO.ListarPorNomeTela(Q, nome);
end;

end.
