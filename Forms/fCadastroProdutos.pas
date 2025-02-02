unit fCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dConexao,
  Vcl.Mask, uUnidade, FireDAC.Comp.Client, uProduto, Vcl.DBCtrls,
  uHelpersImagensBase64, Data.DB;

type
  TfrmCadastroProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblDescricao: TLabel;
    lblMarca: TLabel;
    lblPreco: TLabel;
    edtDescricao: TEdit;
    edtPreco: TEdit;
    edtMarca: TEdit;
    lblReferencia: TLabel;
    edtReferencia: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    lblUnidade: TLabel;
    edtSaldo: TEdit;
    edtCusto: TEdit;
    lblSaldo: TLabel;
    lblCusto: TLabel;
    cbxUnidade: TComboBox;
    pnlFotoProduto: TPanel;
    imgFotoProduto: TImage;
    lblImagemProduto: TLabel;
    edtCodigoProduto: TEdit;
    lblCodigoProduto: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoProduto: integer;
    Tipo: String;
    procedure IncluirProduto;
    procedure AlterarProduto;
    procedure CarregaUnidadeComboBox;
  end;

var
  frmCadastroProdutos: TfrmCadastroProdutos;

implementation

{$R *.dfm}

procedure TfrmCadastroProdutos.AlterarProduto;
var
  lPreco: string;
  lProduto: Tproduto;
begin
  lProduto := Tproduto.Create;
  try
    lProduto.ID := CodigoProduto;
    lProduto.DESCRICAO := edtDescricao.Text;
    lProduto.REFERENCIA := edtReferencia.Text;
    lProduto.MARCA := edtMarca.Text;
    lProduto.PRECO := StrToFloat(edtPreco.Text);
    lProduto.FK_UNIDADE :=
      integer(cbxUnidade.Items.Objects[cbxUnidade.ItemIndex]);
    lProduto.SALDO := StrToFloat(edtSaldo.Text);
    lProduto.CUSTO := StrToFloat(edtCusto.Text);
    lProduto.FOTO := imgFotoProduto.Base64;
    lProduto.Alterar(true);
  finally
    lProduto.Free;
  end;
end;

procedure TfrmCadastroProdutos.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroProdutos.btnSalvarClick(Sender: TObject);
begin
  if trim(edtDescricao.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher a descri��o do produto.');
    edtDescricao.SetFocus;
    exit;
  end
  else if trim(edtMarca.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher a marca do produto.');
    edtMarca.SetFocus;
    exit;
  end
  else if trim(edtPreco.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher o pre�o do produto.');
    edtPreco.SetFocus;
  end
  else if trim(edtSaldo.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher a quantidade do produto.');
    edtSaldo.SetFocus;
    exit;
  end
  else
  begin
    if Tipo = 'Incluir' then
    begin
      IncluirProduto;
    end
    else if Tipo = 'Alterar' then
    begin
      AlterarProduto;
    end;
    close;

  end;
end;

procedure TfrmCadastroProdutos.CarregaUnidadeComboBox;
var
  lNome: string;
  lId: integer;
  lquery: Tfdquery;
begin
  lquery := Tfdquery.Create(nil);
  try
    cbxUnidade.Items.Clear;
    lquery.Connection := dtmConexao.FDConnection;
    lquery.close;
    lquery.SQL.Clear;
    lquery.SQL.Add(' SELECT * FROM UNIDADES');
    lquery.Open;
    lquery.First;

    while not lquery.Eof do
    begin
      lId := lquery.FieldByName('IDUNIDADE').AsInteger;
      lNome := lquery.FieldByName('UNIDADE').AsString;
      cbxUnidade.Items.AddObject(lNome, TObject(lId));
      lquery.next;
    end;

    cbxUnidade.ItemIndex := 0;

  finally
    lquery.Free;
  end;

end;

procedure TfrmCadastroProdutos.edtPrecoExit(Sender: TObject);
var
  lValor: double;
begin
  if edtPreco.Text <> emptystr then
  begin
    if (TryStrToFloat(edtPreco.Text, lValor)) then
    begin
      edtPreco.Text := FormatFloat('#0.00', lValor);
    end
    else
    begin
      ShowMessage('N�mero digitado n�o � um valor v�lido');
      edtPreco.Clear;
      edtPreco.SetFocus;
    end;
  end;
end;

procedure TfrmCadastroProdutos.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmCadastroProdutos.FormCreate(Sender: TObject);
begin
  imgFotoProduto.Popup;
  CarregaUnidadeComboBox;
end;

procedure TfrmCadastroProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmCadastroProdutos.FormShow(Sender: TObject);
begin

  edtDescricao.SetFocus;
end;

procedure TfrmCadastroProdutos.IncluirProduto;
var
  lPreco: string;
  lProduto: Tproduto;
begin

  lProduto := Tproduto.Create;
  try
    lProduto.DESCRICAO := edtDescricao.Text;
    lProduto.REFERENCIA := edtReferencia.Text;
    lProduto.MARCA := edtMarca.Text;
    lProduto.PRECO := StrToFloat(edtPreco.Text);
    lProduto.FK_UNIDADE :=
      integer(cbxUnidade.Items.Objects[cbxUnidade.ItemIndex]);
    lProduto.SALDO := StrToFloat(edtSaldo.Text);
    lProduto.CUSTO := StrToFloat(edtCusto.Text);
    lProduto.FOTO := imgFotoProduto.Base64;

    lProduto.Incluir(true);
  finally
    lProduto.Free;
  end;

end;

end.
