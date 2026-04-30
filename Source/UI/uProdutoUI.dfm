inherited frmCadastroProduto: TfrmCadastroProduto
  Caption = 'Produtos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited PageControlHerenca: TPageControl
    inherited TabConsulta: TTabSheet
      inherited Panel1: TPanel
        StyleElements = [seFont, seClient, seBorder]
        inherited mskPesquisar: TMaskEdit
          StyleElements = [seFont, seClient, seBorder]
        end
      end
      inherited dbGridHerenca: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            ReadOnly = False
            Title.Caption = 'CODIGO'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'NNOME DO PRODUTO'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_UNITARIO'
            Title.Caption = 'PRE'#199'O'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Title.Caption = 'QUANTIDADE'
            Width = 80
            Visible = True
          end>
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
        object btnIniciarEstoque: TBitBtn
          Left = 98
          Top = 161
          Width = 81
          Height = 24
          Caption = 'Iniciar estoque'
          TabOrder = 2
        end
        object mskValorUnitario: TEdit
          Left = 16
          Top = 103
          Width = 64
          Height = 23
          TabOrder = 3
          Text = '0,00'
        end
        object mskQuantidade: TEdit
          Left = 16
          Top = 161
          Width = 64
          Height = 23
          TabOrder = 4
          Text = '0,00'
        end
      end
    end
  end
  inherited pnlInferior: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited dtsDados: TDataSource
    Left = 564
  end
  inherited Qry: TZQuery
    SQL.Strings = (
      '')
  end
end
