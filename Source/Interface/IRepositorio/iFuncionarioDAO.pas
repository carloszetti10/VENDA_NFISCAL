unit iFuncionarioDAO;

interface
uses
   uFuncionarioModel,ZDataset;
type
    IFuncionarioDAOO = interface
    procedure Insert(Func: TFuncionarioModel);
    procedure Update(Func: TFuncionarioModel);
    function  FindByID(cod: Integer): TFuncionarioModel;
     procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;
implementation

end.
