unit uCliente;

interface

uses
  FireDAC.Comp.Client, dconexao, Vcl.Dialogs, System.SysUtils;

type
  TCliente = class
  private
    FID: integer;
    FNOME: string;
    FENDERECO: string;
    FCPF: string;
    FTELEFONE: string;
    FEMAIL: string;
    FCIDADE: string;
    FCNPJ: string;
    FTIPO: string;
    FCEP: string;
    FBAIRRO: string;
    class var FObjetoBusca: TCliente;
  public
    destructor Destroy; override;
    procedure Inicializar;
    procedure Carrega;
    procedure Incluir(pEfetuarCommit: boolean);
    procedure Alterar(pEfetuarCommit: boolean);
    procedure Excluir(pEfetuarCommit: boolean);
    class function ValidaCPF(pCPF: string): boolean;
    class function ValidaCNPJ(pCNPJ: string): boolean;
    class function ValidaCEP(pCEP: string): boolean;
    class function Existe(pCodigo: integer): boolean;
    function MostraProximoID: integer;

    constructor Create;
    property ID: integer read FID write FID;
    property NOME: string read FNOME write FNOME;
    property ENDERECO: string read FENDERECO write FENDERECO;
    property CPF: string read FCPF write FCPF;
    property TELEFONE: string read FTELEFONE write FTELEFONE;
    property EMAIL: string read FEMAIL write FEMAIL;
    property CIDADE: string read FCIDADE write FCIDADE;
    property CNPJ: string read FCNPJ write FCNPJ;
    property TIPO: string read FTIPO write FTIPO;
    property CEP: string read FCEP write FCEP;
    property BAIRRO: string read FBAIRRO write FBAIRRO;
    class property ObjetoBusca: TCliente read FObjetoBusca write FObjetoBusca;
  end;

implementation

{ TCliente }

procedure TCliente.Alterar(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' UPDATE CLIENTE SET    ');
    lQuery.sql.Add(' NOME = :NOME          ');
    lQuery.sql.Add(' ,ENDERECO = :ENDERECO ');
    lQuery.sql.Add(' ,CPF = :CPF           ');
    lQuery.sql.Add(' ,TELEFONE = :TELEFONE ');
    lQuery.sql.Add(' ,EMAIL = :EMAIL       ');
    lQuery.sql.Add(' ,CIDADE = :CIDADE     ');
    lQuery.sql.Add(' ,CNPJ = :CNPJ         ');
    lQuery.sql.Add(' ,TIPO = :TIPO         ');
    lQuery.sql.Add(' ,CEP = :CEP           ');
    lQuery.sql.Add(' ,BAIRRO = :BAIRRO     ');
    lQuery.sql.Add(' WHERE ID = :ID        ');

    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.ParamByName('NOME').AsString := FNOME;
    lQuery.ParamByName('ENDERECO').AsString := FENDERECO;
    lQuery.ParamByName('CPF').AsString := FCPF;
    lQuery.ParamByName('TELEFONE').AsString := FTELEFONE;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ParamByName('CIDADE').AsString := FCIDADE;
    lQuery.ParamByName('CNPJ').AsString := FCNPJ;
    lQuery.ParamByName('TIPO').AsString := FTIPO;
    lQuery.ParamByName('CEP').AsString := FCEP;
    lQuery.ParamByName('BAIRRO').AsString := FBAIRRO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;

  finally
    lQuery.Free;
  end;
end;

procedure TCliente.Carrega;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT * FROM CLIENTE ');
    lQuery.sql.Add(' WHERE ID = :ID        ');
    lQuery.ParamByName('ID').AsInteger := FID;
    lQuery.Open;

    if lQuery.RecordCount > 0 then
    begin
      FNOME := lQuery.FieldByName('NOME').AsString;
      FENDERECO := lQuery.FieldByName('ENDERECO').AsString;
      FCPF := lQuery.FieldByName('CPF').AsString;
      FTELEFONE := lQuery.FieldByName('TELEFONE').AsString;
      FEMAIL := lQuery.FieldByName('EMAIL').AsString;
      FCIDADE := lQuery.FieldByName('CIDADE').AsString;
      FCNPJ := lQuery.FieldByName('CNPJ').AsString;
      FTIPO := lQuery.FieldByName('TIPO').AsString;
      FCEP := lQuery.FieldByName('CEP').AsString;
      FBAIRRO := lQuery.FieldByName('BAIRRO').AsString;
    end;

  finally
    lQuery.Free;
  end;
end;

constructor TCliente.Create;
begin
  Inicializar;
end;

destructor TCliente.Destroy;
begin

  inherited;
end;

procedure TCliente.Excluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('DELETE FROM CLIENTE WHERE ID = :ID ');
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

class function TCliente.Existe(pCodigo: integer): boolean;
var
  lQuery: Tfdquery;
begin
  Result := false;
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add('SELECT * FROM CLIENTE WHERE ID = :ID');
    lQuery.ParamByName('ID').AsInteger := pCodigo;
    lQuery.Open;
    if (lQuery.RecordCount > 0) then
    begin
      Result := true;
      if not Assigned(FObjetoBusca) then
      begin
        FObjetoBusca := TCliente.Create;
      end;
      FObjetoBusca.ID := pCodigo;
      FObjetoBusca.Carrega;
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TCliente.Incluir(pEfetuarCommit: boolean);
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' INSERT INTO CLIENTE(           ');
    lQuery.sql.Add(' NOME,                          ');
    lQuery.sql.Add(' ENDERECO,                      ');
    lQuery.sql.Add(' CPF,                           ');
    lQuery.sql.Add(' TELEFONE,                      ');
    lQuery.sql.Add(' EMAIL,                         ');
    lQuery.sql.Add(' CIDADE,                        ');
    lQuery.sql.Add(' TIPO,                          ');
    lQuery.sql.Add(' CNPJ,                          ');
    lQuery.sql.Add(' CEP,                           ');
    lQuery.sql.Add(' BAIRRO                         ');
    lQuery.sql.Add(' )VALUES(                       ');
    lQuery.sql.Add(' :NOME,                         ');
    lQuery.sql.Add(' :ENDERECO,                     ');
    lQuery.sql.Add(' :CPF,                          ');
    lQuery.sql.Add(' :TELEFONE,                     ');
    lQuery.sql.Add(' :EMAIL,                        ');
    lQuery.sql.Add(' :CIDADE,                       ');
    lQuery.sql.Add(' :TIPO,                         ');
    lQuery.sql.Add(' :CNPJ,                         ');
    lQuery.sql.Add(' :CEP,                          ');
    lQuery.sql.Add(' :BAIRRO                       )');

    lQuery.ParamByName('NOME').AsString := FNOME;
    lQuery.ParamByName('ENDERECO').AsString := FENDERECO;
    lQuery.ParamByName('CPF').AsString := FCPF;
    lQuery.ParamByName('TELEFONE').AsString := FTELEFONE;
    lQuery.ParamByName('EMAIL').AsString := FEMAIL;
    lQuery.ParamByName('CIDADE').AsString := FCIDADE;
    lQuery.ParamByName('CNPJ').AsString := FCNPJ;
    lQuery.ParamByName('TIPO').AsString := FTIPO;
    lQuery.ParamByName('CEP').AsString := FCEP;
    lQuery.ParamByName('BAIRRO').AsString := FBAIRRO;
    lQuery.ExecSQL;
    if pEfetuarCommit then
    begin
      dtmconexao.FDConnection.Commit;
    end;
  finally
    lQuery.Free;
  end;

end;

procedure TCliente.Inicializar;
begin
  FNOME := '';
  FENDERECO := '';
  FCPF := '';
  FTELEFONE := '';
  FEMAIL := '';
  FCIDADE := '';
  FCNPJ := '';
  FTIPO := '';
  FCEP := '';
  FBAIRRO := '';
end;

function TCliente.MostraProximoID: integer;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    lQuery.Connection := dtmconexao.FDConnection;
    lQuery.Close;
    lQuery.sql.Clear;
    lQuery.sql.Add(' SELECT gen_id(gen_cliente_id, 0)+1 codigo from CLIENTE');
    lQuery.Open;
    Result := lQuery.FieldByName('codigo').AsInteger;
  finally
    lQuery.Free;
  end;
end;

class function TCliente.ValidaCEP(pCEP: string): boolean;
var
  lQuery: Tfdquery;
begin
  lQuery := Tfdquery.Create(nil);
  try
    if Length(pCEP) < 8 then
    begin
      Result := false;
    end
    else
    begin
      Result := true;
    end;

  finally
    lQuery.Free;
  end;
end;

class function TCliente.ValidaCNPJ(pCNPJ: string): boolean;
var
  aDig: array [1 .. 14] of Byte; // array q armazena os valores do Cadastro
  i, Resto: Byte;
  DV1, DV2: Byte;

  Total1, Total2: integer;

  lQuery: Tfdquery;

begin
  lQuery := Tfdquery.Create(nil);
  try
    Result := false;
    if Length(trim(pCNPJ)) = 14 then
    begin
      for i := 1 to 14 do
        try
          aDig[i] := StrToInt(pCNPJ[i]);
        except
          aDig[i] := 0;
        end;
      Total1 := aDig[1] * 5 + aDig[2] * 4 + aDig[3] * 3 + aDig[4] * 2 + aDig[5]
        * 9 + aDig[6] * 8 + aDig[7] * 7 + aDig[8] * 6 + aDig[9] * 5 + aDig[10] *
        4 + aDig[11] * 3 + aDig[12] * 2;
      Resto := Total1 mod 11;
      if Resto > 1 then
        DV1 := 11 - Resto
      else
        DV1 := 0;
      Total2 := aDig[1] * 6 + aDig[2] * 5 + aDig[3] * 4 + aDig[4] * 3 + aDig[5]
        * 2 + aDig[6] * 9 + aDig[7] * 8 + aDig[8] * 7 + aDig[9] * 6 + aDig[10] *
        5 + aDig[11] * 4 + aDig[12] * 3 + DV1 * 2;
      Resto := Total2 mod 11;
      if Resto > 1 then
        DV2 := 11 - Resto
      else
        DV2 := 0;
      if (DV1 = aDig[13]) and (DV2 = aDig[14]) then
        Result := true;
    end;

  finally
    lQuery.Free;
  end;

end;

class function TCliente.ValidaCPF(pCPF: string): boolean;
var
  i, a, Numero, Resto: Byte;
  DV1, DV2: Byte;
  Total, Soma: integer;
  res: string;

  lQuery: Tfdquery;

begin
  lQuery := Tfdquery.Create(nil);
  try
    Result := false;
    if Length(trim(pCPF)) = 11 then
    begin

      // N�o digitar 11 numeros iguais
      for a := 0 to 9 do // percorre os nr iguais
      begin
        res := '';
        for i := 1 to 11 do // repete o nr para formar o CPF igual
          res := res + IntToStr(a);
        if pCPF = res then // se o CPF for igual os nr repetido cai fora
        begin
          Result := false;
          Exit;
        end;
      end;
      // fim n�o digitar nr iguais

      Total := 0;
      Soma := 0;
      for i := 1 to 9 do
      begin
        try
          Numero := StrToInt(pCPF[i]);
        except
          Numero := 0;
        end;
        Total := Total + (Numero * (11 - i));
        Soma := Soma + Numero;
      end;
      Resto := Total mod 11;
      if Resto > 1 then
        DV1 := 11 - Resto
      else
        DV1 := 0;
      Total := Total + Soma + 2 * DV1;
      Resto := Total mod 11;
      if Resto > 1 then
        DV2 := 11 - Resto
      else
        DV2 := 0;
      if (IntToStr(DV1) = pCPF[10]) and (IntToStr(DV2) = pCPF[11]) then
        Result := true;
    end;

  finally
    lQuery.Free;
  end;

end;

end.
