unit uFormFiltroCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,  uFormFiltroPai, Vcl.Grids, Vcl.DBGrids, uFormCadastroCliente;

type
  TFormFiltroCliente = class(TFormFiltroPai)
    DBGrid1: TDBGrid;
    lblNomeFantasia: TLabel;
    edtNomeFantasia: TEdit;
    lblCpfCnpj: TLabel;
    edtCpfCnpj: TEdit;
    lblIdCliente: TLabel;
    edtIdCliente: TEdit;
    btnNovo: TButton;
    btnVisualizar: TButton;
    lblRazaoSocial: TLabel;
    edtRazaoSocial: TEdit;
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Filtrar;
    procedure ValidarQueryVazia;
  public
    { Public declarations }
  end;

var
  FormFiltroCliente: TFormFiltroCliente;

implementation

{$R *.dfm}
{ TFormFiltroCliente }

procedure TFormFiltroCliente.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  Filtrar;
end;

procedure TFormFiltroCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  FormCadastroCliente := TFormCadastroCliente.Create(Self);
    try
    FormCadastroCliente.fdQryCadastro.Insert;
    FormCadastroCliente.ShowModal;
  finally
    FreeAndNil(FormCadastroCliente);
  end;
end;

procedure TFormFiltroCliente.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  ValidarQueryVazia;
  FormCadastroCliente := TFormCadastroCliente.Create(Self);
    try
    FormCadastroCliente.fdQryCadastro.Locate('ID_CLIENTE', fdQryFiltro.FieldByName('ID_CLIENTE').AsInteger, []);
    FormCadastroCliente.ShowModal;
  finally
    FreeAndNil(FormCadastroCliente);
  end;
end;

procedure TFormFiltroCliente.Filtrar;
begin
  fdQryFiltro.Close;
  fdQryFiltro.SQL.Clear;
  fdQryFiltro.SQL.Add('SELECT * FROM CLIENTE');
  fdQryFiltro.SQL.Add(' WHERE 1 = 1');

  if Trim(edtNome.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM(NOME_CLIENTE)) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtNome.Text)) + '%'));
  end;

  if Trim(edtNomeFantasia.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM(NOME_FANTASIA)) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtNomeFantasia.Text)) + '%'));
  end;

  if Trim(edtRazaoSocial.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM(RAZAO_SOCIAL)) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtRazaoSocial.Text)) + '%'));
  end;

  if Trim(edtCpfCnpj.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM  (REPLACE  (REPLACE  (REPLACE(CPF_CNPJ,''.'', ''''), ''/'', ''''), ''-'', '''') ) ) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtCpfCnpj.Text)) + '%'));
  end;

  if StrToIntDef(edtIdCliente.Text, 0) > 0 then begin
    fdQryFiltro.SQL.Add(' AND ID_CLIENTE = ' + edtIdCliente.Text);
  end;



  fdQryFiltro.Open();
  fdQryFiltro.FetchAll;

end;

procedure TFormFiltroCliente.ValidarQueryVazia;
begin
  if fdQryFiltro.IsEmpty then begin
    ShowMessage('Insira dados para pesquisar um cliente.');
    Abort;
  end;
end;

end.
