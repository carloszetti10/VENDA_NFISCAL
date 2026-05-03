unit uPermissaoModel;

interface
type
   TPermissaoModel = class
    private
      FId: Integer;
      FNome: string;
      FCodigo: string;
    public
      property Id: Integer read FId write FId;
      property Nome: string read FNome write FNome;
      property Codigo: string read FCodigo write FCodigo;
      constructor Create; overload;
  end;

implementation

constructor TPermissaoModel.Create;
begin
  inherited;
end;

end.
