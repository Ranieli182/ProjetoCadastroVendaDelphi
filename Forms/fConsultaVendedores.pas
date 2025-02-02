unit fConsultaVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, dConexao, fCadastroVendedores, uVendedor;

type
  TfrmConsultaVendedores = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgConsultaVendedor: TDBGrid;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnVisualizar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtPerquisarVendedor: TEdit;
    cbxFiltroVendedor: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPerquisarVendedorChange(Sender: TObject);
    procedure cbxFiltroVendedorChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarQueryVendedor;
    procedure BuscarDadosVendedor;
    procedure ValidaSeUsuarioEstaLiberado(pNivelAcesso: integer);
  end;

var
  frmConsultaVendedores: TfrmConsultaVendedores;

implementation

{$R *.dfm}

procedure TfrmConsultaVendedores.AtualizarQueryVendedor;
begin
  dtmConexao.qryConsultaVendedores.close;
  dtmConexao.qryConsultaVendedores.SQL.Clear;
  dtmConexao.qryConsultaVendedores.SQL.add('SELECT * FROM VENDEDOR');
  if edtPerquisarVendedor.Text <> emptyStr then
  begin
    case cbxFiltroVendedor.ItemIndex of
      0:
        begin
          dtmConexao.qryConsultaVendedores.SQL.add('WHERE IDVENDEDOR LIKE ' +
            QuotedStr('%' + edtPerquisarVendedor.Text + '%'));
        end;
      1:
        begin
          dtmConexao.qryConsultaVendedores.SQL.add('WHERE NOMEVENDEDOR LIKE ' +
            QuotedStr('%' + edtPerquisarVendedor.Text + '%'));
        end;
    end;
  end;
  dtmConexao.qryConsultaVendedores.Open;
end;

procedure TfrmConsultaVendedores.btnAlterarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaVendedores.RecordCount > 0 then
  begin
    BuscarDadosVendedor;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;
end;

procedure TfrmConsultaVendedores.btnExcluirClick(Sender: TObject);
var
  lVendedor: Tvendedor;
begin
  if dtmConexao.qryConsultaVendedores.RecordCount > 0 then
  begin
    if Application.MessageBox
      ('Tem certeza que deseja excluir o registro selecionado?', 'Confirma��o',
      mb_yesNO + mb_iconQuestion + MB_DEFBUTTON2) = idYes then
      if dtmConexao.qryVendedores.State in [dsBrowse] then
      begin
        try
          lVendedor := Tvendedor.Create;
          try
            lVendedor.IDVENDEDOR := dtmConexao.qryConsultaVendedores.FieldByName
              ('IDVENDEDOR').asinteger;
            lVendedor.Excluir(true);
          finally
            frmConsultaVendedores.Refresh;
            AtualizarQueryVendedor;
          end;
        finally
          lVendedor.Free;
        end;
      end;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;

end;

procedure TfrmConsultaVendedores.btnIncluirClick(Sender: TObject);
var
  lFormulario: TfrmCadastroVendedores;
  lVendedor: Tvendedor;
begin
  lFormulario := TfrmCadastroVendedores.Create(nil);
  lVendedor := Tvendedor.Create;
  try
    lFormulario.Tipo := 'Incluir';
    lFormulario.edtCodigoVendedor.Enabled := false;
    lFormulario.edtCodigoVendedor.Text := lVendedor.MostraProximoID.ToString;
    lFormulario.ShowModal;
    AtualizarQueryVendedor;
  finally
    lFormulario.Free;
    lVendedor.Free;
  end;
end;

procedure TfrmConsultaVendedores.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaVendedores.btnVisualizarClick(Sender: TObject);
var
  lFormulario: TfrmCadastroVendedores;
  lVendedor: Tvendedor;
begin
  if dtmConexao.qryConsultaVendedores.RecordCount > 0 then
  begin
    lVendedor := Tvendedor.Create;
    lFormulario := TfrmCadastroVendedores.Create(nil);
    try
      lVendedor.IDVENDEDOR := dtmConexao.qryConsultaVendedores.FieldByName
        ('IDVENDEDOR').asinteger;
      lVendedor.Carrega;
      lFormulario.edtCodigoVendedor.Text := IntToStr(lVendedor.IDVENDEDOR);
      lFormulario.edtNome.Text := lVendedor.NOMEVENDEDOR;
      lFormulario.edtEmail.Text := lVendedor.EMAIL;
      lFormulario.edtEndereco.Text := lVendedor.ENDERECO;
      lFormulario.edtBairro.Text := lVendedor.BAIRRO;
      lFormulario.edtCEP.Text := lVendedor.CEP;
      lFormulario.edtCidade.Text := lVendedor.CIDADE;
      lFormulario.btnSalvar.Enabled := false;
      lFormulario.edtCodigoVendedor.Enabled := false;
      lFormulario.ShowModal;
      AtualizarQueryVendedor;
    finally
      lFormulario.Free;
      lVendedor.Free;
    end;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;

end;

procedure TfrmConsultaVendedores.BuscarDadosVendedor;
var
  lFormulario: TfrmCadastroVendedores;
  lVendedor: Tvendedor;
begin
  lVendedor := Tvendedor.Create;
  lFormulario := TfrmCadastroVendedores.Create(nil);
  try
    lFormulario.Tipo := 'Alterar';
    lFormulario.CodigoVendedor := 0;
    lVendedor.IDVENDEDOR := dtmConexao.qryConsultaVendedores.FieldByName
      ('IDVENDEDOR').asinteger;
    lFormulario.CodigoVendedor := lVendedor.IDVENDEDOR;
    lVendedor.Carrega;
    lFormulario.edtCodigoVendedor.Text := IntToStr(lVendedor.IDVENDEDOR);
    lFormulario.edtNome.Text := lVendedor.NOMEVENDEDOR;
    lFormulario.edtEmail.Text := lVendedor.EMAIL;
    lFormulario.edtEndereco.Text := lVendedor.ENDERECO;
    lFormulario.edtBairro.Text := lVendedor.BAIRRO;
    lFormulario.edtCEP.Text := lVendedor.CEP;
    lFormulario.edtCidade.Text := lVendedor.CIDADE;
    lFormulario.edtCodigoVendedor.Enabled := false;
    lFormulario.ShowModal;
    AtualizarQueryVendedor;
  finally
    lFormulario.Free;
    lVendedor.Free;
  end;

end;

procedure TfrmConsultaVendedores.cbxFiltroVendedorChange(Sender: TObject);
begin
  case cbxFiltroVendedor.ItemIndex of
    0:
      begin
        edtPerquisarVendedor.NumbersOnly := true;
        edtPerquisarVendedor.Clear;
      end;
    1:
      begin
        edtPerquisarVendedor.NumbersOnly := false;
        edtPerquisarVendedor.Clear;
      end;
  end;
end;

procedure TfrmConsultaVendedores.edtPerquisarVendedorChange(Sender: TObject);
begin
  AtualizarQueryVendedor;
end;

procedure TfrmConsultaVendedores.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  AtualizarQueryVendedor;
end;

procedure TfrmConsultaVendedores.ValidaSeUsuarioEstaLiberado
  (pNivelAcesso: integer);
begin
  if pNivelAcesso < 90 then
  begin
    btnIncluir.Enabled := false;
    btnExcluir.Enabled := false;
    btnAlterar.Enabled := false;
  end;
end;

end.
