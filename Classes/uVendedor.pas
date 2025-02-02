unit uVendedor;

interface

uses
  FireDAC.Comp.Client, dconexao, Vcl.Dialogs;

type
  TVendedor = class
  private
    FIDVENDEDOR: integer;
    FNOMEVENDEDOR: string;
    FEMAIL: string;
    FENDERECO: string;
    FBAIRRO: string;
    FCEP: string;
    FCIDADE: string;

    class var FObjetoBusca: TVendedor;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    function MostraProximoID: integer;
    class function Existe(pCodigo: integer): boolean;

    constructor Create;
    class property ObjetoBusca: TVendedor read FObjetoBusca write FObjetoBusca;
    property IDVENDEDOR: integer read FIDVENDEDOR write FIDVENDEDOR;
    property NOMEVENDEDOR: string read FNOMEVENDEDOR write FNOMEVENDEDOR;
    property EMAIL: string read FEMAIL write FEMAIL;
    property ENDERECO: string read FENDERECO write FENDERECO;
    property BAIRRO: string read FBAIRRO write FBAIRRO;
    property CEP: string read FCEP write FCEP;
    property CIDADE: string read FCIDADE write FCIDADE;
  end;

implementation

{ TVendedor }

procedure TVendedor.Alterar(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' UPDATE VENDEDOR SET                ');
    lQuery.sql.Add(' NOMEVENDEDOR = :NOMEVENDEDOR       ');
    lQuery.sql.Add(' ,EMAIL = :EMAIL                    ');
    lQuery.sql.Add(' ,ENDERECO = :ENDERECO              ');
    lQuery.sql.Add(' ,BAIRRO = :BAIRRO                  ');
    lQuery.sql.Add(' ,CEP = :CEP                        ');
    lQuery.sql.Add(' ,CIDADE = :CIDADE                  ');
    lQuery.sql.Add(' WHERE IDVENDEDOR = :IDVENDEDOR     ');

    lQuery.ParamByName('IDVENDEDOR').AsInteger := FIDVENDEDOR;
    lQuery.ParamByName('NOMEVENDEDOR').AsString := FNOMEVENDEDOR;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ParamByName('ENDERECO').AsString := FENDERECO;
    lQuery.ParamByName('BAIRRO').AsString := FBAIRRO;
    lQuery.ParamByName('CEP').AsString := FCEP;
    lQuery.ParamByName('CIDADE').AsString := FCIDADE;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TVendedor.Carrega;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM VENDEDOR                ');
    lQuery.sql.Add(' WHERE IDVENDEDOR = :IDVENDEDOR        ');
    lQuery.ParamByName('IDVENDEDOR').AsInteger := FIDVENDEDOR;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FNOMEVENDEDOR := lQuery.FieldByName('NOMEVENDEDOR').AsString;
      FEMAIL := lQuery.FieldByName('EMAIL').AsString;
      FENDERECO := lQuery.FieldByName('ENDERECO').AsString;
      FBAIRRO := lQuery.FieldByName('BAIRRO').AsString;
      FCEP := lQuery.FieldByName('CEP').AsString;
      FCIDADE := lQuery.FieldByName('CIDADE').AsString;
    end;

  finally
    lQuery.Free;
  end;
end;

constructor TVendedor.Create;
begin
  Inicializar;
end;

destructor TVendedor.Destroy;
begin

  inherited;
end;

procedure TVendedor.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM VENDEDOR WHERE IDVENDEDOR = :IDVENDEDOR ');
    lQuery.ParamByName('IDVENDEDOR').AsInteger := FIDVENDEDOR;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TVendedor.Existe(pCodigo: integer): boolean;
var
  lQuery: Tfdquery;
begin
  Result := false;
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('SELECT * FROM VENDEDOR WHERE IDVENDEDOR = :IDVENDEDOR');
    lQuery.ParamByName('IDVENDEDOR').AsInteger := pCodigo;
    lQuery.Open;
    if (lQuery.RecordCount > 0) then
    begin
      Result := true;
      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TVendedor.Create;
      end;
      FObjetoBusca.IDVENDEDOR := pCodigo;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TVendedor.Incluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' INSERT INTO VENDEDOR(          ');
    lQuery.sql.Add(' NOMEVENDEDOR                   ');
    lQuery.sql.Add(' ,EMAIL                         ');
    lQuery.sql.Add(' ,ENDERECO                      ');
    lQuery.sql.Add(' ,BAIRRO                        ');
    lQuery.sql.Add(' ,CEP                           ');
    lQuery.sql.Add(' ,CIDADE                        ');
    lQuery.sql.Add(' )VALUES(                       ');
    lQuery.sql.Add(' :NOMEVENDEDOR                  ');
    lQuery.sql.Add(' ,:EMAIL                        ');
    lQuery.sql.Add(' ,:ENDERECO                     ');
    lQuery.sql.Add(' ,:BAIRRO                       ');
    lQuery.sql.Add(' ,:CEP                          ');
    lQuery.sql.Add(' ,:CIDADE                      )');

    lQuery.ParamByName('NOMEVENDEDOR').AsString := FNOMEVENDEDOR;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ParamByName('ENDERECO').AsString := FENDERECO;
    lQuery.ParamByName('BAIRRO').AsString := FBAIRRO;
    lQuery.ParamByName('CEP').AsString := FCEP;
    lQuery.ParamByName('CIDADE').AsString := FCIDADE;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TVendedor.Inicializar;
begin
  FNOMEVENDEDOR := '';
  FEMAIL := '';
  FENDERECO := '';
  FBAIRRO := '';
  FCEP := '';
  FCIDADE := '';
end;

function TVendedor.MostraProximoID: integer;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add
      (' SELECT gen_id(gen_vendedor_id, 0)+1 codigo from VENDEDOR                ');
    lQuery.Open;
    Result := lQuery.FieldByName('codigo').AsInteger;
  finally
    lQuery.Free;
  end;
end;

end.
