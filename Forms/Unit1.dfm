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
    ExplicitLeft = 152
    ExplicitTop = 56
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1008
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitLeft = 352
    ExplicitTop = 96
    ExplicitWidth = 185
  end
  object Panel3: TPanel
    Left = 0
    Top = 82
    Width = 1008
    Height = 599
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitLeft = 72
    ExplicitTop = 312
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1006
      Height = 597
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
