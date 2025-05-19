{ config, pkgs, lib, ... }:

{
  # TODO: Add support for flatpaks
  imports = [
    ./vscode.nix
    ./shell.nix
    ./git.nix
  ];

  programs.home-manager.enable = true;

  home.username = "vmtest";
  home.homeDirectory = "/home/vmtest";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    jetbrains.idea-community
    eclipses.eclipse-jee
    vscode
    yt-dlp
    nixfmt
    libreoffice
    zulu17
    neofetch
    bat
    dconf-editor # TODO: Add to cinnamon
  ];

  home.sessionVariables = { EDITOR = "vim"; };

  # nixpkgs.overlays = [ (import ../../../overlays/viber.nix) ];

  home.shellAliases = {
    cat = "bat";
    rcat = "cat";
  };

  # TODO: Move in another file for cinnamon
  dconf.settings = {
       "org/gnome/libgnomekbd/keyboard" = {
         layouts = ["us" "bg\tphonetic"];
         options = [ "grp\tgrp:alt_shift_toggle" ];
       };

       "org/cinnamon/desktop/interface" = {
         keyboard-layout-use-upper = true;
       };
       "org/cinnamon" = {
        panel-zone-icon-sizes = builtins.toJSON [
            { panelId = 1; left = 0; center = 0; right = 24; }
            { panelId = 2; left = 0; center = 0; right = 0; }
          ];
        panel-zone-symbolic-icon-sizes = builtins.toJSON [
            { panelId = 1; left = 28; center = 28; right = 16; }
            { panelId = 2; left = 28; center = 28; right = 28; }
        ];
        panel-zone-text-sizes = builtins.toJSON [
            { panelId = 1; left = 0; center = 0; right = 0; }
            { panelId = 2; left = 0; center = 0; right = 0; }
        ];
        panels-autohide = [
            "1:false"
            "2:false"
        ];
        panels-enabled = [
            "1:0:top"
            "2:0:bottom"
        ];
        panels-height = [
            "1:0:36"
            "2:0:60"
        ];
        panels-hide-delay = [
            "1:0"
            "2:0"
        ];
        panels-show-delay = [
            "1:0"
            "2:0"
        ];
        enabled-applets=[
          "panel1:left:0:menu@cinnamon.org:0" 
          "panel1:left:2:separator@cinnamon.org:1"
          "panel1:right:0:systray@cinnamon.org:3" 
          "panel1:right:1:xapp-status@cinnamon.org:4" 
          "panel1:right:2:notifications@cinnamon.org:5" 
          "panel1:right:3:printers@cinnamon.org:6" 
          "panel1:right:4:removable-drives@cinnamon.org:7" 
          "panel1:right:5:keyboard@cinnamon.org:8" 
          "panel1:right:6:favorites@cinnamon.org:9" 
          "panel1:right:7:network@cinnamon.org:10" 
          "panel1:right:8:sound@cinnamon.org:11" 
          "panel1:right:9:power@cinnamon.org:12" 
          "panel1:right:10:calendar@cinnamon.org:13" 
          "panel1:right:11:cornerbar@cinnamon.org:14"

          "panel2:center:0:grouped-window-list@cinnamon.org:2" 
        ];
       };
     };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
