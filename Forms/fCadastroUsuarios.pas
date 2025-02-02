unit fCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uUsuario,
  dConexao;

type
  TfrmCadastroUsuarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnSalvar: TButton;
    btnSair: TButton;
    edtNomeUsuario: TEdit;
    lblNomeUsuario: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtEmail: TEdit;
    edtNivelAcesso: TEdit;
    lblLogin: TLabel;
    lblSenha: TLabel;
    lblEmail: TLabel;
    lblNivelAcesso: TLabel;
    edtCodigoUsuario: TEdit;
    lblCodigoUsuario: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoUsuario: integer;
    Tipo: String;
    EmailAntigo: String;
    LoginAntigo: String;
    procedure IncluirUsuario;
    procedure AlterarUsuario;
    function ValidaLogin: Boolean;
    function ValidaEmail: Boolean;
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

implementation

{$R *.dfm}

procedure TfrmCadastroUsuarios.AlterarUsuario;
var
  lUsuario: Tusuario;
begin
  lUsuario := Tusuario.Create;
  try
    lUsuario.IDUSUARIO := CodigoUsuario;
    lUsuario.NOMEUSUARIO := edtNomeUsuario.Text;
    lUsuario.LOGIN := edtLogin.Text;
    lUsuario.SENHA := edtSenha.Text;
    lUsuario.EMAIL := edtEmail.Text;
    lUsuario.NIVELACESSO := StrToInt(edtNivelAcesso.Text);
    lUsuario.Alterar(true);
  finally
    lUsuario.Free;
  end;
end;

procedure TfrmCadastroUsuarios.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroUsuarios.btnSalvarClick(Sender: TObject);
var
  lUsuario: Tusuario;
begin
  if trim(edtNomeUsuario.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher o Nome do Usu�rio.');
    edtNomeUsuario.SetFocus;
    exit;
  end
  else if trim(edtLogin.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher o Login do Usu�rio.');
    edtLogin.SetFocus;
    exit;
  end
  else if trim(edtSenha.Text) = '' then
  begin
    ShowMessage
      ('Campo obrigat�rio n�o informado, favor preencher a Senha do Usu�rio.');
    edtSenha.SetFocus;
    exit;
  end
  else
  begin
    if Tipo = 'Incluir' then
    begin
      lUsuario := Tusuario.Create;
      try
        if (lUsuario.VerificaUnique('EMAIL', edtEmail.Text)) then
        begin
          ShowMessage
            ('N�o � permitido informar um E-mail que j� existe no cadastro.');
              edtEmail.SetFocus;
        end
        else if (lUsuario.VerificaUnique('LOGIN', edtLogin.Text)) then
        begin
          ShowMessage
            ('N�o � permitido informar um Login que j� existe no cadastro.');
            edtLogin.SetFocus;
        end
        else
        begin
          IncluirUsuario;
          close;
        end;
      finally
        lUsuario.Free;
      end;
    end
    else if Tipo = 'Alterar' then
    begin
      if not(ValidaEmail) then
      begin
        ShowMessage
          ('N�o � permitido informar um E-mail que j� existe no cadastro.');
          edtEmail.SetFocus;
      end
      else if not(ValidaLogin) then
      begin
        ShowMessage
          ('N�o � permitido informar um Login que j� existe no cadastro.');
          edtLogin.SetFocus;
      end
      else
      begin
        AlterarUsuario;
        close;
      end;
    end;
  end;

end;

procedure TfrmCadastroUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TfrmCadastroUsuarios.FormShow(Sender: TObject);
begin
  edtNomeUsuario.SetFocus;
end;

procedure TfrmCadastroUsuarios.IncluirUsuario;
var
  lUsuario: Tusuario;
begin
  lUsuario := Tusuario.Create;
  try
    lUsuario.NOMEUSUARIO := edtNomeUsuario.Text;
    lUsuario.LOGIN := edtLogin.Text;
    lUsuario.SENHA := edtSenha.Text;
    lUsuario.EMAIL := edtEmail.Text;
    lUsuario.NIVELACESSO := StrToInt(edtNivelAcesso.Text);
    lUsuario.Incluir(true);
  finally
    lUsuario.Free;
  end;
end;

function TfrmCadastroUsuarios.ValidaEmail: Boolean;
var
  lUsuario: Tusuario;
begin
  lUsuario := Tusuario.Create;
  try
    Result := true;
    if (EmailAntigo <> edtEmail.Text) then
    begin
      if lUsuario.VerificaUnique('EMAIL', edtEmail.Text) then
      begin
        Result := false;
      end;
    end;
  finally
    lUsuario.Free;
  end;

end;

function TfrmCadastroUsuarios.ValidaLogin: Boolean;
var
  lUsuario: Tusuario;
begin
  lUsuario := Tusuario.Create;
  try
    Result := true;
    if (LoginAntigo <> edtLogin.Text) then
    begin
      if lUsuario.VerificaUnique('LOGIN', edtLogin.Text) then
      begin
        Result := false;
      end;
    end;
  finally
    lUsuario.Free;
  end;
end;

end.
