object frmRelatorioClienteFortes: TfrmRelatorioClienteFortes
  Left = 0
  Top = 0
  Caption = 'frmRelatorioClienteFortes'
  ClientHeight = 473
  ClientWidth = 770
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlrCliente: TRLReport
    Left = -16
    Top = -24
    Width = 794
    Height = 1123
    DataSource = dtsRelatorioCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 3
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 656
        Top = 3
        Width = 59
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
      end
    end
    object rlbTitulo: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 40
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lblTitulo: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 34
        Align = faClientTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbColunas: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 26
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object lblCódigo: TRLLabel
        Left = 19
        Top = 4
        Width = 42
        Height = 14
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNome: TRLLabel
        Left = 88
        Top = 4
        Width = 36
        Height = 14
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCPFCNPJ: TRLLabel
        Left = 227
        Top = 4
        Width = 59
        Height = 14
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCidade: TRLLabel
        Left = 632
        Top = 4
        Width = 42
        Height = 14
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEndereco: TRLLabel
        Left = 359
        Top = 4
        Width = 57
        Height = 14
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBairro: TRLLabel
        Left = 535
        Top = 4
        Width = 38
        Height = 14
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlbDetalhes: TRLBand
      Left = 38
      Top = 139
      Width = 718
      Height = 30
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDBText1: TRLDBText
        Left = 19
        Top = 8
        Width = 12
        Height = 14
        DataField = 'ID'
        DataSource = dtsRelatorioCliente
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 88
        Top = 8
        Width = 32
        Height = 14
        DataField = 'NOME'
        DataSource = dtsRelatorioCliente
        Text = ''
      end
      object txtCPFCNPJ: TRLDBText
        Left = 227
        Top = 8
        Width = 59
        Height = 14
        DataSource = dtsRelatorioCliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        BeforePrint = txtCPFCNPJBeforePrint
      end
      object RLDBText4: TRLDBText
        Left = 359
        Top = 8
        Width = 57
        Height = 14
        DataField = 'ENDERECO'
        DataSource = dtsRelatorioCliente
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 535
        Top = 8
        Width = 42
        Height = 14
        DataField = 'BAIRRO'
        DataSource = dtsRelatorioCliente
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 632
        Top = 8
        Width = 40
        Height = 14
        DataField = 'CIDADE'
        DataSource = dtsRelatorioCliente
        Text = ''
      end
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 169
      Width = 718
      Height = 40
      BandType = btFooter
      object RLLabel1: TRLLabel
        Left = 288
        Top = 21
        Width = 143
        Height = 16
        Alignment = taJustify
        Caption = 'Desenvolvido por Ranieli'
      end
    end
  end
  object qryRelatorioCliente: TFDQuery
    Connection = dtmConexao.FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 72
    Top = 360
  end
  object dtsRelatorioCliente: TDataSource
    DataSet = qryRelatorioCliente
    Left = 72
    Top = 408
  end
end
