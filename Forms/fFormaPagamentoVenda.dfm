object frmFormaPagamento: TfrmFormaPagamento
  Left = 0
  Top = 0
  Caption = 'Forma de Pagamento'
  ClientHeight = 193
  ClientWidth = 399
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 152
    Width = 399
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnConfirmar: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
      ExplicitLeft = 0
      ExplicitTop = 6
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
    Width = 399
    Height = 35
    Align = alTop
    Caption = 'Informa a Forma de Pagamento'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object TPanel
    Left = 0
    Top = 35
    Width = 399
    Height = 117
    Align = alClient
    TabOrder = 2
    object lblNomeFormaPagamento: TLabel
      Left = 184
      Top = 37
      Width = 121
      Height = 13
      Caption = 'lblNomeFormaPagamento'
    end
    object lblFormaPagamento: TLabel
      Left = 30
      Top = 14
      Width = 102
      Height = 13
      Caption = 'Forma de Pagamento'
    end
    object lblTotalNota: TLabel
      Left = 30
      Top = 80
      Width = 50
      Height = 13
      Caption = 'Total Nota'
    end
    object edtFormaPagamento: TEdit
      Left = 30
      Top = 32
      Width = 59
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnExit = edtFormaPagamentoExit
    end
    object btnBuscaFormaPagamento: TButton
      Left = 95
      Top = 30
      Width = 74
      Height = 27
      Caption = 'Forma Pgto'
      TabOrder = 1
      TabStop = False
      OnClick = btnBuscaFormaPagamentoClick
    end
    object edtTotalNota: TEdit
      Left = 90
      Top = 75
      Width = 67
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
  end
end
