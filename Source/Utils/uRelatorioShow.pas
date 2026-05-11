unit uRelatorioShow;

interface

uses
  System.SysUtils,uRelCadClientes,uRelProVenda,uAppServiceConexao, uRelCadProdutos;

type
  TRelatorioShow = class
  public
     class procedure VisualizarTelatorioCliente;
     class procedure VisualizarTelatorioProduto;
     class procedure VisualizarTelatorioVendaPorId(IdVenda: Integer);
  end;

implementation

{ TRelatorioShow }

class procedure TRelatorioShow.VisualizarTelatorioCliente;
begin
  frmRelCadClientes := TfrmRelCadClientes.Create(nil);
  try
    frmRelCadClientes.PreencherRelatorio;
    frmRelCadClientes.Relatorio.Preview;
  finally
    frmRelCadClientes.Free;
  end;
end;

class procedure TRelatorioShow.VisualizarTelatorioProduto;
begin
   frmRelCadProdutos := TfrmRelCadProdutos.Create(nil);
  try
    frmRelCadProdutos.Relatorio.Preview;
  finally
    frmRelCadProdutos.Free;
  end;
end;

class procedure TRelatorioShow.VisualizarTelatorioVendaPorId(IdVenda: Integer);
var
  frmRelVenda: TfrmRelProVenda;
begin
  frmRelVenda := TfrmRelProVenda.Create(nil);
  try
    frmRelVenda.QryVendas.Connection := AppServiceConexao.getConexao;
    frmRelVenda.QryVendaItens.Connection := AppServiceConexao.getConexao;
    frmRelVenda.QryVendas.ParamByName('ID_VENDA').AsInteger := IdVenda;
    frmRelVenda.QryVendas.Open;
    frmRelVenda.QryVendaItens.ParamByName('ID_VENDA').AsInteger := IdVenda;
    frmRelVenda.QryVendaItens.Open;
    frmRelVenda.Relatorio.PreviewModal;
  finally
    frmRelVenda.Free;
  end;
end;

end.
