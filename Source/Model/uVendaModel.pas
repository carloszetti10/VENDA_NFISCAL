unit uVendaModel;

interface
type
   TStatusVenda = (svAberta = 0, svDav = 1, svFaturada = 2, svCancelado = 3);
   TVendaModel = class
    private
      FIdVenda: Integer;
      FIdVendedor: Integer;
      FIdCliente: Integer;
      FIdUsuario: Integer;

      FNomeVendedor: string;
      FNomeCliente: string;

      FStatus: TStatusVenda;
      FValorTotal: Currency;
      FValorDesc: Currency;
      FValorLiquido: Currency;
      FEmissao: TDateTime;
    public
      constructor Create;
      property IdVenda: Integer read FIdVenda write FIdVenda;
      property IdVendedor: Integer read FIdVendedor write FIdVendedor;
      property IdCliente: Integer read FIdCliente write FIdCliente;
      property IdUsuario: Integer read FIdUsuario write FIdUsuario;

      property NomeVendedor: string read FNomeVendedor write FNomeVendedor;
      property NomeCliente: string read FNomeCliente write FNomeCliente;

      property Status: TStatusVenda read FStatus write FStatus;
      property ValorTotal: Currency read FValorTotal write FValorTotal;
      property ValorLiquido: Currency read FValorLiquido write FValorLiquido;
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
