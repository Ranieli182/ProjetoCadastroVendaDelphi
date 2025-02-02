object frmRelatorioProdutoFortes: TfrmRelatorioProdutoFortes
  Left = 0
  Top = 0
  Caption = 'frmRelatorioProdutoFortes'
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
  object rlrProduto: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dtsRelatorioProduto
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 32
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 10
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 664
        Top = 10
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
      end
    end
    object rlbTitulo: TRLBand
      Left = 38
      Top = 70
      Width = 718
      Height = 34
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object lblTitulo: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        Align = faClientTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Produtos'
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
      Top = 104
      Width = 718
      Height = 26
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lblCodigo: TRLLabel
        Left = 24
        Top = 3
        Width = 42
        Height = 15
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TRLLabel
        Left = 88
        Top = 3
        Width = 61
        Height = 15
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMarca: TRLLabel
        Left = 212
        Top = 2
        Width = 39
        Height = 15
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPreco: TRLLabel
        Left = 307
        Top = 2
        Width = 37
        Height = 15
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblImagem: TRLLabel
        Left = 584
        Top = 2
        Width = 49
        Height = 15
        Caption = 'Imagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSaldo: TRLLabel
        Left = 432
        Top = 2
        Width = 35
        Height = 15
        Caption = 'Saldo'
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
      Top = 130
      Width = 718
      Height = 79
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLImage1: TRLImage
        Left = 584
        Top = 6
        Width = 65
        Height = 67
        Center = True
        Scaled = True
        BeforePrint = RLImage1BeforePrint
      end
      object RLDBText1: TRLDBText
        Left = 24
        Top = 10
        Width = 12
        Height = 14
        DataField = 'ID'
        DataSource = dtsRelatorioProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 88
        Top = 10
        Width = 62
        Height = 14
        DataField = 'DESCRICAO'
        DataSource = dtsRelatorioProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 212
        Top = 10
        Width = 41
        Height = 14
        DataField = 'MARCA'
        DataSource = dtsRelatorioProduto
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 307
        Top = 10
        Width = 37
        Height = 14
        DataField = 'PRECO'
        DataSource = dtsRelatorioProduto
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 432
        Top = 10
        Width = 39
        Height = 14
        DataField = 'SALDO'
        DataSource = dtsRelatorioProduto
        Text = ''
      end
    end
    object rlbRodape: TRLBand
      Left = 38
      Top = 209
      Width = 718
      Height = 30
      BandType = btFooter
      object RLLabel1: TRLLabel
        Left = 296
        Top = 6
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
    Left = 152
    Top = 480
  end
  object dtsRelatorioCliente: TDataSource
    DataSet = qryRelatorioCliente
    Left = 152
    Top = 528
  end
  object qryRelatorioProduto: TFDQuery
    Connection = dtmConexao.FDConnection
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 72
    Top = 360
  end
  object dtsRelatorioProduto: TDataSource
    DataSet = qryRelatorioProduto
    Left = 72
    Top = 416
  end
end
