unit iUsuarioService;

interface
uses
 uUsuarioModel, System.Generics.Collections,ZDataset, uLojaModel;
type
    IUsuarioServiceInterface = interface
    procedure IInserirUsuario(Usuario: TUsuarioModel; listaPermi: TList<Integer>);
    procedure IAlterarUsuario(Usuario: TUsuarioModel);
    procedure ListarNaTela(Q: TZQuery; Nome: string; Todos: Boolean);
    function Login(ALogin, ASenha: string): TUsuarioModel;
    procedure PreecherAppContext(UsuarioLogado: TUsuarioModel; Loja: TLojaModel);
    procedure ListarPermissoes(Q: TZQuery);
    function BuscarPorId(ID: Integer): TUsuarioModel;
   end;

implementation

end.
