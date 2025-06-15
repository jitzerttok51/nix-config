{ config, pkgs, ...}: {
    programs.plasma = {
    configFile = {
      "kxkbrc".Layout = {
          DisplayNames= "";
          LayoutList = "bg,us";
          Use = true;
          VariantList = "phonetic,";
      };
    };
    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Next Keyboard Layout" = "Alt+Shift";
      };
    };
  };
}
