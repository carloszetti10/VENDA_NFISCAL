unit uSession;

interface

uses uUsuarioModel;

type
  TSession = class
  private
    class var FUsuarioLogado: TUsuarioModel;
  public
    class procedure SetUsuario(AUsuario: TUsuarioModel);
    class function GetUsuario: TUsuarioModel;
    class procedure Logout;
  end;

implementation

{ TSession }

class function TSession.GetUsuario: TUsuarioModel;
begin
  Result := FUsuarioLogado;
end;

class procedure TSession.SetUsuario(AUsuario: TUsuarioModel);
begin
  FUsuarioLogado := AUsuario;
end;

class procedure TSession.Logout;
begin
  FUsuarioLogado.Free;
end;

end.
