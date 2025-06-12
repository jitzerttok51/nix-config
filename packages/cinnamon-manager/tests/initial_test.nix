{pkgs}: let
  inherit (pkgs) lib;
  inherit (lib) runTests;
  math = import ../lib;
  panels = [
    {
      autohide = "false";
      height = 36;
      show-delay = 3000;
      position = "bottom";
      applets = {
        left = [
          "menu@cinnamon.org"
          "workspace-switcher@cinnamon.org"
          "separator@cinnamon.org"
        ];
        right = [
          "systray@cinnamon.org"
          "xapp-status@cinnamon.org"
          "notifications@cinnamon.org"
          "printers@cinnamon.org"
          "removable-drives@cinnamon.org"
          "keyboard@cinnamon.org"
          "favorites@cinnamon.org"
          "network@cinnamon.org"
          "sound@cinnamon.org"
          "power@cinnamon.org"
          "calendar@cinnamon.org"
          "cornerbar@cinnamon.org"
        ];
      };
    }
    {
      autohide = "false";
      height = 60;
      position = "top";
      applets = {
        center = [
          "systray@cinnamon.org"
          "xapp-status@cinnamon.org"
          "notifications@cinnamon.org"
        ];
      };
    }
  ];
in
  runTests {
    testIsEven_1 = {
      expr = builtins.map math.addDefaultsToPanel panels;
      expected = [
        {
          autohide = "false";
          height = 36;
          show-delay = 3000;
          hide-delay = 0;
          position = "bottom";
          applets = {
            center = [];
            left = [
              "menu@cinnamon.org"
              "workspace-switcher@cinnamon.org"
              "separator@cinnamon.org"
            ];
            right = [
              "systray@cinnamon.org"
              "xapp-status@cinnamon.org"
              "notifications@cinnamon.org"
              "printers@cinnamon.org"
              "removable-drives@cinnamon.org"
              "keyboard@cinnamon.org"
              "favorites@cinnamon.org"
              "network@cinnamon.org"
              "sound@cinnamon.org"
              "power@cinnamon.org"
              "calendar@cinnamon.org"
              "cornerbar@cinnamon.org"
            ];
          };
        }
        {
          autohide = "false";
          height = 60;
          position = "top";
          hide-delay = 0;
          show-delay = 0;
          applets = {
            center = [
              "systray@cinnamon.org"
              "xapp-status@cinnamon.org"
              "notifications@cinnamon.org"
            ];
            left = [];
            right = [];
          };
        }
      ];
    };
  }
