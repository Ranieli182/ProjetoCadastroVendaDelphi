object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Consulta de Vendedores'
  ClientHeight = 275
  ClientWidth = 628
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 33
    Align = alTop
    Caption = 'Colsulta de Vendedores'
    TabOrder = 0
    ExplicitWidth = 445
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 628
    Height = 33
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 216
    ExplicitTop = 80
    ExplicitWidth = 185
    object btnIncluir: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 0
      ExplicitLeft = 24
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnAlterar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
      ExplicitLeft = 128
      ExplicitTop = 6
      ExplicitHeight = 25
    end
    object btnVisualizar: TButton
      Left = 151
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 2
      ExplicitLeft = 224
      ExplicitTop = 6
      ExplicitHeight = 25
    end
    object btnExcluir: TButton
      Left = 226
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 3
      ExplicitLeft = 344
      ExplicitTop = 8
      ExplicitHeight = 25
    end
    object btnSair: TButton
      Left = 301
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Sair'
      TabOrder = 4
      ExplicitLeft = 448
      ExplicitTop = 0
      ExplicitHeight = 25
    end
    object edtPerquisarVendedor: TEdit
      Left = 440
      Top = 6
      Width = 135
      Height = 21
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 66
    Width = 628
    Height = 209
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 312
    ExplicitTop = 192
    ExplicitWidth = 185
    ExplicitHeight = 41
    object dbgConsultaVendedor: TDBGrid
      Left = 1
      Top = 1
      Width = 626
      Height = 207
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
