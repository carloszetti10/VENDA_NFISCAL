unit uFuncionarioModel;

interface
type
   TFuncionarioModel = class
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
{ TFuncionarioModel }

constructor TFuncionarioModel.Create;
begin
  inherited;
end;

end.
