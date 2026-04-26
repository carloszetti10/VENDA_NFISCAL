unit uValidadorDocumento;

interface

type
  TValidadorDocumento = class
  public
    class function ValidarCPF(const CPF: string): Boolean;
    class function ValidarCNPJ(const CNPJ: string): Boolean;
  end;

implementation

uses System.SysUtils;


class function TValidadorDocumento.ValidarCPF(const CPF: string): Boolean;
var
  i, Soma, Resto: Integer;
  Digito1, Digito2: Integer;
begin
  Result := False;

  if Length(CPF) <> 11 then Exit;

  // Evita sequência tipo 11111111111
  if CPF = StringOfChar(CPF[1], 11) then Exit;

  // Primeiro dígito
  Soma := 0;
  for i := 1 to 9 do
    Soma := Soma + StrToInt(CPF[i]) * (11 - i);

  Resto := (Soma * 10) mod 11;
  if Resto = 10 then Resto := 0;
  Digito1 := Resto;

  // Segundo dígito
  Soma := 0;
  for i := 1 to 10 do
    Soma := Soma + StrToInt(CPF[i]) * (12 - i);

  Resto := (Soma * 10) mod 11;
  if Resto = 10 then Resto := 0;
  Digito2 := Resto;

  Result :=
    (Digito1 = StrToInt(CPF[10])) and
    (Digito2 = StrToInt(CPF[11]));
end;


class function TValidadorDocumento.ValidarCNPJ(const CNPJ: string): Boolean;
var
  i, Soma, Resto: Integer;
  const
  Peso1: array[1..12] of Integer = (5,4,3,2,9,8,7,6,5,4,3,2);
  Peso2: array[1..13] of Integer = (6,5,4,3,2,9,8,7,6,5,4,3,2);
begin
  Result := False;

  if Length(CNPJ) <> 14 then Exit;

  // Evita sequência tipo 00000000000000
  if CNPJ = StringOfChar(CNPJ[1], 14) then Exit;

  // Primeiro dígito
  Soma := 0;
  for i := 1 to 12 do
    Soma := Soma + StrToInt(CNPJ[i]) * Peso1[i];

  Resto := Soma mod 11;
  if Resto < 2 then
    Resto := 0
  else
    Resto := 11 - Resto;

  if Resto <> StrToInt(CNPJ[13]) then Exit;

  // Segundo dígito
  Soma := 0;
  for i := 1 to 13 do
    Soma := Soma + StrToInt(CNPJ[i]) * Peso2[i];

  Resto := Soma mod 11;
  if Resto < 2 then
    Resto := 0
  else
    Resto := 11 - Resto;

  Result := Resto = StrToInt(CNPJ[14]);
end;

end.unit Unit1;

interface

implementation

end.
