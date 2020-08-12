unit ConfigINI.Base;

interface

uses IniFiles;

type

  TConfigIniBase = Class(TObject)
    private
      FOwner :TIniFile;
    public
      constructor Create(AOwner :TIniFile);
      property Owner :TIniFile read FOwner;
  end;

implementation

{ TConfigIniBase }

constructor TConfigIniBase.Create(AOwner: TIniFile);
begin
  FOwner := AOwner;
end;


end.
