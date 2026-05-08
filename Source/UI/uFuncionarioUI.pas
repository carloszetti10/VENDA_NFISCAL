unit uFuncionarioUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaBaseCadastroUI, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uValidarCampo, uFuncionarioModel, iFuncionarioService, uException;

type
  TfrmCadastroFuncionario = class(TfrmTelaBaseCadastro)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mskNome: TMaskEdit;
    edtID: TLabeledEdit;
  private
    FService: IFuncionarioServiceInterface;
  public
    procedure Inserir; override;
    procedure Alterar;override;
    procedure Pesquisa; override;
    procedure PreencherCampos(id: Integer); override;

    function GetFuncionario: TFuncionarioModel;
    constructor Create(AOwner: TComponent; AService: IFuncionarioServiceInterface);
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

{$R *.dfm}

{ TfrmCadastroFuncionario }

constructor TfrmCadastroFuncionario.Create(AOwner: TComponent; AService: IFuncionarioServiceInterface);
begin
  inherited Create(AOwner);
  FService:= AService;
  edtID.Enabled := false;
end;
procedure TfrmCadastroFuncionario.Alterar;
var
  Fun: TFuncionarioModel;
begin
  inherited;
  TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');
  Fun := TFuncionarioModel.Create;
  fun.Id := StrToInt(edtID.Text);
  fun.Nome := mskNome.Text;
  try
    FService.IAlterar(Fun);
  finally
    Fun.Free;
  end;
end;
procedure TfrmCadastroFuncionario.Inserir;
var
  Func: TFuncionarioModel;
begin
  try
    TValidarCampos.ValidarCampoVazio(mskNome, 'Nome');
    Func := TFuncionarioModel.Create;
    try
      Func.Nome := mskNome.Text;
      FService.IInserir(Func);
  finally
     Func.Free;
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
procedure TfrmCadastroFuncionario.Pesquisa;
begin
  inherited;
  FService.ListarPorNomeTela(Qry, mskPesquisar.Text)
end;
procedure TfrmCadastroFuncionario.PreencherCampos(id: Integer);
var
  Func: TFuncionarioModel;
begin
  inherited;
  Func:= FService.BuscarPorId(id);
  try
    edtID.Text := Func.Id.ToString;
    mskNome.Text := Func.Nome;
  finally
    Func.Free;
  end;
end;
function TfrmCadastroFuncionario.GetFuncionario: TFuncionarioModel;
begin
  Result := TFuncionarioModel.Create;

  Result.Id := Qry.FieldByName('ID_FUNCIONARIO').AsInteger;
  Result.Nome := Qry.FieldByName('NOME').AsString;
end;
end.
