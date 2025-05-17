{ config, pkgs, layanPlasma, ... }: {
  options = {};
  config = {
    home.file."test-share" = {
      source = "${layanPlasma}/share";
      type = "symlink";
    };
  };
}