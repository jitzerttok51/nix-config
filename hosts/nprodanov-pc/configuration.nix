{ config, lib, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../../modules/users/nprodanov.nix
      ../../modules/desktops/cinnamon.nix
  ];

  networking.hostName = "nprodanov-pc";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.edk2-uefi-shell.enable = true;
    # systemd-boot.windows = {
    #   "11" = {
    #     title = "Windows 11";
    #     efiDeviceHandle = "HD0b1";
    #   };
    # };
  };

  time.timeZone = "Europe/Sofia";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    git
    ffmpeg
    home-manager
    chromium 
  ];

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
    };
  };

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "vmtest" ];

  system.stateVersion = "24.11"; 
}