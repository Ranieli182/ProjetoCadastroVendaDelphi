object frmRelatorioVendas: TfrmRelatorioVendas
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 359
  ClientWidth = 300
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
    Width = 300
    Height = 41
    Align = alTop
    Caption = 'Relat'#243'rio de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 318
    Width = 300
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitTop = 256
    ExplicitWidth = 185
    object Button4: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Button4'
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = 6
      ExplicitHeight = 25
    end
    object Button5: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Button5'
      TabOrder = 1
      ExplicitLeft = 144
      ExplicitTop = 16
      ExplicitHeight = 25
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 300
    Height = 277
    Align = alClient
    TabOrder = 2
    ExplicitTop = 35
    object lblDataInicial: TLabel
      Left = 32
      Top = 15
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object lblDataFinal: TLabel
      Left = 160
      Top = 15
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label1: TLabel
      Left = 32
      Top = 64
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 127
      Top = 85
      Width = 31
      Height = 13
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 32
      Top = 112
      Width = 31
      Height = 13
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 127
      Top = 134
      Width = 31
      Height = 13
      Caption = 'Label2'
    end
    object Label5: TLabel
      Left = 32
      Top = 162
      Width = 31
      Height = 13
      Caption = 'Label3'
    end
    object Label6: TLabel
      Left = 127
      Top = 184
      Width = 31
      Height = 13
      Caption = 'Label2'
    end
    object Label7: TLabel
      Left = 32
      Top = 212
      Width = 31
      Height = 13
      Caption = 'Label7'
    end
    object Label8: TLabel
      Left = 160
      Top = 213
      Width = 31
      Height = 12
      Caption = 'Label7'
    end
    object dtpDataInicial: TDateTimePicker
      Left = 32
      Top = 34
      Width = 97
      Height = 21
      Date = 44523.000000000000000000
      Time = 0.389263113429478800
      TabOrder = 0
    end
    object dtpDataFinal: TDateTimePicker
      Left = 160
      Top = 34
      Width = 97
      Height = 21
      Date = 44523.000000000000000000
      Time = 0.389479814817605100
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 32
      Top = 83
      Width = 53
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 91
      Top = 80
      Width = 30
      Height = 25
      Caption = 'Button1'
      TabOrder = 3
    end
    object Edit2: TEdit
      Left = 32
      Top = 131
      Width = 53
      Height = 21
      TabOrder = 4
      Text = 'Edit2'
    end
    object Button2: TButton
      Left = 91
      Top = 129
      Width = 30
      Height = 25
      Caption = 'Button1'
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 32
      Top = 181
      Width = 53
      Height = 21
      TabOrder = 6
      Text = 'Edit2'
    end
    object Button3: TButton
      Left = 91
      Top = 179
      Width = 30
      Height = 25
      Caption = 'Button1'
      TabOrder = 7
    end
    object Edit4: TEdit
      Left = 32
      Top = 231
      Width = 89
      Height = 21
      TabOrder = 8
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 160
      Top = 231
      Width = 89
      Height = 21
      TabOrder = 9
      Text = 'Edit4'
    end
  end
end
