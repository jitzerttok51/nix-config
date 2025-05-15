{ config, lib, pkgs, ... }: {

  programs.zsh.enable = true;
  users.users.vmtest = {
    isNormalUser = true;
    home = "/home/vmtest";
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$O8dxVaB.wkZD4VSy$PqSkgKQunLVqiWXXMk39EwKzZqHBAtQ0mlag.Haj3LqTCrITF2oJMLxnDw7YDkDd7D7Ztvc2Zg95ziX553xMn1";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHciq66oygoT3sgZOx5dA7nNK9JgpTqSRiDqVrukz6wQ azuread\\nikolayprodanov@IBM-PW09W916"
    ];
    shell = pkgs.zsh;
  };
}
