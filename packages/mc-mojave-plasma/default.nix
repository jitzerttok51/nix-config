# https://nix.dev/tutorials/packaging-existing-software.html
# Use in flake pkgs.callPackage ./packages/layan-plasma {};
{ stdenv, fetchFromGitHub, lib }: stdenv.mkDerivation {
  pname = "mc-mojave-plasma";
  version = "2024-10-20";

  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = "McMojave-kde";
    rev = "2024-10-20";
    sha256 = "sha256-4INopkfRe2g+FJRUW1DDVEP79O9TuLo3W5BSAmMTXSc="; # Call first time to get hash
  };

  installPhase = ''
    mkdir -p $out/.local/share
    export HOME=$out
    unset name
    bash -x install.sh
    mv $out/.local/* $out/
    mv $out/.config/* $out/
    rm -rf $out/.local
    rm -rf $out/.config
  '';

  meta = with lib; {
    desription = "McSur kde is a materia Design theme for KDE Plasma desktop.";
    homepage = "https://github.com/yeyushengfan258/McSur-kde";
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}