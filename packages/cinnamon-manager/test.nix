# nix eval --file test.nix
let
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

  panelFunctions = import ./lib;
in
  builtins.map panelFunctions.addDefaultsToPanel panels
# in panelFunctions.addIdsToPanels panels

