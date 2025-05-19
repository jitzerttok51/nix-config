{ config, lib, pkgs, ... }: 
let 
  cfg = config.programs.cinnamon;
  script = ''echo "Hello World!" > .hello_world'';
in
{
  options = {
    programs.cinnamon.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Enables the cinnamon home manger configuration
      '';
    };
  };
  config = {
    home.activation = lib.mkIf cfg.enable {
    configure-cinnamon = (
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          $DRY_RUN_CMD ${script}
        ''
      );
    };
  };
}