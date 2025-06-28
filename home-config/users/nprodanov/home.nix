{ config, pkgs, lib, ... }:
{
  # TODO: Add support for flatpaks
  imports = [
    ./vscode.nix
    ./nushell.nix
    ./git.nix
    ./other.nix
    ./plasma-config
  ];

  programs.home-manager.enable = true;

  home.username = "nprodanov";
  home.homeDirectory = "/home/nprodanov";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    jetbrains.idea-community
    eclipses.eclipse-jee
    vscode
    yt-dlp
    qbittorrent
    libreoffice
    meld
    protonmail-bridge-gui
    protonmail-desktop
    proton-pass
    # caprine
    # caprine-bin
    xiphos # TODO: Might use another bible app
    # mpv
    # chromium
    obsidian
    thunderbird
    zulu17
    neofetch
    # bat
    slack # TODO: Fix this
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/sl/slack/package.nix
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/release/rpm-build.nix
    # dconf-editor # TODO: Add to cinnamon
    vlc
  ];

  programs.obsidian = {
    enable = true;
    defaultSettings.appearance = {
      nativeMenus = true;
    };
  };

  home.sessionVariables = { EDITOR = "vim"; };

  home.shellAliases = {
    cat = "bat";
    rcat = "cat";
  };

  programs.ssh.matchBlocks = {
    "adguard" = {
      hostname = "192.168.1.10";
      identityFile = "./pi.key";
      user = "pi";
    };
  };

  home.file = {
    ".ssh/pi.key".source = ./pi.key;
  };

  programs.brave.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
