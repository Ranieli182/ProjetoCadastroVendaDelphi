unit uUsuario;

interface

uses
  FireDAC.Comp.Client, dconexao, Vcl.Dialogs, System.SysUtils;

type
  TUsuario = class
  private
    FIDUSUARIO: Integer;
    FNOMEUSUARIO: string;
    FLOGIN: string;
    FSENHA: string;
    FEMAIL: string;
    FNIVELACESSO: Integer;

    class var FObjetoBusca: TUsuario;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    function VerificaUnique(pColuna, pDado: string): boolean;
    function MostraProximoID: Integer;
    function VerificaSeUsuarioExisteNoBanco: boolean;
    procedure CarregaNivelUsuario;

    constructor Create;
    class property ObjetoBusca: TUsuario read FObjetoBusca write FObjetoBusca;
    property IDUSUARIO: Integer read FIDUSUARIO write FIDUSUARIO;
    property NOMEUSUARIO: string read FNOMEUSUARIO write FNOMEUSUARIO;
    property LOGIN: string read FLOGIN write FLOGIN;
    property SENHA: string read FSENHA write FSENHA;
    property EMAIL: string read FEMAIL write FEMAIL;
    property NIVELACESSO: Integer read FNIVELACESSO write FNIVELACESSO;

  end;

implementation

{ TUsuario }

procedure TUsuario.Alterar(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' UPDATE USUARIOS SET                 ');
    lQuery.sql.Add(' NOMEUSUARIO = :NOMEUSUARIO          ');
    lQuery.sql.Add(' ,LOGIN = :LOGIN                     ');
    lQuery.sql.Add(' ,SENHA = :SENHA                     ');
    lQuery.sql.Add(' ,EMAIL = :EMAIL                     ');
    lQuery.sql.Add(' ,NIVELACESSO = :NIVELACESSO         ');
    lQuery.sql.Add(' WHERE IDUSUARIO = :IDUSUARIO        ');

    lQuery.ParamByName('IDUSUARIO').AsInteger := FIDUSUARIO;
    lQuery.ParamByName('NOMEUSUARIO').AsString := FNOMEUSUARIO;
    lQuery.ParamByName('LOGIN').AsString := FLOGIN;
    lQuery.ParamByName('SENHA').AsString := FSENHA;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ParamByName('NIVELACESSO').AsInteger := FNIVELACESSO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TUsuario.Carrega;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM USUARIOS              ');
    lQuery.sql.Add(' WHERE IDUSUARIO = :IDUSUARIO        ');
    lQuery.ParamByName('IDUSUARIO').AsInteger := FIDUSUARIO;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FIDUSUARIO := lQuery.FieldByName('IDUSUARIO').AsInteger;
      FNOMEUSUARIO := lQuery.FieldByName('NOMEUSUARIO').AsString;
      FLOGIN := lQuery.FieldByName('LOGIN').AsString;
      FSENHA := lQuery.FieldByName('SENHA').AsString;
      FEMAIL := lQuery.FieldByName('EMAIL').AsString;
      FNIVELACESSO := lQuery.FieldByName('NIVELACESSO').AsInteger;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TUsuario.CarregaNivelUsuario;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM USUARIOS              ');
    lQuery.sql.Add(' WHERE LOGIN = :LOGIN        ');
    lQuery.ParamByName('LOGIN').AsString := FLOGIN;
    lQuery.Open;

    FNIVELACESSO := lQuery.FieldByName('NIVELACESSO').AsInteger;

  finally
    lQuery.Free;
  end;
end;

constructor TUsuario.Create;
begin
  Inicializar;
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;

procedure TUsuario.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM USUARIOS WHERE IDUSUARIO = :IDUSUARIO ');
    lQuery.ParamByName('IDUSUARIO').AsInteger := FIDUSUARIO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TUsuario.Incluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' INSERT INTO USUARIOS(          ');
    lQuery.sql.Add(' NOMEUSUARIO                    ');
    lQuery.sql.Add(' ,LOGIN                         ');
    lQuery.sql.Add(' ,SENHA                         ');
    lQuery.sql.Add(' ,EMAIL                         ');
    lQuery.sql.Add(' ,NIVELACESSO                   ');
    lQuery.sql.Add(' )VALUES(                       ');
    lQuery.sql.Add(' :NOMEUSUARIO                   ');
    lQuery.sql.Add(' ,:LOGIN                        ');
    lQuery.sql.Add(' ,:SENHA                        ');
    lQuery.sql.Add(' ,:EMAIL                        ');
    lQuery.sql.Add(' ,:NIVELACESSO                 )');

    lQuery.ParamByName('NOMEUSUARIO').AsString := FNOMEUSUARIO;
    lQuery.ParamByName('LOGIN').AsString := FLOGIN;
    lQuery.ParamByName('SENHA').AsString := FSENHA;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ParamByName('NIVELACESSO').AsInteger := FNIVELACESSO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TUsuario.Inicializar;
begin
  FIDUSUARIO := 0;
  FNOMEUSUARIO := '';
  FLOGIN := '';
  FSENHA := '';
  FEMAIL := '';
  FNIVELACESSO := 0;
end;

function TUsuario.MostraProximoID: Integer;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add
      (' SELECT gen_id(gen_usuarios_id, 0)+1 codigo from USUARIOS                ');
    lQuery.Open;
    Result := lQuery.FieldByName('codigo').AsInteger;
  finally
    lQuery.Free;
  end;
end;

function TUsuario.VerificaSeUsuarioExisteNoBanco: boolean;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM USUARIOS    ');
    lQuery.sql.Add(' WHERE LOGIN = :LOGIN      ');
    lQuery.sql.Add(' AND SENHA = :SENHA        ');
    lQuery.ParamByName('LOGIN').AsString := FLOGIN;
    lQuery.ParamByName('SENHA').AsString := FSENHA;
    lQuery.Open;
    if lQuery.RecordCount > 0 then
    begin
      Result := true;
    end
    else
    begin
      Result := false;
    end;

  finally
    lQuery.Free;
  end;
end;

function TUsuario.VerificaUnique(pColuna, pDado: string): boolean;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM USUARIOS                               ');
    lQuery.sql.Add(' WHERE ' + pColuna + ' = ' + QuotedStr(pDado));
    lQuery.Open;
    Result := lQuery.RecordCount > 0;
  finally
    lQuery.Free;
  end;
end;

end.
