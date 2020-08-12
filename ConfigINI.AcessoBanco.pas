unit ConfigINI.AcessoBanco;

interface

uses ConfigINI.Base;

type
    TConfigIniAcessoBanco = class(TConfigIniBase)
    private
      function getPathDB: String;
      procedure setPathDB(const Value: String);
    function getUsername: String;
    procedure setUsername(const Value: String);
    function getPassword: String;
    procedure setPassword(const Value: String);
    function getServidor: String;
    procedure setServidor(const Value: String);
    public
    published
        property Servidor :String read getServidor write setServidor;
        property Caminho :String read getPathDB write setPathDB;
        property Usuario :String read getUsername write setUsername;
        { TODO : Encrypt get and setter }
        property Senha :String read getPassword write setPassword;
  end;

implementation

{ TConfigIniAcessoBanco }


function TConfigIniAcessoBanco.getPassword: String;
begin
  Result := Owner.ReadString('AcessoBanco', 'Password', '');
end;

function TConfigIniAcessoBanco.getPathDB: String;
begin
  Result := Owner.ReadString('AcessoBanco', 'PathDB', '');
end;

function TConfigIniAcessoBanco.getServidor: String;
begin
  Result := Owner.ReadString('AcessoBanco', 'Servidor', '');
end;

function TConfigIniAcessoBanco.getUsername: String;
begin
  Result := Owner.ReadString('AcessoBanco', 'Username', '');
end;

procedure TConfigIniAcessoBanco.setPassword(const Value: String);
begin
  Owner.WriteString('AcessoBanco', 'Password', Value);
end;

procedure TConfigIniAcessoBanco.setPathDB(const Value: String);
begin
  Owner.WriteString('AcessoBanco', 'PathDB', Value);
end;

procedure TConfigIniAcessoBanco.setServidor(const Value: String);
begin
  Owner.WriteString('AcessoBanco', 'Servidor', Value);
end;

procedure TConfigIniAcessoBanco.setUsername(const Value: String);
begin
  Owner.WriteString('AcessoBanco', 'Username', Value);
end;


end.
