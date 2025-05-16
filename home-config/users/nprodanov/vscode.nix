{ config, pkgs, lib, nix-vscode-extensions, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    nix-vscode-extensions.overlays.default
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "workbench.colorTheme" = "Dracula Theme";
      };

      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        dracula-theme.theme-dracula
      ];
    };
  };
}
