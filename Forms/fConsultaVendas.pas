unit fConsultaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, dConexao, fVenda, uVenda, uItemVenda;

type
  TfrmConsultaVendas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgConsultarVendas: TDBGrid;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnVisualizar: TButton;
    btnSair: TButton;
    cbxFiltroVenda: TComboBox;
    edtConsultarVendas: TEdit;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtConsultarVendasChange(Sender: TObject);
    procedure cbxFiltroVendaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarQueryVenda;
    procedure ValidaSeUsuarioEstaLiberado(pNivelAcesso: integer);
  end;

var
  frmConsultaVendas: TfrmConsultaVendas;

implementation

{$R *.dfm}

procedure TfrmConsultaVendas.AtualizarQueryVenda;
begin
  begin
    dtmConexao.qryConsultaVendas.close;
    dtmConexao.qryConsultaVendas.SQL.Clear;
    dtmConexao.qryConsultaVendas.SQL.Add
      ('SELECT                              ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('V.ID                                ');
    dtmConexao.qryConsultaVendas.SQL.Add
      (',V.EMISSAO                          ');
    dtmConexao.qryConsultaVendas.SQL.Add
      (',C.NOME                             ');
    dtmConexao.qryConsultaVendas.SQL.Add
      (',VR.NOMEVENDEDOR                    ');
    dtmConexao.qryConsultaVendas.SQL.Add
      (',FP.IDFORMAPAGAMENTO                ');
    dtmConexao.qryConsultaVendas.SQL.Add
      (',V.TOTAL                            ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('FROM VENDA V                        ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('INNER JOIN CLIENTE C                ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('ON V.CLIENTE = C.ID                 ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('INNER JOIN VENDEDOR VR              ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('ON V.VENDEDOR = VR.IDVENDEDOR       ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('INNER JOIN FORMAPAGAMENTO FP        ');
    dtmConexao.qryConsultaVendas.SQL.Add
      ('ON V.FORMAPGTO = FP.IDFORMAPAGAMENTO');
    if edtConsultarVendas.Text <> emptyStr then
    begin
      case cbxFiltroVenda.ItemIndex of
        0:
          begin
            dtmConexao.qryConsultaVendas.SQL.Add('WHERE V.ID LIKE ' +
              QuotedStr('%' + edtConsultarVendas.Text + '%'));
          end;
        1:
          begin
            dtmConexao.qryConsultaVendas.SQL.Add('WHERE C.NOME LIKE ' +
              QuotedStr('%' + edtConsultarVendas.Text + '%'));
          end;
      end;
    end;
    dtmConexao.qryConsultaVendas.Open;
  end;
end;

procedure TfrmConsultaVendas.btnExcluirClick(Sender: TObject);

begin
  if dtmConexao.qryConsultaVendas.RecordCount > 0 then
  begin
    TVenda.Existe(dtmConexao.qryConsultaVendas.FieldByName('ID').AsInteger);
    TVenda.ObjetoBusca.Excluir(true);
    AtualizarQueryVenda;
  end;

end;

procedure TfrmConsultaVendas.btnIncluirClick(Sender: TObject);
var
  lFormulario: TfrmVenda;
begin
  lFormulario := TfrmVenda.Create(nil);
  try
    lFormulario.ShowModal;
  finally
    lFormulario.Free;
  end;
end;

procedure TfrmConsultaVendas.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaVendas.cbxFiltroVendaChange(Sender: TObject);
begin
  case cbxFiltroVenda.ItemIndex of
    0:
      begin
        edtConsultarVendas.NumbersOnly := true;
        edtConsultarVendas.Clear;
      end;
    1:
      begin
        edtConsultarVendas.NumbersOnly := false;
        edtConsultarVendas.Clear;
      end;
  end;
end;

procedure TfrmConsultaVendas.edtConsultarVendasChange(Sender: TObject);
begin
  AtualizarQueryVenda;
end;

procedure TfrmConsultaVendas.FormShow(Sender: TObject);
begin
  WindowState := wsMaximized;
  AtualizarQueryVenda;
end;

procedure TfrmConsultaVendas.ValidaSeUsuarioEstaLiberado(pNivelAcesso: integer);
begin
  if pNivelAcesso < 90 then
  begin
    btnIncluir.Enabled := false;
    btnExcluir.Enabled := false;
  end;
end;

end.
