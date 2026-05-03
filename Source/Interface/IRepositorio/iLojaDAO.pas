unit iLojaDAO;

interface
uses
   uLojaModel,ZDataset;
type
    ILojaDAOO = interface
    procedure Insert(Loja: TLojaModel);
    procedure Update(Loja: TLojaModel);
    function  FindBy: TLojaModel;
   end;
implementation

end.
