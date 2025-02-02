unit fCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dConexao,
  uCliente, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmCadastroClientes = class(TForm)
    pnlClienteBotao: TPanel;
    pnlClienteInfo: TPanel;
    lblNomeCliente: TLabel;
    edtNomeCliente: TEdit;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtCidade: TEdit;
    lblCidade: TLabel;
    lblTelefone: TLabel;
    edtTelefone: TEdit;
    lblCPF: TLabel;
    lblCNPJ: TLabel;
    edtEMAIL: TEdit;
    lblEMAIL: TLabel;
    rdgTipo: TRadioGroup;
    edtCPF: TMaskEdit;
    edtCNPJ: TMaskEdit;
    edtCodigoCliente: TEdit;
    lblCodigoCliente: TLabel;
    edtBairro: TEdit;
    lblBairro: TLabel;
    edtCEP: TMaskEdit;
    lblCEP: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelefoneExit(Sender: TObject);
    procedure rdgTipoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    CodigoCliente: integer;
    Tipo: String;
    TipoCliente: String;
    procedure IncluirCliente;
    procedure AlterarCliente;
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

procedure TfrmCadastroClientes.AlterarCliente;
var
  lCliente: Tcliente;
begin
  lCliente := Tcliente.Create;
  try
    lCliente.ID := CodigoCliente;
    lCliente.NOME := edtNomeCliente.Text;
    lCliente.ENDERECO := edtEndereco.Text;
    lCliente.CPF := edtCPF.Text;
    lCliente.CIDADE := edtCidade.Text;
    lCliente.TELEFONE := edtTelefone.Text;
    lCliente.CNPJ := edtCNPJ.Text;
    lCliente.EMAIL := edtEMAIL.Text;
    lCliente.CEP := edtCEP.Text;
    lCliente.BAIRRO := edtBairro.Text;

    if rdgTipo.ItemIndex = 0 then
    begin
      TipoCliente := 'F';
    end
    else if rdgTipo.ItemIndex = 1 then
    begin
      TipoCliente := 'J';
    end;
    lCliente.Tipo := TipoCliente;

    lCliente.Alterar(true);
  finally
    lCliente.Free;
  end;
end;

procedure TfrmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroClientes.btnSalvarClick(Sender: TObject);
var
  I: integer;
begin
  if trim(edtNomeCliente.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher o Nome do Cliente.');
    edtNomeCliente.SetFocus;
    exit;
  end
  else if trim(edtEndereco.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher o endere�o do cliente.');
    edtEndereco.SetFocus;
    exit;
  end
  else if trim(edtCidade.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher a cidade do cliente.');
    edtCidade.SetFocus;
    exit;
  end
  else if not Tcliente.ValidaCEP(edtCEP.Text) then
  begin
    ShowMessage('CEP inv�lido.');
    edtCEP.SetFocus;
    exit;
  end
  else if rdgTipo.ItemIndex = 0 then
  begin
    if trim(edtCPF.Text) = '' then
    begin
      ShowMessage('CPF n�o pode ser vazio.');
      edtCPF.SetFocus;
      exit;
    end
    else if not Tcliente.ValidaCPF(edtCPF.Text) then
    begin
      ShowMessage('CPF inv�lido.');
      edtCPF.SetFocus;
      exit;
    end
    else if Tipo = 'Incluir' then
    begin
      IncluirCliente;
    end
    else if Tipo = 'Alterar' then
    begin
      AlterarCliente;
    end;
    close;
  end
  else if rdgTipo.ItemIndex = 1 then
  begin
    if trim(edtCNPJ.Text) = '' then
    begin
      ShowMessage('CNPJ n�o pode ser vazio.');
      edtCNPJ.SetFocus;
      exit;
    end
    else if not Tcliente.ValidaCNPJ(edtCNPJ.Text) then
    begin
      ShowMessage('CNPJ inv�lido.');
      edtCNPJ.SetFocus;
      exit;
    end
    else if Tipo = 'Incluir' then
    begin
      IncluirCliente;
    end
    else if Tipo = 'Alterar' then
    begin
      AlterarCliente;
    end;
    close;
  end;

end;

procedure TfrmCadastroClientes.edtTelefoneExit(Sender: TObject);
begin
  rdgTipo.SetFocus;
end;

procedure TfrmCadastroClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmCadastroClientes.FormShow(Sender: TObject);
begin
  edtNomeCliente.SetFocus;
end;

procedure TfrmCadastroClientes.IncluirCliente;
var
  lCliente: Tcliente;
begin
  lCliente := Tcliente.Create;
  try
    lCliente.NOME := edtNomeCliente.Text;
    lCliente.ENDERECO := edtEndereco.Text;
    lCliente.CPF := edtCPF.Text;
    lCliente.CIDADE := edtCidade.Text;
    lCliente.TELEFONE := edtTelefone.Text;
    lCliente.CNPJ := edtCNPJ.Text;
    lCliente.EMAIL := edtEMAIL.Text;
    lCliente.CEP := edtCEP.Text;
    lCliente.BAIRRO := edtBairro.Text;

    if rdgTipo.ItemIndex = 0 then
    begin
      TipoCliente := 'F';
    end
    else if rdgTipo.ItemIndex = 1 then
    begin
      TipoCliente := 'J';
    end;
    lCliente.Tipo := TipoCliente;

    lCliente.Incluir(true);
  finally
    lCliente.Free;
  end;

end;

procedure TfrmCadastroClientes.rdgTipoClick(Sender: TObject);
begin
  if rdgTipo.ItemIndex = 0 then
  begin
    edtCNPJ.Visible := false;
    edtCPF.Visible := true;
    lblCNPJ.Visible := false;
    lblCPF.Visible := true;
  end
  else if rdgTipo.ItemIndex = 1 then
  begin
    edtCNPJ.Visible := true;
    edtCPF.Visible := false;
    lblCNPJ.Visible := true;
    lblCPF.Visible := false;
  end;

end;

end.
