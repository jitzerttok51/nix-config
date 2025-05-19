{ config, pkgs, ...}: {
    programs.git = {
    enable = true;
    userEmail = "Nikolay.Prodanov@proton.me";
    userName = "Nikolay Prodanov";
    signing = {
      signByDefault = true;
      key = "0xEDAFC88588BBFEFA";
      format = "openpgp";
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
  };

  programs.gpg = { 
    enable = true; 
  };
}