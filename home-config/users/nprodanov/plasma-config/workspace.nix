{ config, pkgs, ...}: {
    qt.style.name = "kvantum";

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
}
