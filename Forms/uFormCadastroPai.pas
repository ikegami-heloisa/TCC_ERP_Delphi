unit uFormCadastroPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TFormCadastroPai = class(TForm)
    pnCabecalho: TPanel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    fdQryCadastro: TFDQuery;
    fdUpdCadastro: TFDUpdateSQL;
    fdTransaction: TFDTransaction;
    dsCadastro: TDataSource;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadastroPai: TFormCadastroPai;

implementation

{$R *.dfm}

procedure TFormCadastroPai.btnNovoClick(Sender: TObject);
begin
  if not (fdQryCadastro.State in [dsEdit, dsInsert]) then begin
    fdQryCadastro.Insert;
  end;

end;

procedure TFormCadastroPai.btnSalvarClick(Sender: TObject);
begin
  if fdQryCadastro.State in [dsEdit, dsInsert] then begin
    fdTransaction.StartTransaction;
    fdQryCadastro.Post;
    fdTransaction.CommitRetaining;
    ShowMessage('Cadastro salvo!');
  end;
end;

procedure TFormCadastroPai.FormCreate(Sender: TObject);
begin
  fdQryCadastro.Open();
end;

procedure TFormCadastroPai.btnCancelarClick(Sender: TObject);
begin
  if fdQryCadastro.State in [dsEdit, dsInsert] then begin
    fdQryCadastro.Cancel;
    fdTransaction.RollbackRetaining;
  end;
end;

procedure TFormCadastroPai.btnExcluirClick(Sender: TObject);
begin
  fdQryCadastro.Edit;
  fdQryCadastro.FieldByName('DT_EXCLUIDO').AsDateTime := Date;
  fdTransaction.StartTransaction;
  fdQryCadastro.Post;
  fdTransaction.CommitRetaining;
end;

procedure TFormCadastroPai.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
