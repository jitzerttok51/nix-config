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
        hiding = "dodgewindows";
        widgets = [
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:systemsettings.desktop"
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                  "preferred://filemanager"
                  "preferred://browser"
                  "file://${pkgs.vscode}/share/applications/code.desktop"
                ];
              };
            };
          }
        ];
      }
      # Global menu at the top
      {
        location = "top";
        height = 26;
        floating = true;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.windowbuttons"
          # TODO: Figure out how to add this part to config
          /*
          [Containments][439][Applets][454][Configuration][ConfigDialog]
          DialogHeight=540
          DialogWidth=720

          [Containments][439][Applets][454][Configuration][General]
          buttons=3|4|5|10|2|9
          containmentType=Plasma
          perScreenActive=true
          selectedPlugin=org.kde.kwin.aurorae
          selectedScheme=/home/nprodanov/.local/share/color-schemes/McSurDark.colors
          selectedTheme=__aurorae__svg__McSur-dark
          useCurrentDecoration=false
          visibility=ActiveMaximizedWindow
          */
          "org.kde.plasma.digitalclock"
        ];
      }
    ];
  };
}