unit uFormaPagModel;

interface
type
   TFormaPagamentoModel = class
    private
      FId: Integer;
      FNome: string;
      FAtivo: Boolean;
    public
      property Id: Integer read FId write FId;
      property Nome: string read FNome write FNome;
      property Ativo: Boolean read FAtivo write FAtivo;
      constructor Create; overload;
  end;

implementation
{ TFormaPagamentoModel }

constructor TFormaPagamentoModel.Create;
begin
  inherited;
end;

end.
