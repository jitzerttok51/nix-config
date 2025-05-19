{ config, pkgs, mc-sur-plasma, ...}: {
    programs.plasma = {
    panels = [
      {
        location = "bottom";
        alignment = "center";
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
          {
            name = "com.github.antroids.application-title-bar";
            config = {
              ConfigDialog = {
                DialogHeight = 540;
                DialogWidth = 720;
              };
              Appearance = {
                widgetButtonsAuroraeTheme = "McSur-light";
                widgetButtonsIconsTheme = "Oxygen";
                widgetElements = "windowTitle";
                windowTitleFontBold = false;
                windowTitleMarginsLeft = 20;
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          {
            name = "org.kde.windowbuttons";
            config = {
              ConfigDialog = {
                DialogHeight = 540;
                DialogWidth = 720;
              };

              General = {
                buttons = "3|4|5|10|2|9";
                containmentType = "Plasma";
                perScreenActive = true;
                selectedPlugin = "org.kde.kwin.aurorae";
                selectedScheme = "${mc-sur-plasma}/share/color-schemes/McSurDark.colors";
                selectedTheme = "__aurorae__svg__McSur-dark";
                useCurrentDecoration = false;
                visibility = "ActiveMaximizedWindow";
              };
            };
          }
          {
            name = "org.kde.plasma.digitalclock";
            config = {
              General = {
                autoFontAndSize=false;
                fontFamily="DejaVu Sans";
                fontStyleName="Condensed";
                fontWeight=400;
                showDate=false;
              };
            };
          }
        ];
      }
    ];
  };
}
