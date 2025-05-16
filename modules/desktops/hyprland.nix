{ pkgs, lib, config, hyprland, ...}: {

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
    };
  };
}