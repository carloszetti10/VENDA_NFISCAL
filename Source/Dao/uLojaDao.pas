unit uLojaDao;

interface
uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection,
  uException, uLojaModel, iLojaDAO;
type
  TLojaDao = class(TInterfacedObject, ILojaDAOO)
    private
      FConexao : TZConnection;
    public
      procedure Insert(Loja: TLojaModel);
      procedure Update(Loja: TLojaModel);
      function  FindBy: TLojaModel;
      Constructor Create(Conn:TZConnection);
  end;


implementation

{ TLojaDao }

constructor TLojaDao.Create(Conn: TZConnection);
begin
    inherited Create;
    FConexao := Conn;
end;
function TLojaDao.FindBy: TLojaModel;
var
  Qry: TZQuery;
begin
  Result := nil;
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := FConexao;

    Qry.SQL.Text := 'SELECT FIRST 1 * FROM LOJA';
    Qry.Open;

    if not Qry.IsEmpty then
    begin
      Result := TLojaModel.Create;
      Result.Id    := Qry.FieldByName('ID_LOJA').AsInteger;
      Result.Nome  := Qry.FieldByName('NOME').AsString;
      Result.RazaoSocial := Qry.FieldByName('RAZAO').AsString;
      Result.Documento  := Qry.FieldByName('CNPJ').AsString;
    end;

  except
    on E: Exception do
      raise Exception.Create('Erro ao buscar loja: ' + E.Message);
  end;
  Qry.Free;
end;
procedure TLojaDao.Insert(Loja: TLojaModel);
var
  Qry: TZQuery;
begin
  Qry := TZQuery.Create(nil);
  try
    Qry.Connection := FConexao;
    Qry.SQL.Text :=
      'INSERT INTO LOJA (NOME, RAZAO, CNPJ) ' +
      'VALUES (:NOME, :RAZAO, :CNPJ)';

    Qry.ParamByName('NOME').AsString := Loja.Nome;
    Qry.ParamByName('RAZAO').AsString := Loja.RazaoSocial;
    Qry.ParamByName('CNPJ').AsString := Loja.Documento;

    Qry.ExecSQL;

  except
    on E: Exception do
      raise Exception.Create('Erro ao inserir loja: ' + E.Message);
  end;
  Qry.Free;
end;

procedure TLojaDao.Update(Loja: TLojaModel);
begin

end;

end.
