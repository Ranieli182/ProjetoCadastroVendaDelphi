unit fRelatorioProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, dConexao,
  uProduto, fRLProdutoFortes;

type
  TfrmRelatorioProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnVisualizar: TButton;
    btnCancelar: TButton;
    rdgFiltros: TRadioGroup;
    edtBuscaFiltros: TEdit;
    lblPesquisaFiltro: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure rdgFiltrosClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioProdutos: TfrmRelatorioProdutos;

implementation

{$R *.dfm}

procedure TfrmRelatorioProdutos.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelatorioProdutos.btnVisualizarClick(Sender: TObject);
var
  lfrmRelatorioProdutoFortes: TfrmRelatorioProdutoFortes;
begin
  lfrmRelatorioProdutoFortes := TfrmRelatorioProdutoFortes.Create(nil);
  try
    lfrmRelatorioProdutoFortes.qryRelatorioProduto.close;
    lfrmRelatorioProdutoFortes.qryRelatorioProduto.SQL.Clear;
    lfrmRelatorioProdutoFortes.qryRelatorioProduto.SQL.Add
      ('SELECT * FROM PRODUTO WHERE 1 > 0 ');
    if edtBuscaFiltros.Text <> emptyStr then
    begin
      case rdgFiltros.ItemIndex of
        0:
          begin
            lfrmRelatorioProdutoFortes.qryRelatorioProduto.SQL.Add
              ('and ID LIKE ' + QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
        1:
          begin
            lfrmRelatorioProdutoFortes.qryRelatorioProduto.SQL.Add
              ('AND DESCRICAO LIKE ' +
              QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
        2:
          begin
            lfrmRelatorioProdutoFortes.qryRelatorioProduto.SQL.Add
              ('AND MARCA LIKE ' +
              QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
        3:
          begin
            lfrmRelatorioProdutoFortes.qryRelatorioProduto.SQL.Add
              ('AND REFERENCIA LIKE ' +
              QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
      end;
    end;
    lfrmRelatorioProdutoFortes.qryRelatorioProduto.Open;
    lfrmRelatorioProdutoFortes.rlrProduto.Preview;

  finally
    lfrmRelatorioProdutoFortes.Free;
  end;

end;

procedure TfrmRelatorioProdutos.rdgFiltrosClick(Sender: TObject);
begin
  case rdgFiltros.ItemIndex of
    0:
      begin
        edtBuscaFiltros.NumbersOnly := true;
        edtBuscaFiltros.Clear;
        edtBuscaFiltros.SetFocus;
      end;
    1:
      begin
        edtBuscaFiltros.NumbersOnly := false;
        edtBuscaFiltros.Clear;
        edtBuscaFiltros.SetFocus;
      end;
    2:
      begin
        edtBuscaFiltros.NumbersOnly := false;
        edtBuscaFiltros.Clear;
        edtBuscaFiltros.SetFocus;
      end;
    3:
      begin
        edtBuscaFiltros.NumbersOnly := false;
        edtBuscaFiltros.Clear;
        edtBuscaFiltros.SetFocus;
      end;
  end;
end;

end.
