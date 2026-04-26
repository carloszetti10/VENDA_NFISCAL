unit uClienteModel;

interface
type
  TTipoPessoa = (F,J);
  TClienteModel = class
    private
      FId: Integer;
      FNome: string;
      FTelefone: string;
      FCpfCnpj: string;
      FRazaoSocial: string;
      FTipoPesoa: TTipoPessoa;
      FAtivo: Boolean;
    public
      property Id: Integer read FId write FId;
      property Nome: string read FNome write FNome;
      property Telefone: string read FTelefone write FTelefone;
      property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
      property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
      property TipoPessoa: TTipoPessoa read FTipoPesoa write FTipoPesoa;
      property Ativo: Boolean read FAtivo write FAtivo;
      function GetTipoChar: char;
      constructor Create; overload;

  end;

implementation

{ TClienteModel }


constructor TClienteModel.Create;
begin
  inherited;
end;

function TClienteModel.GetTipoChar: Char;
begin
  case TipoPessoa of
    F: Result := 'F';
    J: Result := 'J';
  end;
end;

end.
