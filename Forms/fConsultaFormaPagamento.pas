unit fConsultaFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, dConexao, uFormaPagamento,
  fCadastroFormaPagamento;

type
  TfrmConsultaFormaPagamento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgConsultaFormaPagamento: TDBGrid;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnVisualizar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtpesquisaFormaPagamento: TEdit;
    cbxFiltroFormaPagamento: TComboBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtpesquisaFormaPagamentoChange(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cbxFiltroFormaPagamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarQueryFormaPagamento;
    procedure BuscarDadosFormaPagamento;
    procedure ValidaSeUsuarioEstaLiberado(pNivelAcesso: Integer);
  end;

var
  frmConsultaFormaPagamento: TfrmConsultaFormaPagamento;

implementation

{$R *.dfm}

procedure TfrmConsultaFormaPagamento.AtualizarQueryFormaPagamento;
begin
  dtmConexao.qryContultaFormaPagamento.close;
  dtmConexao.qryContultaFormaPagamento.SQL.Clear;
  dtmConexao.qryContultaFormaPagamento.SQL.add('SELECT * FROM FORMAPAGAMENTO');
  if edtpesquisaFormaPagamento.Text <> emptyStr then
  begin
    case cbxFiltroFormaPagamento.ItemIndex of
      0:
        begin
          dtmConexao.qryContultaFormaPagamento.SQL.add
            ('WHERE IDFORMAPAGAMENTO LIKE ' +
            QuotedStr('%' + edtpesquisaFormaPagamento.Text + '%'));
        end;
      1:
        begin
          dtmConexao.qryContultaFormaPagamento.SQL.add('WHERE DESCRICAO LIKE ' +
            QuotedStr('%' + edtpesquisaFormaPagamento.Text + '%'));
        end;
    end;
  end;
  dtmConexao.qryContultaFormaPagamento.Open;
end;

procedure TfrmConsultaFormaPagamento.btnAlterarClick(Sender: TObject);
begin
  if dtmConexao.qryContultaFormaPagamento.RecordCount > 0 then
  begin
    BuscarDadosFormaPagamento;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;

end;

procedure TfrmConsultaFormaPagamento.btnExcluirClick(Sender: TObject);
var
  lFormaPagamento: Tformapagamento;
begin
  if dtmConexao.qryContultaFormaPagamento.RecordCount > 0 then
  begin
    if Application.MessageBox
      ('Tem certeza que deseja excluir o registro selecionado?', 'Confirma��o',
      mb_yesNO + mb_iconQuestion + MB_DEFBUTTON2) = idYes then
      if dtmConexao.qryFormaPagamento.State in [dsBrowse] then
      begin
        try
          lFormaPagamento := Tformapagamento.Create;
          try
            lFormaPagamento.IDFORMAPAGAMENTO :=
              dtmConexao.qryContultaFormaPagamento.FieldByName
              ('IDFORMAPAGAMENTO').asinteger;
            lFormaPagamento.Excluir(true);
          finally
            frmConsultaFormaPagamento.Refresh;
            AtualizarQueryFormaPagamento;
          end;
        finally
          lFormaPagamento.Free;
        end;
      end;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;
end;

procedure TfrmConsultaFormaPagamento.btnIncluirClick(Sender: TObject);
var
  lFormulario: TfrmCadastroFormaPagamento;
  lFormaPagamento: Tformapagamento;
begin
  lFormulario := TfrmCadastroFormaPagamento.Create(nil);
  lFormaPagamento := Tformapagamento.Create;
  try
    lFormulario.Tipo := 'Incluir';
    lFormulario.rdgTipo.ItemIndex := 0;
    lFormulario.edtCodigoFormaPagamento.Text :=
      lFormaPagamento.MostraProximoID.ToString;
    lFormulario.edtCodigoFormaPagamento.Enabled := false;
    lFormulario.ShowModal;
    AtualizarQueryFormaPagamento;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmConsultaFormaPagamento.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaFormaPagamento.btnVisualizarClick(Sender: TObject);
var
  lFormulario: TfrmCadastroFormaPagamento;
  lFormaPagamento: Tformapagamento;
begin
  if dtmConexao.qryContultaFormaPagamento.RecordCount > 0 then
  begin
    lFormaPagamento := Tformapagamento.Create;
    lFormulario := TfrmCadastroFormaPagamento.Create(nil);
    try
      lFormulario.Tipo := 'Alterar';
      lFormulario.CodigoFormaPagamento := 0;
      lFormaPagamento.IDFORMAPAGAMENTO :=
        dtmConexao.qryContultaFormaPagamento.FieldByName('IDFORMAPAGAMENTO')
        .asinteger;
      lFormulario.CodigoFormaPagamento := lFormaPagamento.IDFORMAPAGAMENTO;
      lFormaPagamento.Carrega;
      lFormulario.edtCodigoFormaPagamento.Text :=
        IntToStr(lFormulario.CodigoFormaPagamento);
      lFormulario.edtDescricao.Text := lFormaPagamento.DESCRICAO;

      if dtmConexao.qryContultaFormaPagamento.FieldByName('TIPO').AsString = 'S'
      then
      begin
        lFormulario.rdgTipo.ItemIndex := 0;
      end
      else if dtmConexao.qryContultaFormaPagamento.FieldByName('TIPO')
        .AsString = 'E' then
      begin
        lFormulario.rdgTipo.ItemIndex := 1;
      end;
      lFormulario.btnSalvar.Enabled := false;
      lFormulario.ShowModal;
      AtualizarQueryFormaPagamento;
    finally
      lFormulario.Free;
      lFormaPagamento.Free;
    end;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.')
  end;

end;

procedure TfrmConsultaFormaPagamento.BuscarDadosFormaPagamento;
var
  lFormulario: TfrmCadastroFormaPagamento;
  lFormaPagamento: Tformapagamento;
begin
  lFormaPagamento := Tformapagamento.Create;
  lFormulario := TfrmCadastroFormaPagamento.Create(nil);
  try
    lFormulario.Tipo := 'Alterar';
    lFormulario.CodigoFormaPagamento := 0;
    lFormaPagamento.IDFORMAPAGAMENTO :=
      dtmConexao.qryContultaFormaPagamento.FieldByName('IDFORMAPAGAMENTO')
      .asinteger;
    lFormulario.CodigoFormaPagamento := lFormaPagamento.IDFORMAPAGAMENTO;
    lFormaPagamento.Carrega;
    lFormulario.edtCodigoFormaPagamento.Text :=
      IntToStr(lFormulario.CodigoFormaPagamento);
    lFormulario.edtDescricao.Text := lFormaPagamento.DESCRICAO;

    if dtmConexao.qryContultaFormaPagamento.FieldByName('TIPO').AsString = 'S'
    then
    begin
      lFormulario.rdgTipo.ItemIndex := 0;
    end
    else if dtmConexao.qryContultaFormaPagamento.FieldByName('TIPO').AsString = 'E'
    then
    begin
      lFormulario.rdgTipo.ItemIndex := 1;
    end;

    lFormulario.ShowModal;
    AtualizarQueryFormaPagamento;
  finally
    lFormulario.Free;
    lFormaPagamento.Free;
  end;
end;

procedure TfrmConsultaFormaPagamento.cbxFiltroFormaPagamentoChange
  (Sender: TObject);
begin
  case cbxFiltroFormaPagamento.ItemIndex of
    0:
      begin
        edtpesquisaFormaPagamento.NumbersOnly := true;
        edtpesquisaFormaPagamento.Clear;
      end;
    1:
      begin
        edtpesquisaFormaPagamento.NumbersOnly := false;
        edtpesquisaFormaPagamento.Clear;
      end;
  end;
end;

procedure TfrmConsultaFormaPagamento.edtpesquisaFormaPagamentoChange
  (Sender: TObject);
begin
  AtualizarQueryFormaPagamento;
end;

procedure TfrmConsultaFormaPagamento.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  AtualizarQueryFormaPagamento;
end;

procedure TfrmConsultaFormaPagamento.ValidaSeUsuarioEstaLiberado
  (pNivelAcesso: Integer);
begin
  if pNivelAcesso < 90 then
  begin
    btnIncluir.Enabled := false;
    btnExcluir.Enabled := false;
    btnAlterar.Enabled := false;
  end;
end;

end.
