object frmRelatorioClientes: TfrmRelatorioClientes
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Clientes'
  ClientHeight = 246
  ClientWidth = 284
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 284
    Height = 41
    Align = alTop
    Caption = 'Relat'#243'rio de Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 274
  end
  object Panel2: TPanel
    Left = 0
    Top = 211
    Width = 284
    Height = 35
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 223
    ExplicitWidth = 274
    object btnVisualizar: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnCancelar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 284
    Height = 170
    Align = alClient
    TabOrder = 2
    ExplicitTop = 47
    ExplicitWidth = 467
    object lblPesquisaFiltro: TLabel
      Left = 135
      Top = 42
      Width = 84
      Height = 13
      Caption = 'Pesquisa do Filtro'
    end
    object rdgTipo: TRadioGroup
      Left = 22
      Top = 88
      Width = 151
      Height = 65
      Caption = 'Tipo'
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica'
        'Todos')
      TabOrder = 0
    end
    object rdgFiltros: TRadioGroup
      Left = 22
      Top = 6
      Width = 107
      Height = 76
      Caption = 'Filtros'
      Items.Strings = (
        'C'#243'digo'
        'Cidade'
        'Endere'#231'o')
      TabOrder = 1
      OnClick = rdgFiltrosClick
    end
    object edtBuscaFiltros: TEdit
      Left = 135
      Top = 61
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
  end
end
