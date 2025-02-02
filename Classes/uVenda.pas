unit uVenda;

interface

uses
  FireDAC.Comp.Client,
  dconexao,
  Vcl.Dialogs,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  uItemVenda,
  System.Generics.Collections,
  uHelpersImagensBase64;

type
  TVenda = class
  private
    FID: Integer;
    FEMISSAO: TDate;
    FCLIENTE: Integer;
    FVENDEDOR: Integer;
    FFORMAPGTO: Integer;
    FTOTAL: Double;
    FOBS: String;
    FDESCONTO: Double;
    FListaVendaItem: TObjectList<TItemVenda>;

    class var FObjetoBusca: TVenda;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    procedure AdicionarItemVenda(pItemVenda: TItemVenda);
    class function Existe(pCodigo: integer): boolean;

    constructor Create;
    class property ObjetoBusca: TVenda read FObjetoBusca write FObjetoBusca;
    class function GeraProximoID: Integer;

    property ID: Integer read FID write FID;
    property EMISSAO: TDate read FEMISSAO write FEMISSAO;
    property CLIENTE: Integer read FCLIENTE write FCLIENTE;
    property VENDEDOR: Integer read FVENDEDOR write FVENDEDOR;
    property FORMAPGTO: Integer read FFORMAPGTO write FFORMAPGTO;
    property TOTAL: Double read FTOTAL write FTOTAL;
    property OBS: string read FOBS write FOBS;
    property DESCONTO: Double read FDESCONTO write FDESCONTO;
    property ListaVendaItem: TObjectList<TItemVenda> read FListaVendaItem
      write FListaVendaItem;

  end;

implementation

{ TVenda }

procedure TVenda.AdicionarItemVenda(pItemVenda: TItemVenda);
var
  Index: Integer;
begin
  FListaVendaItem.add(TItemVenda.Create);
  Index := FListaVendaItem.Count - 1;
  FListaVendaItem[Index].ID := Index;
  FListaVendaItem[Index].EMISSAO := pItemVenda.EMISSAO;
  FListaVendaItem[Index].VENDA := FID;
  FListaVendaItem[Index].PRODUTO := pItemVenda.PRODUTO;
  FListaVendaItem[Index].QUANTIDADE := pItemVenda.QUANTIDADE;
  FListaVendaItem[Index].VALOR := pItemVenda.VALOR;
  FListaVendaItem[Index].DESCONTO := pItemVenda.DESCONTO;
  FListaVendaItem.add(pItemVenda);
end;

procedure TVenda.Alterar(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.add(' UPDATE VENDA SET           ');
    lQuery.SQL.add(' EMISSAO = :EMISSAO         ');
    lQuery.SQL.add(' ,CLIENTE = :CLIENTE        ');
    lQuery.SQL.add(' ,VENDEDOR = :VENDEDOR      ');
    lQuery.SQL.add(' ,FORMAPGTO = :FORMAPGTO    ');
    lQuery.SQL.add(' ,TOTAL = :TOTAL            ');
    lQuery.SQL.add(' ,OBS = :OBS                ');
    lQuery.SQL.add(' ,DESCONTO = :DESCONTO      ');
    lQuery.SQL.add(' WHERE ID = :ID             ');

    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.ParamByName('EMISSAO').AsDateTime := FEMISSAO;
    lQuery.ParamByName('CLIENTE').AsInteger := FCLIENTE;
    lQuery.ParamByName('VENDEDOR').AsInteger := FVENDEDOR;
    lQuery.ParamByName('FORMAPGTO').AsInteger := FFORMAPGTO;
    lQuery.ParamByName('TOTAL').AsFloat := FTOTAL;
    lQuery.ParamByName('OBS').AsString := FOBS;
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

procedure TVenda.Carrega;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.add(' SELECT * FROM VENDA ');
    lQuery.SQL.add(' WHERE ID = :ID        ');
    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FID := lQuery.ParamByName('ID').AsInteger;
      FEMISSAO := lQuery.FieldByName('EMISSAO').AsDateTime;
      FCLIENTE := lQuery.FieldByName('CLIENTE').AsInteger;
      FVENDEDOR := lQuery.FieldByName('VENDEDOR').AsInteger;
      FFORMAPGTO := lQuery.FieldByName('FORMAPGTO').AsInteger;
      FTOTAL := lQuery.FieldByName('TOTAL').AsFloat;
      FOBS := lQuery.FieldByName('OBS').AsString;
      FDESCONTO := lQuery.FieldByName('DESCONTO').AsFloat;
    end;

  finally
    lQuery.Free;
  end;

end;

constructor TVenda.Create;
begin
  Inicializar;
end;

destructor TVenda.Destroy;
begin
  FreeAndNil(FListaVendaItem);
  inherited;
end;

procedure TVenda.Excluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    if (MessageDlg('Confirma a Exclus�o da Nota: ' + FID.ToString + '-' +
      ' ?', mtInformation, [mbyes, mbno], 0) = mryes) then
    begin
      lQuery.Connection := dtmConexao.FDConnection;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.add(' DELETE FROM VENDA_ITEM ');
      lQuery.SQL.add(' WHERE VENDA = :VENDA      ');
      lQuery.ParamByName('VENDA').AsInteger := FID;
      lQuery.ExecSQL;


      lQuery.Connection := dtmConexao.FDConnection;
      lQuery.Close;
      lQuery.SQL.Clear;
      lQuery.SQL.add(' DELETE FROM VENDA ');
      lQuery.SQL.add(' WHERE ID = :ID      ');
      lQuery.ParamByName('ID').AsInteger := FID;
      lQuery.ExecSQL;

      if pEfetuarCommit = true then
      begin
        dtmConexao.FDConnection.Commit;
      end;
    end;
  except
    begin
      MessageDlg('Problema na Exclus�o da Venda. ' +
        'Favor tentar mais tarde e conferir rotina !!!', mtError, [mbOK], 0);
    end;
    Screen.Cursor := crDefault;
  end;
end;

class function TVenda.Existe(pCodigo: integer): boolean;
var
  lQuery: Tfdquery;
begin
  Result := false;
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('SELECT * FROM VENDA WHERE ID = :ID');
    lQuery.ParamByName('ID').AsInteger := pCodigo;
    lQuery.Open;
    if (lQuery.RecordCount > 0) then
    begin
      Result := true;
      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TVenda.Create;
      end;
      FObjetoBusca.ID := pCodigo;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TVenda.GeraProximoID: Integer;
var
  lQuery: TFDQuery;
begin
  // Criei Class Function para n�o precisar estanciar a classe.
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.add(' select gen_id(gen_venda_id, 0) codigo from VENDA ');
    lQuery.Open;

    result := lQuery.FieldByName('codigo').AsInteger + 1;

  finally
    lQuery.Free;
  end;
end;

procedure TVenda.Incluir(pEfetuarCommit: boolean);
var
  lQuery: TFDQuery;
  I: Integer;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dtmConexao.FDConnection;
    lQuery.Close;
    lQuery.SQL.Clear;
    lQuery.SQL.add(' INSERT INTO VENDA (   ');
    lQuery.SQL.add('  EMISSAO              ');
    lQuery.SQL.add(' ,CLIENTE              ');
    lQuery.SQL.add(' ,VENDEDOR             ');
    lQuery.SQL.add(' ,FORMAPGTO            ');
    lQuery.SQL.add(' ,TOTAL                ');
    lQuery.SQL.add(' ,OBS                  ');
    lQuery.SQL.add(' ,DESCONTO             ');
    lQuery.SQL.add(' )VALUES (             ');
    lQuery.SQL.add('  :EMISSAO             ');
    lQuery.SQL.add(' ,:CLIENTE             ');
    lQuery.SQL.add(' ,:VENDEDOR            ');
    lQuery.SQL.add(' ,:FORMAPGTO           ');
    lQuery.SQL.add(' ,:TOTAL               ');
    lQuery.SQL.add(' ,:OBS                 ');
    lQuery.SQL.add(' ,:DESCONTO            ');
    lQuery.SQL.add(' )                     ');

    lQuery.ParamByName('EMISSAO').AsDateTime := FEMISSAO;
    lQuery.ParamByName('CLIENTE').AsInteger := FCLIENTE;
    lQuery.ParamByName('VENDEDOR').AsInteger := FVENDEDOR;
    lQuery.ParamByName('FORMAPGTO').AsInteger := FFORMAPGTO;
    lQuery.ParamByName('TOTAL').AsFloat := FTOTAL;
    lQuery.ParamByName('OBS').AsString := FOBS;
    lQuery.ParamByName('DESCONTO').AsFloat := FDESCONTO;
    lQuery.ExecSQL;

    if FListaVendaItem.Count > 0 then
    begin
      for I := 0 to FListaVendaItem.Count - 1 do
      begin
          FListaVendaItem[I].Incluir(false);
      end;
    end;

    if pEfetuarCommit then
    begin
      dtmConexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TVenda.Inicializar;
begin
  FID := 0;
  FEMISSAO := 0;
  FCLIENTE := 0;
  FVENDEDOR := 0;
  FFORMAPGTO := 0;
  FTOTAL := 0;
  FOBS := emptystr;
  FDESCONTO := 0;
  FListaVendaItem := TObjectList<TItemVenda>.Create;
end;

end.
