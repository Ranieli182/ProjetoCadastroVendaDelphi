unit fVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uVenda,
  fConsultaClientes, fConsultaVendedores, fConsultaProdutos, uCliente, dConexao,
  uVendedor, uProduto, uItemVenda, fFormaPagamentoVenda;

type
  TfrmVenda = class(TForm)
    Panel1: TPanel;
    edtProduto: TEdit;
    btnBuscaProduto: TButton;
    Panel4: TPanel;
    pnlGridItensVenda: TPanel;
    dbgItensVenda: TDBGrid;
    edtCliente: TEdit;
    btnBuscaCliente: TButton;
    lblNomeCliente: TLabel;
    edtVendedor: TEdit;
    btnBuscaVendedor: TButton;
    lblNomeVendedor: TLabel;
    imgButton: TImageList;
    lblNomeProduto: TLabel;
    edtQuantidade: TEdit;
    lblCliente: TLabel;
    lblVendedor: TLabel;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    edtIDVenda: TEdit;
    lblIDVenda: TLabel;
    dtpEmissao: TDateTimePicker;
    lblEmissao: TLabel;
    btnConfirmarProduto: TButton;
    btnExcluirProduto: TButton;
    lblQuantidadeItensVenda: TLabel;
    Label2: TLabel;
    edtValor: TEdit;
    lblValor: TLabel;
    edtDesconto: TEdit;
    lblDesconto: TLabel;
    lblOBS: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    lblTotal: TLabel;
    lblSubTotal: TLabel;
    lblDescontoTotal: TLabel;
    lblSubTotalValor: TLabel;
    lblDescontoValor: TLabel;
    Panel3: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    mmOBS: TMemo;
    edtDescontoValor: TEdit;
    edtDescontoProduto: TLabel;
    edtDescontoPorcentual: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtValorTotal: TEdit;
    lblValorTotal: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure btnBuscaVendedorClick(Sender: TObject);
    procedure btnBuscaProdutoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtClienteExit(Sender: TObject);
    procedure edtVendedorExit(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure btnConfirmarProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure edtDescontoPorcentualExit(Sender: TObject);
    procedure edtDescontoValorExit(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure mmOBSExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    CodigoVenda: integer;
    CodigoItemVenda: integer;
    procedure IncluirVenda;
    procedure CarregaNomeCliente;
    procedure CarregaNomeVendedor;
    procedure CarregaNomeProduto;
    procedure CarregaPrecoProduto;
    procedure LimparEditsProdutos;
    procedure CalculaTotalProduto;
    procedure LimparVenda;

  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}

procedure TfrmVenda.btnBuscaClienteClick(Sender: TObject);
var
  lfrmConsultaClientes: TfrmConsultaClientes;
begin
  lfrmConsultaClientes := TfrmConsultaClientes.Create(nil);
  try
    lfrmConsultaClientes.ShowModal;
    edtCliente.Text := lfrmConsultaClientes.dbgConsultaCliente.DataSource.
      DataSet.FieldByName('ID').AsString;
    lblNomeCliente.Caption := lfrmConsultaClientes.dbgConsultaCliente.
      DataSource.DataSet.FieldByName('NOME').AsString;
    edtCliente.SetFocus;
  finally
    lfrmConsultaClientes.Free;
  end;
end;

procedure TfrmVenda.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmVenda.btnConfirmarClick(Sender: TObject);
var
  lfrmFormaPagamento: TfrmFormaPagamento;
  lVenda: Tvenda;
  lItemVenda: Titemvenda;
  lFomaPagamentoTemp: string;
begin
  lfrmFormaPagamento := TfrmFormaPagamento.Create(nil);
  lVenda := Tvenda.Create;
  lItemVenda := Titemvenda.Create;
  try
    if (trim(edtCliente.Text) = EmptyStr) then
    begin
      ShowMessage('Cliente n�o informado.');
      edtCliente.SetFocus;
    end
    else if (trim(edtVendedor.Text) = EmptyStr) then
    begin
      ShowMessage('Vendedor n�o informado.');
      edtVendedor.SetFocus;
    end
    else if (dtmConexao.tblVenda.recordcount = 0) then
    begin
      ShowMessage('Produto n�o informado.');
      edtProduto.SetFocus;
    end
    else
    begin
      lfrmFormaPagamento.edtTotalNota.Text := lblTotal.Caption;
      lfrmFormaPagamento.ShowModal;
      lFomaPagamentoTemp := lfrmFormaPagamento.edtFormaPagamento.Text;
      if (lFomaPagamentoTemp <> EmptyStr) then
      begin

          lVenda.ID := StrToInt(edtIDVenda.Text);
          lVenda.EMISSAO := dtpEmissao.DateTime;
          lVenda.CLIENTE := StrToInt(edtCliente.Text);
          lVenda.VENDEDOR := StrToInt(edtVendedor.Text);
          lVenda.FORMAPGTO :=
            StrToInt(lfrmFormaPagamento.edtFormaPagamento.Text);
          lVenda.TOTAL := StrToFloat(lblTotal.Caption);
          lVenda.OBS := mmOBS.Text;
          lVenda.DESCONTO := StrToFloat(lblDescontoValor.Caption);

          while not(dtmConexao.tblVenda.eof) do
          begin

            lItemVenda.ID := StrToInt(edtIDVenda.Text);
            lItemVenda.EMISSAO := StrToInt(edtIDVenda.Text);
            lItemVenda.VENDA := StrToInt(edtIDVenda.Text);
            lItemVenda.PRODUTO := dtmConexao.tblVenda.FieldByName('PRODUTO')
              .asinteger;
            lItemVenda.QUANTIDADE := dtmConexao.tblVenda.FieldByName
              ('QUANTIDADE').AsFloat;
            lItemVenda.VALOR := dtmConexao.tblVenda.FieldByName
              ('VALOR').AsFloat;
            lItemVenda.DESCONTO := dtmConexao.tblVenda.FieldByName
              ('DESCONTO').AsFloat;
            lVenda.AdicionarItemVenda(lItemVenda);
            dtmConexao.tblVenda.Next;
          end;
          lVenda.Incluir(true);
          LimparVenda;
        end;
    end;
  finally
    lfrmFormaPagamento.Free;
    lVenda.Free;
  end;


end;

procedure TfrmVenda.btnConfirmarProdutoClick(Sender: TObject);
  function ValidaCamposVazio: Boolean;
  begin
    if (edtProduto.Text = EmptyStr) AND (edtQuantidade.Text = EmptyStr) AND
      (edtValor.Text = EmptyStr) AND (edtDesconto.Text = EmptyStr) then
    begin
      result := true;
    end
    else
    begin
      result := false;
    end;

  end;

begin
  if (dtmConexao.tblVenda.recordcount > 0) AND (ValidaCamposVazio) then
  begin
    edtDescontoValor.SetFocus;
  end
  else
  begin
    if (trim(edtProduto.Text) = EmptyStr) AND
      (dtmConexao.tblVenda.recordcount = 0) then
    begin
      ShowMessage('O Produto n�o pode ser vazio.');
      edtProduto.SetFocus;
    end
    else if (trim(edtQuantidade.Text) = EmptyStr) AND
      (dtmConexao.tblVenda.recordcount = 0) then
    begin
      ShowMessage('A Quantidade n�o pode ser vazio.');
      edtQuantidade.SetFocus;
    end
    else if (trim(edtDesconto.Text) = EmptyStr) AND
      (dtmConexao.tblVenda.recordcount = 0) then
    begin
      ShowMessage('O Desconto n�o pode ser vazio.');
      edtDesconto.SetFocus;
    end
    else if (trim(edtValor.Text) = EmptyStr) AND
      (dtmConexao.tblVenda.recordcount = 0) then
    begin
      ShowMessage('O Valor do Produto n�o pode ser vazio.');
      edtValor.SetFocus;
    end
    else if (trim(edtValorTotal.Text) = EmptyStr) AND
      (dtmConexao.tblVenda.recordcount = 0) then
    begin
      ShowMessage('O Valor do Total do Produto n�o pode ser vazio.');
      edtValorTotal.SetFocus;
    end
    else
    begin
      dtmConexao.tblVenda.open;
      dtmConexao.tblVenda.Append;
      dtmConexao.tblVenda.FieldByName('PRODUTO').asinteger :=
        strtointdef(edtProduto.Text, 0);
      dtmConexao.tblVenda.FieldByName('DESCRICAO').AsString :=
        lblNomeProduto.Caption;
      dtmConexao.tblVenda.FieldByName('QUANTIDADE').AsFloat :=
        strtofloatdef(edtQuantidade.Text, 0);
      dtmConexao.tblVenda.FieldByName('VALOR').AsFloat :=
        strtofloatdef(edtValor.Text, 0);
      dtmConexao.tblVenda.FieldByName('DESCONTO').AsFloat :=
        strtofloatdef(edtDesconto.Text, 0);
      dtmConexao.tblVenda.FieldByName('TOTAL').AsFloat :=
        strtofloatdef(edtValorTotal.Text, 0);
      dtmConexao.tblVenda.Post;

      lblSubTotalValor.Caption := formatfloat('#,##0.00',
        strtofloatdef(lblSubTotalValor.Caption, 0) +
        strtofloatdef(edtValorTotal.Text, 0));
      lblTotal.Caption := formatfloat('#,##0.00',
        strtofloatdef(lblTotal.Caption, 0) +
        strtofloatdef(edtValorTotal.Text, 0));

      lblQuantidadeItensVenda.Caption :=
        IntToStr(dtmConexao.tblVenda.recordcount);

      LimparEditsProdutos;
      edtProduto.SetFocus;
    end;
  end;
end;

procedure TfrmVenda.btnExcluirProdutoClick(Sender: TObject);
begin
  if dtmConexao.tblVenda.recordcount > 0 then
  begin
    if Application.MessageBox
      ('Tem certeza que deseja excluir o registro selecionado?', 'Confirma��o',
      mb_yesNO + mb_iconQuestion + MB_DEFBUTTON2) = idYes then
    begin
      lblSubTotalValor.Caption := formatfloat('#,##0.00',
        strtofloatdef(lblSubTotalValor.Caption, 0) -
        dtmConexao.tblvendaTOTAL.AsFloat);
      dtmConexao.tblVenda.delete;
      lblQuantidadeItensVenda.Caption :=
        IntToStr(dtmConexao.tblVenda.recordcount);
    end;
  end
  else
  begin
    ShowMessage('N�o h� registros na tabela.');
  end;

end;

procedure TfrmVenda.btnBuscaProdutoClick(Sender: TObject);
var
  lfrmConsultaProdutos: TfrmConsultaProdutos;
  lValor: double;
begin
  lfrmConsultaProdutos := TfrmConsultaProdutos.Create(nil);
  try
    lfrmConsultaProdutos.ShowModal;
    edtProduto.Text := lfrmConsultaProdutos.dbgConsultaProduto.DataSource.
      DataSet.FieldByName('ID').AsString;
    lblNomeProduto.Caption := lfrmConsultaProdutos.dbgConsultaProduto.
      DataSource.DataSet.FieldByName('DESCRICAO').AsString;
    lValor := lfrmConsultaProdutos.dbgConsultaProduto.DataSource.DataSet.
      FieldByName('PRECO').AsFloat;
    edtValor.Text := formatfloat('#,##0.00', lValor);
    edtQuantidade.Text := formatfloat('#,##0.00', 1);
    edtDesconto.Text := formatfloat('#,##0.00', 0);
    edtValorTotal.Text := formatfloat('#,##0.00', lValor);
    edtProduto.SetFocus;
  finally
    lfrmConsultaProdutos.Free;
  end;
end;

procedure TfrmVenda.btnBuscaVendedorClick(Sender: TObject);
var
  lfrmConsultaVendedores: TfrmConsultaVendedores;
begin
  lfrmConsultaVendedores := TfrmConsultaVendedores.Create(nil);
  try
    lfrmConsultaVendedores.ShowModal;
    edtCliente.Text := lfrmConsultaVendedores.dbgConsultaVendedor.DataSource.
      DataSet.FieldByName('IDVENDEDOR').AsString;
    lblNomeVendedor.Caption := lfrmConsultaVendedores.dbgConsultaVendedor.
      DataSource.DataSet.FieldByName('NOMEVENDEDOR').AsString;
    edtVendedor.SetFocus;
  finally
    lfrmConsultaVendedores.Free;
  end;
end;

procedure TfrmVenda.CalculaTotalProduto;
var
  lQuantidade, lDesconto, lValor, lTotal: double;
begin
  lQuantidade := strtofloatdef(edtQuantidade.Text, 0);
  lValor := strtofloatdef(edtValor.Text, 0);
  lDesconto := strtofloatdef(edtDesconto.Text, 0);
  lDesconto := lDesconto / 100;
  lDesconto := lDesconto * (lQuantidade * lValor);
  lTotal := (lQuantidade * lValor) - lDesconto;
  edtValorTotal.Text := formatfloat('#,##0.00', lTotal);
end;

procedure TfrmVenda.CarregaNomeCliente;
begin
  if (trim(edtCliente.Text) <> EmptyStr) AND not(btnBuscaCliente.Focused) then
  begin
    if Tcliente.Existe(StrToInt(edtCliente.Text)) then
    begin
      lblNomeCliente.Caption := Tcliente.ObjetoBusca.NOME;
    end
    else
    begin
      ShowMessage('Cliente n�o cadastrado.');
      edtCliente.Text := EmptyStr;
      edtCliente.SetFocus;
    end
  end;
end;

procedure TfrmVenda.CarregaNomeProduto;
begin
  if (trim(edtProduto.Text) <> EmptyStr) AND not(btnBuscaProduto.Focused) then
  begin
    if TProduto.Existe(StrToInt(edtProduto.Text)) then
    begin
      lblNomeProduto.Caption := TProduto.ObjetoBusca.DESCRICAO;
    end
    else
    begin
      ShowMessage('Produto n�o cadastrado.');
      edtProduto.Text := EmptyStr;
      edtProduto.SetFocus;
    end
  end;
end;

procedure TfrmVenda.CarregaNomeVendedor;
begin
  if (trim(edtVendedor.Text) <> EmptyStr) AND not(btnBuscaVendedor.Focused) then
  begin
    if TVendedor.Existe(StrToInt(edtVendedor.Text)) then
    begin
      lblNomeVendedor.Caption := TVendedor.ObjetoBusca.NOMEVENDEDOR;
      edtProduto.SetFocus;
    end
    else
    begin
      ShowMessage('Vendedor n�o cadastrado.');
      edtVendedor.Text := EmptyStr;
      edtVendedor.SetFocus;
    end
  end;
end;

procedure TfrmVenda.CarregaPrecoProduto;
var
  lValor: double;
begin
  if (trim(edtProduto.Text) <> EmptyStr) AND not(btnBuscaProduto.Focused) then
  begin
    if TProduto.Existe(StrToInt(edtProduto.Text)) then
    begin
      lValor := TProduto.ObjetoBusca.PRECO;
      edtValor.Text := formatfloat('#,##0.00', lValor);
      edtQuantidade.Text := formatfloat('#,##0.00', 1);
      edtDesconto.Text := formatfloat('#,##0.00', 0);
      edtValorTotal.Text := formatfloat('#,##0.00', lValor);
      CalculaTotalProduto;
      edtQuantidade.SetFocus;
    end
    else
    begin
      ShowMessage('Pre�o n�o cadastrado.');
      edtProduto.Text := EmptyStr;
      edtProduto.SetFocus;
    end
  end;
end;

procedure TfrmVenda.edtClienteExit(Sender: TObject);
begin
  CarregaNomeCliente;
end;

procedure TfrmVenda.edtDescontoExit(Sender: TObject);
begin
  CalculaTotalProduto;
  btnConfirmarProduto.SetFocus;
end;

procedure TfrmVenda.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVenda.edtDescontoPorcentualExit(Sender: TObject);
var
  lDesconto, lTotal, lValorDesconto: double;
begin
  if trim(edtDescontoPorcentual.Text) <> '' then
  begin
    if (StrToFloat(edtDescontoPorcentual.Text) <= 100) then
    begin
      lDesconto := strtofloatdef(edtDescontoPorcentual.Text, 0);
      lDesconto := lDesconto / 100;
      lDesconto := lDesconto * strtofloatdef(lblSubTotalValor.Caption, 0);

      lTotal := strtofloatdef(lblSubTotalValor.Caption, 0) - lDesconto;
      edtDescontoValor.Text :=
        floattostr(strtofloatdef(lblSubTotalValor.Caption, 0) - lTotal);
      lValorDesconto := StrToFloat(edtDescontoValor.Text);

      edtDescontoValor.Text := formatfloat('#,##0.00', lValorDesconto);
      lblTotal.Caption := formatfloat('#,##0.00', lTotal);
      lblDescontoValor.Caption := formatfloat('#,##0.00', lValorDesconto);
      mmOBS.SetFocus;
    end
    else
    begin
      ShowMessage('Porcentual do desconto n�o pode ser maior que o Sub-Total.');
      edtDescontoPorcentual.SetFocus;
    end;
  end;
  mmOBS.SetFocus;
end;

procedure TfrmVenda.edtDescontoValorExit(Sender: TObject);
var
  lDescontoPerc, lTotal, lDescontoValor: double;
begin
  if trim(edtDescontoValor.Text) <> '' then
  begin
    if StrToFloat(edtDescontoValor.Text) <= StrToFloat(lblSubTotalValor.Caption)
    then
    begin
      lDescontoValor := strtofloatdef(edtDescontoValor.Text, 0);
      lDescontoPerc := lDescontoValor /
        strtofloatdef(lblSubTotalValor.Caption, 0) * 100;
      edtDescontoPorcentual.Text := formatfloat('#,##0.00', lDescontoPerc);

      lTotal := strtofloatdef(lblSubTotalValor.Caption, 0) - lDescontoValor;
      lblTotal.Caption := formatfloat('#,##0.00', lTotal);
      lblDescontoValor.Caption := formatfloat('#,##0.00', lDescontoValor);
    end
    else
    begin
      ShowMessage('Valor do desconto n�o pode ser maior que o Sub-Total.');
      edtDescontoValor.SetFocus;
    end;
  end;

end;

procedure TfrmVenda.edtProdutoExit(Sender: TObject);
begin
  CarregaNomeProduto;
  CarregaPrecoProduto;
end;

procedure TfrmVenda.edtQuantidadeExit(Sender: TObject);
begin
  CalculaTotalProduto;
end;

procedure TfrmVenda.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVenda.edtValorExit(Sender: TObject);
begin
  CalculaTotalProduto;
end;

procedure TfrmVenda.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '.', #8]) then
    Key := #0;
  if Key in ['.'] then
    Key := #44;
end;

procedure TfrmVenda.edtVendedorExit(Sender: TObject);
begin
  CarregaNomeVendedor;
end;

procedure TfrmVenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
begin
  dtmConexao.tblVenda.open;
  dtmConexao.tblVenda.EmptyDataSet;
  WindowState := wsMaximized;
  edtCliente.SetFocus;
  lblNomeCliente.Caption := EmptyStr;
  lblNomeVendedor.Caption := EmptyStr;
  lblNomeProduto.Caption := EmptyStr;
end;

procedure TfrmVenda.IncluirVenda;
var
  lVenda: Tvenda;
begin

end;

procedure TfrmVenda.LimparEditsProdutos;
begin
  edtProduto.Clear;
  edtValor.Clear;
  edtDesconto.Clear;
  edtQuantidade.Clear;
  edtValorTotal.Clear;
  lblNomeProduto.Caption := EmptyStr;
end;

procedure TfrmVenda.LimparVenda;
begin

  edtCliente.Clear;
  lblNomeCliente.Caption := EmptyStr;
  edtVendedor.Clear;
  lblNomeVendedor.Caption := EmptyStr;
  dtmConexao.tblVenda.EmptyDataSet;
  edtDescontoValor.Clear;
  edtDescontoPorcentual.Clear;
  mmOBS.Clear;
  edtIDVenda.Text := Tvenda.GeraProximoID.ToString;
  lblSubTotalValor.Caption := '0,00';
  lblDescontoValor.Caption := '0,00';
  lblTotal.Caption := '0,00';
  lblQuantidadeItensVenda.Caption := '0';
  edtCliente.SetFocus;

end;

procedure TfrmVenda.mmOBSExit(Sender: TObject);
begin
  btnConfirmar.SetFocus;
end;

end.
