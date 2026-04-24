unit uTelaBaseCadastroUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmTelaBaseCadastro = class(TForm)
    PageControlHerenca: TPageControl;
    TabConsulta: TTabSheet;
    Panel1: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisa: TBitBtn;
    dbGridHerenca: TDBGrid;
    TabCadastro: TTabSheet;
    pnlInferior: TPanel;
    btnAlterar: TBitBtn;
    btnGravar: TBitBtn;
    btnApagar: TBitBtn;
    btnSair: TBitBtn;
    btnNovo: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure qqClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
     procedure ControlarBotoes(nInsert: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaBaseCadastro: TfrmTelaBaseCadastro;

implementation

{$R *.dfm}

{ TForm2 }



procedure TfrmTelaBaseCadastro.qqClick(Sender: TObject);
begin
   ControlarBotoes(true);
end;

procedure TfrmTelaBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(true);
end;

procedure TfrmTelaBaseCadastro.btnNovoClick(Sender: TObject);
begin
   ControlarBotoes(false);
end;

procedure TfrmTelaBaseCadastro.ControlarBotoes(nInsert: Boolean);
begin
  btnNovo.Enabled := nInsert;
   btnAlterar.Enabled := nInsert;
   btnApagar.Enabled := nInsert;

   btnCancelar.Enabled := not nInsert;
   btnGravar.Enabled := not nInsert;

   if(not nInsert) then
   begin
     PageControlHerenca.ActivePageIndex := 1;  // vai para a página cadastro
     PageControlHerenca.Pages[0].TabVisible := False; // desativa consulta
   end
   else
   begin
       PageControlHerenca.Pages[0].TabVisible := true; // ativar consulta
   end;
end;

end.
