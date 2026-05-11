unit uItemVendaService;

interface
uses
  iItemVendaService, IItemVendaDAOO, uItemVendaModel,System.Generics.Collections,
  ZConnection, uException,ZDataset, IProdutoService, uProdutoService;
type
   TItemVendaService = class(TInterfacedObject, IItemVendaServiceInterface)
   private
     FItemVendaDao: IItemVendaDAO;
   public
     procedure ListarProdutoVenda(Q: TZQuery; IdVenda: Integer);
     procedure InserirItem(AItem: TItemVendaModel);
     constructor Create(AItemVendaDao: IItemVendaDAO);
     procedure RemoverItemDaVenda(Quant: Currency; ItemVenda: TItemVendaModel);
     function  ListarProdutosPorVenda(IdVenda: Integer): TObjectList<TItemVendaModel>;
   end;
implementation

{ TVendaService }

constructor TItemVendaService.Create(AItemVendaDao: IItemVendaDAO);
begin
  FItemVendaDao:= AItemVendaDao;
end;

procedure TItemVendaService.InserirItem(AItem: TItemVendaModel);
var
  ItemExistente: TItemVendaModel;
begin
  ItemExistente := FItemVendaDao.FindByItemVenda(AItem);
  try
    if Assigned(ItemExistente) then
    begin
      AItem.Quantidade := ItemExistente.Quantidade + AItem.Quantidade;
    end;

    AItem.ValorTotal := (AItem.Quantidade * AItem.ValorUnitario);

    if Assigned(ItemExistente) then
      FItemVendaDao.Update(AItem)
    else
      FItemVendaDao.Insert(AItem);

  finally
    ItemExistente.Free;
  end;
end;

function TItemVendaService.ListarProdutosPorVenda(
  IdVenda: Integer): TObjectList<TItemVendaModel>;
begin
   Result := FItemVendaDAO.ListarProdutosPorVenda(IdVenda);
end;

procedure TItemVendaService.ListarProdutoVenda(Q: TZQuery; IdVenda: Integer);
begin
  FItemVendaDao.ListarPorVenda(Q, IdVenda);
end;

procedure TItemVendaService.RemoverItemDaVenda(Quant: Currency;
  ItemVenda: TItemVendaModel);
begin
  if Quant = ItemVenda.Quantidade  then
  begin
    //delete
    FItemVendaDao.Deletar(ItemVenda.IdVenda, ItemVenda.IdProduto);
  end
  else if Quant < ItemVenda.Quantidade then
  begin
    //update
    ItemVenda.Quantidade:= ItemVenda.Quantidade - Quant;
    ItemVenda.ValorTotal := ItemVenda.ValorUnitario * ItemVenda.Quantidade;
    FItemVendaDao.Update(ItemVenda);
  end
  else
    raise EAppException.Create('Quantidade selecionada maior do que o a quantidade do produto da venda.');
end;

end.
