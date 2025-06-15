{ config, pkgs, ...}: let 
  variant = "macchiato";     
  accent = "mauve";   
  kvantum-machiato = (pkgs.catppuccin-kvantum.override {     
      inherit variant accent;
  });
in
{
    qt.style.name = "kvantum";

    home.packages = with pkgs; [

    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.kmailtransport

    kdePackages.elisa
    kdePackages.bluedevil
    kdePackages.bluez-qt
    kdePackages.kdeconnect-kde
    redshift-plasma-applet
    redshift
    kdePackages.kdeplasma-addons
    kdePackages.plasma-nm
    kdePackages.plasma-pa
    kdePackages.plasma-browser-integration
    layan-cursors
    catppuccin-kde
    (catppuccin-kde.override {     
      flavour = [ variant ];     
      accents = [ accent ];   
    })
  ];

    programs.plasma = {

    workspace = {
      colorScheme = "CatppuccinFrappeBlue";
      windowDecorations.library="org.kde.kwin.aurorae";
      windowDecorations.theme="__aurorae__svg__CatppuccinMacchiato-Modern";
      splashScreen.theme = "Noir-Splash-6";
      theme = "McSur-dark";
      clickItemTo = "select";
      cursor.theme = "layan-cursors-white"; # WinSur-dark-cursors
      iconTheme = "Papirus-Dark";
      wallpaper =
        "${pkgs.kdePackages.plasma-workspace-wallpapers}share/wallpapers/MilkyWay/";
    };

    configFile = {
      auroraerc = {
        "CatppuccinMacchiato-Modern".ButtonSize = 0;
      };
      kwinrc = {
        "org.kde.kdecoration2"."ButtonsOnLeft" = "";
        "org.kde.kdecoration2"."ButtonsOnRight" = "IAX";
        "Windows"."BorderlessMaximizedWindows" = true;
      };
      kdeglobals = {
        General.TerminalApplication = "kitty";
        General.TerminalService = "kitty.desktop";
        KDE.widgetStyle = "kvantum-dark";
      };
    };
  };

  home.file = {
    ".icons/layan-cursors-white/".source = "${pkgs.layan-cursors}/share/icons/layan-cursors-white/";
    ".config/Kvantum/catppuccin-${variant}-${accent}".source = "${kvantum-machiato}/share/Kvantum/catppuccin-${variant}-${accent}/";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum-config" {
    General.theme = "catppuccin-${variant}-${accent}";
  };
}
