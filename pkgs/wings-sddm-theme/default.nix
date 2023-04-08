{ stdenv, fetchFromGitHub }: stdenv.mkDerivation {
  name = "wings-sddm-theme";

  src = fetchFromGitHub {
    owner = "L4ki";
    repo = "Wings-Plasma-Themes";
    rev = "759d32053677b0e19b25eb01681f59c5ffd1430d";
    sha256 = "sha256-9m3na50GnUXOOURgxHytwzulEsoe1v1KTC1QY1XovAo=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -r ./Wings\ SDDM\ Themes/Wings-SDDM $out/share/sddm/themes/wings
  '';
}
