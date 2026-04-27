inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'frmCadastroProduto'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited PageControlHerenca: TPageControl
    ActivePage = TabCadastro
    inherited TabConsulta: TTabSheet
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited Panel2: TPanel
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited TabCadastro: TTabSheet
      object gpCadastro: TGroupBox
        Left = 16
        Top = 40
        Width = 577
        Height = 241
        Caption = 'CADASTRO DE PRODUTO'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 26
          Width = 38
          Height = 15
          Caption = 'NOME:'
        end
        object Label2: TLabel
          Left = 264
          Top = 26
          Width = 71
          Height = 15
          Caption = 'COD. BARRA:'
        end
        object Label3: TLabel
          Left = 16
          Top = 82
          Width = 40
          Height = 15
          Caption = 'PRE'#199'O:'
        end
        object Label4: TLabel
          Left = 16
          Top = 140
          Width = 76
          Height = 15
          Caption = 'QUANTIDADE:'
        end
        object mskNome: TMaskEdit
          Left = 16
          Top = 47
          Width = 205
          Height = 23
          TabOrder = 0
          Text = ''
        end
        object mskCodBarra: TMaskEdit
          Left = 264
          Top = 47
          Width = 205
          Height = 23
          TabOrder = 1
          Text = ''
        end
        object mskValorUnitario: TMaskEdit
          Left = 16
          Top = 103
          Width = 65
          Height = 23
          TabOrder = 2
          Text = ''
        end
        object mskQuantidade: TMaskEdit
          Left = 16
          Top = 161
          Width = 65
          Height = 23
          TabOrder = 3
          Text = ''
        end
        object btnIniciarEstoque: TBitBtn
          Left = 98
          Top = 161
          Width = 81
          Height = 24
          Caption = 'Iniciar estoque'
          TabOrder = 4
        end
      end
    end
  end
  inherited pnlInferior: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited dtsDados: TDataSource
    Left = 588
    Top = 34
  end
end
