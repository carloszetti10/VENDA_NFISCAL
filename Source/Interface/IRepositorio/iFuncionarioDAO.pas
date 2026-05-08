unit iFuncionarioDAO;

interface
uses
   uFuncionarioModel,ZDataset;
type
    IFuncionarioDAOO = interface
    procedure Insert(Func: TFuncionarioModel);
    procedure Update(Func: TFuncionarioModel);
    function FindbyId(ID: Integer): TFuncionarioModel;
    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;
implementation

end.
