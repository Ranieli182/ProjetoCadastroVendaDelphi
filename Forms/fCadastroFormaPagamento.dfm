object frmCadastroFormaPagamento: TfrmCadastroFormaPagamento
  Left = 0
  Top = 0
  Caption = 'Cadastro de Forma de Pagamento'
  ClientHeight = 202
  ClientWidth = 338
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
    Top = 0
    Width = 338
    Height = 33
    Align = alTop
    Caption = 'Cadastro de Forma de Pagamento'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 161
    Width = 338
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSalvar: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
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
  object Panel3: TPanel
    Left = 0
    Top = 33
    Width = 338
    Height = 128
    Align = alClient
    TabOrder = 2
    object lblCodigoFormaPagamento: TLabel
      Left = 32
      Top = 6
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblDescricao: TLabel
      Left = 32
      Top = 53
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edtCodigoFormaPagamento: TEdit
      Left = 32
      Top = 25
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 32
      Top = 72
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object rdgTipo: TRadioGroup
      Left = 201
      Top = 14
      Width = 96
      Height = 87
      Caption = 'Tipo'
      Items.Strings = (
        'Saida'
        'Entrada')
      TabOrder = 2
    end
  end
end
