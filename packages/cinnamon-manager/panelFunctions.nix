# nix eval --file test.nix
let
  defaultPanel = {
    hide-delay = 0;
    show-delay = 0;
    autohide = "false";
    position = "bottom"; # REQUIRED
    height = 20; # Check height
    applets = {
        left = [];
        center = [];
        right = [];
    };
  };

  addIdsToPanels = panels: let
    defContainer = { 
        panels = []; 
        nextId = 1;
    };

    accFunc = container: panel: let 
        nextId = container.nextId+1;
        idAndName = {
            name = "panel${builtins.toString container.nextId}"; 
            id = container.nextId;
        };
        enhancedPanel = (idAndName // defaultPanel) // panel;
    in {
        inherit nextId;
        panels = container.panels ++ [ enhancedPanel ];
    };

  in (builtins.foldl' accFunc defContainer panels).panels;

  addIdsToApplets = panels: let
    defContainer = { 
        panels = [];
        nextId = 0;
    };

    attachIdsToApplets = nextId: applets: let
        cont = {
            id = nextId;
            applets = [];
        };
        fun = cont: applet: with cont; {
            id = id + 1;
            applets = applets ++ [ ({ inherit id;} // applet) ];
        };

    in cont // (builtins.foldl' fun cont applets);

    fun = cont: panel: let 
        resultLeft = attachIdsToApplets cont.nextId panel.applets.left;
        resultCenter = attachIdsToApplets resultLeft.id panel.applets.center;
        resultRight = attachIdsToApplets resultCenter.id panel.applets.right;
        result = { 
            applets.left = resultLeft.applets;
            applets.center = resultCenter.applets;
            applets.right = resultRight.applets;
        };
        newPanel = (panel // result);
    in {
        nextId = resultRight.id;
        panels = cont.panels ++ [ newPanel ];
    };

    result = (builtins.foldl' fun defContainer panels);

  in result;

  attachRegionToApplets = panels: let
    defContainer = { 
        applets = [];
        index = 0;
    };

    func = position: cont: type: with cont; {
        index = index + 1;
        applets = applets ++ [ { inherit type position index; } ];
    };

    fun = panel: let 
        result = { 
            applets.left = (builtins.foldl' (func "left") defContainer panel.applets.left).applets;
            applets.center = (builtins.foldl' (func "center") defContainer panel.applets.center).applets;
            applets.right = (builtins.foldl' (func "right") defContainer panel.applets.right).applets;
        };
    in (panel // result);
  in builtins.map fun panels;

  createDconfInput = panels: let
    defDeconfOutput = {
        panels-autohide = [];
        panels-height = [];
        panels-show-delay = [];
        panels-hide-delay = [];
        panels-enabled = [];
        enabled-applets = [];
    };

    accFunc = container: panel: {
        panels-enabled = container.panels-enabled ++ [
            "${builtins.toString panel.id}:0:${panel.position}"
        ];
        panels-autohide = container.panels-autohide ++ [
            "${builtins.toString panel.id}:${panel.autohide}"
        ];
        panels-show-delay = container.panels-show-delay ++ [
            "${builtins.toString panel.id}:${builtins.toString panel.show-delay}"
        ];
        panels-hide-delay = container.panels-show-delay ++ [
            "${builtins.toString panel.id}:${builtins.toString panel.hide-delay}"
        ];
        panels-height = container.panels-height ++ [
            "${builtins.toString panel.id}:0:${builtins.toString panel.height}"
        ];
    };
  in defDeconfOutput // (builtins.foldl' accFunc defDeconfOutput panels);

  addNamespace = dconfSettings: {
    "org/cinnamon" = {} // dconfSettings;
  };

in { inherit 
    addNamespace
    createDconfInput
    addIdsToApplets
    addIdsToPanels
    attachRegionToApplets; 
}