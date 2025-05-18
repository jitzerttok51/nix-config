{ config, pkgs, ...}: {
    programs.plasma = {
      enable = true;
      overrideConfig = true;
    };

    imports = [
      ./misc.nix
      ./panels.nix
      ./workspace.nix
    ];
}
