unit uProdutoUI;

interface

uses
  Winapi.Windows, iProdutoService, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaBaseCadastroUI, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uException, uProdutoModel, uValidarCampo,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uAppServiceConexao,
  RxToolEdit, RxCurrEdit;

type
  TfrmCadastroProduto = class(TfrmTelaBaseCadastro)
    gpCadastro: TGroupBox;
    mskNome: TMaskEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    mskValorUnitario: TCurrencyEdit;
    mskQuantidade: TCurrencyEdit;
    edtID: TLabeledEdit;
    mskCodBarra: TLabeledEdit;
  private
    FService: IProdutoServiceInterface;
    procedure Inserir; override;
    procedure Alterar; override;
    procedure Pesquisa; override;
    procedure Novo; virtual;
    procedure PreencherCampos(id: Integer); override;
    function CriarProdutoTela: TProdutoModel;

  public
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
  edtID.Enabled := false;
end;

function TfrmCadastroProduto.CriarProdutoTela: TProdutoModel;
var
  Prod: TProdutoModel;
begin

  prod := TProdutoModel.Create;
  prod.IdProduto := 0;
  if EstadoCadastro = ecAlterar then
    prod.IdProduto := strToInt(edtID.Text);
  Prod.Nome := mskNome.Text;
  Prod.CodBarra:= mskCodBarra.Text;
  Prod.Estoque := mskQuantidade.Value;
  Prod.ValorUnitario := mskValorUnitario.Value;

  Result := Prod;
end;

{$REGION 'METODOS VIRTUAIS'}
procedure TfrmCadastroProduto.Alterar;
var
  Prod: TProdutoModel;
begin
   TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');

    Prod := CriarProdutoTela;
    try
       FService.Atualizar(Prod);
    finally
      Prod.Free;
    end;
end;
procedure TfrmCadastroProduto.Inserir;
var
  Prod: TProdutoModel;
begin
   TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');

   prod := CriarProdutoTela;
   try
     FService.Inserir(Prod);
  finally
     Prod.Free;
  end
end;

procedure TfrmCadastroProduto.Novo;
begin
end;

procedure TfrmCadastroProduto.Pesquisa;
begin
  inherited;
  FService.ListarPorNomeTela(Qry, mskPesquisar.Text);
end;

procedure TfrmCadastroProduto.PreencherCampos(id: Integer);
var
  ProdBanco: TProdutoModel;
begin
   ProdBanco := FService.BuscarPorId(id);
   try
     edtID.Text := ProdBanco.IdProduto.ToString;
     mskNome.Text := ProdBanco.Nome;
     mskCodBarra.Text  := ProdBanco.CodBarra;
     mskQuantidade.Text := ProdBanco.Estoque.ToString;
     mskValorUnitario.Text := ProdBanco.ValorUnitario.ToString;
  finally
     ProdBanco.Free;
  end
end;

{$ENDREGION}
end.
