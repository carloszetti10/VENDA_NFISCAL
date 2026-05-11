unit uLojaUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, uAppServiceConexao,
  Vcl.ExtCtrls,  ZDataset;

type
  TfrmLoja = class(TForm)
    edtNome: TLabeledEdit;
    btngravar: TBitBtn;
    procedure btngravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLoja: TfrmLoja;

implementation

{$R *.dfm}

procedure TfrmLoja.btngravarClick(Sender: TObject);
var
  Q: TZQuery;
begin
  if Trim(edtNome.Text) = '' then
    Exit;

  Q := TZQuery.Create(nil);

  try
    Q.Connection := AppServiceConexao.getConexao;

    Q.SQL.Text :=
      'INSERT INTO LOJA (NOME) ' +
      'VALUES (:NOME)';

    Q.ParamByName('NOME').AsString := edtNome.Text;

    Q.ExecSQL;

    ShowMessage('Loja cadastrada com sucesso.');

    edtNome.Clear;
    ModalResult := mrOk;
  finally
    Q.Free;
  end;
end;

end.
