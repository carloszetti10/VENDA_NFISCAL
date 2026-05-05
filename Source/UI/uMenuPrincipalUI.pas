unit uMenuPrincipalUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uClientesUI,uAppServiceConexao, uFormaPagamentoUI, uFuncionarioUI,
  uProdutoUI, uUsuarioUI, uUsuarioService,uUsuarioDao,IUsuarioDAO,iUsuarioService, uVendaDavUI,
  Vcl.ExtCtrls,ZConnection,
  iClienteService, uClienteService, IClienteDAO, uClienteDao,
  IProdutoService, uProdutoService, IProdutoDAO, uProdutoDao,
  iVendaService, uVendaService, iVendaDAO, uVendaDao,
   iFuncionarioService, uFuncionarioService, iFuncionarioDAO, uFuncionarioDao,
   iItemVendaService, uItemVendaModel, uItemVendaDao, IItemVendaDAOO,uItemVendaService,
  Vcl.StdCtrls,uAppContext,uSession, uUsuarioModel, Vcl.Buttons;

type
  TfrmTelaPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    CLIENTES: TMenuItem;
    PRODUTO: TMenuItem;
    RELATORIOS1: TMenuItem;
    SAIR1: TMenuItem;
    FUNCIONARIO1: TMenuItem;
    N1: TMenuItem;
    USUARIO1: TMenuItem;
    EMPRESA1: TMenuItem;
    FORMAPAGAMENTO1: TMenuItem;
    PanelCentro: TPanel;
    GridPanel1: TGridPanel;
    VENDA1: TMenuItem;
    pnl: TPanel;
    nomeEmpresa: TLabel;
    lbUsuario: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlProd: TPanel;
    pnlUser: TPanel;
    pnlFun: TPanel;
    pnlForP: TPanel;
    pnlVen: TPanel;
    pnlFat: TPanel;
    btnCliente: TBitBtn;
    btnProd: TBitBtn;
    btnUsuario: TBitBtn;
    btnFuncio: TBitBtn;
    BitBtn5: TBitBtn;
    btnVenda: TBitBtn;
    btnFaturam: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure SAIR1Click(Sender: TObject);
    procedure CLIENTESClick(Sender: TObject);
    procedure PRODUTOClick(Sender: TObject);
    procedure FUNCIONARIO1Click(Sender: TObject);
    procedure FORMAPAGAMENTO1Click(Sender: TObject);
    procedure USUARIO1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure VENDA1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel2Click(Sender: TObject);
    procedure btnProdClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnFuncioClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);



  private
    FConn: TZConnection;
  public
    function CriarProdutoService: IProdutoServiceInterface;
    function CriarVendaService: IVendaServiceInterface;
    function CriarFuncionarioService: IFuncionarioServiceInterface;
    function CriarItemVendaService: IItemVendaServiceInterface;
    procedure EsconderMenuPorPermissao;
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

{$R *.dfm}

procedure TfrmTelaPrincipal.BitBtn5Click(Sender: TObject);
begin
  FORMAPAGAMENTO1.Click;
end;

procedure TfrmTelaPrincipal.btnClienteClick(Sender: TObject);
begin
  CLIENTES.Click;
end;

procedure TfrmTelaPrincipal.btnFuncioClick(Sender: TObject);
begin
  FUNCIONARIO1.Click;
end;

procedure TfrmTelaPrincipal.btnProdClick(Sender: TObject);
begin
  PRODUTO.Click;
end;

procedure TfrmTelaPrincipal.btnUsuarioClick(Sender: TObject);
begin
  USUARIO1.Click;
end;

procedure TfrmTelaPrincipal.btnVendaClick(Sender: TObject);
begin
  VENDA1.Click;
end;

procedure TfrmTelaPrincipal.CLIENTESClick(Sender: TObject);
var
  frm : TfrmCadastroCliente;
  Service: IClienteServiceInterface;
  Dao: IClienteDAOO;
begin
  Dao := TClienteDao.Create(AppServiceConexao.getConexao);
  Service := TClienteService.Create(Dao);  //pequisar depois uma forma de fazer para não precisar criar a implementação aqui
  frm := TfrmCadastroCliente.Create(nil, Service);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

function TfrmTelaPrincipal.CriarFuncionarioService: IFuncionarioServiceInterface;
var
  Dao: IFuncionarioDAOO;
begin
  Dao := TFuncionarioDao.Create(FConn);
  Result := TFuncionarioService.Create(Dao);
end;

function TfrmTelaPrincipal.CriarItemVendaService: IItemVendaServiceInterface;
var
  Dao: IItemVendaDAO;
begin
  Dao := TItemVendaDao.Create(FConn);
  Result := TItemVendaService.Create(Dao);
end;

function TfrmTelaPrincipal.CriarProdutoService: IProdutoServiceInterface;
var
  Dao: IProdutoDAOO;
begin
  Dao := TProdutoDao.Create(FConn);
  Result := TProdutoService.Create(Dao);
end;

function TfrmTelaPrincipal.CriarVendaService: IVendaServiceInterface;
var
  DaoVenda: IVendaDAOO;
  ProdutoService: IProdutoServiceInterface;
  ItemVendaService: IItemVendaServiceInterface;
begin
  ProdutoService := CriarProdutoService;
  DaoVenda := TVendaDao.Create(FConn);
  ItemVendaService := CriarItemVendaService;
  Result := TVendaService.Create(DaoVenda, ProdutoService,ItemVendaService);
end;
procedure TfrmTelaPrincipal.EsconderMenuPorPermissao;
var
  Usuario: TUsuarioModel;
begin
  Usuario := TSession.GetUsuario;

  if not Assigned(Usuario) then Exit;

  CLIENTES.Visible    := Usuario.TemPermissao('CAD_CLIENTE');
  PRODUTO.Visible      := Usuario.TemPermissao('CAD_PRODUTO');
  FUNCIONARIO1.Visible := Usuario.TemPermissao('CAD_FUNCIONARIO');
  USUARIO1.Visible     := Usuario.TemPermissao('CAD_USUARIO');
  VENDA1.Visible       := Usuario.TemPermissao('CAD_VENDA');

  btnCliente.Enabled  := Usuario.TemPermissao('CAD_CLIENTE');
  btnProd.Enabled   := Usuario.TemPermissao('CAD_PRODUTO');
  btnUsuario.Enabled :=  Usuario.TemPermissao('CAD_USUARIO');
  btnVenda.Enabled :=  Usuario.TemPermissao('CAD_VENDA');

  btnFaturam.Enabled := FALSE;

  if Usuario.Id = 0 then
  begin
    USUARIO1.Visible     := True;
    FUNCIONARIO1.Visible := True;
  end;
end;
procedure TfrmTelaPrincipal.FORMAPAGAMENTO1Click(Sender: TObject);
var
  frm : TfrmCadastroPagamento;
  //Service: IClienteServiceInterface;
  //Dao: IClienteDAOO;
begin
  //Dao := TClienteDao.Create(AppServiceConexao.getConexao);
  //Service := TClienteService.Create(Dao);
  frm := TfrmCadastroPagamento.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;
procedure TfrmTelaPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   TSession.Logout;
   AppCtx.ClearAll;

    Action := caFree;
end;

procedure TfrmTelaPrincipal.FormCreate(Sender: TObject);
begin

  begin
  if Assigned(AppCtx.Store) then
    nomeEmpresa.Caption := AppCtx.Store.Razao
  else
    nomeEmpresa.Caption := '';
  end;

  FConn := AppServiceConexao.getConexao;
  nomeEmpresa.Caption := AppCtx.Store.Razao;
  lbUsuario.Caption := AppCtx.User.Login;
  EsconderMenuPorPermissao;
end;

procedure TfrmTelaPrincipal.FormResize(Sender: TObject);
begin
  PanelCentro.Left := (ClientWidth - PanelCentro.Width) div 2;
  PanelCentro.Top  := (ClientHeight - PanelCentro.Height) div 2;
end;
procedure TfrmTelaPrincipal.FUNCIONARIO1Click(Sender: TObject);
var
  frm : TfrmCadastroFuncionario;
  Service: IFuncionarioServiceInterface;
begin

  Service := CriarFuncionarioService;
  frm := TfrmCadastroFuncionario.Create(nil, Service);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;
procedure TfrmTelaPrincipal.Panel2Click(Sender: TObject);
begin
  CLIENTES.Click;
end;

procedure TfrmTelaPrincipal.PRODUTOClick(Sender: TObject);
var
  frm : TfrmCadastroProduto;
  Service: IProdutoServiceInterface;
begin
  Service := CriarProdutoService;
  frm := TfrmCadastroProduto.Create(nil, Service);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;
procedure TfrmTelaPrincipal.SAIR1Click(Sender: TObject);
begin
   Close;
end;
procedure TfrmTelaPrincipal.USUARIO1Click(Sender: TObject);
var
  frm : TTfrmCadastroUsuario;
  Service: IUsuarioServiceInterface;
  Dao: IUsuarioDAOO;
begin
  Dao := TUsuarioDao.Create(AppServiceConexao.getConexao);
  Service := TUsuarioService.Create(Dao, AppServiceConexao.getConexao);
  frm := TTfrmCadastroUsuario.Create(nil,Service);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;
procedure TfrmTelaPrincipal.VENDA1Click(Sender: TObject);
var
  frm : TfrmVendaDav;
  Service: IVendaServiceInterface;
begin
  Service := CriarVendaService;
  frm := TfrmVendaDav.Create(nil,Service);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;

end;

end.
