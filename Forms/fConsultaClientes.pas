unit fConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, dConexao, fCadastroClientes, uCliente,
  fRLClienteFortes, fRelatorioClientes;

type
  TfrmConsultaClientes = class(TForm)
    Panel1: TPanel;
    dbgConsultaCliente: TDBGrid;
    Panel2: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtPesquisarCliente: TEdit;
    btnVisualizar: TButton;
    cbxFiltroCliente: TComboBox;
    btnRelatorioCliente: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtPesquisarClienteChange(Sender: TObject);
    procedure cbxFiltroClienteChange(Sender: TObject);
    procedure btnRelatorioClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarQueryCliente;
    procedure BuscarDadosCliente;
    procedure ValidaSeUsuarioEstaLiberado(pNivelAcesso: Integer);
  end;

var
  frmConsultaClientes: TfrmConsultaClientes;

implementation

{$R *.dfm}

procedure TfrmConsultaClientes.btnAlterarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaClientes.RecordCount > 0 then
  begin
    BuscarDadosCliente;
  end
  else
  begin
    ShowMessage('Não há registro selecionado.');
  end;
end;

procedure TfrmConsultaClientes.btnExcluirClick(Sender: TObject);
var
  lCliente: Tcliente;
begin
  if dtmConexao.qryConsultaClientes.RecordCount > 0 then
  begin
    if Application.MessageBox
      ('Tem certeza que deseja excluir o registro selecionado?', 'Confirmação',
      mb_yesNO + mb_iconQuestion + MB_DEFBUTTON2) = idYes then
      begin
          lCliente := Tcliente.Create;
          try
            lCliente.ID := dtmConexao.qryConsultaClientesID.asinteger;
            lCliente.Excluir(true);
            AtualizarQueryCliente;
            frmConsultaClientes.Refresh;
          finally
            lCliente.Free;
          end;
      end;
  end
  else
  begin
    ShowMessage('Não há registro selecionado.');
  end;

end;

procedure TfrmConsultaClientes.btnIncluirClick(Sender: TObject);
var
  lFormulario: TfrmCadastroClientes;
  lCliente: Tcliente;
begin
  lFormulario := TfrmCadastroClientes.Create(nil);
  lCliente := Tcliente.Create;
  try
    lFormulario.Tipo := 'Incluir';
    lFormulario.rdgTipo.ItemIndex := 0;
    lFormulario.edtCodigoCliente.Enabled := false;
    lFormulario.edtCodigoCliente.Text := lCliente.MostraProximoID.ToString;
    lFormulario.ShowModal;
    AtualizarQueryCliente;
  finally
    lFormulario.Free;
    lCliente.Free;
  end;
end;

procedure TfrmConsultaClientes.btnRelatorioClienteClick(Sender: TObject);
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

procedure TfrmConsultaClientes.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaClientes.btnVisualizarClick(Sender: TObject);
var
  lFormulario: TfrmCadastroClientes;
  lCliente: Tcliente;
begin
  if dtmConexao.qryConsultaClientes.RecordCount > 0 then
  begin
    lCliente := Tcliente.Create;
    lFormulario := TfrmCadastroClientes.Create(nil);
    try
      lCliente.ID := dtmConexao.qryConsultaClientes.FieldByName('ID').asinteger;
      lCliente.Carrega;
      lFormulario.edtCodigoCliente.Text := IntToStr(lCliente.ID);
      lFormulario.edtNomeCliente.Text := lCliente.NOME;
      lFormulario.edtEndereco.Text := lCliente.ENDERECO;
      lFormulario.edtCidade.Text := lCliente.CIDADE;
      lFormulario.edtTelefone.Text := lCliente.TELEFONE;
      lFormulario.edtEMAIL.Text := lCliente.EMAIL;
      lFormulario.edtCPF.Text := lCliente.CPF;
      lFormulario.edtCNPJ.Text := lCliente.CNPJ;
      lFormulario.edtCEP.Text := lCliente.CEP;
      lFormulario.edtBairro.Text := lCliente.BAIRRO;

      if dtmConexao.qryConsultaClientes.FieldByName('TIPO').AsString = 'F' then
      begin
        lFormulario.rdgTipo.ItemIndex := 0;
      end
      else if dtmConexao.qryConsultaClientes.FieldByName('TIPO').AsString = 'J'
      then
      begin
        lFormulario.rdgTipo.ItemIndex := 1;
      end;
      lFormulario.btnSalvar.Enabled := false;
      lFormulario.ShowModal;
      AtualizarQueryCliente;
    finally
      lFormulario.Free;
      lCliente.Free;
    end;
  end
  else
  begin
    ShowMessage('Não há registro selecionado.');
  end;

end;

procedure TfrmConsultaClientes.BuscarDadosCliente;
var
  lFormulario: TfrmCadastroClientes;
  lCliente: Tcliente;
begin
  lCliente := Tcliente.Create;
  lFormulario := TfrmCadastroClientes.Create(nil);
  try
    lFormulario.Tipo := 'Alterar';
    lFormulario.CodigoCliente := 0;
    lCliente.ID := dtmConexao.qryConsultaClientes.FieldByName('ID').asinteger;
    lFormulario.CodigoCliente := lCliente.ID;
    lCliente.Carrega;
    lFormulario.edtCodigoCliente.Text := IntToStr(lCliente.ID);
    lFormulario.edtNomeCliente.Text := lCliente.NOME;
    lFormulario.edtEndereco.Text := lCliente.ENDERECO;
    lFormulario.edtCidade.Text := lCliente.CIDADE;
    lFormulario.edtTelefone.Text := lCliente.TELEFONE;
    lFormulario.edtEMAIL.Text := lCliente.EMAIL;
    lFormulario.edtCPF.Text := lCliente.CPF;
    lFormulario.edtCNPJ.Text := lCliente.CNPJ;
    lFormulario.edtCEP.Text := lCliente.CEP;
    lFormulario.edtBairro.Text := lCliente.BAIRRO;

    if dtmConexao.qryConsultaClientes.FieldByName('TIPO').AsString = 'F' then
    begin
      lFormulario.rdgTipo.ItemIndex := 0;
    end
    else if dtmConexao.qryConsultaClientes.FieldByName('TIPO').AsString = 'J'
    then
    begin
      lFormulario.rdgTipo.ItemIndex := 1;
    end;
    lFormulario.edtCodigoCliente.Enabled := false;
    lFormulario.ShowModal;
    AtualizarQueryCliente;
  finally
    lFormulario.Free;
    lCliente.Free;
  end;

end;

procedure TfrmConsultaClientes.cbxFiltroClienteChange(Sender: TObject);
begin
  case cbxFiltroCliente.ItemIndex of
    0:
      begin
        edtPesquisarCliente.NumbersOnly := true;
        edtPesquisarCliente.Clear;
      end;
    1:
      begin
        edtPesquisarCliente.NumbersOnly := false;
        edtPesquisarCliente.Clear;
      end;
  end;
end;

procedure TfrmConsultaClientes.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  AtualizarQueryCliente;
end;

procedure TfrmConsultaClientes.ValidaSeUsuarioEstaLiberado
  (pNivelAcesso: Integer);
begin
  if pNivelAcesso < 90 then
  begin
    btnIncluir.Enabled := false;
    btnExcluir.Enabled := false;
    btnAlterar.Enabled := false;
  end;
end;

procedure TfrmConsultaClientes.AtualizarQueryCliente;
begin
  dtmConexao.qryConsultaClientes.close;
  dtmConexao.qryConsultaClientes.SQL.Clear;
  dtmConexao.qryConsultaClientes.SQL.add('SELECT * FROM CLIENTE');
  if edtPesquisarCliente.Text <> emptyStr then
  begin
    case cbxFiltroCliente.ItemIndex of
      0:
        begin
          dtmConexao.qryConsultaClientes.SQL.add
            ('WHERE ID LIKE ' + QuotedStr('%' +
            edtPesquisarCliente.Text + '%'));
        end;
      1:
        begin
          dtmConexao.qryConsultaClientes.SQL.add('WHERE NOME LIKE ' +
            QuotedStr('%' + edtPesquisarCliente.Text + '%'));
        end;
    end;
  end;
  dtmConexao.qryConsultaClientes.Open;

end;

procedure TfrmConsultaClientes.edtPesquisarClienteChange(Sender: TObject);
begin
  AtualizarQueryCliente;
end;

end.
