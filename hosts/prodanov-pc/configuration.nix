{ config, lib, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../../modules/users/nprodanov.nix
      ../../modules/desktops/cinnamon.nix
  ];

  networking.hostName = "prodanov-pc";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
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