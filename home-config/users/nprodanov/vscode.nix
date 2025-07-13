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
        "editor.fontFamily" = "Meslo lg";
        # "workbench.colorTheme" = "Dracula Theme";
        "window.titleBarStyle" = "native";
      };

      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
        gruntfuggly.todo-tree
        ms-python.python
        ms-python.debugpy
      ];
    };
  };
}
