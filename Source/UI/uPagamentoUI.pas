unit uPagamentoUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,uPagamentoVendaModel,
  uAppServiceConexao, ZConnection, ZDataset, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TfrmPagamento = class(TForm)
    total: TLabel;
    lbTotal: TLabel;
    cbFormaPagamento: TComboBox;
    Label2: TLabel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Label3: TLabel;
    edtValor: TCurrencyEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FPagamento: TPagamentoVendaModel;
    FTotalVenda: Currency;

    procedure CarregarFormasPagamento;

  public
    property Pagamento: TPagamentoVendaModel read FPagamento;
    property TotalVenda: Currency write FTotalVenda;
  end;

var
  frmPagamento: TfrmPagamento;

implementation

{$R *.dfm}

procedure TfrmPagamento.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPagamento.btnConfirmarClick(Sender: TObject);
begin
  if cbFormaPagamento.ItemIndex = -1 then
    raise Exception.Create('Selecione a forma de pagamento');

  FPagamento := TPagamentoVendaModel.Create;

  FPagamento.IdPagamento :=
    Integer(cbFormaPagamento.Items.Objects[cbFormaPagamento.ItemIndex]);

  FPagamento.Parcela := 1;
  FPagamento.Valor := StrToCurr(edtValor.Text);

  ModalResult := mrOk;
end;

procedure TfrmPagamento.CarregarFormasPagamento;
var
  Q: TZQuery;
begin
  cbFormaPagamento.Clear;

  Q := TZQuery.Create(nil);
  try
    Q.Connection := AppServiceConexao.getConexao;

    Q.SQL.Text := 'SELECT ID_PAGAMENTO, NOME FROM FORMA_PAGAMENTO';
    Q.Open;

    while not Q.Eof do
    begin
      cbFormaPagamento.Items.AddObject(
        Q.FieldByName('NOME').AsString,
        TObject(Q.FieldByName('ID_PAGAMENTO').AsInteger)
      );
      Q.Next;
    end;

  finally
    Q.Free;
  end;
end;

procedure TfrmPagamento.FormDestroy(Sender: TObject);
begin
    FPagamento.Free;
end;

procedure TfrmPagamento.FormShow(Sender: TObject);
begin
  lbTotal.Caption := CurrToStr(FTotalVenda);
  edtValor.Text := CurrToStr(FTotalVenda);

  CarregarFormasPagamento;
end;
end.
