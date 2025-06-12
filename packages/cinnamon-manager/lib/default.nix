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
in {
  inherit
    addDefaultsToPanel
    ;
}
