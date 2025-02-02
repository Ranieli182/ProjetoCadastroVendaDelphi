unit fRLProdutoFortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, uProduto;

type
  TfrmRelatorioProdutoFortes = class(TForm)
    qryRelatorioCliente: TFDQuery;
    dtsRelatorioCliente: TDataSource;
    rlrProduto: TRLReport;
    rlbCabecalho: TRLBand;
    rlbTitulo: TRLBand;
    rlbColunas: TRLBand;
    rlbDetalhes: TRLBand;
    rlbRodape: TRLBand;
    lblTitulo: TRLLabel;
    lblCodigo: TRLLabel;
    lblDescricao: TRLLabel;
    lblMarca: TRLLabel;
    RLImage1: TRLImage;
    lblPreco: TRLLabel;
    lblImagem: TRLLabel;
    lblSaldo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel1: TRLLabel;
    qryRelatorioProduto: TFDQuery;
    dtsRelatorioProduto: TDataSource;
    procedure RLImage1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioProdutoFortes: TfrmRelatorioProdutoFortes;

implementation

{$R *.dfm}

procedure TfrmRelatorioProdutoFortes.RLImage1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  lProduto: TProduto;
begin
  lProduto := TProduto.Create;
  lProduto.ID := qryRelatorioProduto.FieldByName('ID').asinteger;
  lProduto.carrega; // aqui carrega propriedades do cliente na classe

  lProduto.CarregaRLImagem(RLImage1);

end;

end.
