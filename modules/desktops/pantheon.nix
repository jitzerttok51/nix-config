{ config, lib, pkgs, ... }: {

  services.xserver = {
    enable = true;
    desktopManager.pantheon.enable = true;
  };
}
