unit uUnidade;

interface

uses
  FireDAC.Comp.Client, dconexao, Vcl.Dialogs;

type
  TUnidade = class
  private
    FIDUNIDADE: integer;
    FNOMEUNIDADE: string;
    FUNIDADE: string;
    FDATACADASTROUNIDADE: TDate;

    class var FObjetoBusca: TUnidade;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);

    constructor Create;
    class property ObjetoBusca: TUnidade read FObjetoBusca write FObjetoBusca;
    property IDUNIDADE: integer read FIDUNIDADE write FIDUNIDADE;
    property NOMEUNIDADE: string read FNOMEUNIDADE write FNOMEUNIDADE;
    property UNIDADE: string read FUNIDADE write FUNIDADE;
    property DATACADASTROUNIDADE: TDate read FDATACADASTROUNIDADE
      write FDATACADASTROUNIDADE;
  end;

implementation

{ TUnidade }

procedure TUnidade.Alterar(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' UPDATE UNIDADES SET                             ');
    lQuery.sql.Add(' NOMEUNIDADE = :NOMEUNIDADE                      ');
    lQuery.sql.Add(' ,UNIDADE = :UNIDADE                             ');
    lQuery.sql.Add(' ,DATACADASTROUNIDADE = :DATACADASTROUNIDADE     ');
    lQuery.sql.Add(' WHERE IDUNIDADE = :IDUNIDADE                    ');

    lQuery.ParamByName('IDUNIDADE').AsInteger := FIDUNIDADE;
    lQuery.ParamByName('NOMEUNIDADE').AsString := FNOMEUNIDADE;
    lQuery.ParamByName('UNIDADE').AsString := FUNIDADE;
    lQuery.ParamByName('DATACADASTROUNIDADE').AsDateTime :=
      FDATACADASTROUNIDADE;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TUnidade.Carrega;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM UNIDADES              ');
    lQuery.sql.Add(' WHERE IDUNIDADE = :IDUNIDADE        ');
    lQuery.ParamByName('IDUNIDADE').AsInteger := FIDUNIDADE;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FNOMEUNIDADE := lQuery.FieldByName('NOMEUNIDADE').AsString;
      FUNIDADE := lQuery.FieldByName('UNIDADE').AsString;
      FDATACADASTROUNIDADE := lQuery.FieldByName('DATACADASTROUNIDADE')
        .AsDateTime;
    end;

  finally
    lQuery.Free;
  end;
end;

constructor TUnidade.Create;
begin
  Inicializar;
end;

destructor TUnidade.Destroy;
begin

  inherited;
end;

procedure TUnidade.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM UNIDADES WHERE IDUNIDADE = :IDUNIDADE ');
    lQuery.ParamByName('IDUNIDADE').AsInteger := FIDUNIDADE;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TUnidade.Incluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' INSERT INTO UNIDADES(           ');
    lQuery.sql.Add(' NOMEUNIDADE,                   ');
    lQuery.sql.Add(' UNIDADE,                       ');
    lQuery.sql.Add(' DATACADASTROUNIDADE            ');
    lQuery.sql.Add(' )VALUES(                       ');
    lQuery.sql.Add(' :NOMEUNIDADE,                  ');
    lQuery.sql.Add(' :UNIDADE,                      ');
    lQuery.sql.Add(' :DATACADASTROUNIDADE          )');

    lQuery.ParamByName('NOMEUNIDADE').AsString := FNOMEUNIDADE;
    lQuery.ParamByName('UNIDADE').AsString := FUNIDADE;
    lQuery.ParamByName('DATACADASTROUNIDADE').AsDate := FDATACADASTROUNIDADE;

    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TUnidade.Inicializar;
begin
  FNOMEUNIDADE := '';
  FUNIDADE := '';
  DATACADASTROUNIDADE := 0;
end;

end.
