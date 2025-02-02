unit fRelatorioClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  fRLClienteFortes, dConexao, uCliente;

type
  TfrmRelatorioClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnVisualizar: TButton;
    btnCancelar: TButton;
    rdgTipo: TRadioGroup;
    rdgFiltros: TRadioGroup;
    edtBuscaFiltros: TEdit;
    lblPesquisaFiltro: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgFiltrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioClientes: TfrmRelatorioClientes;

implementation

{$R *.dfm}

procedure TfrmRelatorioClientes.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmRelatorioClientes.btnVisualizarClick(Sender: TObject);
var
  lfrmRelatorioClienteFortes: TfrmRelatorioClienteFortes;
begin
  lfrmRelatorioClienteFortes := TfrmRelatorioClienteFortes.Create(nil);
  try
    lfrmRelatorioClienteFortes.qryRelatorioCliente.close;
    lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Clear;
    lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Add
      ('SELECT * FROM CLIENTE WHERE 1 > 0 ');
    if edtBuscaFiltros.Text <> emptyStr then
    begin
      case rdgFiltros.ItemIndex of
        0:
          begin
            lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Add
              ('and ID LIKE ' + QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
        1:
          begin
            lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Add
              ('AND CIDADE LIKE ' +
              QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
        2:
          begin
            lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Add
              ('AND ENDERECO LIKE ' +
              QuotedStr('%' + edtBuscaFiltros.Text + '%'));
          end;
      end;
    end;
    if (rdgTipo.ItemIndex = 0) then
    begin
      lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Add
        ('AND TIPO =' + QuotedStr('F'));
    end;
    if (rdgTipo.ItemIndex = 1) then
    begin
      lfrmRelatorioClienteFortes.qryRelatorioCliente.SQL.Add
        ('AND TIPO =' + QuotedStr('J'));
    end;
    lfrmRelatorioClienteFortes.qryRelatorioCliente.Open;
    lfrmRelatorioClienteFortes.rlrCliente.Preview;

  finally
    lfrmRelatorioClienteFortes.Free;
  end;

end;

procedure TfrmRelatorioClientes.FormShow(Sender: TObject);
begin
  rdgTipo.ItemIndex := 3;
end;

procedure TfrmRelatorioClientes.rdgFiltrosClick(Sender: TObject);
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
  end;
end;

end.
