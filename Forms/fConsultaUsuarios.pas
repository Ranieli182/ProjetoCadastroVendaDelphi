unit fConsultaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, fCadastroUsuarios, dConexao, uUsuario;

type
  TfrmConsultaUsuarios = class(TForm)
    Panel1: TPanel;
    dgbConsultaUsuarios: TDBGrid;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnVisualizar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtPesquisarUsuario: TEdit;
    cbxFiltroUsuario: TComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisarUsuarioChange(Sender: TObject);
    procedure cbxFiltroUsuarioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarQueryUsuario;
    procedure BuscarDadosUsuario;
    procedure ValidaSeUsuarioEstaLiberado(pNivelAcesso: integer);
  end;

var
  frmConsultaUsuarios: TfrmConsultaUsuarios;

implementation

{$R *.dfm}

procedure TfrmConsultaUsuarios.AtualizarQueryUsuario;
begin
  dtmConexao.qryConsultaUsuarios.close;
  dtmConexao.qryConsultaUsuarios.SQL.Clear;
  dtmConexao.qryConsultaUsuarios.SQL.add('SELECT * FROM USUARIOS');
  if edtPesquisarUsuario.Text <> emptyStr then
  begin
    case cbxFiltroUsuario.ItemIndex of
      0:
        begin
          dtmConexao.qryConsultaUsuarios.SQL.add('WHERE IDUSUARIO LIKE ' +
            QuotedStr('%' + edtPesquisarUsuario.Text + '%'));
        end;
      1:
        begin
          dtmConexao.qryConsultaUsuarios.SQL.add('WHERE NOMEUSUARIO LIKE ' +
            QuotedStr('%' + edtPesquisarUsuario.Text + '%'));
        end;
    end;
  end;
  dtmConexao.qryConsultaUsuarios.Open;
end;

procedure TfrmConsultaUsuarios.btnAlterarClick(Sender: TObject);
begin
  if dtmConexao.qryConsultaUsuarios.RecordCount > 0 then
  begin
    BuscarDadosUsuario;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;

end;

procedure TfrmConsultaUsuarios.btnExcluirClick(Sender: TObject);
var
  lUsuario: Tusuario;
begin
  if dtmConexao.qryConsultaUsuarios.RecordCount > 0 then
  begin
    if Application.MessageBox
      ('Tem certeza que deseja excluir o registro selecionado?', 'Confirma��o',
      mb_yesNO + mb_iconQuestion + MB_DEFBUTTON2) = idYes then
      if dtmConexao.qryUsuarios.State in [dsBrowse] then
      begin
        try
          lUsuario := Tusuario.Create;
          try
            lUsuario.IDUSUARIO := dtmConexao.qryConsultaUsuarios.FieldByName
              ('IDUSUARIO').asinteger;
            lUsuario.Excluir(true);
          finally
            frmConsultaUsuarios.Refresh;
            AtualizarQueryUsuario;
          end;
        finally
          lUsuario.Free;
        end;
      end;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;

end;

procedure TfrmConsultaUsuarios.btnIncluirClick(Sender: TObject);
var
  lFormulario: TfrmCadastroUsuarios;
  lUsuario: Tusuario;
begin
  lFormulario := TfrmCadastroUsuarios.Create(nil);
  lUsuario := Tusuario.Create;
  try
    lFormulario.Tipo := 'Incluir';
    lFormulario.edtCodigoUsuario.Enabled := false;
    lFormulario.edtCodigoUsuario.Text := lUsuario.MostraProximoID.ToString;
    lFormulario.ShowModal;
    AtualizarQueryUsuario;
  finally
    lFormulario.Free;
    lUsuario.Free;
  end;
end;

procedure TfrmConsultaUsuarios.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaUsuarios.btnVisualizarClick(Sender: TObject);
var
  lFormulario: TfrmCadastroUsuarios;
  lUsuario: Tusuario;
begin
  if dtmConexao.qryConsultaUsuarios.RecordCount > 0 then
  begin
    lUsuario := Tusuario.Create;
    lFormulario := TfrmCadastroUsuarios.Create(nil);
    try
      lUsuario.IDUSUARIO := dtmConexao.qryConsultaUsuarios.FieldByName
        ('IDUSUARIO').asinteger;
      lUsuario.Carrega;
      lFormulario.edtCodigoUsuario.Text := IntToStr(lUsuario.IDUSUARIO);
      lFormulario.edtNomeUsuario.Text := lUsuario.NOMEUSUARIO;
      lFormulario.edtLogin.Text := lUsuario.LOGIN;
      lFormulario.edtSenha.Text := ('*****');
      lFormulario.edtEmail.Text := lUsuario.EMAIL;
      lFormulario.edtNivelAcesso.Text := IntToStr(lUsuario.NIVELACESSO);
      lFormulario.edtSenha.Enabled := false;
      lFormulario.btnSalvar.Enabled := false;
      lFormulario.edtCodigoUsuario.Enabled := false;
      lFormulario.ShowModal;
      AtualizarQueryUsuario;
    finally
      lFormulario.Free;
      lUsuario.Free;
    end;
  end
  else
  begin
    ShowMessage('N�o h� registro selecionado.');
  end;

end;

procedure TfrmConsultaUsuarios.BuscarDadosUsuario;
var
  lFormulario: TfrmCadastroUsuarios;
  lUsuario: Tusuario;
begin
  lUsuario := Tusuario.Create;
  lFormulario := TfrmCadastroUsuarios.Create(nil);
  try
    lFormulario.Tipo := 'Alterar';
    lFormulario.CodigoUsuario := 0;
    lUsuario.IDUSUARIO := dtmConexao.qryConsultaUsuarios.FieldByName
      ('IDUSUARIO').asinteger;
    lFormulario.CodigoUsuario := lUsuario.IDUSUARIO;
    lUsuario.Carrega;
    lFormulario.edtCodigoUsuario.Text := IntToStr(lUsuario.IDUSUARIO);
    lFormulario.edtNomeUsuario.Text := lUsuario.NOMEUSUARIO;
    lFormulario.edtLogin.Text := lUsuario.LOGIN;
    lFormulario.LoginAntigo := lUsuario.LOGIN;
    lFormulario.edtSenha.Text := lUsuario.SENHA;
    lFormulario.edtEmail.Text := lUsuario.EMAIL;
    lFormulario.EmailAntigo := lUsuario.EMAIL;
    lFormulario.edtNivelAcesso.Text := IntToStr(lUsuario.NIVELACESSO);
    lFormulario.edtCodigoUsuario.Enabled := false;
    lFormulario.ShowModal;
    AtualizarQueryUsuario;
  finally
    lFormulario.Free;
    lUsuario.Free;
  end;
end;

procedure TfrmConsultaUsuarios.cbxFiltroUsuarioChange(Sender: TObject);
begin
  case cbxFiltroUsuario.ItemIndex of
    0:
      begin
        edtPesquisarUsuario.NumbersOnly := true;
        edtPesquisarUsuario.Clear;
      end;
    1:
      begin
        edtPesquisarUsuario.NumbersOnly := false;
        edtPesquisarUsuario.Clear;
      end;
  end;
end;

procedure TfrmConsultaUsuarios.edtPesquisarUsuarioChange(Sender: TObject);
begin
  AtualizarQueryUsuario;
end;

procedure TfrmConsultaUsuarios.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  AtualizarQueryUsuario;
end;

procedure TfrmConsultaUsuarios.ValidaSeUsuarioEstaLiberado
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
