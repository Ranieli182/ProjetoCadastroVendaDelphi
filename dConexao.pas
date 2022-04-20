unit dConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.IBBase, Data.FMTBcd, Data.SqlExpr;

type
  TdtmConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    qryClientes: TFDQuery;
    dtsClientes: TDataSource;
    qryClientesID: TIntegerField;
    qryClientesNOME: TStringField;
    qryClientesENDERECO: TStringField;
    qryClientesCPF: TStringField;
    qryClientesTELEFONE: TStringField;
    qryClientesEMAIL: TStringField;
    qryClientesCIDADE: TStringField;
    qryClientesCNPJ: TStringField;
    qryClientesTIPO: TStringField;
    qryConsultaClientes: TFDQuery;
    qryConsultaClientesID: TIntegerField;
    qryConsultaClientesNOME: TStringField;
    qryConsultaClientesENDERECO: TStringField;
    qryConsultaClientesCPF: TStringField;
    qryConsultaClientesTELEFONE: TStringField;
    qryConsultaClientesEMAIL: TStringField;
    qryConsultaClientesCIDADE: TStringField;
    qryConsultaClientesCNPJ: TStringField;
    qryConsultaClientesTIPO: TStringField;
    qryProdutos: TFDQuery;
    qryConsultaProdutos: TFDQuery;
    dtsProdutos: TDataSource;
    qryUnidades: TFDQuery;
    qryConsultaUnidades: TFDQuery;
    dtsUnidades: TDataSource;
    qryConsultaUnidadesIDUNIDADE: TIntegerField;
    qryConsultaUnidadesNOMEUNIDADE: TStringField;
    qryConsultaUnidadesUNIDADE: TStringField;
    qryConsultaUnidadesDATACADASTROUNIDADE: TDateField;
    qryProdutosIDPRODUTO: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosMARCA: TStringField;
    qryProdutosQUANTIDADE: TSingleField;
    qryProdutosPRECO: TBCDField;
    qryProdutosUNIDADE: TIntegerField;
    qryProdutosSALDO: TBCDField;
    qryProdutosCUSTO: TBCDField;
    qryProdutosFOTO: TBlobField;
    qryUsuarios: TFDQuery;
    qryConsultaUsuarios: TFDQuery;
    dtsUsuarios: TDataSource;
    qryConsultaUsuariosIDUSUARIO: TIntegerField;
    qryConsultaUsuariosNOMEUSUARIO: TStringField;
    qryConsultaUsuariosLOGIN: TStringField;
    qryConsultaUsuariosSENHA: TStringField;
    qryConsultaUsuariosEMAIL: TStringField;
    qryConsultaUsuariosNIVELACESSO: TIntegerField;
    qryUsuariosIDUSUARIO: TIntegerField;
    qryUsuariosNOMEUSUARIO: TStringField;
    qryUsuariosLOGIN: TStringField;
    qryUsuariosSENHA: TStringField;
    qryUsuariosEMAIL: TStringField;
    qryUsuariosNIVELACESSO: TIntegerField;
    qryVendedores: TFDQuery;
    qryConsultaVendedores: TFDQuery;
    dtsVendedores: TDataSource;
    qryConsultaVendedoresIDVENDEDOR: TIntegerField;
    qryConsultaVendedoresNOMEVENDEDOR: TStringField;
    qryConsultaVendedoresEMAIL: TStringField;
    qryConsultaVendedoresENDERECO: TStringField;
    qryConsultaVendedoresBAIRRO: TStringField;
    qryConsultaVendedoresCEP: TStringField;
    qryConsultaVendedoresCIDADE: TStringField;
    qryVendedoresIDVENDEDOR: TIntegerField;
    qryVendedoresNOMEVENDEDOR: TStringField;
    qryVendedoresEMAIL: TStringField;
    qryVendedoresENDERECO: TStringField;
    qryVendedoresBAIRRO: TStringField;
    qryVendedoresCEP: TStringField;
    qryVendedoresCIDADE: TStringField;
    qryFormaPagamento: TFDQuery;
    qryContultaFormaPagamento: TFDQuery;
    dtsFormaPagamento: TDataSource;
    qryContultaFormaPagamentoIDFORMAPAGAMENTO: TIntegerField;
    qryContultaFormaPagamentoDESCRICAO: TStringField;
    qryContultaFormaPagamentoTIPO: TStringField;
    qryFormaPagamentoIDFORMAPAGAMENTO: TIntegerField;
    qryFormaPagamentoDESCRICAO: TStringField;
    qryFormaPagamentoTIPO: TStringField;
    qryClientesCEP: TStringField;
    qryClientesBAIRRO: TStringField;
    qryConsultaClientesCEP: TStringField;
    qryConsultaClientesBAIRRO: TStringField;
    qryConsultaProdutosID: TIntegerField;
    qryConsultaProdutosFK_UNIDADE: TIntegerField;
    qryConsultaProdutosDESCRICAO: TStringField;
    qryConsultaProdutosREFERENCIA: TStringField;
    qryConsultaProdutosPRECO: TBCDField;
    qryConsultaProdutosCUSTO: TBCDField;
    qryConsultaProdutosSALDO: TBCDField;
    qryConsultaProdutosPESO: TBCDField;
    qryConsultaProdutosFOTO: TBlobField;
    qryConsultaProdutosUNIDADE: TStringField;
    qryConsultaProdutosMARCA: TStringField;
    dtsVenda: TDataSource;
    tblVenda: TFDMemTable;
    tblVendaPRODUTO: TIntegerField;
    tblVendaQUANTIDADE: TFloatField;
    tblVendaVALOR: TFloatField;
    tblVendaDESCONTO: TFloatField;
    tblVendaTOTAL: TFloatField;
    tblVendaDESCRICAO: TStringField;
    dtsConsultaVenda: TDataSource;
    qryConsultaVendas: TFDQuery;
    qryConsultaVendasID: TIntegerField;
    qryConsultaVendasEMISSAO: TSQLTimeStampField;
    qryConsultaVendasNOME: TStringField;
    qryConsultaVendasNOMEVENDEDOR: TStringField;
    qryConsultaVendasIDFORMAPAGAMENTO: TIntegerField;
    qryConsultaVendasTOTAL: TBCDField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdtmConexao }


end.
