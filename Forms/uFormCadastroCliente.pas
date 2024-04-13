unit uFormCadastroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uFormCadastroPai, Vcl.Mask, Vcl.DBCtrls, uLookup;

type
  TFormCadastroCliente = class(TFormCadastroPai)
    fdQryCadastroID_CLIENTE: TIntegerField;
    fdQryCadastroRAZAO_SOCIAL: TWideStringField;
    fdQryCadastroNOME_FANTASIA: TWideStringField;
    fdQryCadastroCPF_CNPJ: TWideStringField;
    fdQryCadastroTIPO_FJ: TWideStringField;
    fdQryCadastroNOME: TWideStringField;
    fdQryCadastroTELEFONE: TWideStringField;
    fdQryCadastroCELULAR: TWideStringField;
    fdQryCadastroEMAIL: TWideStringField;
    fdQryCadastroENDERECO: TWideStringField;
    fdQryCadastroNUMERO: TWideStringField;
    fdQryCadastroCOMPLEMENTO: TWideStringField;
    fdQryCadastroBAIRRO: TWideStringField;
    fdQryCadastroIE: TWideStringField;
    fdQryCadastroIM: TWideStringField;
    fdQryCadastroDT_EXCLUIDO: TDateField;
    lblIdCliente: TLabel;
    edtIdCliente: TDBEdit;
    lblRazaoSocial: TLabel;
    edtRazaoSocial: TDBEdit;
    lblNomeFantasia: TLabel;
    edtNomeFantasia: TDBEdit;
    lblTipoFJ: TLabel;
    lblNome: TLabel;
    edtNome: TDBEdit;
    lblCpfCnpj: TLabel;
    edtCpfCnpj: TDBEdit;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    edtTipoFJ: TDBComboBox;
    lblCelular: TLabel;
    edtCelular: TDBEdit;
    lblEmail: TLabel;
    edtEmail: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblNumero: TLabel;
    edtNumero: TDBEdit;
    lblComplemento: TLabel;
    edtComplemento: TDBEdit;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    lblIe: TLabel;
    edtIe: TDBEdit;
    lblIm: TLabel;
    edtIm: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBLookupComboBox;
    lblEstado: TLabel;
    edtEstado: TDBLookupComboBox;


    procedure FormShow(Sender: TObject);
    procedure fdQryCadastroBeforeInsert(DataSet: TDataSet);
    procedure fdQryCadastroBeforeEdit(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroCliente: TFormCadastroCliente;

implementation

{$R *.dfm}

procedure TFormCadastroCliente.fdQryCadastroBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if Self.Visible then
    edtRazaoSocial.SetFocus;
end;

procedure TFormCadastroCliente.fdQryCadastroBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if Self.Visible then
    edtRazaoSocial.SetFocus;
end;

procedure TFormCadastroCliente.FormShow(Sender: TObject);
begin
  inherited;
  Lookup.fdQryEstados.Open();
  Lookup.fdQryEstados.FetchAll;

  Lookup.fdQryCidades.Open();
  Lookup.fdQryCidades.FetchAll;

  edtRazaoSocial.SetFocus;
end;

end.
