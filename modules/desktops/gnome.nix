{ config, lib, pkgs, ... }: {
  
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    # gnome-characters
    # gnome-music
    # gnome-photos
    gnome-terminal
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    #  totem # video player
  ]);

  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    gnome-tweaks
    whitesur-gtk-theme
    whitesur-icon-theme
    adwaita-icon-theme

    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
  ];
}
