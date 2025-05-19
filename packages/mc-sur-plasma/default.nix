# https://nix.dev/tutorials/packaging-existing-software.html
# Use in flake pkgs.callPackage ./packages/layan-plasma {};
{ stdenv, fetchFromGitHub, lib }: stdenv.mkDerivation {
  pname = "mc-sur-plasma";
  version = "2025-03-11";

  src = fetchFromGitHub {
    owner = "yeyushengfan258";
    repo = "McSur-kde";
    rev = "a7a4503ba36848361b7881319809551c41ffa452";
    sha256 = "sha256-yW1HjJzii0JM1O63lvV66ZXZuROB/0LJE0PEJstTEQg="; # Call first time to get hash
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