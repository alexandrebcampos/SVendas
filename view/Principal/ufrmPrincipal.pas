unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.ToolWin;

type
  TfrmPrincipal = class(TForm)
    sbRodapePrincipal: TStatusBar;
    tPrincipal: TTimer;
    mMenuTopoPrincipal: TMainMenu;
    acListMenu: TActionList;
    imgList48: TImageList;
    imgList20: TImageList;
    imgBackgroundPrincipal: TImage;
    acCadCliente: TAction;
    acCadFuncionario: TAction;
    acCadFornecedor: TAction;
    acCadProduto: TAction;
    acVenda: TAction;
    acLogout: TAction;
    acSair: TAction;
    acRelClientes: TAction;
    acRelFuncionarios: TAction;
    acRelProdutos: TAction;
    acRelVendas: TAction;
    acSobre: TAction;
    acManual: TAction;
    mMenuTopoArquivo: TMenuItem;
    Cadastros1: TMenuItem;
    Venda1: TMenuItem;
    N1: TMenuItem;
    Logout1: TMenuItem;
    Sair1: TMenuItem;
    mMenuTopoRelatorios: TMenuItem;
    Clientes1: TMenuItem;
    Funcionrios1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    mMenuTopoAjuda: TMenuItem;
    Sobre1: TMenuItem;
    Manual1: TMenuItem;
    Cliente1: TMenuItem;
    Funcionrio1: TMenuItem;
    Fornecedor1: TMenuItem;
    Produto1: TMenuItem;
    tbAcessoRapido: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    procedure acCadClienteExecute(Sender: TObject);
    procedure acCadFuncionarioExecute(Sender: TObject);
    procedure acCadFornecedorExecute(Sender: TObject);
    procedure acCadProdutoExecute(Sender: TObject);
    procedure acVendaExecute(Sender: TObject);
    procedure acLogoutExecute(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acRelClientesExecute(Sender: TObject);
    procedure acRelFuncionariosExecute(Sender: TObject);
    procedure acRelProdutosExecute(Sender: TObject);
    procedure acRelVendasExecute(Sender: TObject);
    procedure acSobreExecute(Sender: TObject);
    procedure acManualExecute(Sender: TObject);
    procedure tPrincipalTimer(Sender: TObject);
    procedure sbRodapePrincipalDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure Deslogar;
    procedure CloseForm;
  public
    var strNome, strFuncao : string;
    var userLogado : Boolean;
    procedure abreForm(Classe : TFormClass);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses udmLogin, ufrmControleAcesso, ufrmCadCliente, ufrmCadFuncionario,
  ufrmCadFornecedor, ufrmSobre;

procedure TfrmPrincipal.abreForm(Classe: TFormClass);
var
	I : Integer;
begin

	for I := 0 to MDIChildCount -1 do
	begin
		if MDIChildren[I] is Classe then
		begin
			if MDIChildren[i].WindowState = wsMinimized then
			begin
				MDIChildren[i].WindowState := wsNormal;
			end;

			MDIChildren[i].BringToFront;
			MDIChildren[i].SetFocus;
			Exit;
		end;
	end;

	Classe.Create(Application);
end;

procedure TfrmPrincipal.acCadClienteExecute(Sender: TObject);
begin
  abreForm(TfrmCadCliente);
end;

procedure TfrmPrincipal.acCadFornecedorExecute(Sender: TObject);
begin
 abreForm(TfrmCadFornecedor);
end;

procedure TfrmPrincipal.acCadFuncionarioExecute(Sender: TObject);
begin
  abreForm(TfrmCadFuncionario);
end;

procedure TfrmPrincipal.acCadProdutoExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.acLogoutExecute(Sender: TObject);
begin
 Deslogar;
end;

procedure TfrmPrincipal.acManualExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.acRelClientesExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.acRelFuncionariosExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.acRelProdutosExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.acRelVendasExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.acSairExecute(Sender: TObject);
begin
 CloseForm;
end;

procedure TfrmPrincipal.acSobreExecute(Sender: TObject);
begin
 abreForm(TfrmSobre);
end;

procedure TfrmPrincipal.acVendaExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.CloseForm;
begin
  if MessageBox(Application.Handle, Pchar('Deseja realmente sair do software?'), Pchar('Confirmação de Sair'), MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    Application.Terminate;
  end
  else
  begin
    Abort;
  end;
end;

procedure TfrmPrincipal.Deslogar;
begin
  if MessageBox(Application.Handle, Pchar('Deseja mesmo trocar de usuário?'), Pchar('Confirmação Trocar de Usuário'), MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    with dmLogin.zqrLogin do
    begin
      Close;
      strNome := EmptyStr;
      strFuncao := EmptyStr;
      userLogado := False;

      Enabled := False;

      mMenuTopoArquivo.Visible := False;
      mMenuTopoRelatorios.Visible := False;
      mMenuTopoAjuda.Visible := False;

      tbAcessoRapido.Visible := False;

      imgBackgroundPrincipal.Visible := False;

      sbRodapePrincipal.Visible := False;

      frmControleAcesso.Show;
      frmControleAcesso.edtUser.Clear;
      frmControleAcesso.edtPass.Clear;
      frmControleAcesso.cbxFuncao.ItemIndex := -1;

      frmControleAcesso.edtUser.TextHint := EmptyStr;
      frmControleAcesso.edtPass.TextHint := EmptyStr;
      frmControleAcesso.cbxFuncao.TextHint := EmptyStr;
      frmControleAcesso.edtUser.SetFocus;
    end;
  end
  else
  begin
    Abort;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseForm;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmControleAcesso := TfrmControleAcesso.Create(nil);
  frmControleAcesso.Show;
end;

procedure TfrmPrincipal.sbRodapePrincipalDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with sbRodapePrincipal.Canvas do
  begin
    if Panel.Index = 0 then
    begin
      Font.Size := 9;
      Font.Name := 'Verdana';
      Font.Style := [fsBold];
      TextOut(Rect.Left + 90 + Font.Size, Rect.Top + 1, Panel.Text);
    end;
    if Panel.Index = 1 then
    begin
      Font.Size := 10;
      Font.Name := 'Verdana';
      Font.Style := [fsBold];
      TextOut(Rect.Left + 40 + Font.Size, Rect.Top + 1, Panel.Text);
    end;
    if Panel.Index = 2 then
    begin
      Font.Size := 9;
      Font.Name := 'Verdana';
      Font.Style := [fsBold];
      TextOut(Rect.Left + 255 + Font.Size, Rect.Top + 1, Panel.Text);
    end;
  end;
end;

procedure TfrmPrincipal.tPrincipalTimer(Sender: TObject);
begin
   sbRodapePrincipal.Panels.Items[0].Text := '.:: SV - Sistema de Vendas: Seja bem-vindo ::.';
   sbRodapePrincipal.Panels.Items[1].Text := 'Funcionário: ' + strNome + ' - Função: ' + strFuncao ;
   sbRodapePrincipal.Panels.Items[2].Text := 'Data.: ' + DateToStr(now) + ' - Hora.: ' + TimeToStr(now);
end;

end.
