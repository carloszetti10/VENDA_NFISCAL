object frmVendaDav: TfrmVendaDav
  Left = 0
  Top = 0
  Caption = 'VENDA'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 53
      Height = 15
      Caption = 'NUMERO:'
    end
    object Label2: TLabel
      Left = 120
      Top = 13
      Width = 49
      Height = 15
      Caption = 'EMISS'#195'O'
    end
    object Label3: TLabel
      Left = 240
      Top = 13
      Width = 47
      Height = 15
      Caption = 'CLIENTE:'
    end
    object Label6: TLabel
      Left = 424
      Top = 13
      Width = 63
      Height = 15
      Caption = 'VENDEDOR:'
    end
    object Edit1: TEdit
      Left = 16
      Top = 34
      Width = 81
      Height = 23
      TabOrder = 0
    end
    object dtmEmisao: TDateTimePicker
      Left = 120
      Top = 34
      Width = 97
      Height = 23
      Date = 46141.000000000000000000
      Time = 0.490384513890603600
      TabOrder = 1
    end
    object edtCliente: TEdit
      Left = 240
      Top = 34
      Width = 154
      Height = 23
      TabOrder = 2
      OnClick = edtClienteClick
    end
    object edtVendedor: TEdit
      Left = 424
      Top = 34
      Width = 154
      Height = 23
      TabOrder = 3
      OnClick = edtVendedorClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 336
    Width = 624
    Height = 105
    Align = alBottom
    TabOrder = 1
    object Label10: TLabel
      Left = 16
      Top = 6
      Width = 39
      Height = 15
      Caption = 'BRUTO:'
    end
    object Label11: TLabel
      Left = 119
      Top = 6
      Width = 63
      Height = 15
      Caption = 'DESCONTO:'
    end
    object Label12: TLabel
      Left = 222
      Top = 6
      Width = 49
      Height = 15
      Caption = 'LIQUIDO:'
    end
    object edtBruto: TEdit
      Left = 16
      Top = 22
      Width = 97
      Height = 23
      TabOrder = 0
    end
    object edtDesconto: TEdit
      Left = 119
      Top = 22
      Width = 97
      Height = 23
      TabOrder = 1
    end
    object edtLiquido: TEdit
      Left = 222
      Top = 22
      Width = 97
      Height = 23
      TabOrder = 2
    end
    object btnNovo: TBitBtn
      Left = 16
      Top = 62
      Width = 75
      Height = 25
      Caption = '&NOVO'
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 107
      Top = 62
      Width = 75
      Height = 25
      Caption = '&NOVO'
      TabOrder = 4
    end
    object BitBtn2: TBitBtn
      Left = 196
      Top = 62
      Width = 75
      Height = 25
      Caption = '&NOVO'
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 624
    Height = 247
    Align = alClient
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 245
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 360
      ExplicitWidth = 583
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 620
        Height = 56
        Align = alTop
        TabOrder = 0
        object Label9: TLabel
          Left = 501
          Top = 4
          Width = 39
          Height = 15
          Caption = 'VALOR:'
        end
        object Label8: TLabel
          Left = 399
          Top = 4
          Width = 76
          Height = 15
          Caption = 'QUANTIDADE:'
        end
        object Label7: TLabel
          Left = 15
          Top = 5
          Width = 122
          Height = 15
          Caption = 'PESQUISAR PRODUTOS'
        end
        object edtValorUnitarioProd: TEdit
          Left = 501
          Top = 25
          Width = 81
          Height = 23
          TabOrder = 0
        end
        object edtQuantidade: TEdit
          Left = 399
          Top = 25
          Width = 81
          Height = 23
          TabOrder = 1
        end
        object edtPesquisa: TEdit
          Left = 15
          Top = 26
          Width = 302
          Height = 23
          TabOrder = 2
        end
      end
      object Panel6: TPanel
        Left = 1
        Top = 57
        Width = 620
        Height = 187
        Align = alClient
        TabOrder = 1
        ExplicitTop = 104
        ExplicitHeight = 140
        object painelEstoque: TPanel
          Left = 14
          Top = 6
          Width = 243
          Height = 160
          TabOrder = 0
          object DBGrid2: TDBGrid
            Left = 1
            Top = 17
            Width = 241
            Height = 142
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_PRODUTO'
                Title.Caption = 'CODIGO'
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Title.Caption = 'DESCRI'#199#195'O'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_BARRA'
                Title.Caption = 'COD BARRA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESTOQUE'
                Title.Caption = 'QUANTIDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Title.Caption = 'VALOR UNITARIO'
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 241
            Height = 16
            Align = alTop
            Caption = 'PRODUTOS DO ESTOQUE'
            TabOrder = 1
            ExplicitWidth = 240
          end
        end
        object painelVenda: TPanel
          Left = 320
          Top = 6
          Width = 256
          Height = 160
          TabOrder = 1
          object DBGrid1: TDBGrid
            Left = 1
            Top = 19
            Width = 254
            Height = 140
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_PRODUTO'
                Title.Caption = 'CODIGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Title.Caption = 'DESCRI'#199#195'O'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_BARRA'
                Title.Caption = 'COD BARRA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QUANTIDADE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_UNITARIO'
                Title.Caption = 'VALOR UNITARIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALOR_TOTAL'
                Title.Caption = 'VALOR TOTAL'
                Visible = True
              end>
          end
          object Panel8: TPanel
            Left = 1
            Top = 1
            Width = 254
            Height = 18
            Align = alTop
            Caption = 'PRODUTOS DA VENDA'
            TabOrder = 1
            ExplicitWidth = 240
          end
        end
      end
    end
  end
  object DTSProdEstoque: TDataSource
    DataSet = QRYProdEstoque
    Left = 184
    Top = 257
  end
  object QRYProdEstoque: TZQuery
    Params = <>
    Left = 128
    Top = 257
  end
  object DTSProdVenda: TDataSource
    DataSet = QRYProdVenda
    Left = 520
    Top = 257
  end
  object QRYProdVenda: TZQuery
    Params = <>
    Left = 480
    Top = 257
  end
end
