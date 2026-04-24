unit uMenuPrincipalUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uClientesUI;

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

{$R *.dfm}

procedure TfrmTelaPrincipal.CLIENTES1Click(Sender: TObject);
begin
   var
      frm : TfrmCadastroCliente;
    try
        frm := TfrmCadastroCliente.Create(nil);
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
