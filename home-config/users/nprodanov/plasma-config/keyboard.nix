{ config, pkgs, ...}: {
    programs.plasma = {
    configFile = {
      "kxkbrc".Layout = {
          DisplayNames= "";
          LayoutList = "us,bg";
          Use = true;
          VariantList = ",phonetic";
      };
    };
    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Next Keyboard Layout" = "Alt+Shift";
      };
    };
  };
}
