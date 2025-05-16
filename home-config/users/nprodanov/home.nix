{ config, pkgs, lib, nix-vscode-extensions, ... }:

{
  imports = [
    ./vscode.nix
    ./plasma-config.nix
    ./shell.nix
    ./git.nix
    ../../../modules/desktops/hyprland.nix
  ];

  programs.home-manager.enable = true;

  home.username = "nprodanov";
  home.homeDirectory = "/home/nprodanov";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # jetbrains.idea-community
    # eclipses.eclipse-jee
    vscode
    yt-dlp
    nixfmt
    # qbittorrent
    # libreoffice
    # caprine
    # caprine-bin
    # viber
    # xiphos
    mpv
    wofi
    # chromium
    # obsidian
    # thunderbird
    zulu17
    neofetch
    bat
    # dconf-editor
  ];

  home.sessionVariables = { EDITOR = "vim"; };

  nixpkgs.overlays = [ (import ../../../overlays/viber.nix) ];

  home.shellAliases = {
    cat = "bat";
    rcat = "cat";
  };

  home.keyboard = {
    layout = "us, bg";
    options = [ "grp:caps_toggle" ];
  };

  /* dconf.settings = {
       "org/gnome/libgnomekbd/keyboard" = {
         layouts = ["us" "bg\tphonetic"];
         options = [ "grp\tgrp:alt_shift_toggle" ];
       };

       "org/cinnamon/desktop/interface" = {
         keyboard-layout-use-upper = true;
       };
     };
  */

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
