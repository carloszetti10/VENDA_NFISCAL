unit uItemVendaDao;
interface
uses
  IVendaDAO, uVendaModel, System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, uException,
  System.Generics.Collections, uItemVendaModel, IItemVendaDAOO, uProdutoModel;
type
  TItemVendaDao = class(TInterfacedObject, IItemVendaDAO)
  private
    FConexao: TZConnection;
  public
    constructor Create(Conn: TZConnection);

    procedure Insert(AItem: TItemVendaModel);
    procedure Update(AItem: TItemVendaModel);
    procedure Deletar(IdVenda, IdProduto: Integer);
    procedure ListarPorVenda(Q: TZQuery; IdVenda: Integer);
    function  FindByItemVenda(AItem: TItemVendaModel): TItemVendaModel;
    function ListarProdutosPorVenda(IdVenda: Integer): TObjectList<TItemVendaModel>;
  end;

implementation

{ TItemVendaDao }


{ ================== CONSTRUTOR ================== }
constructor TItemVendaDao.Create(Conn: TZConnection);
begin
  inherited Create;
  FConexao := Conn;
end;

procedure TItemVendaDao.Deletar(IdVenda, IdProduto: Integer);
var
  Q: TZQuery;
begin
  Q := TZQuery.Create(nil);
  try
    try
      Q.Connection := FConexao;

      Q.SQL.Text :=
        'DELETE FROM ITEM_VENDA ' +
        'WHERE ID_VENDA = :ID_VENDA ' +
        'AND ID_PRODUTO = :ID_PRODUTO';

      Q.ParamByName('ID_VENDA').AsInteger := IdVenda;
      Q.ParamByName('ID_PRODUTO').AsInteger := IdProduto;

      Q.ExecSQL;

    except
      on E: Exception do
        raise EInfraException.Create('Erro ao deletar item: ' + E.Message);
    end;

  finally
    Q.Free;
  end;
end;


function TItemVendaDao.FindByItemVenda(AItem: TItemVendaModel): TItemVendaModel;
var
  Q: TZQuery;
  Item: TItemVendaModel;
begin
  Result := nil;

  Q := TZQuery.Create(nil);
  try
    Q.Connection := FConexao;

    Q.SQL.Text :=
      'SELECT ID_VENDA, ID_PRODUTO, QUANTIDADE, VALOR_DESC, VALOR_UNITARIO, VALOR_TOTAL ' +
      'FROM ITEM_VENDA ' +
      'WHERE ID_VENDA = :ID_VENDA AND ID_PRODUTO = :ID_PRODUTO';

    Q.ParamByName('ID_VENDA').AsInteger := AItem.IdVenda;
    Q.ParamByName('ID_PRODUTO').AsInteger := AItem.IdProduto;

    Q.Open;

    if not Q.IsEmpty then
    begin
      Item := TItemVendaModel.Create;
      Item.IdVenda       := Q.FieldByName('ID_VENDA').AsInteger;
      Item.IdProduto     := Q.FieldByName('ID_PRODUTO').AsInteger;
      Item.Quantidade    := Q.FieldByName('QUANTIDADE').AsFloat;
      Item.ValorDesc     := Q.FieldByName('VALOR_DESC').AsCurrency;
      Item.ValorUnitario := Q.FieldByName('VALOR_UNITARIO').AsCurrency;
      Item.ValorTotal    := Q.FieldByName('VALOR_TOTAL').AsCurrency;

      Result := Item;
    end;

  finally
    Q.Free;
  end;
end;

{ ================== INSERT ================== }
procedure TItemVendaDao.Insert(AItem: TItemVendaModel);
var
  Q: TZQuery;
begin

  Q := TZQuery.Create(nil);
  try
    try
      Q.Connection := FConexao;

      Q.SQL.Text := 'INSERT INTO ITEM_VENDA (ID_VENDA, ID_PRODUTO, QUANTIDADE, VALOR_DESC, VALOR_UNITARIO, VALOR_TOTAL) ' +
       'VALUES (:ID_VENDA, :ID_PRODUTO, :QTD, :DESC, :VLR_UNIT, :TOTAL)';

    Q.ParamByName('ID_VENDA').AsInteger := AItem.IdVenda;
    Q.ParamByName('ID_PRODUTO').AsInteger := AItem.IdProduto;
    Q.ParamByName('QTD').AsCurrency := AItem.Quantidade;
    Q.ParamByName('DESC').AsCurrency := AItem.ValorDesc;
    Q.ParamByName('VLR_UNIT').AsCurrency := AItem.ValorUnitario;
    Q.ParamByName('TOTAL').AsCurrency := AItem.ValorTotal;

    Q.ExecSQL;
    except
    on E: Exception do
      raise EInfraException.Create('Erro ao inserir item: ' + E.Message);

    end;
  finally
    Q.Free;
  end;

end;

procedure TItemVendaDao.ListarPorVenda(Q: TZQuery; IdVenda: Integer);
begin
  Q.Close;
  Q.Connection := FConexao;

  Q.SQL.Text :=
    'SELECT I.ID_PRODUTO, P.NOME, I.QUANTIDADE, I.VALOR_UNITARIO, I.VALOR_TOTAL ' +
    'FROM ITEM_VENDA I JOIN PRODUTO P ON I.ID_PRODUTO = P.ID_PRODUTO '+
    'WHERE ID_VENDA = :ID';

  Q.ParamByName('ID').AsInteger := IdVenda;
  Q.Open;

  TFMTBCDField(Q.FieldByName('VALOR_UNITARIO')).DisplayFormat := 'R$ #,##0.00';
  TFMTBCDField(Q.FieldByName('VALOR_TOTAL')).DisplayFormat := 'R$ #,##0.00';
  TFMTBCDField(Q.FieldByName('QUANTIDADE')).DisplayFormat := '0.00';
end;

procedure TItemVendaDao.Update(AItem: TItemVendaModel);
var
  Q: TZQuery;
begin
  Q := TZQuery.Create(nil);
  try
    Q.Connection := FConexao;

    Q.SQL.Text :=
      'UPDATE ITEM_VENDA SET ' +
      'QUANTIDADE = :QUANTIDADE, ' +
      'VALOR_DESC = :VALOR_DESC, ' +
      'VALOR_UNITARIO = :VALOR_UNITARIO, ' +
      'VALOR_TOTAL = :VALOR_TOTAL ' +
      'WHERE ID_VENDA = :ID_VENDA AND ID_PRODUTO = :ID_PRODUTO';

    Q.ParamByName('ID_VENDA').AsInteger := AItem.IdVenda;
    Q.ParamByName('ID_PRODUTO').AsInteger := AItem.IdProduto;
    Q.ParamByName('QUANTIDADE').AsFloat := AItem.Quantidade;
    Q.ParamByName('VALOR_DESC').AsCurrency := AItem.ValorDesc;
    Q.ParamByName('VALOR_UNITARIO').AsCurrency := AItem.ValorUnitario;
    Q.ParamByName('VALOR_TOTAL').AsCurrency := AItem.ValorTotal;

    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;


function TItemVendaDao.ListarProdutosPorVenda(
  IdVenda: Integer
): TObjectList<TItemVendaModel>;
var
  Q: TZQuery;
  Item: TItemVendaModel;
begin
  Result := TObjectList<TItemVendaModel>.Create(True);

  Q := TZQuery.Create(nil);

  try
    Q.Connection := FConexao;

    Q.SQL.Text :=
      'SELECT ' +
      '  P.ID_PRODUTO, ' +
      '  P.NOME, ' +
      '  I.QUANTIDADE, ' +
      '  I.VALOR_DESC, ' +
      '  I.VALOR_TOTAL, ' +
      '  I.VALOR_UNITARIO ' +
      'FROM ITEM_VENDA I ' +
      'JOIN PRODUTO P ON P.ID_PRODUTO = I.ID_PRODUTO ' +
      'WHERE I.ID_VENDA = :ID';

    Q.ParamByName('ID').AsInteger := IdVenda;

    Q.Open;

    while not Q.Eof do
    begin
      Item := TItemVendaModel.Create;

      Item.IdProduto := Q.FieldByName('ID_PRODUTO').AsInteger;
      Item.NomeProduto := Q.FieldByName('NOME').AsString;
      Item.Quantidade := Q.FieldByName('QUANTIDADE').AsCurrency;
      Item.ValorUnitario := Q.FieldByName('VALOR_UNITARIO').AsCurrency;
      Item.ValorTotal := Q.FieldByName('VALOR_TOTAL').AsCurrency;
      Item.ValorDesc := Q.FieldByName('VALOR_DESC').AsCurrency;

      Result.Add(Item);

      Q.Next;
    end;

  finally
    Q.Free;
  end;
end;


end.
