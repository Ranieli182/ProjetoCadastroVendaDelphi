object frmCadastroVendedores: TfrmCadastroVendedores
  Left = 0
  Top = 0
  Caption = 'Cadastro de Vendedor'
  ClientHeight = 335
  ClientWidth = 365
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 33
    Align = alTop
    Caption = 'Cadastro de Vendedor'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 302
    Width = 365
    Height = 33
    Align = alBottom
    TabOrder = 1
    object btnSalvar: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 31
      Align = alLeft
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 33
    Width = 365
    Height = 269
    Align = alClient
    TabOrder = 2
    object lblCodigo: TLabel
      Left = 24
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblNome: TLabel
      Left = 112
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Nome Vendedor'
    end
    object lblEmail: TLabel
      Left = 26
      Top = 54
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lblEndereco: TLabel
      Left = 26
      Top = 99
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblBairro: TLabel
      Left = 26
      Top = 149
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object lblCEP: TLabel
      Left = 192
      Top = 149
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object lblCidade: TLabel
      Left = 26
      Top = 205
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object edtCodigoVendedor: TEdit
      Left = 24
      Top = 27
      Width = 57
      Height = 21
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 112
      Top = 27
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 35
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 24
      Top = 73
      Width = 217
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 2
    end
    object edtEndereco: TEdit
      Left = 24
      Top = 118
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 35
      TabOrder = 3
    end
    object edtBairro: TEdit
      Left = 24
      Top = 168
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 4
    end
    object edtCidade: TEdit
      Left = 24
      Top = 224
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 5
    end
    object edtCEP: TMaskEdit
      Left = 192
      Top = 168
      Width = 120
      Height = 21
      EditMask = '99.999-999;0'
      MaxLength = 10
      TabOrder = 6
      Text = ''
    end
  end
end
