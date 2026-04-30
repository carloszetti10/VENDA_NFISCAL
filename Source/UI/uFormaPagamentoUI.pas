unit uFormaPagamentoUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaBaseCadastroUI, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmCadastroPagamento = class(TfrmTelaBaseCadastro)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mskNome: TMaskEdit;
  private

  public
    procedure Inserir; override;
    procedure Alterar;override;
    procedure Novo;override;
    procedure Pesquisa; override;
    procedure LimparCampos; override;
    procedure HabilitarCampos(Habilitar: Boolean); override;
  end;

var
  frmCadastroPagamento: TfrmCadastroPagamento;

implementation

{$R *.dfm}

{ TfrmCadastroPagamento }

procedure TfrmCadastroPagamento.Alterar;
begin
  inherited;

end;

procedure TfrmCadastroPagamento.HabilitarCampos(Habilitar: Boolean);
begin
  inherited;

end;

procedure TfrmCadastroPagamento.Inserir;
begin
  inherited;

end;

procedure TfrmCadastroPagamento.LimparCampos;
begin
  inherited;

end;

procedure TfrmCadastroPagamento.Novo;
begin
  inherited;

end;

procedure TfrmCadastroPagamento.Pesquisa;
begin
  inherited;

end;

end.
