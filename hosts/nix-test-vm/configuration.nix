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
    hashedPassword = "$6$O8dxVaB.wkZD4VSy$PqSkgKQunLVqiWXXMk39EwKzZqHBAtQ0mlag.Haj3LqTCrITF2oJMLxnDw7YDkDd7D7Ztvc2Zg95ziX553xMn1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHciq66oygoT3sgZOx5dA7nNK9JgpTqSRiDqVrukz6wQ azuread\\nikolayprodanov@IBM-PW09W916"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    zip
    unzip
    git
  ];

  # services.xserver = {
  #   enable = true;
  #   desktopManager = {
  #     xfce.enable = true;
  #   };
  #   displayManager.defaultSession = "xfce";
  # };

  # services.xserver.enable = true;
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # services.xserver.enable = true;
  # services.displayManager.lightdm.enable = true;
  # services.desktopManager.cinnamon.enable = true;

  # services.xserver = {
  #   enable = true;
  #   desktopManager.pantheon.enable = true;
  # };

  services.xserver = {
		enable = true;
		libinput.enable = true;
		displayManager.lightdm.enable = true;
		desktopManager = {
			cinnamon.enable = true;
		};
		displayManager.defaultSession = "cinnamon";
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