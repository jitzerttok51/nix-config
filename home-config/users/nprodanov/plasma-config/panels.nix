{ config, pkgs, mc-sur-plasma, ...}: {
    programs.plasma = {
    panels = [
      {
        location = "bottom";
        alignment = "center";
        height = 48;
        lengthMode = "fit";
        hiding = "dodgewindows";
        screen = "all";
        widgets = [
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:systemsettings.desktop"
                  "file://${pkgs.vscode}/share/applications/code.desktop"
                  "applications:brave-browser.desktop"
                  "applications:Viber.desktop"
                  "applications:slack.desktop"
                  "applications:proton-pass.desktop"
                  "applications:proton-mail.desktop"
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
        screen = "all";
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
                windowTitleFontSize = 10;
                windowTitleUndefined = "";
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
                "org.kde.plasma.notifications"
                "org.kde.plasma.keyboardlayout"

              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.devicenotifier"
                "org.kde.plasma.cameraindicator"
                "org.kde.plasma.keyboardindicator"
                "org.kde.plasma.clipboard"
                "Proton"
              ];
            };
          }
          {
            name = "org.kde.windowbuttons";
            config = {
              ConfigDialog = {
                DialogHeight = 540;
                DialogWidth = 720;
              };

              General = {
                lengthFirstMargin = 4;
                lengthLastMargin = 4;
                inactiveStateEnabled = true;
                buttonSizePercentage = 50;
                spacing = 8;
                useDecorationMetrics = false;
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
            digitalClock = {
              time.format = "24h";
              font = {
                family = "DejaVu Sans";
                style = "Book";
                weight = 400;
                size = 10;
              };
              settings = {
                General = {
                  autoFontAndSize=false;
                  showDate = false;
                };
              };
            };
          }
          {
            panelSpacer = {
              expanding = false;
              length = 10;
            };
          }
        ];
      }
    ];
  };
}
