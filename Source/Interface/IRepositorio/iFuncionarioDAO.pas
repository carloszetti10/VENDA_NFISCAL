unit iFuncionarioDAO;

interface
uses
   uFuncionarioModel;
type
    IFuncionarioDAOO = interface
    procedure Insert(Func: TFuncionarioModel);
    procedure Update(Func: TFuncionarioModel);
    function  FindByID(cod: Integer): TFuncionarioModel;
   end;
implementation

end.
