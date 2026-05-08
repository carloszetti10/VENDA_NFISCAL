unit uUsuarioModel;

interface
uses
  System.Generics.Collections, uPermissaoModel;
type
   TUsuarioModel = class
    private
      FId: Integer;
      FIdFuncionario: Integer;
      FNomeFuncionario: string;
      FLogin: string;
      FSenha: string;
      FAtivo: Boolean;
      FPermissao: TObjectList<TPermissaoModel>;
    public
      property Id: Integer read FId write FId;
      property IdFuncionario: Integer read FIdFuncionario write FIdFuncionario;
      property NomeFuncionario: string read FNomeFuncionario write FNomeFuncionario;
      property Login: string read FLogin write FLogin;
      property Senha: string read FSenha write FSenha;
      property Ativo: Boolean read FAtivo write FAtivo;
      property Permissao: TObjectList<TPermissaoModel> read FPermissao write FPermissao;
      constructor Create; overload;
      destructor Destroy;
      function TemPermissao(const ACodigo: string): Boolean;
  end;

implementation

{ TUsuarioModel }

constructor TUsuarioModel.Create;
begin
inherited Create;
FPermissao := TObjectList<TPermissaoModel>.Create;
end;

destructor TUsuarioModel.Destroy;
begin
  FPermissao.Free;
  inherited;
end;

function TUsuarioModel.TemPermissao(const ACodigo: string): Boolean;
var
  Perm: TPermissaoModel;
begin
  Result := False;

  for Perm in FPermissao do
  begin
    if Perm.Codigo = ACodigo then
      Exit(True);
  end;
end;

end.
