{ config, lib, pkgs, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../../modules/users/vmtest.nix
      ../../modules/desktops/cinnamon.nix
  ];

  networking.hostName = "nix-test-vm";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda"; 
  time.timeZone = "Europe/Sofia";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    ../../overlays/viber.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    git
    chromium
    # obsidian
    thunderbird
    jetbrains.idea-community
    zulu17
    eclipses.eclipse-jee
    vscode
    qbittorrent
    libreoffice
    # caprine
    caprine-bin
    viber
    xiphos
    mpv
    ffmpeg
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