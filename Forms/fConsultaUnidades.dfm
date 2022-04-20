object frmConsultaUnidade: TfrmConsultaUnidade
  Left = 0
  Top = 0
  Caption = 'Consulta de Unidades'
  ClientHeight = 681
  ClientWidth = 1024
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
    Width = 1024
    Height = 33
    Align = alTop
    Caption = 'Consulta de Unidade'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 1024
    Height = 33
    Align = alTop
    TabOrder = 1
    object btnIncluir: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnVisualizar: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 2
      OnClick = btnVisualizarClick
    end
    object btnExcluir: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      Left = 301
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
    object edtPesquisarUnidade: TEdit
      Left = 552
      Top = 6
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      NumbersOnly = True
      TabOrder = 5
      OnChange = edtPesquisarUnidadeChange
    end
    object cbxFiltroUnidades: TComboBox
      Left = 401
      Top = 6
      Width = 128
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'C'#243'digo'
      OnChange = cbxFiltroUnidadesChange
      Items.Strings = (
        'C'#243'digo'
        'Nome')
    end
  end
  object dbgConsultaUnidades: TDBGrid
    Left = 0
    Top = 66
    Width = 1024
    Height = 615
    Align = alClient
    DataSource = dtmConexao.dtsUnidades
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
