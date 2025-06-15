{ config, pkgs, ...}: {
    # TODO: Add kvantum
    # TODO: Experiment with different themes
    # TODO: Try capputcin
    # TODO: Fix title and app menu
    # TODO: Try the KDE tiling window manager
    programs.plasma = {
      enable = true;
      overrideConfig = true;
    };

    imports = [
      ./panels.nix
      ./workspace.nix
      ./keyboard.nix
      ./keybinds.nix
      ./misc.nix
    ];
}
