{ config, pkgs, mc-sur-plasma, custom-packages, ...}: {
    programs.plasma = {
    panels = [
      {
        location = "bottom";
        alignment = "center";
        height = 44;
        lengthMode = "fill";
        floating = true;
        hiding = "none";
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
          "org.kde.plasma.pager"
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:systemsettings.desktop"
                  "file://${pkgs.vscode}/share/applications/code.desktop"
                  "applications:brave-browser.desktop"
                  "applications:kitty.desktop"
                  "applications:obsidian.desktop"
                  "file://${custom-packages.viber}/share/applications/viber.desktop"
                  "applications:slack.desktop"
                  "applications:proton-pass.desktop"
                  "applications:proton-mail.desktop"
                ];
              };
            };
          }
          "org.kde.plasma.marginsseparator"
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
            digitalClock = {
              time.format = "24h";
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];
  };
}
