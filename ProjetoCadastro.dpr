program ProjetoCadastro;

uses
  Vcl.Forms,
  fMenuPrincipal in 'Forms\fMenuPrincipal.pas' {frmMenuPrincipal},
  fCadastroClientes in 'Forms\fCadastroClientes.pas' {frmCadastroClientes},
  fConsultaClientes in 'Forms\fConsultaClientes.pas' {frmConsultaClientes},
  dConexao in 'dConexao.pas' {dtmConexao: TDataModule},
  uCliente in 'Classes\uCliente.pas',
  fConsultaProdutos in 'Forms\fConsultaProdutos.pas' {frmConsultaProdutos},
  fCadastroProdutos in 'Forms\fCadastroProdutos.pas' {frmCadastroProdutos},
  fRelatorioClientes in 'Forms\fRelatorioClientes.pas' {frmRelatorioClientes},
  fRLClienteFortes in 'Forms\fRLClienteFortes.pas' {frmRelatorioClienteFortes},
  fCadastroUnidades in 'Forms\fCadastroUnidades.pas' {frmCadastroUnidades},
  fConsultaUnidades in 'Forms\fConsultaUnidades.pas' {frmConsultaUnidade},
  uUnidade in 'Classes\uUnidade.pas',
  fCadastroUsuarios in 'Forms\fCadastroUsuarios.pas' {frmCadastroUsuarios},
  fConsultaUsuarios in 'Forms\fConsultaUsuarios.pas' {frmConsultaUsuarios},
  uUsuario in 'Classes\uUsuario.pas',
  fCadastroVendedores in 'Forms\fCadastroVendedores.pas' {frmCadastroVendedores},
  fConsultaVendedores in 'Forms\fConsultaVendedores.pas' {frmConsultaVendedores},
  uVendedor in 'Classes\uVendedor.pas',
  uFormaPagamento in 'Classes\uFormaPagamento.pas',
  fCadastroFormaPagamento in 'Forms\fCadastroFormaPagamento.pas' {frmCadastroFormaPagamento},
  fConsultaFormaPagamento in 'Forms\fConsultaFormaPagamento.pas' {frmConsultaFormaPagamento},
  fLogin in 'Forms\fLogin.pas' {frmLogin},
  uProduto in 'Classes\uProduto.pas',
  uHelpersImagensBase64 in 'Classes\uHelpersImagensBase64.pas',
  fVenda in 'Forms\fVenda.pas' {frmVenda},
  fConsultaVendas in 'Forms\fConsultaVendas.pas' {frmConsultaVendas},
  fFormaPagamentoVenda in 'Forms\fFormaPagamentoVenda.pas' {frmFormaPagamento},
  uVenda in 'Classes\uVenda.pas',
  uItemVenda in 'Classes\uItemVenda.pas',
  fRLProdutoFortes in 'Forms\fRLProdutoFortes.pas' {frmRelatorioProdutoFortes},
  fRelatorioProdutos in 'Forms\fRelatorioProdutos.pas' {frmRelatorioProdutos},
  uHelpersRLImagensBase64 in 'Classes\uHelpersRLImagensBase64.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.CreateForm(TfrmConsultaVendas, frmConsultaVendas);
  Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento);
  Application.CreateForm(TfrmRelatorioProdutoFortes, frmRelatorioProdutoFortes);
  Application.CreateForm(TfrmRelatorioProdutos, frmRelatorioProdutos);
  Application.Run;
end.
