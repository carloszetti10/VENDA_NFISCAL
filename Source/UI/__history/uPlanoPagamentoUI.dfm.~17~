object frmPlanoPagamento: TfrmPlanoPagamento
  Left = 0
  Top = 0
  Caption = 'frmPlanoPagamento'
  ClientHeight = 354
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  TextHeight = 15
  object pnlBase: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 354
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 224
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlInferior: TPanel
      Left = 1
      Top = 312
      Width = 611
      Height = 41
      Align = alBottom
      TabOrder = 0
      object btnConfirmar: TBitBtn
        Left = 12
        Top = 6
        Width = 93
        Height = 25
        Caption = '&CONFIRMAR'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
          4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
          B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
          C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
          6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
          53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
          D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
          F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
          0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
          DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
          F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
          C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
          E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
          FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
          C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
          EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
          CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
          F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
          FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
          CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
          17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 0
        OnClick = btnConfirmarClick
      end
    end
    object pnlPlano: TPanel
      Left = 1
      Top = 1
      Width = 184
      Height = 311
      Align = alLeft
      TabOrder = 1
      object pnlInferiorPlano: TPanel
        Left = 1
        Top = 265
        Width = 182
        Height = 45
        Align = alBottom
        TabOrder = 0
        object Label3: TLabel
          Left = 12
          Top = 25
          Width = 70
          Height = 15
          Caption = 'COD PLANO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtCodPlano: TEdit
          Tag = 2
          Left = 88
          Top = 19
          Width = 90
          Height = 23
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object DBplano: TDBGrid
        Left = 1
        Top = 1
        Width = 182
        Height = 264
        Align = alClient
        DataSource = dtsPlano
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_PAGAMENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            Title.Caption = 'COD'
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            Title.Caption = 'PLANO'
            Width = 126
            Visible = True
          end>
      end
    end
    object pnlAplicarPlano: TPanel
      Left = 185
      Top = 1
      Width = 427
      Height = 311
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 190
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 425
        Height = 56
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 5
          Width = 59
          Height = 15
          Caption = 'PARCELAS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 229
          Top = 5
          Width = 98
          Height = 15
          Caption = 'VALOR TOTAL R$:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbValorTotal: TLabel
          Left = 333
          Top = 5
          Width = 77
          Height = 15
          Caption = 'VALOR TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnAdiPagamento: TBitBtn
          Left = 70
          Top = 26
          Width = 81
          Height = 25
          Caption = '&ADD'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FF0A6B0A0A6B0A0A6B0A0A6B0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFB25D130A6B0A42D37331B85A0A6B0AA8
            4E0FA54A0EA4480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FF
            B561140A6B0A78F3A440D1710A6B0AFBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7
            C89E400BFF00FFFF00FF0A6B0A0A6B0A0A6B0A0A6B0A78F3A444D5740A6B0A0A
            6B0A0A6B0A0A6B0AFCEDD6FBEBD1FBEACEA1430CFF00FFFF00FF0A6B0A78F3A4
            53E4844FE1804CDD7C48D97845D67541D27231B85A0A6B0AFBEFDBFCEDD6FBEB
            D1A3470DFF00FFFF00FF0A6B0A78F3A478F3A478F3A478F3A44DDE7D78F3A478
            F3A442D3730A6B0AFCF1E0FBEFDBFBEDD7A64B0EFF00FFFF00FF0A6B0A0A6B0A
            0A6B0A0A6B0A78F3A450E2810A6B0A0A6B0A0A6B0A0A6B0AFCF4E4FBF1E1FCEF
            DCA94F0FFF00FFFF00FFFF00FFFF00FFC375190A6B0A78F3A454E5850A6B0AFC
            F9F5FCF7F1FCF7EEFCF5E9FBF3E4FCF2E2AC5110FF00FFFF00FFFF00FFFF00FF
            C579190A6B0A78F3A478F3A40A6B0AFCFAF7FCF9F5FCF7F2FCF7EEFBF6E9FBF3
            E5AD5611FF00FFFF00FFFF00FFFF00FFC77C1A0A6B0A0A6B0A0A6B0A0A6B0AFC
            FBFBFCFAF8FCF9F5FBF8F2FCF7EEFBF6EAB05A12FF00FFFF00FFFF00FFFF00FF
            C97F1CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFAFCFBF8FCF9F6FCF8F2FCF7
            EFB35E13FF00FFFF00FFFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFAFCFBF9FCFAF6FCF8F3B66214FF00FFFF00FFFF00FFFF00FF
            CE851DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFBFCFBF9FCFA
            F7B96615FF00FFFF00FFFF00FFFF00FFCF861DFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFBFCFBF8BC6A16FF00FFFF00FFFF00FFFF00FF
            CF871DCF871DCE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172
            17BF6F17FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 0
          OnClick = btnAdiPagamentoClick
        end
        object edtNumeroVenda: TCurrencyEdit
          Left = 5
          Top = 25
          Width = 59
          Height = 25
          DecimalPlaces = 0
          DisplayFormat = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 57
        Width = 425
        Height = 124
        Align = alClient
        TabOrder = 1
        ExplicitTop = 72
        ExplicitHeight = 197
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 423
          Height = 122
          Align = alClient
          DataSource = dtsPagamentoVenda
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PARCELA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Title.Caption = 'FORMA PAGAMENTO'
              Width = 158
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 181
        Width = 425
        Height = 129
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 176
        object Label10: TLabel
          Left = 17
          Top = 63
          Width = 44
          Height = 15
          Caption = 'BRUTO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 152
          Top = 63
          Width = 66
          Height = 15
          Caption = 'DESCONTO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 288
          Top = 63
          Width = 53
          Height = 15
          Caption = 'LIQUIDO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbFormaPagamento: TComboEdit
          Left = 16
          Top = 34
          Width = 115
          Height = 23
          Enabled = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C20E0000C20E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFA9B3A9518C58237A2B0E69120D6611227128518357A9B1A9FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFC3C5C352965A168F222EB5433DBD5150
            C16156C26445BD5534B042106F13507F53C3C4C3FF00FFFF00FFFF00FFC3C5C3
            38974325B13A3CBE534BBF5D87D28E8BD29172CA7B66C6706DC8745DC26726A0
            32316E37C3C4C3FF00FFFF00FF55AD6227B63F38BE4F42BF58AFE2B5FCF9F6FC
            F9F4FAF7F17BCE8268C6726FC8766CC77429A134508054FF00FFA9BFAC21B236
            2FBE4F3CBF56BFE7C4FCFAF8FCFAF7FCF9F6FCF9F4CBE8C862C56D69C77271C9
            7861C46B137717A9B1A957BA6A30BF5037BF56D1EFD7FCFBFAFCFBF9FCFAF8FC
            FAF7FCF9F6FCF9F481D08763C66F6BC77472C97937B3464C825039BD5231C157
            2CBE4FB3E5BFFCFCFCFCFBFBA3DFACBCE5C0FCFAF7FCF9F6D3ECD15EC46B64C6
            706CC8754FC0601F782639C15431C2592EBF5332C053C4EBCD86D79839BF5458
            C76CF7F9F5FCFAF7FCF9F688D3915FC56C66C7725DC46B157E1B40C75D33C45D
            30C1572EBF532DBF4F2EBE4F34BF523BBF55ACE2B5FCFAF8FCFAF7DDEFDA5CC5
            6B61C56E58C36816841E4ECC6D36C66132C35B30C1572FC0532DBF4F30BF5036
            BF534EC565F4F8F2FCFAF8FCFAF78FD6995BC4694AC05F24902C73CF8B3CC963
            34C55F32C35B31C2572FC0532DBF4F31BF5137BF549EDEABFCFBF9FCFAF8E5F3
            E45AC56B37BB4D509E58B5CABB54D77637C86334C55F33C45B31C2572FC0532D
            BF5033BF5342C25DEFF8F0FCFBF9CCEBCF5BC76E1CAB2BAABAABFF00FF84D69D
            47D06E36C76234C55F33C45B31C2572FC0542EBF5134BF5377D28B71D08443C1
            5B31BC4758B365FF00FFFF00FFC5C8C677DD9748D16E37C76335C65F33C45B31
            C2572FC05430BF5235BF5539C05734BF4C41B653C3C6C4FF00FFFF00FFFF00FF
            C5C8C68EDDA862DF863FCC6637C76134C55D33C35B32C35835C35737C24F65C1
            75C3C7C4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBACEC089DBA268DB8959
            D97851D46F55CE7371C986AFC6B3FF00FFFF00FFFF00FFFF00FF}
          NumGlyphs = 1
          TabOrder = 0
          Text = ''
        end
        object edtBrutoVenda: TCurrencyEdit
          Tag = 1
          Left = 16
          Top = 84
          Width = 130
          Height = 25
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object edtDescontoVenda: TCurrencyEdit
          Tag = 1
          Left = 152
          Top = 84
          Width = 130
          Height = 25
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object edtLiquidoVenda: TCurrencyEdit
          Tag = 1
          Left = 288
          Top = 84
          Width = 130
          Height = 25
          Ctl3D = False
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 137
          Top = 34
          Width = 112
          Height = 23
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object btnAlterar: TBitBtn
          Left = 255
          Top = 32
          Width = 81
          Height = 25
          Caption = '&ALTERAR'
          Enabled = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB25D13AF5912AD5612AC5311AA4F10A84E0FA54A0EA4
            480DA1440DA0420C9F3F0C9D3E0BFF00FFFF00FFFF00FFFF00FFB56114FCF7EF
            FBF6EBF3EBE0FCF2E3FBF0DEFBEFDAFBEDD5FBEBD1FBE9CDFBE7C89E400BFF00
            FFFF00FFFF00FFFF00FFB86516FCF8F3FCF7EF1D2B321B2F37A7C0C5EDE0CFF4
            E0C8F8E6CFFBEBD1FBEACEA1430CFF00FFFF00FFFF00FFFF00FFBB6916FCFAF7
            FCF8F43F5A655999A455B9D12A84A64A8763E3C0A5E4C1A4E8C9ABA2450DFF00
            FFFF00FFFF00FFFF00FFBE6D17FCFBF9FCFAF7B2CDD96BBAD688E9EF2381400E
            6D0D0E6E0EE3C0A5E3BFA2A3470DFF00FFFF00FFFF00FFFF00FFC07217FCFBFC
            FCFBF9EBEFF14190B23687509CDEB056B86D146F110E6E0EE3C0A6A54A0EFF00
            FFFF00FFFF00FFFF00FFC37519FCFCFCFCFCFCFCFBFA5B9A9A53975392C69994
            E1AC4EB565146F110E6E0EA84C0FFF00FFFF00FFFF00FFFF00FFC57919FCFCFC
            FCFCFCFCFCFCFCFBF931833550955080BC8784DCA046B15E146F110E6E0EFF00
            FFFF00FFFF00FFFF00FFC77C1AFCFCFCFCFCFCFCFCFCFCFCFCFCFBFB31833547
            8F476DB27573D7943EAE58116A0E0E6E9B84ACBDFF00FFFF00FFC97F1CFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFA3183353C893C5AA96461D1874297AC34A3
            CC0E6E9BFF00FFFF00FFCC821CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFA3183353183354297AC9AFBFB4297AC141EB10A0A9AFF00FFCE851DFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFBFB4297AC87EDF64297AC476B
            FC1D46F72231C34B4BAACF861DFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCEEF5F74297AC1116A6476BFC1D46F70A0A9AFF00FFCF871DCF871D
            CE861DCC831CCC821CCA801BC87D1BC67A1AC47719C37419C172170A0A9A2231
            C30A0A9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF4B4BAAFF00FFFF00FFFF00FF}
          TabOrder = 5
        end
      end
    end
  end
  object QRYPlano: TZQuery
    Params = <>
    Left = 65
    Top = 73
  end
  object dtsPlano: TDataSource
    DataSet = QRYPlano
    OnDataChange = dtsPlanoDataChange
    Left = 97
    Top = 73
  end
  object QRYpagamentoVenda: TZQuery
    Params = <>
    Left = 497
    Top = 97
  end
  object dtsPagamentoVenda: TDataSource
    DataSet = QRYpagamentoVenda
    Left = 537
    Top = 97
  end
end
