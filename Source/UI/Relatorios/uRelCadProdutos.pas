unit uRelCadProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLFilters, RLPDFFilter,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLXLSFilter, uAppServiceConexao,
  RLXLSXFilter;

type
  TfrmRelCadProdutos = class(TForm)
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RegistrosDB: TRLBand;
    QryProdutos: TZQuery;
    dtsProdutos: TDataSource;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    CabecalhoLabel: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    Rodape: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLDraw2: TRLDraw;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProdutos: TfrmRelCadProdutos;

implementation

{$R *.dfm}



procedure TfrmRelCadProdutos.FormCreate(Sender: TObject);
begin
  QryProdutos.Connection := AppServiceConexao.getConexao;
  QryProdutos.Open;
end;

procedure TfrmRelCadProdutos.FormDestroy(Sender: TObject);
begin
  QryProdutos.Close;
end;

end.
