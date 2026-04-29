unit uProdutoUI;

interface

uses
  Winapi.Windows, iProdutoService, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaBaseCadastroUI, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uException, uProdutoModel, uValidarCampo;

type
  TfrmCadastroProduto = class(TfrmTelaBaseCadastro)
    gpCadastro: TGroupBox;
    mskNome: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    mskCodBarra: TMaskEdit;
    Label3: TLabel;
    mskValorUnitario: TMaskEdit;
    mskQuantidade: TMaskEdit;
    Label4: TLabel;
    btnIniciarEstoque: TBitBtn;
  private
    FService: IProdutoServiceInterface;
    procedure InserirProduto;
  public
    procedure Gravar;override;
    constructor Create(AOwner: TComponent; AService: IProdutoServiceInterface);
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.dfm}

constructor TfrmCadastroProduto.Create(AOwner: TComponent; AService: IProdutoServiceInterface);
begin
  inherited Create(AOwner);
  FService:= AService;
end;

procedure TfrmCadastroProduto.Gravar;
begin
  inherited;
  try
     if EstadoCadastro = ecInserir then
       //metodo de inserir
       InserirProduto;
     if EstadoCadastro = ecAlterar then
       //metodo alterar
  except
  on EApp: EAppException do
     ShowMessage(EApp.Message);
  on EInf: EInfraException do
     ShowMessage(EInf.Message);
  on EG: Exception do
      ShowMessage('Falha na operação, tente novamente!'+EG.Message);
  end;
end;
procedure TfrmCadastroProduto.InserirProduto;
var
  Prod: TProdutoModel;
begin
  try
    TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');

   prod := TProdutoModel.Create;
   try
     Prod.Nome := mskNome.Text;
     Prod.CodBarra:= mskCodBarra.Text;
     Prod.Estoque:= StrToInt(mskQuantidade.Text);
     Prod.ValorUnitario:= StrToCurr(mskValorUnitario.Text);
     FService.Inserir(Prod);
     ShowMessage('Cadastro realizado!');
     ControlarBotoes(true);
     EstadoCadastro := ecNenhum;
  finally
     Prod.Free;
  end
  except
    on E: EAppException do
      raise;
    on E: EInfraException do
      raise;
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  end;
end;



end.
