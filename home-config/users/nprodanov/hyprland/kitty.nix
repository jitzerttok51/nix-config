{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.name = "Meslo lg";
    font.size = 12;
    font.package = pkgs.nerd-fonts.meslo-lg;
    themeFile = "Catppuccin-Mocha";
    settings = {
      background_opacity = "0.8";
    };
  };
}