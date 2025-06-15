{ config, pkgs, ...}: {
    programs.git = {
    enable = true;
    userEmail = "Nikolay.Prodanov@proton.me";
    userName = "Nikolay Prodanov";
    signing = {
      signByDefault = true;
      key = "0x7F7E202ABB244D20";
      format = "openpgp";
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  programs.gpg = { enable = true; };
}