object frmRelatorioProdutos: TfrmRelatorioProdutos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Produtos'
  ClientHeight = 230
  ClientWidth = 367
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 367
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnVisualizar: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnCancelar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 41
    Align = alTop
    Caption = 'Relat'#243'rio de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 367
    Height = 148
    Align = alClient
    TabOrder = 2
    object lblPesquisaFiltro: TLabel
      Left = 208
      Top = 97
      Width = 84
      Height = 13
      Caption = 'Pesquisa do Filtro'
    end
    object rdgFiltros: TRadioGroup
      Left = 8
      Top = 6
      Width = 185
      Height = 131
      Caption = 'Filtros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o'
        'Marca'
        'Refer'#234'ncia')
      ParentFont = False
      TabOrder = 0
      OnClick = rdgFiltrosClick
    end
    object edtBuscaFiltros: TEdit
      Left = 208
      Top = 116
      Width = 136
      Height = 21
      TabOrder = 1
    end
  end
end
