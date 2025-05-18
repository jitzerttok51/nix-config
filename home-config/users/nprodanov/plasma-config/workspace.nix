{ config, pkgs, ...}: {
    programs.plasma = {
    enable = true;
    overrideConfig = true;
    workspace = {
      colorScheme = "Layan";
      windowDecorations.library="org.kde.kwin.aurorae";
      windowDecorations.theme="__aurorae__svg__McSur-dark";
      splashScreen.theme = "Noir-Splash-6";
      theme = "McSur-dark";
      clickItemTo = "select";
      cursor.theme = "Breeze_Light"; # WinSur-dark-cursors
      iconTheme = "Papirus-Dark";
      wallpaper =
        "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/DarkestHour/";
    };
  };
}
