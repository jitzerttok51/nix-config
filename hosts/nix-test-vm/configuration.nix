# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
  ];

  networking.hostName = "mix-test-vm";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; 
  time.timeZone = "Europe/Sofia";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.vmtest = {
    isNormalUser = true;
    home = "/home/vmtest";
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    git
  ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };

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