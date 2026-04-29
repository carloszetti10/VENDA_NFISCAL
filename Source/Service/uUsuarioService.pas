unit uUsuarioService;

interface
uses
  iUsuarioService, System.SysUtils, uUsuarioModel, iUsuarioDao,System.Generics.Collections, ZConnection, uException;
type
  TUsuarioService = class(TInterfacedObject, IUsuarioServiceInterface)
  private
    FUsuarioDAO: IUsuarioDAOO;
    FConexao: TZConnection;
  public
    procedure IInserirUsuario(Usuario: TUsuarioModel; listaPermi: TList<Integer>);
    procedure IAlterarUsuario(Usuario: TUsuarioModel);
    constructor Create(AUsuarioDao: IUsuarioDAOO; AConexao: TZConnection);
  end;

implementation

{ TUsuarioService }

constructor TUsuarioService.Create(AUsuarioDao: IUsuarioDAOO; AConexao: TZConnection);
begin
  FUsuarioDAO:= AUsuarioDao;
  FConexao:= AConexao;
end;

procedure TUsuarioService.IAlterarUsuario(Usuario: TUsuarioModel);
begin

end;



procedure TUsuarioService.IInserirUsuario(Usuario: TUsuarioModel; listaPermi: TList<Integer>);
var
  IdUsuario: Integer;
begin
  FConexao.StartTransaction;
  try
    //adicionar a função para verificar se tem logi cadastrado depois
    IdUsuario := FUsuarioDAO.Insert(Usuario);

    FUsuarioDAO.InsertPermissoes(IdUsuario, listaPermi);

    FConexao.Commit;
  except
    on E: Exception do
    begin
      FConexao.Rollback;
      raise EInfraException.Create('Erro ao inserir usuário: ' + E.Message);
    end;
  end;
end;

end.
