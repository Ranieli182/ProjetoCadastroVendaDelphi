object frmCadastroClientes: TfrmCadastroClientes
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 327
  ClientWidth = 623
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
  object pnlClienteBotao: TPanel
    Left = 0
    Top = 286
    Width = 623
    Height = 41
    Align = alBottom
    TabOrder = 0
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
  object pnlClienteInfo: TPanel
    Left = 0
    Top = 0
    Width = 623
    Height = 286
    Align = alClient
    TabOrder = 1
    object lblNomeCliente: TLabel
      Left = 120
      Top = 16
      Width = 78
      Height = 13
      Caption = 'Nome do Cliente'
    end
    object lblEndereco: TLabel
      Left = 24
      Top = 66
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object lblCidade: TLabel
      Left = 24
      Top = 114
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object lblTelefone: TLabel
      Left = 456
      Top = 113
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object lblCPF: TLabel
      Left = 217
      Top = 165
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object lblCNPJ: TLabel
      Left = 376
      Top = 165
      Width = 25
      Height = 13
      Caption = 'CNPJ'
    end
    object lblEMAIL: TLabel
      Left = 24
      Top = 219
      Width = 28
      Height = 13
      Caption = 'E-Mail'
    end
    object lblCodigoCliente: TLabel
      Left = 24
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lblBairro: TLabel
      Left = 456
      Top = 67
      Width = 32
      Height = 13
      Caption = 'Bairrro'
    end
    object lblCEP: TLabel
      Left = 296
      Top = 113
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object edtNomeCliente: TEdit
      Left = 120
      Top = 35
      Width = 465
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 0
    end
    object edtEndereco: TEdit
      Left = 24
      Top = 86
      Width = 393
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 80
      TabOrder = 1
    end
    object edtCidade: TEdit
      Left = 24
      Top = 133
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 3
    end
    object edtTelefone: TEdit
      Left = 456
      Top = 132
      Width = 121
      Height = 21
      MaxLength = 15
      TabOrder = 5
      OnExit = edtTelefoneExit
    end
    object edtEMAIL: TEdit
      Left = 24
      Top = 238
      Width = 305
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 9
    end
    object rdgTipo: TRadioGroup
      Left = 24
      Top = 160
      Width = 151
      Height = 53
      Caption = 'Tipo'
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica')
      TabOrder = 6
      OnClick = rdgTipoClick
    end
    object edtCPF: TMaskEdit
      Left = 217
      Top = 184
      Width = 112
      Height = 21
      EditMask = '999.999.999-99;0'
      MaxLength = 14
      TabOrder = 7
      Text = ''
    end
    object edtCNPJ: TMaskEdit
      Left = 376
      Top = 184
      Width = 112
      Height = 21
      EditMask = '99.999.999/9999-99;0'
      MaxLength = 18
      TabOrder = 8
      Text = ''
    end
    object edtCodigoCliente: TEdit
      Left = 24
      Top = 35
      Width = 65
      Height = 21
      TabOrder = 10
    end
    object edtBairro: TEdit
      Left = 456
      Top = 86
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object edtCEP: TMaskEdit
      Left = 296
      Top = 132
      Width = 118
      Height = 21
      EditMask = '99.999-999;0'
      MaxLength = 10
      TabOrder = 4
      Text = ''
    end
  end
end
