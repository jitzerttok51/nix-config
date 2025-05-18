{ config, pkgs, ...}: {
    programs.plasma = {
    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "";
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnRight" = "IAX";
      "kwinrc"."Windows"."BorderlessMaximizedWindows" = true;
      "kwinrc"."Desktops"."Number" = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
    };
    shortcuts = {
      ksmserver = { "Lock Session" = [ "Meta+L" "Screensaver" "Meta+Ctrl+Alt+L" ]; };

      kwin = {
        "Expose" = "Meta+,";
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+P";
        "Switch Window Up" = "Meta+K";
      };
    };
  };
}
