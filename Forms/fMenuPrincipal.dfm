object frmMenuPrincipal: TfrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 661
  ClientWidth = 1008
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1008
    Height = 620
    Align = alClient
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 48
    object Usurios1: TMenuItem
      Caption = 'Usu'#225'rios'
      OnClick = Usurios1Click
    end
    object Clientes1: TMenuItem
      Caption = 'Clientes'
      OnClick = Clientes1Click
    end
    object Produtos1: TMenuItem
      Caption = 'Produtos'
      OnClick = Produtos1Click
    end
    object Unidades1: TMenuItem
      Caption = 'Unidades'
      OnClick = Unidades1Click
    end
    object Vendedor1: TMenuItem
      Caption = 'Vendedor'
      OnClick = Vendedor1Click
    end
    object Venda1: TMenuItem
      Caption = 'Venda'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
      object ConsultarVendas1: TMenuItem
        Caption = 'Consultar Vendas'
        OnClick = ConsultarVendas1Click
      end
    end
    object FormadePagamento1: TMenuItem
      Caption = 'Forma de Pagamento'
      OnClick = FormadePagamento1Click
    end
    object Re1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes2Click
      end
      object Produtos2: TMenuItem
        Caption = 'Produtos'
      end
      object Vendas2: TMenuItem
        Caption = 'Vendas'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
