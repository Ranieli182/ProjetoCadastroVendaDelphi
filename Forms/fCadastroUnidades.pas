unit fCadastroUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, dConexao, uUnidade;

type
  TfrmCadastroUnidades = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtUnidade: TEdit;
    edtNomeUnidade: TEdit;
    lblUnidade: TLabel;
    lblNomeUnidade: TLabel;
    btnSalvar: TButton;
    dtpDataCadastro: TDateTimePicker;
    lblDataCadastro: TLabel;
    btnCancelar: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoUnidade : integer;
    Tipo: String;
    procedure IncluirUnidade;
    procedure AlterarUnidade;

  end;

var
  frmCadastroUnidades: TfrmCadastroUnidades;

implementation

{$R *.dfm}

procedure TfrmCadastroUnidades.AlterarUnidade;
var
  lUnidade: Tunidade;
begin
  lUnidade := Tunidade.Create;
  try
    lUnidade.IDUNIDADE := CodigoUnidade;
    lUnidade.NOMEUNIDADE := edtNomeUnidade.Text;
    lUnidade.UNIDADE := edtUnidade.Text;
    lUnidade.Alterar(true);
  finally
    lUnidade.Free;
  end;
end;

procedure TfrmCadastroUnidades.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroUnidades.btnSalvarClick(Sender: TObject);
begin
  if trim(edtUnidade.Text) = '' then
  begin
    ShowMessage('Campo obrigat�rio n�o informado, favor preencher a Unidade.');
    edtUnidade.SetFocus;
    exit;
  end
  else if trim(edtNomeUnidade.Text) = '' then
  begin
   ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher o Nome da Unidade.');
    edtNomeUnidade.SetFocus;
    exit;
  end
  else
  begin
    if Tipo = 'Incluir' then
    begin
      IncluirUnidade;
    end
    else if Tipo = 'Alterar' then
    begin
      AlterarUnidade;
    end;
    close;
  end;

end;

procedure TfrmCadastroUnidades.FormCreate(Sender: TObject);
begin
  dtpDataCadastro.date := now;
end;

procedure TfrmCadastroUnidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmCadastroUnidades.FormShow(Sender: TObject);
begin
  edtUnidade.SetFocus;
end;

procedure TfrmCadastroUnidades.IncluirUnidade;
var
  lUnidade: Tunidade;
begin
  lUnidade := Tunidade.Create;
  try
    lUnidade.NOMEUNIDADE := edtNomeUnidade.Text;
    lUnidade.UNIDADE := edtUnidade.Text;
    lUnidade.DATACADASTROUNIDADE := dtpDataCadastro.Date;
    lUnidade.Incluir(true);
  finally
    lUnidade.Free;
  end;
end;

end.
