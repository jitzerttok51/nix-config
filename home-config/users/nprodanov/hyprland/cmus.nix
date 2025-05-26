{ config, pkgs, ...}: {
  programs.cmus = {
    enable = true;
  };
  home.file.".config/cmus/autosave" = {
    source = ./cmus-config;
    recursive = true;
  };
}