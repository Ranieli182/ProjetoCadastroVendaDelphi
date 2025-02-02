unit fCadastroVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCadastroVendedor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtCodigoVendedor: TEdit;
    edtNome: TEdit;
    edtEmail: TEdit;
    edtEndereco: TEdit;
    edtCEP: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    lblEmail: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblCEP: TLabel;
    lblCidade: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroVendedor: TfrmCadastroVendedor;

implementation

{$R *.dfm}

end.
