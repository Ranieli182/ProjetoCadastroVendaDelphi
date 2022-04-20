object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 496
  Width = 644
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\BancoDeDadosFB\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 32
    Top = 8
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 32
    Top = 56
  end
  object qryClientes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 160
    Top = 8
    object qryClientesID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryClientesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object qryClientesCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 15
    end
    object qryClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object qryClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object qryClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryClientesTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 2
    end
    object qryClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
  end
  object dtsClientes: TDataSource
    DataSet = qryConsultaClientes
    Left = 216
    Top = 8
  end
  object qryConsultaClientes: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    Left = 160
    Top = 56
    object qryConsultaClientesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaClientesNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object qryConsultaClientesENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 80
    end
    object qryConsultaClientesBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object qryConsultaClientesCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 15
    end
    object qryConsultaClientesTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
    object qryConsultaClientesEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object qryConsultaClientesCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryConsultaClientesCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryConsultaClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryConsultaClientesTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Size = 2
    end
  end
  object qryProdutos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 344
    Top = 8
    object qryProdutosIDPRODUTO: TIntegerField
      FieldName = 'IDPRODUTO'
      Origin = 'IDPRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 30
    end
    object qryProdutosMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
    end
    object qryProdutosQUANTIDADE: TSingleField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object qryProdutosPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
    end
    object qryProdutosUNIDADE: TIntegerField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
    end
    object qryProdutosSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
    object qryProdutosCUSTO: TBCDField
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      Precision = 18
    end
    object qryProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
  end
  object qryConsultaProdutos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      'P.ID'
      ', P.FK_UNIDADE'
      ', P.DESCRICAO'
      ', P.REFERENCIA'
      ', P.PRECO'
      ', P.CUSTO'
      ', P.SALDO'
      ', P.PESO'
      ', P.FOTO'
      ', U.UNIDADE'
      ', P.MARCA'
      'FROM PRODUTO P'
      'INNER JOIN UNIDADES U'
      'ON P.FK_UNIDADE = U.IDUNIDADE')
    Left = 344
    Top = 56
    object qryConsultaProdutosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaProdutosFK_UNIDADE: TIntegerField
      DisplayLabel = 'Unidade'
      FieldName = 'FK_UNIDADE'
      Origin = 'FK_UNIDADE'
      Required = True
    end
    object qryConsultaProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 35
    end
    object qryConsultaProdutosREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 15
    end
    object qryConsultaProdutosPRECO: TBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Precision = 18
    end
    object qryConsultaProdutosCUSTO: TBCDField
      DisplayLabel = 'Custo'
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      Precision = 18
    end
    object qryConsultaProdutosSALDO: TBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      Origin = 'SALDO'
      Precision = 18
    end
    object qryConsultaProdutosPESO: TBCDField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
      Origin = 'PESO'
      Precision = 18
    end
    object qryConsultaProdutosFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
    end
    object qryConsultaProdutosUNIDADE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object qryConsultaProdutosMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = 'MARCA'
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryConsultaProdutos
    Left = 416
    Top = 8
  end
  object qryUnidades: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM UNIDADES')
    Left = 512
    Top = 8
  end
  object qryConsultaUnidades: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM UNIDADES')
    Left = 512
    Top = 64
    object qryConsultaUnidadesIDUNIDADE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDUNIDADE'
      Origin = 'IDUNIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaUnidadesNOMEUNIDADE: TStringField
      DisplayLabel = 'Nome Unidade'
      FieldName = 'NOMEUNIDADE'
      Origin = 'NOMEUNIDADE'
      Size = 15
    end
    object qryConsultaUnidadesUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object qryConsultaUnidadesDATACADASTROUNIDADE: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DATACADASTROUNIDADE'
      Origin = 'DATACADASTROUNIDADE'
    end
  end
  object dtsUnidades: TDataSource
    DataSet = qryConsultaUnidades
    Left = 576
    Top = 8
  end
  object qryUsuarios: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 24
    Top = 136
    object qryUsuariosIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      Origin = 'NOMEUSUARIO'
      Size = 50
    end
    object qryUsuariosLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 5
    end
    object qryUsuariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 5
    end
    object qryUsuariosEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qryUsuariosNIVELACESSO: TIntegerField
      FieldName = 'NIVELACESSO'
      Origin = 'NIVELACESSO'
    end
  end
  object qryConsultaUsuarios: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 24
    Top = 184
    object qryConsultaUsuariosIDUSUARIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaUsuariosNOMEUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'NOMEUSUARIO'
      Origin = 'NOMEUSUARIO'
      Size = 50
    end
    object qryConsultaUsuariosLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 5
    end
    object qryConsultaUsuariosSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 5
    end
    object qryConsultaUsuariosEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qryConsultaUsuariosNIVELACESSO: TIntegerField
      DisplayLabel = 'N'#237'vel Acesso'
      FieldName = 'NIVELACESSO'
      Origin = 'NIVELACESSO'
    end
  end
  object dtsUsuarios: TDataSource
    DataSet = qryConsultaUsuarios
    Left = 88
    Top = 136
  end
  object qryVendedores: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM VENDEDOR')
    Left = 216
    Top = 136
    object qryVendedoresIDVENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDVENDEDOR'
      Origin = 'IDVENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendedoresNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOMEVENDEDOR'
      Origin = 'NOMEVENDEDOR'
      Size = 35
    end
    object qryVendedoresEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qryVendedoresENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object qryVendedoresBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object qryVendedoresCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryVendedoresCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
  end
  object qryConsultaVendedores: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM VENDEDOR')
    Left = 216
    Top = 184
    object qryConsultaVendedoresIDVENDEDOR: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDVENDEDOR'
      Origin = 'IDVENDEDOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaVendedoresNOMEVENDEDOR: TStringField
      DisplayLabel = 'Nome Vendedor'
      FieldName = 'NOMEVENDEDOR'
      Origin = 'NOMEVENDEDOR'
      Size = 35
    end
    object qryConsultaVendedoresEMAIL: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qryConsultaVendedoresENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 35
    end
    object qryConsultaVendedoresBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
    end
    object qryConsultaVendedoresCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qryConsultaVendedoresCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
  end
  object dtsVendedores: TDataSource
    DataSet = qryConsultaVendedores
    Left = 288
    Top = 136
  end
  object qryFormaPagamento: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM FORMAPAGAMENTO')
    Left = 408
    Top = 136
    object qryFormaPagamentoIDFORMAPAGAMENTO: TIntegerField
      FieldName = 'IDFORMAPAGAMENTO'
      Origin = 'IDFORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFormaPagamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 10
    end
    object qryFormaPagamentoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object qryContultaFormaPagamento: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM FORMAPAGAMENTO')
    Left = 408
    Top = 184
    object qryContultaFormaPagamentoIDFORMAPAGAMENTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDFORMAPAGAMENTO'
      Origin = 'IDFORMAPAGAMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryContultaFormaPagamentoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 10
    end
    object qryContultaFormaPagamentoTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsFormaPagamento: TDataSource
    DataSet = qryContultaFormaPagamento
    Left = 496
    Top = 136
  end
  object dtsVenda: TDataSource
    DataSet = tblVenda
    Left = 24
    Top = 312
  end
  object tblVenda: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 24
    Top = 264
    object tblVendaPRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRODUTO'
    end
    object tblVendaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object tblVendaQUANTIDADE: TFloatField
      DisplayLabel = 'Quant.'
      FieldName = 'QUANTIDADE'
      DisplayFormat = '#,#0.00'
    end
    object tblVendaVALOR: TFloatField
      DisplayLabel = 'Valor R$'
      FieldName = 'VALOR'
      DisplayFormat = '#,#0.00'
    end
    object tblVendaDESCONTO: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'DESCONTO'
      DisplayFormat = '#,#0.00'
    end
    object tblVendaTOTAL: TFloatField
      DisplayLabel = 'Total R$'
      FieldName = 'TOTAL'
    end
  end
  object dtsConsultaVenda: TDataSource
    DataSet = qryConsultaVendas
    Left = 160
    Top = 312
  end
  object qryConsultaVendas: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'SELECT '
      'V.ID'
      ',V.EMISSAO'
      ',C.NOME'
      ',VR.NOMEVENDEDOR'
      ',FP.IDFORMAPAGAMENTO'
      ',V.TOTAL'
      'FROM VENDA V'
      'INNER JOIN CLIENTE C'
      'ON V.CLIENTE = C.ID'
      'INNER JOIN VENDEDOR VR'
      'ON V.VENDEDOR = VR.IDVENDEDOR'
      'INNER JOIN FORMAPAGAMENTO FP'
      'ON V.FORMAPGTO = FP.IDFORMAPAGAMENTO')
    Left = 160
    Top = 264
    object qryConsultaVendasID: TIntegerField
      DisplayLabel = 'Nota'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConsultaVendasEMISSAO: TSQLTimeStampField
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object qryConsultaVendasNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cliente'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryConsultaVendasNOMEVENDEDOR: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Vendedor'
      FieldName = 'NOMEVENDEDOR'
      Origin = 'NOMEVENDEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 35
    end
    object qryConsultaVendasIDFORMAPAGAMENTO: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Forma Pgto'
      FieldName = 'IDFORMAPAGAMENTO'
      Origin = 'IDFORMAPAGAMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryConsultaVendasTOTAL: TBCDField
      DisplayLabel = 'R$ Total'
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      Precision = 18
    end
  end
end
