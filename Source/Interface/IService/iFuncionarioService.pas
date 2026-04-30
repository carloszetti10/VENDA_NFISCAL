unit iFuncionarioService;

interface
uses
 uFuncionarioModel,ZDataset;
type
    IFuncionarioServiceInterface = interface
    procedure IInserir(Fun: TFuncionarioModel);
    procedure IAlterar(Fun: TFuncionarioModel);
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;

implementation

end.
