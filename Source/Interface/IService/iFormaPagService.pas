unit iFormaPagService;

interface

uses
  uFormaPagModel,
  ZDataset;

type
  IFormaPagServiceInterface = interface
    procedure IInserir(Forma: TFormaPagamentoModel);
    procedure IAlterar(Forma: TFormaPagamentoModel);

    function BuscarPorId(ID: Integer): TFormaPagamentoModel;

    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
  end;

implementation

end.
