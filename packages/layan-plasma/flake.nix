{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    packages."x86_64-linux".layan-plasma = nixpkgs.legacyPackages."x86_64-linux".callPackage ./files {};
    homeManagerModules.layan-plasma = { ... }: {
      imports = [ ./module.nix ];
    };
  };
}