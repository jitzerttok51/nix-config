{ config, pkgs, ...}: {
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
    kdePackages.baloo
  ];

    programs.plasma = {

      powerdevil = {
        AC = {
          autoSuspend.action = "nothing";
          turnOffDisplay.idleTimeout = "never";
        };
      };

      workspace = {
        windowDecorations.library="org.kde.kwin.aurorae";
        windowDecorations.theme="__aurorae__svg__McMojave";
        theme = "Layan";
        colorScheme = "Layan";
        cursor.size = 24;
        cursor.theme = "Breeze_Light";
        iconTheme = "Papirus-Dark";
        splashScreen.theme = "com.github.yeyushengfan258.McSur-dark";
        wallpaperSlideShow = {
          path = ./wallpapers;
          interval = 600;
        };
      };

      kscreenlocker.appearance.wallpaperSlideShow = {
          path = ./wallpapers;
          interval = 300;
      };

      configFile = {
        kdeglobals = {
          General.TerminalApplication = "kitty";
          General.TerminalService = "kitty.desktop";
        };
        kwinrc = {
          "org.kde.kdecoration2"."ButtonsOnLeft" = "";
          "org.kde.kdecoration2"."ButtonsOnRight" = "IAX";
          "Windows"."BorderlessMaximizedWindows" = false;
        };
      };
  };
}
