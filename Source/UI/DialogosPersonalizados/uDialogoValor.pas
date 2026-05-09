unit uDialogoValor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  RxToolEdit, RxCurrEdit;

type
  TfrmDialogoValor = class(TForm)
    edtValor: TCurrencyEdit;
    lbText: TLabel;
    btnCancelar: TBitBtn;
    bntOk: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDialogoValor: TfrmDialogoValor;

implementation

{$R *.dfm}

end.
