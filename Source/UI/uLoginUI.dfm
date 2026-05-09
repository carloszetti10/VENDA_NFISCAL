object ftmLogin: TftmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'LOGIN'
  ClientHeight = 373
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 147
    Top = 72
    Width = 35
    Height = 15
    Caption = 'LOGIN'
  end
  object Label2: TLabel
    Left = 144
    Top = 128
    Width = 49
    Height = 15
    Caption = 'USUARIO'
  end
  object Label3: TLabel
    Left = 144
    Top = 192
    Width = 38
    Height = 15
    Caption = 'SENHA'
  end
  object edtLogin: TEdit
    Left = 56
    Top = 149
    Width = 225
    Height = 23
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 56
    Top = 213
    Width = 225
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnEntrar: TBitBtn
    Left = 40
    Top = 272
    Width = 257
    Height = 25
    Caption = 'ENTRAR'
    TabOrder = 2
    OnClick = btnEntrarClick
  end
end
