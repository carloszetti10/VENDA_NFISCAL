unit uDialogServiceImpl;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Winapi.Windows;

type
  TDialogo = class
  public
    class procedure Informacao(const Msg: string; const Titulo: string = 'Informação');
    class procedure Sucesso(const Msg: string; const Titulo: string = 'Sucesso');
    class procedure Atencao(const Msg: string; const Titulo: string = 'Atenção');
    class procedure Erro(const Msg: string; const Titulo: string = 'Erro');
    class function Confirmar(const Msg: string; const Titulo: string = 'Confirmação'): Boolean;
  end;

implementation

class procedure TDialogo.Informacao(const Msg, Titulo: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Titulo), MB_OK or MB_ICONINFORMATION);
end;

class procedure TDialogo.Sucesso(const Msg, Titulo: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Titulo), MB_OK or MB_ICONINFORMATION);
end;

class procedure TDialogo.Atencao(const Msg, Titulo: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Titulo), MB_OK or MB_ICONWARNING);
end;

class procedure TDialogo.Erro(const Msg, Titulo: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Titulo), MB_OK or MB_ICONERROR);
end;

class function TDialogo.Confirmar(const Msg, Titulo: string): Boolean;
begin
  Result :=
    Application.MessageBox(
      PChar(Msg),
      PChar(Titulo),
      MB_YESNO or MB_ICONQUESTION
    ) = IDYES;
end;

end.
