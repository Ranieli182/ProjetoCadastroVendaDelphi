unit uItemVenda;

interface

uses
  FireDAC.Comp.Client,
  dconexao,
  Vcl.Dialogs,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  uHelpersImagensBase64;

type
  TItemVenda = class
  private
    FID: Integer;
    FEMISSAO: TDate;
    FVENDA: Integer;
    FPRODUTO: Integer;
    FQUANTIDADE: Double;
    FVALOR: Double;
    FDESCONTO: Double;

    class var FObjetoBusca: TItemVenda;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    class function GeraProximoID: Integer;

    constructor Create;
    class property ObjetoBusca: TItemVenda read FObjetoBusca write FObjetoBusca;


    property ID: Integer read FID write FID;
    property EMISSAO: TDate read FEMISSAO write FEMISSAO;
    property VENDA: Integer read FVENDA write FVENDA;
    property PRODUTO: Integer read FPRODUTO write FPRODUTO;
    property QUANTIDADE: Double read FQUANTIDADE write FQUANTIDADE;
    property VALOR: Double read FVALOR write FVALOR;
    property DESCONTO: Double read FDESCONTO write FDESCONTO;

  end;

implementation

{ TItemVenda }

procedure TItemVenda.Alterar(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' UPDATE VENDA_ITEM SET        ');
    lQuery.SQL.Add(' EMISSAO = :EMISSAO           ');
    lQuery.SQL.Add(' ,VENDA = :VENDA              ');
    lQuery.SQL.Add(' ,PRODUTO = :PRODUTO          ');
    lQuery.SQL.Add(' ,QUANTIDADE = :QUANTIDADE    ');
    lQuery.SQL.Add(' ,VALOR = :VALOR              ');
    lQuery.SQL.Add(' ,DESCONTO = :DESCONTO        ');
    lQuery.SQL.Add(' WHERE ID = :ID               ');

    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.ParamByName('EMISSAO').AsDateTime := FEMISSAO;
    lQuery.ParamByName('VENDA').AsInteger := FVENDA;
    lQuery.ParamByName('PRODUTO').AsInteger := FPRODUTO;
    lQuery.ParamByName('QUANTIDADE').AsFloat := FQUANTIDADE;
    lQuery.ParamByName('VALOR').AsFloat := FVALOR;
    lQuery.ParamByName('DESCONTO').AsFloat := FDESCONTO;
    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TItemVenda.Carrega;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' SELECT * FROM VENDA_ITEM ');
    lQuery.SQL.Add(' WHERE ID = :ID        ');
    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FID := lQuery.ParamByName('ID').AsInteger;
      FEMISSAO := lQuery.FieldByName('EMISSAO').AsDateTime;
      FVENDA := lQuery.FieldByName('VENDA').AsInteger;
      FPRODUTO := lQuery.FieldByName('PRODUTO').AsInteger;
      FQUANTIDADE := lQuery.FieldByName('QUANTIDADE').AsFloat;
      FVALOR := lQuery.FieldByName('VALOR').AsFloat;
      FDESCONTO := lQuery.FieldByName('DESCONTO').AsFloat;
    end;

  finally
    lQuery.Free;
  end;
end;

constructor TItemVenda.Create;
begin
  Inicializar;
end;

destructor TItemVenda.Destroy;
begin

  inherited;
end;

procedure TItemVenda.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM VEMDA_ITEM WHERE ID = :ID ');
    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TItemVenda.GeraProximoID: Integer;
var
  lQuery: TFDQuery;
begin
  // Criei Class Function para n�o precisar estanciar a classe.
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' select gen_id(gen_venda_item_id, 0) codigo from VENDA_ITEM ');
    lQuery.Open;

    result := lQuery.FieldByName('codigo').AsInteger + 1;

  finally
    lQuery.Free;
  end;

end;

procedure TItemVenda.Incluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.Add(' INSERT INTO VENDA_ITEM (   ');
    lQuery.SQL.Add('  EMISSAO                   ');
    lQuery.SQL.Add(' ,VENDA                     ');
    lQuery.SQL.Add(' ,PRODUTO                   ');
    lQuery.SQL.Add(' ,QUANTIDADE                ');
    lQuery.SQL.Add(' ,VALOR                     ');
    lQuery.SQL.Add(' ,DESCONTO                  ');
    lQuery.SQL.Add(' )VALUES (                  ');
    lQuery.SQL.Add('  :EMISSAO                  ');
    lQuery.SQL.Add(' ,:VENDA                    ');
    lQuery.SQL.Add(' ,:PRODUTO                  ');
    lQuery.SQL.Add(' ,:QUANTIDADE               ');
    lQuery.SQL.Add(' ,:VALOR                    ');
    lQuery.SQL.Add(' ,:DESCONTO                 ');
    lQuery.SQL.Add(' )                          ');

    lQuery.ParamByName('EMISSAO').AsDateTime := FEMISSAO;
    lQuery.ParamByName('VENDA').AsInteger := FVENDA;
    lQuery.ParamByName('PRODUTO').AsInteger := FPRODUTO;
    lQuery.ParamByName('QUANTIDADE').AsFloat := FQUANTIDADE;
    lQuery.ParamByName('VALOR').AsFloat := FVALOR;
    lQuery.ParamByName('DESCONTO').AsFloat := FDESCONTO;
    lQuery.ExecSQL;

    if pEfetuarCommit = true then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TItemVenda.Inicializar;
begin
  FID := 0;
  FEMISSAO := 0;
  FVENDA := 0;
  FPRODUTO := 0;
  FQUANTIDADE := 0;
  FVALOR := 0;
  FDESCONTO := 0;
end;

end.
