unit uFormaPagamentoUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaBaseCadastroUI, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uFormaPagService,iFormaPagService, uException, uValidarCampo,uFormaPagModel;

type
  TfrmCadastroPagamento = class(TfrmTelaBaseCadastro)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mskNome: TMaskEdit;
    edtID: TLabeledEdit;
  private
     FService: IFormaPagServiceInterface;
  public
    procedure Inserir; override;
    procedure Alterar;override;
    procedure Pesquisa; override;
    procedure PreencherCampos(id: Integer);  override;
    constructor Create(AOwner: TComponent; AService: IFormaPagServiceInterface);

  end;

var
  frmCadastroPagamento: TfrmCadastroPagamento;

implementation

{$R *.dfm}

{ TfrmCadastroPagamento }


constructor TfrmCadastroPagamento.Create(AOwner: TComponent; AService: IFormaPagServiceInterface);
begin
  inherited Create(AOwner);
  FService := AService;
  edtID.Enabled := False;
end;

procedure TfrmCadastroPagamento.Alterar;
var
  Forma: TFormaPagamentoModel;
begin
  inherited;
  TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');
  Forma := TFormaPagamentoModel.Create;
  Forma.Id := StrToInt(edtID.Text);
  Forma.Nome := mskNome.Text;

  try
    FService.IAlterar(Forma);
  finally
    Forma.Free;
  end;
end;


procedure TfrmCadastroPagamento.Inserir;
var
  Forma: TFormaPagamentoModel;
begin
  try
    TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');
    Forma := TFormaPagamentoModel.Create;
    try
      Forma.Nome := mskNome.Text;
      FService.IInserir(Forma);
    finally
      Forma.Free;
    end;

  except
    on E: EAppException do
      raise;
    on E: EInfraException do
      raise;
    on E: Exception do
      raise Exception.Create('Erro: ' + E.Message);
  end;

end;

procedure TfrmCadastroPagamento.Pesquisa;
begin
  inherited;
   FService.ListarPorNomeTela(Qry, mskPesquisar.Text);
end;

procedure TfrmCadastroPagamento.PreencherCampos(id: Integer);
var
  Forma: TFormaPagamentoModel;
begin
  inherited;

  Forma := FService.BuscarPorId(id);

  try
    edtID.Text := Forma.Id.ToString;
    mskNome.Text := Forma.Nome;

  finally
    Forma.Free;
  end;
end;

end.
