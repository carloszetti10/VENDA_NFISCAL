unit iFormaPagDAO;

interface

uses
  uFormaPagModel,
  ZDataset;

type
  IFormaPagDAOO = interface
    procedure Insert(Forma: TFormaPagamentoModel);
    procedure Update(Forma: TFormaPagamentoModel);

    function FindByID(ID: Integer): TFormaPagamentoModel;

    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
  end;

implementation

end.
