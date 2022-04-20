unit fRLClienteFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelatorioClienteFortes = class(TForm)
    rlrCliente: TRLReport;
    rlbCabecalho: TRLBand;
    rlbTitulo: TRLBand;
    rlbColunas: TRLBand;
    rlbDetalhes: TRLBand;
    rlbRodape: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    lblTitulo: TRLLabel;
    lblCódigo: TRLLabel;
    lblNome: TRLLabel;
    lblCPFCNPJ: TRLLabel;
    lblCidade: TRLLabel;
    lblEndereco: TRLLabel;
    lblBairro: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    txtCPFCNPJ: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    qryRelatorioCliente: TFDQuery;
    dtsRelatorioCliente: TDataSource;
    RLLabel1: TRLLabel;
    procedure txtCPFCNPJBeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure VerificaCPFCNPJ;
  end;

var
  frmRelatorioClienteFortes: TfrmRelatorioClienteFortes;

implementation

{$R *.dfm}
{ TfrmRelatorioClienteFortes }

procedure TfrmRelatorioClienteFortes.txtCPFCNPJBeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  VerificaCPFCNPJ;
end;

procedure TfrmRelatorioClienteFortes.VerificaCPFCNPJ;
begin
  if qryRelatorioCliente.FieldByName('TIPO').AsString = 'F' then
  begin
    txtCPFCNPJ.Text := qryRelatorioCliente.FieldByName('CPF').AsString;
  end
  else if qryRelatorioCliente.FieldByName('TIPO').AsString = 'J' then
  begin
    txtCPFCNPJ.Text := qryRelatorioCliente.FieldByName('CNPJ').AsString;
  end;
end;

end.
