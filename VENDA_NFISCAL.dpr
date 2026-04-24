program VENDA_NFISCAL;

uses
  Vcl.Forms,
  uMenuPrincipalUI in 'Source\UI\uMenuPrincipalUI.pas' {frmTelaPrincipal},
  uTelaBaseCadastroUI in 'Source\UI\uTelaBaseCadastroUI.pas' {frmTelaBaseCadastro},
  uClientesUI in 'Source\UI\uClientesUI.pas' {frmCadastroCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.CreateForm(TfrmTelaBaseCadastro, frmTelaBaseCadastro);
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  Application.Run;
end.
