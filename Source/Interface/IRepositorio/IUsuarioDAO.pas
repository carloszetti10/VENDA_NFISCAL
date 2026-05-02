unit IUsuarioDAO;

interface
uses
   uUsuarioModel,System.Generics.Collections,ZDataset;
type
    IUsuarioDAOO = interface
    function Insert(Usuario: TUsuarioModel):Integer;
    procedure Update(Usuario: TUsuarioModel);
    function  FindByID(cod: Integer): TUsuarioModel;
    function  ListaPermissaoPorID(Id: Integer): TList<Integer>;
    procedure InsertPermissoes(Id: Integer; Lista:TList<Integer>);
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    procedure ListarTodos(Q: TZQuery);
    function FindByLogin(const Login: string): TUsuarioModel;
    function Login(ALogin, ASenha: string): TUsuarioModel;
   end;

implementation

end.
