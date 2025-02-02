unit fMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  fConsultaClientes, fConsultaProdutos, fRelatorioClientes, fConsultaUnidades,
  fConsultaUsuarios, fConsultaVendedores, fConsultaFormaPagamento, fVenda,
  fConsultaVendas, uVenda, Vcl.StdCtrls, uItemVenda, uUsuario;

type
  TfrmMenuPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Panel1: TPanel;
    Panel2: TPanel;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    Sair1: TMenuItem;
    Re1: TMenuItem;
    Clientes2: TMenuItem;
    Produtos2: TMenuItem;
    Unidades1: TMenuItem;
    Usurios1: TMenuItem;
    Venda1: TMenuItem;
    ConsultarVendas1: TMenuItem;
    Vendedor1: TMenuItem;
    FormadePagamento1: TMenuItem;
    Vendas1: TMenuItem;
    Vendas2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Unidades1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Vendedor1Click(Sender: TObject);
    procedure FormadePagamento1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure ConsultarVendas1Click(Sender: TObject);
  private
    { Private declarations }
    FNivelAcessoMenu: Integer;
  public
    { Public declarations }
    property NivelAcessoMenu: Integer read FNivelAcessoMenu
      write FNivelAcessoMenu;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses fLogin;

{$R *.dfm}

procedure TfrmMenuPrincipal.Clientes1Click(Sender: TObject);
var
  lfrmConsultaClientes: TfrmConsultaClientes;
begin
  lfrmConsultaClientes := TfrmConsultaClientes.Create(nil);
  try
    lfrmConsultaClientes.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaClientes.ShowModal;
  finally
    lfrmConsultaClientes.Free;
  end;
end;

procedure TfrmMenuPrincipal.Clientes2Click(Sender: TObject);
var
  lfrmRelatorioClientes: TfrmRelatorioClientes;
begin
  lfrmRelatorioClientes := TfrmRelatorioClientes.Create(nil);
  try
    lfrmRelatorioClientes.ShowModal;
  finally
    lfrmRelatorioClientes.Free;
  end;
end;

procedure TfrmMenuPrincipal.ConsultarVendas1Click(Sender: TObject);
var
  lfrmConsultaVendas: TfrmConsultaVendas;
begin
  lfrmConsultaVendas := TfrmConsultaVendas.Create(nil);
  try
    lfrmConsultaVendas.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaVendas.ShowModal;
  finally
    lfrmConsultaVendas.Free;
  end;
end;

procedure TfrmMenuPrincipal.FormadePagamento1Click(Sender: TObject);
var
  lfrmConsultaFormaPagamento: TfrmConsultaFormaPagamento;
begin
  lfrmConsultaFormaPagamento := TfrmConsultaFormaPagamento.Create(nil);
  try
    lfrmConsultaFormaPagamento.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaFormaPagamento.ShowModal;
  finally
    lfrmConsultaFormaPagamento.Free;
  end;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmMenuPrincipal.Produtos1Click(Sender: TObject);
var
  lfrmConsultaProdutos: TfrmConsultaProdutos;
begin
  lfrmConsultaProdutos := TfrmConsultaProdutos.Create(nil);
  try
    lfrmConsultaProdutos.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaProdutos.ShowModal;
  finally
    lfrmConsultaProdutos.Free;
  end;
end;

procedure TfrmMenuPrincipal.Sair1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair?', TMsgDlgType.mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    if CallTerminateProcs then
    begin
      PostQuitMessage(0);
    end
  end;
end;

procedure TfrmMenuPrincipal.Unidades1Click(Sender: TObject);
var
  lfrmConsultaUnidade: TfrmConsultaUnidade;
begin
  lfrmConsultaUnidade := TfrmConsultaUnidade.Create(nil);
  try
    lfrmConsultaUnidade.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaUnidade.ShowModal;
  finally
    lfrmConsultaUnidade.Free;
  end;
end;

procedure TfrmMenuPrincipal.Usurios1Click(Sender: TObject);
var
  lfrmConsultaUsuarios: TfrmConsultaUsuarios;
begin
  lfrmConsultaUsuarios := TfrmConsultaUsuarios.Create(nil);
  try
    lfrmConsultaUsuarios.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaUsuarios.ShowModal;
  finally
    lfrmConsultaUsuarios.Free;
  end;
end;

procedure TfrmMenuPrincipal.Vendas1Click(Sender: TObject);
var
  lfrmVenda: TfrmVenda;
  lVenda: Tvenda;
begin
  lfrmVenda := TfrmVenda.Create(nil);
  lVenda := Tvenda.Create;
  try
    lfrmVenda.edtIDVenda.Text := lVenda.GeraProximoID.ToString;
    lfrmVenda.ShowModal;
  finally
    lfrmVenda.Free;
    lVenda.Free;
  end;
end;

procedure TfrmMenuPrincipal.Vendedor1Click(Sender: TObject);
var
  lfrmConsultaVendedores: TfrmConsultaVendedores;
begin
  lfrmConsultaVendedores := TfrmConsultaVendedores.Create(nil);
  try
    lfrmConsultaVendedores.ValidaSeUsuarioEstaLiberado(NivelAcessoMenu);
    lfrmConsultaVendedores.ShowModal;
  finally
    lfrmConsultaVendedores.Free;
  end;
end;

end.
