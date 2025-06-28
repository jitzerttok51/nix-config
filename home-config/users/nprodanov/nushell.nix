{ config, pkgs, ...}: {
  programs = {
    nushell = {
      enable = true;
      configFile.source = ./config.nu;
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    starship = { 
      enable = true;
    };

    kitty = {
      enable = true;
      enableGitIntegration = true;
      themeFile = "Catppuccin-Macchiato";
      settings = {
        background_opacity = 0.75;
      };
    };
  };

}