{ config, pkgs, ...}: {
    programs.plasma = {

    shortcuts = {
        "services/org.kde.spectacle.desktop" = {
          RecordRegion="Meta+Shift+R";
        };

        "services/org.kde.dolphin.desktop" = { _launch = [ "Meta+E" ]; };
        "services/org.kde.krunner.desktop" = { _launch = [ "Meta+R" ]; };
        "services/org.kde.konsole.desktop" = { _launch = [ "Meta+Q" ]; };
        "services/chromium-browser.desktop" = { _launch = [ "Meta+F" ]; };

      plasmashell = {
        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
        "activate application launcher" = "Meta";
      };

      ksmserver = { "Lock Session" = [ "Meta+L" "Screensaver" "Meta+Ctrl+Alt+L" ]; };

      kwin = {
        "Expose" = "Meta+,";
        "Maximize Window" = "Meta+Up";
        "Minimize Window" = "Meta+Down";
        "Window Close" = ["Meta+C" "Alt+F4"];
        "Switch Window Down" = "Meta+J";
        "Switch Window Left" = "Meta+H";
        "Switch Window Right" = "Meta+P";
        "Switch Window Up" = "Meta+K";
        "Window to Desktop 1" = "Meta+Ctrl+1";
        "Window to Desktop 2" = "Meta+Ctrl+2";
        "Window to Desktop 3" = "Meta+Ctrl+3";
        "Window to Desktop 4" = "Meta+Ctrl+4";
        "Window to Desktop 5" = "Meta+Ctrl+5";
        "Window to Desktop 6" = "Meta+Ctrl+6";
        "Window to Desktop 7" = "Meta+Ctrl+7";
        "Window to Desktop 8" = "Meta+Ctrl+8";
        "Switch to Desktop 1" = "Meta+!";
        "Switch to Desktop 2" = "Meta+@";
        "Switch to Desktop 3" = "Meta+#";
        "Switch to Desktop 4" = "Meta+$";
        "Switch to Desktop 5" = "Meta+%";
        "Switch to Desktop 6" = "Meta+^";
        "Switch to Desktop 7" = "Meta+&";
        "Switch to Desktop 8" = "Meta+*";
      };
    };
  };
}
