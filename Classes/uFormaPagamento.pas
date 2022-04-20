unit uFormaPagamento;

interface

uses
  FireDAC.Comp.Client, dconexao, Vcl.Dialogs, System.SysUtils;

type
  TFormaPagamento = class
  private
    FIDFORMAPAGAMENTO: Integer;
    FDESCRICAO: string;
    FTIPO: string;

    class var FObjetoBusca: TFormaPagamento;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    class function Existe(pCodigo: Integer): boolean;
    function MostraProximoID: Integer;

    constructor Create;
    class property ObjetoBusca: TFormaPagamento read FObjetoBusca
      write FObjetoBusca;
    property IDFORMAPAGAMENTO: Integer read FIDFORMAPAGAMENTO
      write FIDFORMAPAGAMENTO;
    property DESCRICAO: string read FDESCRICAO write FDESCRICAO;
    property TIPO: string read FTIPO write FTIPO;
  end;

implementation

{ TFormaPagamento }

procedure TFormaPagamento.Alterar(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' UPDATE FORMAPAGAMENTO SET                         ');
    lQuery.sql.Add(' DESCRICAO = :DESCRICAO,                           ');
    lQuery.sql.Add(' TIPO = :TIPO                                      ');
    lQuery.sql.Add(' WHERE IDFORMAPAGAMENTO = :IDFORMAPAGAMENTO        ');

    lQuery.ParamByName('IDFORMAPAGAMENTO').AsInteger := FIDFORMAPAGAMENTO;
    lQuery.ParamByName('DESCRICAO').Value := FDESCRICAO;
    lQuery.ParamByName('TIPO').Value := FTIPO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TFormaPagamento.Carrega;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM FORMAPAGAMENTO                      ');
    lQuery.sql.Add(' WHERE IDFORMAPAGAMENTO = :IDFORMAPAGAMENTO        ');
    lQuery.ParamByName('IDFORMAPAGAMENTO').AsInteger := FIDFORMAPAGAMENTO;
    lQuery.Open;
    if lQuery.RecordCount > 0 then
    begin
      FIDFORMAPAGAMENTO := lQuery.FieldByName('IDFORMAPAGAMENTO').AsInteger;
      FDESCRICAO := lQuery.FieldByName('DESCRICAO').AsString;
      FTIPO := lQuery.FieldByName('TIPO').AsString;
    end;

  finally
    lQuery.Free;
  end;
end;

constructor TFormaPagamento.Create;
begin
  Inicializar;
end;

destructor TFormaPagamento.Destroy;
begin

  inherited;
end;

procedure TFormaPagamento.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM FORMAPAGAMENTO                  ');
    lQuery.sql.Add('WHERE IDFORMAPAGAMENTO = :IDFORMAPAGAMENTO  ');
    lQuery.ParamByName('IDFORMAPAGAMENTO').AsInteger := FIDFORMAPAGAMENTO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TFormaPagamento.Existe(pCodigo: Integer): boolean;
var
  lQuery: Tfdquery;
begin
  Result := false;
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add
      ('SELECT * FROM FORMAPAGAMENTO WHERE IDFORMAPAGAMENTO = :IDFORMAPAGAMENTO');
    lQuery.ParamByName('IDFORMAPAGAMENTO').AsInteger := pCodigo;
    lQuery.Open;
    if (lQuery.RecordCount > 0) then
    begin
      Result := true;
      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TFormaPagamento.Create;
      end;
      FObjetoBusca.IDFORMAPAGAMENTO := pCodigo;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TFormaPagamento.Incluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' INSERT INTO FORMAPAGAMENTO(     ');
    lQuery.sql.Add(' DESCRICAO                       ');
    lQuery.sql.Add(' ,TIPO                           ');
    lQuery.sql.Add(' )VALUES(                        ');
    lQuery.sql.Add(' :DESCRICAO,                     ');
    lQuery.sql.Add(' :TIPO                          )');

    lQuery.ParamByName('DESCRICAO').AsString := FDESCRICAO;
    lQuery.ParamByName('TIPO').AsString := FTIPO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TFormaPagamento.Inicializar;
begin
  FDESCRICAO := '';
  FTIPO := '';
end;

function TFormaPagamento.MostraProximoID: Integer;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add
      (' SELECT gen_id(gen_formapagamento_id, 0)+1 codigo from FORMAPAGAMENTO');
    lQuery.Open;
    Result := lQuery.FieldByName('codigo').AsInteger;
  finally
    lQuery.Free;
  end;
end;

end.
