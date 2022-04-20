unit uProduto;

interface

uses
  FireDAC.Comp.Client, dconexao, Vcl.Dialogs;

type
  TProduto = class
  private
    FIDPRODUTO: integer;
    FDESCRICAO: string;
    FMARCA: string;
    FQUANTIDADE: double;
    FPRECO: double;
    FSALDO: double;
    FCUSTO: double;
    FFOTO: string;
    FUNIDADE: integer;

    class var FObjetoBusca: TProduto;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);

    constructor Create;
    class property ObjetoBusca: TProduto read FObjetoBusca write FObjetoBusca;
    property IDPRODUTO: integer read FIDPRODUTO write FIDPRODUTO;
    property DESCRICAO: string read FDESCRICAO write FDESCRICAO;
    property MARCA: string read FMARCA write FMARCA;
    property QUANTIDADE: double read FQUANTIDADE write FQUANTIDADE;
    property PRECO: double read FPRECO write FPRECO;
    property SALDO: double read FSALDO write FSALDO;
    property CUSTO: double read FCUSTO write FCUSTO;
    property FOTO: string read FFOTO write FFOTO;
    property UNIDADE: integer read FUNIDADE write FUNIDADE;

  end;

implementation

{ TProduto }

procedure TProduto.Alterar(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' UPDATE PRODUTOS SET             ');
    lQuery.sql.Add(' DESCRICAO = :DESCRICAO,         ');
    lQuery.sql.Add(' MARCA = :MARCA,                 ');
    lQuery.sql.Add(' QUANTIDADE = :QUANTIDADE,       ');
    lQuery.sql.Add(' PRECO = :PRECO,                 ');
    lQuery.sql.Add(' SALDO = :SALDO,                 ');
    lQuery.sql.Add(' CUSTO = :CUSTO,                 ');
    lQuery.sql.Add(' FOTO = :FOTO,                   ');
    lQuery.sql.Add(' UNIDADE = :UNIDADE              ');
    lQuery.sql.Add(' WHERE IDPRODUTO = :IDPRODUTO    ');

    lQuery.ParamByName('IDPRODUTO').AsInteger := FIDPRODUTO;
    lQuery.ParamByName('DESCRICAO').Value := FDESCRICAO;
    lQuery.ParamByName('MARCA').Value := FMARCA;
    lQuery.ParamByName('QUANTIDADE').AsFloat := FQUANTIDADE;
    lQuery.ParamByName('PRECO').AsFloat := FPRECO;
    lQuery.ParamByName('SALDO').AsFloat := FSALDO;
    lQuery.ParamByName('CUSTO').AsFloat := FCUSTO;
    lQuery.ParamByName('FOTO').Value := FFOTO;
    lQuery.ParamByName('UNIDADE').AsInteger := FUNIDADE;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;

  finally
    lQuery.Free;
  end;

end;

procedure TProduto.Carrega;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM PRODUTOS ');
    lQuery.sql.Add(' WHERE IDPRODUTO = :IDPRODUTO        ');
    lQuery.ParamByName('IDPRODUTO').AsInteger := FIDPRODUTO;
    lQuery.Open;

    FDESCRICAO := lQuery.FieldByName('DESCRICAO').AsString;
    FMARCA := lQuery.FieldByName('MARCA').AsString;
    FQUANTIDADE := lQuery.FieldByName('QUANTIDADE').AsFloat;
    FPRECO := lQuery.FieldByName('PRECO').AsFloat;
    FSALDO := lQuery.FieldByName('SALDO').AsFloat;
    FCUSTO := lQuery.FieldByName('CUSTO').AsFloat;
    FFOTO := lQuery.FieldByName('FOTO').AsString;
    FUNIDADE := lQuery.FieldByName('UNIDADE').AsInteger;
  finally
    lQuery.Free;
  end;
end;

constructor TProduto.Create;
begin
  Inicializar;
end;

destructor TProduto.Destroy;
begin

  inherited;
end;

procedure TProduto.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM PRODUTOS WHERE IDPRODUTO = :IDPRODUTO ');
    lQuery.ParamByName('IDPRODUTO').AsInteger := FIDPRODUTO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TProduto.Incluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' INSERT INTO PRODUTOS(           ');
    lQuery.sql.Add(' DESCRICAO,                      ');
    lQuery.sql.Add(' MARCA,                          ');
    lQuery.sql.Add(' QUANTIDADE,                     ');
    lQuery.sql.Add(' PRECO,                          ');
    lQuery.sql.Add(' SALDO,                          ');
    lQuery.sql.Add(' CUSTO,                          ');
    lQuery.sql.Add(' FOTO,                           ');
    lQuery.sql.Add(' UNIDADE                         ');
    lQuery.sql.Add(' )VALUES(                        ');
    lQuery.sql.Add(' :DESCRICAO,                     ');
    lQuery.sql.Add(' :MARCA,                         ');
    lQuery.sql.Add(' :QUANTIDADE,                    ');
    lQuery.sql.Add(' :PRECO,                         ');
    lQuery.sql.Add(' :SALDO,                         ');
    lQuery.sql.Add(' :CUSTO,                         ');
    lQuery.sql.Add(' :FOTO,                          ');
    lQuery.sql.Add(' :UNIDADE                       )');

    lQuery.ParamByName('DESCRICAO').Value := FDESCRICAO;
    lQuery.ParamByName('MARCA').Value := FMARCA;
    lQuery.ParamByName('QUANTIDADE').Value := FQUANTIDADE;
    lQuery.ParamByName('PRECO').Value := FPRECO;
    lQuery.ParamByName('SALDO').Value := FSALDO;
    lQuery.ParamByName('CUSTO').Value := FCUSTO;
    lQuery.ParamByName('FOTO').Value := FFOTO;
    lQuery.ParamByName('UNIDADE').Value := FUNIDADE;

    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TProduto.Inicializar;
begin

  FDESCRICAO := '';
  FMARCA := '';
  FQUANTIDADE := 0;
  FPRECO := 0;
  FSALDO := 0;
  FCUSTO := 0;
  FFOTO := '';
  FUNIDADE := 0;

end;

end.
