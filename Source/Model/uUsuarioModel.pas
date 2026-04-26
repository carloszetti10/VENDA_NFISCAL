unit uUsuarioModel;

interface
type
  TUsuarioModel = class
  private
    FIdUsuario: Integer;
    FLogin: string;
    FSenha: string;
    FAtivo: Boolean;
  public
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property Login: string read FLogin write FLogin;
    property Senha: string read FSenha write FSenha;
    property Ativo: Boolean read FAtivo write FAtivo;

    constructor Create; overload;
  end;

implementation

{ TUsuarioModel }

constructor TUsuarioModel.Create;
begin
inherited Create;
end;

end.
