program SyncDB;

uses
  Vcl.Forms,
  uConfigINI in 'uConfigINI.pas',
  Unit2 in 'Unit2.pas' {frmMain},
  uJobCarga in 'uJobCarga.pas',
  uSyncDAO in 'uSyncDAO.pas',
  uJobSincronismo in 'uJobSincronismo.pas',
  ApplicationHelper in 'ApplicationHelper.pas',
  StringHelper in 'StringHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
