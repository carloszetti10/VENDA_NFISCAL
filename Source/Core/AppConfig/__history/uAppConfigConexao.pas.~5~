unit uAppConfigConexao;

interface
uses
  IniFiles, SysUtils, Vcl.Dialogs;
type
   TAppConfigConexao = class
     private
       FHost: string;
       FDatabase: string;
       FUser: string;
       FSenha: string;
     public
       procedure lerMbanco();
       property Host: string read FHost;
       property Database: string read FDatabase;
       property User: string read FUser;
       property Senha: string read FSenha;
   end;

 var
  AppConfigConexao: TAppConfigConexao;
implementation

{ TAppConfigConexao }

procedure TAppConfigConexao.lerMbanco;
  var
  mbanco: TIniFile;
  localMbanco: String;
begin


      localMbanco := ExtractFilePath(ParamStr(0)) + 'MBANCO.INI';


      if not FileExists(localMbanco) then
        raise Exception.Create('Arquivo MBANCO não encontrado');
      try
        mbanco := TIniFile.Create(localMbanco);
        FHost := mbanco.ReadString('DATABASE', 'Servidor', 'localhost');
        FDatabase := mbanco.ReadString('DATABASE', 'Banco', '');
        FUser := mbanco.ReadString('DATABASE', 'User', 'SYSDBA');
        FSenha := mbanco.ReadString('DATABASE', 'Senha', 'masterkey');

        if FDatabase = '' then
          raise Exception.Create('Banco não configurado');
    finally
      mbanco.Free;
    end;
end;

end.
