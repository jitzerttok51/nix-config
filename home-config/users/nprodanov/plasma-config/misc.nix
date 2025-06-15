{ config, pkgs, ...}: {
    programs.plasma = {

    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."Desktops"."Number" = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      krunnerrc.General.FreeFloating = true;
      krunnerrc.Plugins.baloosearchEnabled = true;
    };
  };
}
