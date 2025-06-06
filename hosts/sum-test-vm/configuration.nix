{ config, lib, pkgs, ...}: {

    imports = [
        ./hardware-configuration.nix
        ../../modules/users/vmtest.nix
    ];

    networking.hostName = "sum-test-vm";
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda"; 
    time.timeZone = "Europe/Sofia";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;

    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = true;
        };
    };

    virtualisation.virtualbox.host.enable = true;
    users.extraGroups.vboxusers.members = [ "vmtest" ];

    environment.systemPackages = with pkgs; [
        vim
        zip
        unzip
        git
        home-manager
    ];

    services.xserver = {
        enable = true;
        libinput.enable = true;
        displayManager.lightdm.enable = true;
        desktopManager = {
            cinnamon.enable = true;
        };
        displayManager.defaultSession = "cinnamon";
    };
}