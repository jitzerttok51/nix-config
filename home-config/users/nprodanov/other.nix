{ config, pkgs, custom-packages, ...}: {
    home.packages = with custom-packages; [
      viber
    ];
}