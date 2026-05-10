unit uFormaPagService;

interface

uses
  iFormaPagService,
  uFormaPagDao,
  uFormaPagModel,
  SysUtils,
  iFormaPagDAO,
  uException,
  ZDataset,
  Vcl.Forms,
  Vcl.Dialogs;

type
  TFormaPagService = class(TInterfacedObject, IFormaPagServiceInterface)
  private
    FFormaPagDAO: IFormaPagDAOO;

  public
    procedure IInserir(Forma: TFormaPagamentoModel);
    procedure IAlterar(Forma: TFormaPagamentoModel);

    procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
    constructor Create(AFormaPagDAO: IFormaPagDAOO);

    function BuscarPorId(ID: Integer): TFormaPagamentoModel;
  end;

implementation

function TFormaPagService.BuscarPorId(ID: Integer): TFormaPagamentoModel;
begin
  Result := FFormaPagDAO.FindByID(ID);
end;

constructor TFormaPagService.Create(AFormaPagDAO: IFormaPagDAOO);
begin
  inherited Create;
  FFormaPagDAO := AFormaPagDAO;
end;

procedure TFormaPagService.IAlterar(Forma: TFormaPagamentoModel);
begin
  if Forma.Id = 0 then
    raise EAppException.Create('Forma de pagamento não encontrada.');

  FFormaPagDAO.Update(Forma);
end;

procedure TFormaPagService.IInserir(Forma: TFormaPagamentoModel);
begin
  FFormaPagDAO.Insert(Forma);
end;

procedure TFormaPagService.ListarPorNomeTela(Q: TZQuery; Nome: string);
begin
  FFormaPagDAO.ListarPorNomeTela(Q, Nome);
end;

end.
