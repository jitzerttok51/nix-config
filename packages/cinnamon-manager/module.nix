{ config, lib, pkgs, ... }: 
let 
  cfg = config.programs.cinnamon;
  writeConfigScript = pkgs.writeShellApplication {
    name = "write_config";
    runtimeInputs = with pkgs; [ python3 ];
    text = ''python ${./write_config.py} "$@"'';
  };
  script = ''${writeConfigScript}/bin/write_config'';
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