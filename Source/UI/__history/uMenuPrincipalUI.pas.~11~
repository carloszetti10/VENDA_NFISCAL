unit uMenuPrincipalUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uClientesUI,uAppServiceConexao;

type
  TfrmTelaPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CADASTRO1: TMenuItem;
    CLIENTES1: TMenuItem;
    PRODUTOS1: TMenuItem;
    RELATORIOS1: TMenuItem;
    SAIR1: TMenuItem;
    procedure SAIR1Click(Sender: TObject);
    procedure CLIENTES1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation
uses
   iClienteService, uClienteService, IClienteDAO, uClienteDao;

{$R *.dfm}

procedure TfrmTelaPrincipal.CLIENTES1Click(Sender: TObject);
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


procedure TfrmTelaPrincipal.SAIR1Click(Sender: TObject);
begin
   Application.Terminate;
end;

end.
