unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.DataSet,
  FireDAC.Comp.BatchMove.SQL, JvWizard, JvWizardRouteMapNodes, JvExControls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uJobSincronismo;

type
  TfrmMain = class(TForm)
    Button2: TButton;
    JvWizard1: TJvWizard;
    pageWelcome: TJvWizardInteriorPage;
    pageServer: TJvWizardInteriorPage;
    routeNodes: TJvWizardRouteMapNodes;
    pageTerminal: TJvWizardInteriorPage;
    pageStart: TJvWizardInteriorPage;
    Memo1: TMemo;
    Label1: TLabel;
    edtDriver: TEdit;
    edtCaminhoDB: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1CODIGO: TIntegerField;
    ClientDataSet1NOME: TStringField;
    ClientDataSet1IP: TStringField;
    ClientDataSet1PATHDB: TStringField;
    ClientDataSet1USUARIO: TStringField;
    ClientDataSet1SENHA: TStringField;
    Label3: TLabel;
    edtSenha: TEdit;
    Label4: TLabel;
    edtUsuario: TEdit;
    DataSource1: TDataSource;
    TrayIcon1: TTrayIcon;
    pageTables: TJvWizardInteriorPage;
    memoTables: TMemo;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    procedure Button2Click(Sender: TObject);
    procedure JvWizard1CancelButtonClick(Sender: TObject);
    procedure edtCaminhoDBExit(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure JvWizard1FinishButtonClick(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure LoadIniFIle;
    procedure LoadTerminals;
    procedure Minimizar;
    procedure Maximizar;

    procedure ExecuteSync;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  JvDynControlEngineVcl
  {$IFDEF USE_3RDPARTY_DEVEXPRESS_CXEDITOR}
  ,JvDynControlEngineDevExpcx
  {$ENDIF}
  , uConfigINI, uDAO, uSyncDAO, uJobCarga
  ,  System.Threading
  , StringHelper, ApplicationHelper;

{$R *.dfm}

procedure TfrmMain.Button2Click(Sender: TObject);
var
  dao :TSyncDAO;
  job :TJob;
  params, paramServer :TDadosAcesso;
begin
  paramServer.Servidor := ConfigINI.AcessoBanco.Servidor;
  paramServer.Caminho := ConfigINI.AcessoBanco.Caminho;
  paramServer.Usuario := ConfigINI.AcessoBanco.Usuario;
  paramServer.Senha := COnfigINI.AcessoBanco.Senha;

  params.Servidor := ClientDataSet1IP.AsString;
  params.Caminho := ClientDataSet1PATHDB.AsString;
  params.Usuario := ClientDataSet1USUARIO.AsString;
  params.Senha := ClientDataSet1SENHA.AsString;

  dao := TSyncDAO.Create(params);
  job := TJob.Create(Self, paramServer, params, memoTables.Lines);
  TRY
  job.Execute;
  FINALLY
    dao.Free;
    job.Free;
  END;

end;

procedure TfrmMain.edtCaminhoDBExit(Sender: TObject);
begin
  ConfigINI.AcessoBanco.Caminho := edtCaminhoDB.Text;
end;

procedure TfrmMain.edtSenhaExit(Sender: TObject);
begin
  ConfigINI.AcessoBanco.Senha := edtSenha.Text;
end;

procedure TfrmMain.edtUsuarioExit(Sender: TObject);
begin
  ConfigINI.AcessoBanco.Usuario := edtUsuario.Text;
end;

procedure TfrmMain.ExecuteSync;
var
  dao :TSyncDAO;
  job :TJobSync;
  params, paramServer :TDadosAcesso;
begin
  paramServer.Servidor := ConfigINI.AcessoBanco.Servidor;
  paramServer.Caminho := ConfigINI.AcessoBanco.Caminho;
  paramServer.Usuario := ConfigINI.AcessoBanco.Usuario;
  paramServer.Senha := COnfigINI.AcessoBanco.Senha;

  params.Servidor := ClientDataSet1IP.AsString;
  params.Caminho := ClientDataSet1PATHDB.AsString;
  params.Usuario := ClientDataSet1USUARIO.AsString;
  params.Senha := ClientDataSet1SENHA.AsString;

  job := TJobSync.Create(Self, paramServer, params, memoTables.Lines);
  TRY
    job.Execute;
  FINALLY
    job.Free;
  END;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  LoadIniFIle;
  LoadTerminals;
end;

procedure TfrmMain.JvWizard1CancelButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMain.JvWizard1FinishButtonClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    Minimizar;
    timer1.Enabled := true;
  end;

  if RadioGroup1.ItemIndex = 1 then
  begin
    ClientDataSet1.First;
    while not ClientDataSet1.EOF do
    begin
      ExecuteSync;
      ClientDataSet1.Next;
    end;
  end;
end;

procedure TfrmMain.LoadIniFIle;
begin
  edtCaminhoDB.Text := ConfigINI.AcessoBanco.Caminho;
  edtUsuario.Text   := ConfigINI.AcessoBanco.Usuario;
  edtSenha.Text     := ConfigINI.AcessoBanco.Senha;
end;

procedure TfrmMain.LoadTerminals;
begin
  ClientDataSet1.CreateDataSet;

  ClientDataSet1.Append;
  ClientDataSet1CODIGO.AsInteger := 1;
  ClientDataSet1NOME.AsString := 'TERMINAL1';
  ClientDataSet1IP.AsString := 'LOCALHOST';
  ClientDataSet1PATHDB.AsString := 'C:\Temp\teste1.fdb';
  ClientDataSet1USUARIO.AsString := 'SYSDBA';
  ClientDataSet1SENHA.AsString := 'masterkey';
  ClientDataSet1.Post;

  ClientDataSet1.Append;
  ClientDataSet1CODIGO.AsInteger := 2;
  ClientDataSet1NOME.AsString := 'TERMINAL2';
  ClientDataSet1IP.AsString := 'LOCALHOST';
  ClientDataSet1PATHDB.AsString := 'C:\Temp\teste2.fdb';
  ClientDataSet1USUARIO.AsString := 'SYSDBA';
  ClientDataSet1SENHA.AsString := 'masterkey';
  ClientDataSet1.Post;

end;

procedure TfrmMain.Maximizar;
begin
  TrayIcon1.Visible := False;
  Self.Show;
  Self.WindowState := wsNormal;
  Application.BringToFront;
end;

procedure TfrmMain.Minimizar;
begin
  Self.Hide;
  Self.WindowState := wsMinimized;
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  ClientDataSet1.First;
  while not ClientDataSet1.EOF do
  begin
    ExecuteSync;
    ClientDataSet1.Next;
  end;
end;

procedure TfrmMain.TrayIcon1DblClick(Sender: TObject);
begin
  Maximizar;
end;

end.
