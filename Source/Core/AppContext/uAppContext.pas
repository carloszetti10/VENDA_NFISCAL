unit uAppContext;

interface

uses
  System.Generics.Collections;

type
  TUsuarioContext = class
  public
    IdUsuario: Integer;
    Login: string;
    Permissoes: TList<Integer>;

    constructor Create;
    destructor Destroy; override;
  end;

  TLojaContext = class
  public
    CodigoLoja: Integer;
    Nome: string;
    Razao: string;
    CnpjLoja: string;
  end;

  TAppContext = class
  public
    User: TUsuarioContext;
    Store: TLojaContext;

    constructor Create;
    destructor Destroy; override;

    procedure ClearAll;
  end;

var
  AppCtx: TAppContext;

implementation

uses System.SysUtils;

{ TUsuarioContext }

constructor TUsuarioContext.Create;
begin
  Permissoes := TList<Integer>.Create;
end;

destructor TUsuarioContext.Destroy;
begin
  Permissoes.Free;
  inherited;
end;

{ TAppContext }

constructor TAppContext.Create;
begin
  User := TUsuarioContext.Create;
  Store := TLojaContext.Create;
end;

destructor TAppContext.Destroy;
begin
  User.Free;
  Store.Free;
  inherited;
end;

procedure TAppContext.ClearAll;
begin
  User.IdUsuario := 0;
  User.Login := '';
  User.Permissoes.Clear;

  Store.CodigoLoja := 0;
  Store.CnpjLoja := '';
  Store.Nome := '';
  Store.Razao := '';
end;

initialization
  AppCtx := TAppContext.Create;

finalization
  FreeAndNil(AppCtx);
end.
