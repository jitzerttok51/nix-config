# https://nix.dev/tutorials/packaging-existing-software.html
# Use in flake pkgs.callPackage ./packages/layan-plasma {};
{ stdenv, fetchFromGitHub }: stdenv.mkDerivation {
  pname = "";
  version = "2025-02-13";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = "Layan-kde";
    rev = "2025-02-13";
    sha256 = "";
  };

  installPhase = ''
    echo "$HOME"
  '';

  meta = with lib; {
    desription = "";
    homepage = "";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}