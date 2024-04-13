unit uFormCadastroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, uFormCadastroPai, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, uLookup;

type
  TFormCadastroFornecedor = class(TFormCadastroPai)

    fdQryCadastroRAZAO_SOCIAL: TWideStringField;
    fdQryCadastroNOME_FANTASIA: TWideStringField;
    fdQryCadastroCNPJ: TWideStringField;
    fdQryCadastroENDERECO: TWideStringField;
    fdQryCadastroBAIRRO: TWideStringField;
    fdQryCadastroID_CIDADE: TIntegerField;
    fdQryCadastroID_ESTADO: TIntegerField;
    fdQryCadastroEMAIL: TWideStringField;
    lblRazaoSocial: TLabel;
    lblNomeFantasia: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblCnpj: TLabel;
    edtRazaoSocial: TDBEdit;
    edtNomeFantasia: TDBEdit;
    edtEndereco: TDBEdit;
    edtBairro: TDBEdit;
    edtCnpj: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    fdQryCadastroID_FORNECEDOR: TFDAutoIncField;
    lblIdFornecedor: TLabel;
    edtIdFornecedor: TDBEdit;
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroFornecedor: TFormCadastroFornecedor;

implementation



{$R *.dfm}

procedure TFormCadastroFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  Lookup.fdQryEstados.Open();
  Lookup.fdQryEstados.FetchAll;

  Lookup.fdQryCidades.Open();
  Lookup.fdQryCidades.FetchAll;

  edtRazaoSocial.SetFocus;
end;

end.
