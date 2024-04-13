unit uFormFiltroFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,  uFormFiltroPai, Vcl.Grids, Vcl.DBGrids, uFormCadastroFornecedor;

type
  TFormFiltroFornecedor = class(TFormFiltroPai)
    DBGrid1: TDBGrid;
    lblNomeFantasia: TLabel;
    edtNomeFantasia: TEdit;
    lblCnpj: TLabel;
    edtCnpj: TEdit;
    btnNovo: TButton;
    btnVisualizar: TButton;
    lblIdFornecedor: TLabel;
    edtIdFornecedor: TEdit;
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
  FormFiltroFornecedor: TFormFiltroFornecedor;

implementation

{$R *.dfm}

{ TFormFiltroFornecedor }

procedure TFormFiltroFornecedor.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  inherited;
  Filtrar;
end;

procedure TFormFiltroFornecedor.btnNovoClick(Sender: TObject);
begin
  inherited;
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);
    try
    FormCadastroFornecedor.fdQryCadastro.Insert;
    FormCadastroFornecedor.ShowModal;
  finally
    FreeAndNil(FormCadastroFornecedor);
  end;
end;

procedure TFormFiltroFornecedor.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  ValidarQueryVazia;
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);
    try
    FormCadastroFornecedor.fdQryCadastro.Locate('ID_FORNECEDOR', fdQryFiltro.FieldByName('ID_FORNECEDOR').AsInteger, []);
    FormCadastroFornecedor.ShowModal;
  finally
    FreeAndNil(FormCadastroFornecedor);
  end;
end;

procedure TFormFiltroFornecedor.Filtrar;
begin
  fdQryFiltro.Close;
  fdQryFiltro.SQL.Clear;
  fdQryFiltro.SQL.Add('SELECT * FROM FORNECEDOR');
  fdQryFiltro.SQL.Add(' WHERE 1 = 1');

  if Trim(edtNome.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM(RAZAO_SOCIAL)) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtNome.Text)) + '%'));
  end;

  if Trim(edtNomeFantasia.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM(NOME_FANTASIA)) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtNomeFantasia.Text)) + '%'));
  end;

  if Trim(edtCnpj.Text) <> '' then begin
    fdQryFiltro.SQL.Add(' AND UPPER(TRIM  (REPLACE  (REPLACE  (REPLACE(CNPJ,''.'', ''''), ''/'', ''''), ''-'', '''') ) ) LIKE ' + QuotedStr('%' + UpperCase(Trim(edtCnpj.Text)) + '%'));
  end;

  if StrToIntDef(edtIdFornecedor.Text, 0) > 0 then begin
    fdQryFiltro.SQL.Add(' AND ID_FORNECEDOR = ' + edtIdFornecedor.Text);
  end;



  fdQryFiltro.Open();
  fdQryFiltro.FetchAll;
end;

procedure TFormFiltroFornecedor.ValidarQueryVazia;
begin
  if fdQryFiltro.IsEmpty then begin
    ShowMessage('Insira dados para pesquisar um fornecedor.');
    Abort;
  end;
end;

end.
