{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in  {
    packages.${system}.layan-plasma = pkgs.callPackage ./files {};
    homeManagerModules.layan-plasma = { ... }: {
      imports = [ ./module.nix ];
    };
  };
}