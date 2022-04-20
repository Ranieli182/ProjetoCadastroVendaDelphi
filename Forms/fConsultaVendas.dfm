object frmConsultaVendas: TfrmConsultaVendas
  Left = 0
  Top = 0
  Caption = 'Consulta de Vendas'
  ClientHeight = 681
  ClientWidth = 1008
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 41
    Align = alTop
    Caption = 'Consulta de Vendas'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1008
    Height = 41
    Align = alTop
    TabOrder = 1
    object btnIncluir: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnExcluir: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnVisualizar: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 2
    end
    object btnSair: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
    object cbxFiltroVenda: TComboBox
      Left = 344
      Top = 9
      Width = 133
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'N'#250'mero Nota'
      OnChange = cbxFiltroVendaChange
      Items.Strings = (
        'N'#250'mero Nota'
        'Nome Cliente')
    end
    object edtConsultarVendas: TEdit
      Left = 504
      Top = 9
      Width = 139
      Height = 21
      CharCase = ecUpperCase
      NumbersOnly = True
      TabOrder = 5
      OnChange = edtConsultarVendasChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 82
    Width = 1008
    Height = 599
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object dbgConsultarVendas: TDBGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 597
      Align = alClient
      DataSource = dtmConexao.dtsConsultaVenda
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
