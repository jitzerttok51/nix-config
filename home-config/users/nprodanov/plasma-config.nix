{ config, pkgs, layanPlasma, ...}: {
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
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "";
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnRight" = "IAX";
      "kwinrc"."Desktops"."Number" = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };
    shortcuts = {
      ksmserver = { "Lock Session" = [ "Meta+L" "Screensaver" "Meta+Ctrl+Alt+L" ]; };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+P";
        "Switch Window Up" = "Meta+K";
      };
    };
    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        alignment = "center";
        # extraSettings = "";
        height = 64;
        lengthMode = "fit";
        widgets = [
          "org.kde.plasma.icontasks"
        ];
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
        floating = true;
        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}