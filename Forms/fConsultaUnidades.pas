unit fConsultaUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, fCadastroUnidades, dConexao, uUnidade;

type
  TfrmConsultaUnidade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgConsultaUnidades: TDBGrid;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnVisualizar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtPesquisarUnidade: TEdit;
    cbxFiltroUnidades: TComboBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisarUnidadeChange(Sender: TObject);
    procedure cbxFiltroUnidadesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarQueryUnidade;
    procedure BuscarDadosUnidade;
    procedure ValidaSeUsuarioEstaLiberado(pNivelAcesso : Integer);
  end;

var
  frmConsultaUnidade: TfrmConsultaUnidade;

implementation

{$R *.dfm}

procedure TfrmConsultaUnidade.btnAlterarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaUnidades.RecordCount > 0 then
  begin
    BuscarDadosUnidade;
  end
  else
  begin
    ShowMessage('Não há registro selecionado.');
  end;
end;

procedure TfrmConsultaUnidade.btnExcluirClick(Sender: TObject);
var
  lUnidade: Tunidade;
begin
  if dtmConexao.qryConsultaUnidades.RecordCount > 0 then
  begin
    if Application.MessageBox
      ('Tem certeza que deseja excluir o registro selecionado?', 'Confirmação',
      mb_yesNO + mb_iconQuestion + MB_DEFBUTTON2) = idYes then
      if dtmConexao.qryClientes.State in [dsBrowse] then
      begin
        lUnidade := Tunidade.Create;
        try
          lUnidade.IDUNIDADE := dtmConexao.qryConsultaUnidades.FieldByName
            ('IDUNIDADE').asinteger;
          lUnidade.Excluir(true);
          AtualizarQueryUnidade;
          frmConsultaUnidade.Refresh;
        finally
          lUnidade.Free;
        end;
      end;
  end
  else
  begin
    ShowMessage('Não há registro selecionado.');
  end;

end;

procedure TfrmConsultaUnidade.btnIncluirClick(Sender: TObject);
var
  lFormulario: TfrmCadastroUnidades;
begin
  lFormulario := TfrmCadastroUnidades.Create(nil);
  try
    lFormulario.Tipo := 'Incluir';
    lFormulario.ShowModal;
    AtualizarQueryUnidade;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmConsultaUnidade.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaUnidade.btnVisualizarClick(Sender: TObject);
var
  lFormulario: TfrmCadastroUnidades;
  lUnidade: Tunidade;
begin
  if dtmConexao.qryConsultaUnidades.RecordCount > 0 then
  begin
    lUnidade := Tunidade.Create;
    lFormulario := TfrmCadastroUnidades.Create(nil);
    try
      lUnidade.IDUNIDADE := dtmConexao.qryConsultaUnidades.FieldByName
        ('IDUNIDADE').asinteger;
      lUnidade.Carrega;
      lFormulario.edtNomeUnidade.Text := lUnidade.NOMEUNIDADE;
      lFormulario.edtUnidade.Text := lUnidade.UNIDADE;
      lFormulario.dtpDataCadastro.Date := lUnidade.DATACADASTROUNIDADE;
      lFormulario.dtpDataCadastro.Enabled := false;
      lFormulario.btnSalvar.Enabled := false;
      lFormulario.ShowModal;
      AtualizarQueryUnidade;
    finally
      lFormulario.Free;
      lUnidade.Free;
    end;
  end
  else
  begin
    ShowMessage('Não há registro selecionado.');
  end;
end;

procedure TfrmConsultaUnidade.BuscarDadosUnidade;
var
  lFormulario: TfrmCadastroUnidades;
  lUnidade: Tunidade;
begin
  lUnidade := Tunidade.Create;
  lFormulario := TfrmCadastroUnidades.Create(nil);
  try
    lFormulario.Tipo := 'Alterar';
    lFormulario.CodigoUnidade := 0;
    lUnidade.IDUNIDADE := dtmConexao.qryConsultaUnidades.FieldByName
      ('IDUNIDADE').asinteger;
    lFormulario.CodigoUnidade := lUnidade.IDUNIDADE;
    lUnidade.Carrega;
    lFormulario.edtNomeUnidade.Text := lUnidade.NOMEUNIDADE;
    lFormulario.edtUnidade.Text := lUnidade.UNIDADE;
    lFormulario.dtpDataCadastro.Date := lUnidade.DATACADASTROUNIDADE;
    lFormulario.dtpDataCadastro.Enabled := false;
    lFormulario.ShowModal;
    AtualizarQueryUnidade;
  finally
    lFormulario.Free;
    lUnidade.Free;
  end;

end;

procedure TfrmConsultaUnidade.cbxFiltroUnidadesChange(Sender: TObject);
begin
  case cbxFiltroUnidades.ItemIndex of
    0:
      begin
        edtPesquisarUnidade.NumbersOnly := true;
        edtPesquisarUnidade.Clear;
      end;
    1:
      begin
        edtPesquisarUnidade.NumbersOnly := false;
        edtPesquisarUnidade.Clear;
      end;
  end;
end;

procedure TfrmConsultaUnidade.edtPesquisarUnidadeChange(Sender: TObject);
begin
  AtualizarQueryUnidade;
end;

procedure TfrmConsultaUnidade.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  AtualizarQueryUnidade;
end;

procedure TfrmConsultaUnidade.ValidaSeUsuarioEstaLiberado(
  pNivelAcesso: Integer);
begin
    if pNivelAcesso < 90 then
    begin
      btnIncluir.Enabled := false;
      btnExcluir.Enabled := false;
      btnAlterar.Enabled := false;
    end;
end;

procedure TfrmConsultaUnidade.AtualizarQueryUnidade;
begin
  dtmConexao.qryConsultaUnidades.close;
  dtmConexao.qryConsultaUnidades.SQL.Clear;
  dtmConexao.qryConsultaUnidades.SQL.add('SELECT * FROM UNIDADES');
  if edtPesquisarUnidade.Text <> emptyStr then
  begin
    case cbxFiltroUnidades.ItemIndex of
      0:
        begin
          dtmConexao.qryConsultaUnidades.SQL.add
            ('WHERE IDUNIDADE LIKE ' + QuotedStr('%' +
            edtPesquisarUnidade.Text + '%'));
        end;
      1:
        begin
          dtmConexao.qryConsultaUnidades.SQL.add('WHERE NOMEUNIDADE LIKE ' +
            QuotedStr('%' + edtPesquisarUnidade.Text + '%'));
        end;
    end;
  end;
  dtmConexao.qryConsultaUnidades.Open;
end;



end.
