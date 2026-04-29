unit uItemVendaModel;

interface
type
   TVendaModel = class
    private
      FIdVenda: Integer;
      FIdProduto: Integer;

      FQuant: Float;

      FNomeProduto: string;

      FValorTotal: Currency;
      FValorUnitario: Currency;
      FValorDesc: Currency;
    public
      constructor Create;
      property IdVenda: Integer read FIdVenda write FIdVenda;
      property IdVendedor: Integer read FNomeProduto write FNomeProduto;
      property IdCliente: Integer read FIdCliente write FIdCliente;
      property IdUsuario: Integer read FIdUsuario write FIdUsuario;

      property NomeVendedor: string read FNomeVendedor write FNomeVendedor;
      property NomeCliente: string read FNomeCliente write FNomeCliente;

      property Status: TStatusVenda read FStatus write FStatus;
      property ValorTotal: Currency read FValorTotal write FValorTotal;
      property ValorDesconto: Currency read FValorDesc write FValorDesc;
      property Emissao: TDateTime read FEmissao write FEmissao;
  end;

implementation

{ TVendaModel }

constructor TVendaModel.Create;
begin
  FStatus := svAberta;
end;

end.
