unit ufrmControleAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmControleAcesso = class(TForm)
    sbRodapeLogin: TStatusBar;
    imgLogin: TImage;
    imgEdts: TImageList;
    lbUser: TLabel;
    lbSenha: TLabel;
    lbFuncao: TLabel;
    edtUser: TButtonedEdit;
    edtPass: TButtonedEdit;
    cbxFuncao: TComboBox;
    btnCancelar: TBitBtn;
    btnLogar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLogarClick(Sender: TObject);
    procedure sbRodapeLoginDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure edtUserChange(Sender: TObject);
  private
    procedure Logar;
  public
    { Public declarations }
  end;

var
  frmControleAcesso: TfrmControleAcesso;
const
  msg = 'Campo Obrigatório!';
  erro = 'Usuário, Senha ou Função inválidos!';

implementation

{$R *.dfm}

uses ufrmPrincipal, udmLogin, udmFuncionario;

procedure TfrmControleAcesso.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmControleAcesso.btnLogarClick(Sender: TObject);
begin
  Logar;
end;

procedure TfrmControleAcesso.edtUserChange(Sender: TObject);
begin
  if Length(edtUser.Text) = 0 then
  begin
    sbRodapeLogin.Panels.Items[0].Text := EmptyStr;
  end
  else
  begin
    abort;
  end;
end;

procedure TfrmControleAcesso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmControleAcesso.Logar;
begin
  if ((edtUser.Text = EmptyStr) or (edtPass.Text = EmptyStr) or (cbxFuncao.Text = EmptyStr)) then
  begin
    edtUser.TextHint := msg;
    edtPass.TextHint := msg;
    cbxFuncao.TextHint := msg;
  end
  else
  begin
    with dmFuncionario.zqrVerificaSituacao do
    begin
      Close;
      Params[0].AsString := edtUser.Text;
      Params[1].AsString := cbxFuncao.Text;
      Open;

      if RecordCount > 0 then
      begin
          ShowMessage('Usuário inativo,contate o administrador!');
          edtUser.Clear;
          edtPass.Clear;
          cbxFuncao.ItemIndex := -1;
      end
      else
      begin
          with dmLogin.zqrLogin do
          begin
            Close;
            Params[0].AsString := edtUser.Text;
            Params[1].AsString := edtPass.Text;
            Params[2].AsString := cbxFuncao.Text;
            Open;

            if RecordCount > 0 then
            begin
              with frmPrincipal do
              begin

                userLogado := true;
                strNome := FieldByName('f_nome').Value;
                strFuncao := FieldByName('f_funcao').Value;

                Enabled := true;

                mMenuTopoArquivo.Visible := True;
                mMenuTopoRelatorios.Visible := True;
                mMenuTopoAjuda.Visible := true;

                tbAcessoRapido.Visible := true;

                imgBackgroundPrincipal.Visible := true;

                sbRodapePrincipal.Visible := true;

                frmControleAcesso.Hide;
              end;
            end
            else
            begin
              sbRodapeLogin.Panels.Items[0].Text := erro;
              edtUser.SetFocus;
            end;
        end; //fim do zqrLogin
      end;
    end; // fim do zqrVerificaSituacao

  end;

end;

procedure TfrmControleAcesso.sbRodapeLoginDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with sbRodapeLogin.Canvas do
  begin
    if Panel.Index = 0 then
    begin
      Font.Size := 9;
      Font.Name := 'Verdana';
      Font.Style := [fsBold];
      TextOut(Rect.Left + 55 + Font.Size, Rect.Top + 1, Panel.Text);
    end;
  end;
end;

end.
