unit uFuncionarioUI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaBaseCadastroUI, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmCadastroFuncionario = class(TfrmTelaBaseCadastro)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    mskNome: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroFuncionario: TfrmCadastroFuncionario;

implementation

{$R *.dfm}

end.
