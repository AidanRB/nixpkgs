{ buildPecl, curl, fetchFromGitHub, lib, pcre2, php }:

buildPecl rec {
  pname = "ddtrace";
  version = "0.70.0";

  src = fetchFromGitHub {
    owner = "DataDog";
    repo = "dd-trace-php";
    rev = "${version}";
    sha256 = "sha256-AYRBzE0Detg/IHXYutZUfPRMtfthxdkSjqD0M+VcTpY=";
  };

  buildInputs = [ curl pcre2 ];

  meta = with lib; {
    broken = lib.versionOlder php.version "8.1"; # Broken on PHP older than 8.1.
    description = "Datadog Tracing PHP Client";
    homepage = "https://github.com/DataDog/dd-trace-php";
    license = licenses.apsl20;
    maintainers = teams.php.members;
  };
}
