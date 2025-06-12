let
  addDefaultsToPanel = panel: let
    defaultPanelProps = {
      hide-delay = 0;
      show-delay = 0;
      autohide = "false";
      position = "bottom"; # REQUIRED
      height = 20; # Check height
    };
    defaultApplets = {
      left = [];
      center = [];
      right = [];
    };
    panelApplets = {applets = defaultApplets // panel.applets;};
  in
    defaultPanelProps // panel // panelApplets;

  addDefaults = panels: builtins.map addDefaultsToPanel panels;

  addIdsToPanels = panels: let
    defContainer = {
      panels = [];
      nextId = 1;
    };

    accFunc = container: panel: let
      nextId = container.nextId + 1;
      idAndName = {
        name = "panel${builtins.toString container.nextId}";
        id = container.nextId;
      };
    in {
      inherit nextId;
      panels = container.panels ++ [(idAndName // panel)];
    };
  in
    (builtins.foldl' accFunc defContainer panels).panels;
in {
  inherit
    addDefaultsToPanel
    addDefaults
    addIdsToPanels
    ;
}
