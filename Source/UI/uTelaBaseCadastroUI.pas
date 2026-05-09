unit uTelaBaseCadastroUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, uException,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uValidarCampo, uAppServiceConexao, uControlUtils, uDialogServiceImpl;



type
  TEstadoCadastro = (ecNenhum, ecInserir, ecAlterar);
  TModoTela = (mtCadastro, mtSelecao);
  TfrmTelaBaseCadastro = class(TForm)
    PageControlHerenca: TPageControl;
    TabConsulta: TTabSheet;
    Panel1: TPanel;
    mskPesquisar: TMaskEdit;
    btnPesquisa: TBitBtn;
    dbGridHerenca: TDBGrid;
    TabCadastro: TTabSheet;
    pnlInferior: TPanel;
    Panel2: TPanel;
    dtsDados: TDataSource;
    Qry: TZQuery;
    btnAlterar: TBitBtn;
    btnApagar: TBitBtn;
    btnCancelar: TBitBtn;
    btnNovo: TBitBtn;
    btnSair: TBitBtn;
    btnGravar: TBitBtn;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure dbGridHerencaDblClick(Sender: TObject);
    procedure mskPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure dtsDadosDataChange(Sender: TObject; Field: TField);
  private
     FEstadoCadastro : TEstadoCadastro;
     FModoTela: TModoTela;
     FIDSelecionado: Integer;
  protected
    procedure ControlarBotoes(nInsert: Boolean);
    procedure Gravar; virtual;
    procedure Novo; virtual;
    procedure Alterar; virtual; abstract;
    procedure Inserir; virtual; abstract;
    procedure Pesquisa; virtual;
    procedure PreencherCampos(id: Integer); virtual; abstract;
    constructor Create(AOwner: TComponent);
  public
    property EstadoCadastro: TEstadoCadastro read FEstadoCadastro write FEstadoCadastro;
    property ModoTela: TModoTela read FModoTela write FModoTela;

    procedure LimparCampos;
    procedure HabilitarCampos(Habilitar: Boolean);
    procedure Iniciar;
  end;

var
  frmTelaBaseCadastro: TfrmTelaBaseCadastro;

implementation

{$R *.dfm}

{ TForm2 }
{$REGION 'METODOS VIRTUAIS'}

procedure TfrmTelaBaseCadastro.Gravar;
begin
    try
     if EstadoCadastro = ecInserir then
        Inserir;  //metodo de inserir
     if EstadoCadastro = ecAlterar then
        Alterar; //metodo alterar
     TDialogo.Sucesso('Operação finalizada com sucesso!');
     FEstadoCadastro := ecNenhum;
     ControlarBotoes(True);
     Iniciar;
  except
  on EApp: EAppException do
     TDialogo.Atencao(EApp.Message);
  on EInf: EInfraException do
     TDialogo.Erro(EInf.Message);
  on EG: Exception do
      TDialogo.Erro('Falha na operação, tente novamente!'+EG.Message);
  end;
end;

procedure TfrmTelaBaseCadastro.HabilitarCampos(Habilitar: Boolean);
begin
  TControlUtils.HabilitarControles(Self, Habilitar);
end;

procedure TfrmTelaBaseCadastro.Iniciar;
begin
  LimparCampos;
  HabilitarCampos(False);
  mskPesquisar.Enabled := true;
  dbGridHerenca.Enabled := true;
end;

procedure TfrmTelaBaseCadastro.LimparCampos;
begin
   TControlUtils.LimparControles(Self);
end;

procedure TfrmTelaBaseCadastro.mskPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Trim(mskPesquisar.Text) <> '' then
    Pesquisa;
end;

procedure TfrmTelaBaseCadastro.Novo;
begin
   ControlarBotoes(false);
   FEstadoCadastro := ecInserir;
   LimparCampos;
   HabilitarCampos(True);
end;
procedure TfrmTelaBaseCadastro.Pesquisa;
begin

end;

{$ENDREGION}

constructor TfrmTelaBaseCadastro.Create(AOwner: TComponent);
begin
inherited Create(AOwner);
  //Query receber o banco
  Qry.Connection:= AppServiceConexao.getConexao;
end;



procedure TfrmTelaBaseCadastro.dbGridHerencaDblClick(Sender: TObject);
begin
   //para não dar erro quando clica, pois chama a query
   if FIDSelecionado = 0 then
    exit;

   if FModoTela = mtSelecao then
   begin
      ModalResult := mrOk;
   end
   else
   begin
     // preencher os campos se não for a tela de seleção
     btnAlterar.Click;
   end;
end;
//sempre pegar o id do cliente que ta selecionado
procedure TfrmTelaBaseCadastro.dtsDadosDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (dtsDados.DataSet <> nil) and (not dtsDados.DataSet.IsEmpty) then
  begin
    FIDSelecionado := Qry.Fields[0].AsInteger;
  end;
end;

procedure TfrmTelaBaseCadastro.FormShow(Sender: TObject);
begin
  inherited;
  if FModoTela = mtSelecao then
  begin
    // modo seleção
    btnNovo.Visible := False;
    btnAlterar.Visible := False;
    btnApagar.Visible := False;
    btnGravar.Visible := False;
    btnCancelar.Visible := False;
    btnSair.Visible := False;
    PageControlHerenca.ActivePage := TabConsulta;
    PageControlHerenca.Pages[1].TabVisible := False;
  end
  else
  begin
    ControlarBotoes(true);
    FEstadoCadastro := ecNenhum;
    Iniciar;
  end;
end;
procedure TfrmTelaBaseCadastro.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FEstadoCadastro <> ecNenhum then
  begin
    CanClose := False;
    TDialogo.Atencao('Cancele o processo.') ;
  end
  else
    CanClose := True;
end;

{$REGION 'METODOS CONTROLAR BOTOES E CLICK'}
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
//NOVO
procedure TfrmTelaBaseCadastro.btnNovoClick(Sender: TObject);
begin
   Novo;
end;
//PESQUISA
procedure TfrmTelaBaseCadastro.btnPesquisaClick(Sender: TObject);
begin

  Pesquisa;

end;
//SAIR
procedure TfrmTelaBaseCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;
//CANCELAR
procedure TfrmTelaBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(true);
  FEstadoCadastro := ecNenhum;
  Iniciar;
end;

//ALTERAR
procedure TfrmTelaBaseCadastro.btnAlterarClick(Sender: TObject);
begin
  if FIDSelecionado = 0  then
    exit;

  PreencherCampos(FIDSelecionado);
  FEstadoCadastro := ecAlterar;
  HabilitarCampos(true);
  ControlarBotoes(false);
end;
//GRAVAR
procedure TfrmTelaBaseCadastro.btnGravarClick(Sender: TObject);
begin
  Gravar;
end;
{$ENDREGION}


end.
