object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 334
  Width = 494
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\BancoDeDadosFB\BANCO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 32
    Top = 16
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 32
    Top = 72
  end
  object qryClientes: TFDQuery
    Connection = FDConnection
    Left = 336
    Top = 24
  end
  object dtsClientes: TDataSource
    Left = 416
    Top = 24
  end
end
