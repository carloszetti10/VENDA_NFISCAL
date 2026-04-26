unit uClienteDao;

interface
uses
  IClienteDAO, uClienteModel, System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;
type
  TClienteDao = class(TInterfacedObject, IClienteDAOO)
    private
      FConexao : TZConnection;
    public
     procedure Insert(Cliente: TClienteModel);
     procedure Update(Cliente: TClienteModel);
     function FindByDocumento(Docum: string): TClienteModel;
     function FindByID(ID: Integer): TClienteModel;
     function Listar(Nome: string): TZQuery;
     function ListarVazia: TZQuery;
     Constructor Create(Conn:TZConnection);

  end;

implementation

{ TClienteDao }

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
      on E: Exception do
        raise Exception.Create('Erro ao inserir cliente: ' + E.Message);
    end;
  finally
    Q.Free;
  end;
end;

function TClienteDao.Listar(Nome: string): TZQuery;
begin
  Result := TZQuery.Create(nil);
  Result.Connection := FConexao;

  Result.SQL.Text :=  'SELECT ID_CLIENTE, NOME FROM CLIENTE WHERE NOME LIKE :NOME AND ATIVO = 1';

  Result.ParamByName('NOME').AsString := '%' + Nome + '%';
  Result.Open;
end;


function TClienteDAO.ListarVazia: TZQuery;
begin
  Result := TZQuery.Create(nil);
  Result.Connection := FConexao;

  Result.SQL.Text :=
    'SELECT ID_CLIENTE, NOME FROM CLIENTE WHERE ID_CLIENTE = 0';
  Result.Open;
end;

procedure TClienteDao.Update(Cliente: TClienteModel);
begin

end;

end.

