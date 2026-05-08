inherited frmCadastroPagamento: TfrmCadastroPagamento
  Caption = 'Forma de Pagamento'
  ClientHeight = 331
  ClientWidth = 569
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 585
  ExplicitHeight = 370
  TextHeight = 15
  inherited PageControlHerenca: TPageControl
    Width = 569
    Height = 290
    ExplicitWidth = 418
    ExplicitHeight = 172
    inherited TabConsulta: TTabSheet
      ExplicitWidth = 561
      ExplicitHeight = 260
      inherited Panel1: TPanel
        Width = 561
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 456
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited dbGridHerenca: TDBGrid
        Width = 561
        Height = 166
      end
      inherited Panel2: TPanel
        Top = 225
        Width = 561
        StyleElements = [seFont, seClient, seBorder]
        ExplicitTop = 225
        ExplicitWidth = 456
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 561
      ExplicitHeight = 260
      object GroupBox1: TGroupBox
        Left = 16
        Top = 16
        Width = 529
        Height = 169
        Caption = 'CADASTRO FORMA DE PAGAMENTO'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 90
          Width = 38
          Height = 15
          Caption = 'NOME:'
        end
        object mskNome: TMaskEdit
          Left = 16
          Top = 111
          Width = 233
          Height = 23
          TabOrder = 0
          Text = ''
        end
        object edtID: TLabeledEdit
          Tag = 1
          Left = 16
          Top = 53
          Width = 66
          Height = 23
          EditLabel.Width = 48
          EditLabel.Height = 15
          EditLabel.Caption = 'CODIGO:'
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 1
          Text = ''
        end
      end
    end
  end
  inherited pnlInferior: TPanel
    Top = 290
    Width = 569
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 172
    ExplicitWidth = 418
    inherited btnSair: TBitBtn
      Left = 490
      ExplicitLeft = 339
    end
  end
  inherited dtsDados: TDataSource
    Left = 388
    Top = 26
  end
  inherited Qry: TZQuery
    Left = 444
    Top = 26
  end
end
