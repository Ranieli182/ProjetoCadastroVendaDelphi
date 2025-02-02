unit fFormaPagamentoVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uFormaPagamento, fConsultaFormaPagamento, uItemVenda, dConexao;

type
  TfrmFormaPagamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    edtFormaPagamento: TEdit;
    btnBuscaFormaPagamento: TButton;
    lblNomeFormaPagamento: TLabel;
    lblFormaPagamento: TLabel;
    lblTotalNota: TLabel;
    edtTotalNota: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtFormaPagamentoExit(Sender: TObject);
    procedure btnBuscaFormaPagamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaNomeFormaPagamento;
  end;

var
  frmFormaPagamento: TfrmFormaPagamento;

implementation

{$R *.dfm}

procedure TfrmFormaPagamento.btnBuscaFormaPagamentoClick(Sender: TObject);
var
  lfrmConsultaFormaPagamento: TfrmConsultaFormaPagamento;
begin
  lfrmConsultaFormaPagamento := TfrmConsultaFormaPagamento.Create(nil);
  try
    lfrmConsultaFormaPagamento.ShowModal;
    edtFormaPagamento.Text :=
      lfrmConsultaFormaPagamento.dbgConsultaFormaPagamento.DataSource.DataSet.
      FieldByName('IDFORMAPAGAMENTO').AsString;
    lblNomeFormaPagamento.Caption :=
      lfrmConsultaFormaPagamento.dbgConsultaFormaPagamento.DataSource.DataSet.
      FieldByName('DESCRICAO').AsString;
    edtFormaPagamento.SetFocus;
  finally
    lfrmConsultaFormaPagamento.Free;
  end;
end;

procedure TfrmFormaPagamento.btnCancelarClick(Sender: TObject);
begin
  edtFormaPagamento.Text := EmptyStr;
  close;
end;

procedure TfrmFormaPagamento.btnConfirmarClick(Sender: TObject);
begin
  if (edtFormaPagamento.Text = EmptyStr) then
  begin
    ShowMessage('N�o � permitido Forma de Pagamento vazio');
    edtFormaPagamento.SetFocus;
  end
  else
  begin
    close;
  end;

end;

procedure TfrmFormaPagamento.CarregaNomeFormaPagamento;
begin
  if (trim(edtFormaPagamento.Text) <> EmptyStr) AND
    not(btnBuscaFormaPagamento.Focused) then
  begin
    if TFormaPagamento.Existe(strtoint(edtFormaPagamento.Text)) then
    begin
      lblNomeFormaPagamento.Caption := TFormaPagamento.ObjetoBusca.DESCRICAO;
    end
    else
    begin
      ShowMessage('Forma de Pagamento n�o cadastrada.');
      edtFormaPagamento.Text := EmptyStr;
      edtFormaPagamento.SetFocus;
    end
  end;
end;

procedure TfrmFormaPagamento.edtFormaPagamentoExit(Sender: TObject);
begin
  CarregaNomeFormaPagamento;
end;

procedure TfrmFormaPagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmFormaPagamento.FormShow(Sender: TObject);
begin
  lblNomeFormaPagamento.Caption := EmptyStr;
  edtFormaPagamento.SetFocus;
end;

end.
