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
      workspace = {
        wallpaper =
          "${pkgs.kdePackages.plasma-workspace-wallpapers}share/wallpapers/MilkyWay/";
      };

      configFile = {
        kdeglobals = {
          General.TerminalApplication = "kitty";
          General.TerminalService = "kitty.desktop";
        };
      };
  };
}
