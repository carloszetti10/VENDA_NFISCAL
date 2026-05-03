unit uLojaModel;

interface
type
   TLojaModel = class
    private
      FId: Integer;
      FNome: string;
      FRazaoSocial: string;
      FDocumento: string;
    public
      property Id: Integer read FId write FId;
      property Nome: string read FNome write FNome;
      property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
      property Documento: string read FDocumento write FDocumento;
      constructor Create; overload;
  end;

implementation


constructor TLojaModel.Create;
begin
  inherited;
end;

end.
