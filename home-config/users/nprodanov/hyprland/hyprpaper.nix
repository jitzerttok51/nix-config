{config, pkgs, ...}: let
  wallpapers-path = ".local/hypr-wallpapers";
  wallpaper = "${wallpapers-path}/galaxy-waves.jpg";
in {
  home.file.${wallpapers-path} = {
    source = ./wallpapers;
    recursive = true;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = wallpaper;
      wallpaper = ", ${wallpaper}";
    };
  };
}