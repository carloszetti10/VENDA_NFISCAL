unit uClienteService;

interface
uses
  iClienteService,SysUtils,uClienteModel,uException, uValidadorDocumento, IClienteDAO,ZDataset, Vcl.Forms, Vcl.Dialogs;
type
   TClienteService = class(TInterfacedObject, IClienteServiceInterface)
   private
     FClienteDAO : IClienteDAOO;
   public
      procedure Inserir(Cliente: TClienteModel);
      procedure Alterar(ID: Integer);
      function BuscarPorId(ID: Integer): TClienteModel;
      constructor Create(AClienteDao: IClienteDAOO);
      procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
   end;

implementation

{ TClienteService }

procedure TClienteService.Alterar(ID: Integer);
var
  Cliente: TClienteModel;
  Dados: TClienteModel;

begin
  Dados := FClienteDAO.FindByID(ID);
  try
    if Dados = nil then
      raise EAppException.Create('Cliente não encontrado');

    Cliente := TClienteModel.Create;
    try
      Cliente.Id := Dados.Id;
      Cliente.Nome := Dados.Nome;
      Cliente.CpfCnpj := Dados.CpfCnpj;
      Cliente.TipoPessoa := Dados.TipoPessoa;
      Cliente.Ativo := Dados.Ativo;

      //FClienteDAO.Update(Cliente);

    finally
      Cliente.Free;
    end;
  finally
    Dados.Free;
  end;

end;

function TClienteService.BuscarPorId(ID: Integer): TClienteModel;
begin
  result := FClienteDAO.FindByID(ID);
end;

constructor TClienteService.Create(AClienteDao: IClienteDAOO);
begin
  inherited Create;
  FClienteDAO := AClienteDao;
end;

//Cadastrar Clientes
procedure TClienteService.Inserir(Cliente: TClienteModel);
var
  isCpfValido: Boolean;
  isCnpjValido: Boolean;
begin
  isCpfValido := False;
  isCnpjValido := False;
  Try
     if Cliente.TipoPessoa = TTipoPessoa.F then
       //validar cfp
       isCpfVAlido := TValidadorDocumento.ValidarCPF(Cliente.CpfCnpj);
     if Cliente.TipoPessoa = TTipoPessoa.J then
       //validar cnpj
        isCnpjValido := TValidadorDocumento.ValidarCNPJ(Cliente.CpfCnpj);
     if (isCpfValido) and (isCnpjValido) then
       raise EAppException.Create('Documento invalido!');
     //verificar se ja existe
     if (FClienteDAO.FindByDocumento(Cliente.CpfCnpj) <> nil) then
       raise EAppException.Create('Documento já registrado no sistema.');
     //salvar no banco
     FClienteDAO.Insert(Cliente);
  except
    on EApp: EAppException do
      raise;
    on EInf: EInfraException do
      raise;
    on EG: Exception do
      raise Exception.Create('Erro ao salvar Cliente '+EG.Message);
  end;

end;

//Pesquisar cliente por nome
procedure TClienteService.ListarPorNomeTela(Q: TZQuery; Nome: string);
begin
  FClienteDAO.ListarPorNomeTela(Q,Nome);
end;

end.
