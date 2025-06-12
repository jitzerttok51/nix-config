{ config, lib, pkgs, hyprland, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ../../modules/users/nprodanov.nix
      ../../modules/desktops/plasma6.nix
      # ../../modules/desktops/cinnamon.nix
  ];

  networking.hostName = "nprodanov-pc";

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.edk2-uefi-shell.enable = true;
    systemd-boot.windows = {
      "11" = {
        title = "Windows 11";
        efiDeviceHandle = "HD0b";
      };
    };
  };

  time.timeZone = "Europe/Sofia";
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    git
    ffmpeg
    home-manager
    kitty
    nmap
    dnslookup
    libsecret
    git-lfs
  ];

#  services.openssh = {
#    enable = true;
#    settings = {
#      PasswordAuthentication = true;
#    };
#  };

#  virtualisation.virtualbox.host.enable = true;
#  users.extraGroups.vboxusers.members = [ "vmtest" ];

  system.stateVersion = "24.11"; 
}
