{ config, lib, pkgs, ... }: {

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
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
    kdePackages.kio-extras
  ];
}
