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
            center = [];
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
    }
  ];

  panelFunctions = import ./panelFunctions.nix;

  test = expected: acutal: (builtins.toJSON acutal) == expected;

  exptectedResult1 = ''[{"applets":{"center":[],"left":["menu@cinnamon.org","workspace-switcher@cinnamon.org","separator@cinnamon.org"],"right":["systray@cinnamon.org","xapp-status@cinnamon.org","notifications@cinnamon.org","printers@cinnamon.org","removable-drives@cinnamon.org","keyboard@cinnamon.org","favorites@cinnamon.org","network@cinnamon.org","sound@cinnamon.org","power@cinnamon.org","calendar@cinnamon.org","cornerbar@cinnamon.org"]},"autohide":"false","height":36,"hide-delay":0,"id":1,"name":"panel1","position":"bottom","show-delay":3000},{"applets":{"center":[],"left":[],"right":[]},"autohide":"false","height":60,"hide-delay":0,"id":2,"name":"panel2","position":"top","show-delay":0}]'';
  test1 = test exptectedResult1 (panelFunctions.addIdsToPanels panels);

  result = panelFunctions.addNamespace (panelFunctions.createDconfInput (panelFunctions.addIdsToPanels panels));
  rightApplets = (builtins.elemAt panels 0).applets;
  createdApplets = (panelFunctions.addIdsToApplets (panelFunctions.addIdsToPanels panels));
in panelFunctions.addIdsToApplets (panelFunctions.attachRegionToApplets (panelFunctions.addIdsToPanels panels))