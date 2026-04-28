object frmTelaPrincipal: TfrmTelaPrincipal
  Left = 0
  Top = 0
  Caption = 'TELA PRINCIPAL'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 568
    Top = 16
    object CADASTRO1: TMenuItem
      Caption = 'CADASTRO'
      object CLIENTES: TMenuItem
        Caption = 'CLIENTES'
        OnClick = CLIENTESClick
      end
      object PRODUTO: TMenuItem
        Caption = 'PRODUTOS'
        OnClick = PRODUTOClick
      end
    end
    object RELATORIOS1: TMenuItem
      Caption = 'RELATORIOS'
    end
    object SAIR1: TMenuItem
      Caption = 'SAIR'
      OnClick = SAIR1Click
    end
  end
end
