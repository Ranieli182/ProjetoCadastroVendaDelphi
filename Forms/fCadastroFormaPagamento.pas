unit fCadastroFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dConexao,
  uFormaPagamento;

type
  TfrmCadastroFormaPagamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtCodigoFormaPagamento: TEdit;
    edtDescricao: TEdit;
    rdgTipo: TRadioGroup;
    lblCodigoFormaPagamento: TLabel;
    lblDescricao: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoFormaPagamento: integer;
    Tipo: String;
    TipoFormaPagamento: String;
    procedure IncluirFormaPagamento;
    procedure AlterarFormaPagamento;
  end;

var
  frmCadastroFormaPagamento: TfrmCadastroFormaPagamento;

implementation

{$R *.dfm}
{ TfrmCadastroFormaPagamento }

procedure TfrmCadastroFormaPagamento.AlterarFormaPagamento;
var
  lFormaPagamento: Tformapagamento;
begin
  lFormaPagamento := Tformapagamento.Create;
  try
    lFormaPagamento.IDFORMAPAGAMENTO := CodigoFormaPagamento;
    lFormaPagamento.DESCRICAO := edtDescricao.Text;

    if rdgTipo.ItemIndex = 0 then
    begin
      TipoFormaPagamento := 'S';
    end
    else if rdgTipo.ItemIndex = 1 then
    begin
      TipoFormaPagamento := 'E';
    end;
    lFormaPagamento.Tipo := TipoFormaPagamento;

    lFormaPagamento.Alterar(true);
  finally
    lFormaPagamento.Free;
  end;
end;

procedure TfrmCadastroFormaPagamento.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroFormaPagamento.btnSalvarClick(Sender: TObject);
begin
  if trim(edtDescricao.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher a Descri��o.');
    edtDescricao.SetFocus;
    exit;
  end
  else if (rdgTipo.ItemIndex <> 0) AND (rdgTipo.ItemIndex <> 1) then
  begin
    ShowMessage('Campo obrigat�rio n�o informado, favor preencher o Tipo.');
    rdgTipo.SetFocus;
    exit;
  end

  else
  begin
    if Tipo = 'Incluir' then
    begin
      IncluirFormaPagamento;
    end
    else if Tipo = 'Alterar' then
    begin
      AlterarFormaPagamento;
    end;
    close;
  end;
end;

procedure TfrmCadastroFormaPagamento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmCadastroFormaPagamento.FormShow(Sender: TObject);
begin
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroFormaPagamento.IncluirFormaPagamento;
var
  lFormaPagamento: Tformapagamento;
begin
  lFormaPagamento := Tformapagamento.Create;
  try
    lFormaPagamento.DESCRICAO := edtDescricao.Text;

    if rdgTipo.ItemIndex = 0 then
    begin
      TipoFormaPagamento := 'S';
    end
    else if rdgTipo.ItemIndex = 1 then
    begin
      TipoFormaPagamento := 'E';
    end;
    lFormaPagamento.Tipo := TipoFormaPagamento;

    lFormaPagamento.Incluir(true);
  finally
    lFormaPagamento.Free;
  end;
end;

end.
