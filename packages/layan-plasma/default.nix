# https://nix.dev/tutorials/packaging-existing-software.html
# Use in flake pkgs.callPackage ./packages/layan-plasma {};
{ stdenv, fetchFromGitHub, lib }: stdenv.mkDerivation {
  pname = "layan-plasma";
  version = "2025-02-13";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = "Layan-kde";
    rev = "2025-02-13";
    sha256 = "sha256-T69bGjfZeOsJLmOZKps9N2wMv5VKYeo1ipGEsLAS+Sg="; # Call first time to get hash
  };

  installPhase = ''
    mkdir -p $out/.local/share
    export HOME=$out
    unset name
    bash -x install.sh
  '';

  meta = with lib; {
    desription = "";
    homepage = "";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}