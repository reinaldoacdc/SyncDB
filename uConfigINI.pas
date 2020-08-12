unit uConfigINI;

interface

uses Classes, SysUtils, IniFiles, ConfigINI.AcessoDados;

type

  TConfigIni = Class(TIniFile)
      private
        FAcessoBanco :TConfigIniAcessoBanco;
    function getAcessoBanco: TConfigIniAcessoBanco;
      public
      published
        property AcessoBanco :TConfigIniAcessoBanco read getAcessoBanco;
  end;

var ConfigINI :TConfigIni;


implementation

{ TConfigIni }

function TConfigIni.getAcessoBanco: TConfigIniAcessoBanco;
begin
  Result := TConfigIniAcessoBanco.Create(Self);
end;

initialization
  ConfigINI := TConfigINI.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

finalization
  FreeAndNil(ConfigINI);

end.
