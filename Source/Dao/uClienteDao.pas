unit uClienteDao;

interface
uses
  IClienteDAO, uClienteModel, System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, uException;
type
  TClienteDao = class(TInterfacedObject, IClienteDAOO)
    private
      FConexao : TZConnection;
    public
     procedure Insert(Cliente: TClienteModel);
     procedure Update(Cliente: TClienteModel);
     function FindByDocumento(Docum: string): TClienteModel;
     function FindByID(ID: Integer): TClienteModel;
     procedure ListarPorNomeTela(Q: TZQuery; Nome: string);
     Constructor Create(Conn:TZConnection);

  end;

implementation

{ TClienteDao }

constructor TClienteDao.Create(Conn: TZConnection);
begin
  inherited Create;
   FConexao := Conn;
end;

function TClienteDao.FindByDocumento(Docum: string): TClienteModel;
var
  Q: TZQuery;
begin
  Q := TZQuery.Create(nil);
  try
    Q.Connection := FConexao;
    Q.SQL.Text :=
      'SELECT FIRST 1 * FROM CLIENTE WHERE CPF_CNPJ = :CPF_CNPJ';

    Q.ParamByName('CPF_CNPJ').AsString := Docum;
    Q.Open;

    if not Q.IsEmpty then
    begin
      Result := TClienteModel.Create;
      Result.Id := Q.FieldByName('ID_CLIENTE').AsInteger;
      Result.Nome := Q.FieldByName('NOME').AsString;
      Result.CpfCnpj := Q.FieldByName('CPF_CNPJ').AsString;
      Result.Telefone := Q.FieldByName('TELEFONE').AsString;
      Result.RazaoSocial := Q.FieldByName('RAZAO_SOCIAL').AsString;
    end
    else
      result := nil;

  finally
    Q.Free;
  end;
end;

function TClienteDao.FindByID(ID: Integer): TClienteModel;
var
  Q: TZQuery;
begin
  Q := TZQuery.Create(nil);
  try
    Q.Connection := FConexao;
    Q.SQL.Text :=
      'SELECT * FROM CLIENTE WHERE ID_CLIENTE = :ID';

    Q.ParamByName('ID').AsInteger := ID;
    Q.Open;

    if not Q.IsEmpty then
    begin
      Result := TClienteModel.Create;
      Result.Id := Q.FieldByName('ID_CLIENTE').AsInteger;
      Result.Nome := Q.FieldByName('NOME').AsString;
      Result.CpfCnpj := Q.FieldByName('CPF_CNPJ').AsString;
      Result.Telefone := Q.FieldByName('TELEFONE').AsString;
      Result.RazaoSocial := Q.FieldByName('RAZAO_SOCIAL').AsString;
    end
    else
      result := nil;
  finally
    Q.Free;
  end;
end;

procedure TClienteDao.Insert(Cliente: TClienteModel);
var
  Q: TZQuery;
begin
  Q := TZQuery.Create(nil);
  try
    try
      Q.Connection := FConexao;

      Q.SQL.Text :=
        'INSERT INTO CLIENTE (NOME, CPF_CNPJ, TIPO_PESSOA, TELEFONE, RAZAO_SOCIAL) ' +
        'VALUES (:NOME, :CPF_CNPJ, :TIPO, :TELEFONE, :RAZAO_SOCIAL)';

      Q.ParamByName('NOME').AsString := Cliente.Nome;
      Q.ParamByName('CPF_CNPJ').AsString := Cliente.CpfCnpj;
      Q.ParamByName('TIPO').AsString := Cliente.GetTipoChar;
      Q.ParamByName('TELEFONE').AsString := Cliente.Telefone;
      Q.ParamByName('RAZAO_SOCIAL').AsString := Cliente.RazaoSocial;

      Q.ExecSQL;

    except
      on E: EDatabaseError do
        raise EInfraException.Create('Erro ao realizar o cadastro' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

procedure TClienteDao.ListarPorNomeTela(Q: TZQuery; Nome: string);
begin
  Q.Close;
  Q.SQL.Text :=
    'SELECT ID_CLIENTE, NOME, CPF_CNPJ FROM CLIENTE WHERE UPPER(NOME) LIKE UPPER(:NOME)';
  Q.ParamByName('NOME').AsString := '%' + Trim(Nome) + '%';
  Q.Open;
end;

procedure TClienteDao.Update(Cliente: TClienteModel);
begin

end;

end.

