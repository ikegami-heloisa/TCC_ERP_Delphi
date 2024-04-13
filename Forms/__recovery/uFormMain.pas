unit uFormMain;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, AdvToolBar, AdvToolBarStylers, AdvPreviewMenu,
  AdvPreviewMenuStylers, AdvShapeButton, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvGlowButton;

type
  TFormMain = class(TAdvToolBarForm)
    AdvToolBarPager1: TAdvToolBarPager;
    AdvPage1: TAdvPage;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvOfficeStatusBar1: TAdvOfficeStatusBar;
    AdvOfficeStatusBarOfficeStyler1: TAdvOfficeStatusBarOfficeStyler;
    AdvQuickAccessToolBar1: TAdvQuickAccessToolBar;
    AdvShapeButton1: TAdvShapeButton;
    AdvPage2: TAdvPage;
    AdvPage3: TAdvPage;
    AdvToolBar2: TAdvToolBar;
    AdvToolBar1: TAdvToolBar;
    AdvToolBar3: TAdvToolBar;
    btnCadastrarEstado: TAdvGlowButton;
    AdvToolBarSeparator1: TAdvToolBarSeparator;
    btnCadastrarCliente: TAdvGlowButton;
    AdvToolBarSeparator2: TAdvToolBarSeparator;
    btnCadastrarCidade: TAdvGlowButton;
    AdvToolBar4: TAdvToolBar;
    btnCadastrarFornecedor: TAdvGlowButton;
    AdvToolBarSeparator3: TAdvToolBarSeparator;
    btnCadastrarProduto: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    AdvToolBarSeparator4: TAdvToolBarSeparator;
    AdvGlowButton2: TAdvGlowButton;
    btnFiltrarVenda: TAdvGlowButton;
    AdvToolBarSeparator5: TAdvToolBarSeparator;
    AdvGlowButton3: TAdvGlowButton;
    AdvToolBarSeparator6: TAdvToolBarSeparator;
    AdvToolBarSeparator7: TAdvToolBarSeparator;
    AdvGlowButton4: TAdvGlowButton;
    AdvToolBarSeparator8: TAdvToolBarSeparator;
    AdvToolBar5: TAdvToolBar;
    AdvGlowButton5: TAdvGlowButton;
    AdvGlowButton6: TAdvGlowButton;
    AdvGlowButton7: TAdvGlowButton;
    AdvToolBarSeparator9: TAdvToolBarSeparator;
    procedure btnCadastrarClienteClick(Sender: TObject);
    procedure btnCadastrarCidadeClick(Sender: TObject);
    procedure btnCadastrarEstadoClick(Sender: TObject);
    procedure btnFiltroClienteClick(Sender: TObject);
    procedure btnCadastrarFornecedorClick(Sender: TObject);
    procedure btnFiltrarVendaClick(Sender: TObject);

  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses uFormCadastroCidade, uFormCadastroCliente, uFormCadastroEstado,
uFormFiltroCliente, uFormCadastroFornecedor, uFormFiltroFornecedor;


procedure TFormMain.btnCadastrarEstadoClick(Sender: TObject);
begin
  FormCadastroEstado := TFormCadastroEstado.Create(Self);
  try
    FormCadastroEstado.ShowModal;
  finally
    FreeAndNil(FormCadastroEstado);
  end;
end;

procedure TFormMain.btnCadastrarFornecedorClick(Sender: TObject);
begin
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);
  try
    FormCadastroFornecedor.ShowModal;
  finally
    FreeAndNil(FormCadastroFornecedor);
  end;
end;

procedure TFormMain.btnCadastrarClienteClick(Sender: TObject);
begin
  FormCadastroCliente := TFormCadastroCliente.Create(Self);
    try
    FormCadastroCliente.ShowModal;
  finally
    FreeAndNil(FormCadastroCliente);
  end;
end;

procedure TFormMain.btnCadastrarCidadeClick(Sender: TObject);
begin
  FormCadastroCidade := TFormCadastroCidade.Create(Self);
    try
    FormCadastroCidade.ShowModal;
  finally
    FreeAndNil(FormCadastroCidade);
  end;
end;

procedure TFormMain.btnFiltroClienteClick(Sender: TObject);
begin
  try
    FormFiltroCliente := TFormFiltroCliente.Create(Self);
    FormFiltroCliente.Show;
  finally

  end;
end;


procedure TFormMain.btnFiltrarVendaClick(Sender: TObject);
begin
  try
    FormFiltroFornecedor := TFormFiltroFornecedor.Create(Self);
    FormFiltroFornecedor.Show;
  finally

  end;
end;

end.
