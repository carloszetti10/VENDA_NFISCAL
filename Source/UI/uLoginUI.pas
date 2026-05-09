unit uLoginUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uUsuarioService,
  iUsuarioService, uUsuarioModel, uUsuarioDao, uUsuarioUI,IUsuarioDAO, uException, uAppServiceConexao,
  uValidarCampo,ZConnection, uMenuPrincipalUI,uLojaModel, uAppContext,uRelProVenda, iLojaDAO,uLojaDao,uSession, Enter;

type
  TftmLogin = class(TForm)
    Label1: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label2: TLabel;
    btnEntrar: TBitBtn;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     FEnter : TMREnter;
     FUsuarioService: IUsuarioServiceInterface;
     FDaoLoja: ILojaDAOO; //criar o service depois
  public
    procedure Logar;
    function  VerificarUsurMaster(user, senha: string): Boolean;
    procedure AbrirTelaInicial(UsuarioLogado: TUsuarioModel; Loja: TLojaModel);
    procedure VerificarLojaCadastrada;
    procedure LimparCampo;
  end;

var
  ftmLogin: TftmLogin;

implementation

{$R *.dfm}

procedure TftmLogin.AbrirTelaInicial(UsuarioLogado: TUsuarioModel; Loja: TLojaModel);
begin
  TSession.SetUsuario(UsuarioLogado);
  FUsuarioService.PreecherAppContext(UsuarioLogado, Loja);
  frmTelaPrincipal := TfrmTelaPrincipal.Create(nil);
  try
    Self.Hide; // escondeR o login
    frmTelaPrincipal.ShowModal;
  finally
    Self.Show; // volta o login quando a principal fechar
    frmTelaPrincipal.Free;
  end;
end;

procedure TftmLogin.btnEntrarClick(Sender: TObject);
begin
  Logar;
  LimparCampo;
end;

procedure TftmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TftmLogin.FormCreate(Sender: TObject);
var
  Dao: IUsuarioDAOO;
  Conexao: TZConnection;

begin
  Conexao := AppServiceConexao.getConexao;
  FDaoLoja := TLojaDao.Create(Conexao);

  Dao := TUsuarioDao.Create(Conexao);
  FUsuarioService := TUsuarioService.Create(Dao, Conexao);
  VerificarLojaCadastrada; //não deve esta aqui mais de inicio vou implementar aqui.

  FEnter := TMREnter.Create(Self);
  FEnter.FocusEnabled:=true;
  FEnter.FocusColor:=clInfoBk;
end;

procedure TftmLogin.LimparCampo;
begin
  edtLogin.Text := '';
  edtSenha.Text := '';
end;

procedure TftmLogin.Logar;
var
  Usuario: TUsuarioModel;
  Loja: TLojaModel;
begin

  TValidarCampos.ValidarEditVazio(edtLogin, 'Usuario');
  TValidarCampos.ValidarEditVazio(edtSenha, 'Senha');

  Loja := FDaoLoja.FindBy;
  if not Assigned(Loja) then
    raise Exception.Create('Nenhuma loja cadastrada.');

  if VerificarUsurMaster(edtLogin.Text, edtSenha.Text) then
  begin
    Usuario := TUsuarioModel.Create;
    Usuario.Login := 'ZETTI';
    Usuario.Id := 0;
    AbrirTelaInicial(Usuario, Loja);
    Exit;
  end;

  Usuario := FUsuarioService.Login(edtLogin.Text, edtSenha.Text);
  if Usuario <> nil then
  begin
    AbrirTelaInicial(Usuario, Loja);
  end
end;

function TftmLogin.VerificarUsurMaster(user, senha: string): Boolean;
begin
  Result := False;
  if (user = 'ZETTI') and (senha = '123') then
    result:= true;
end;

procedure TftmLogin.VerificarLojaCadastrada;
var
  Loja: TLojaModel;
begin
  Loja := FDaoLoja.FindBy;


  if not Assigned(Loja) then
  begin
    //AbrirTelaInicial(nil,nil);
    Exit;
  end;

end;
end.
