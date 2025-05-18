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
    packages.${system}.mc-mojave-plasma = pkgs.callPackage ./package {};
    homeManagerModules.mc-mojave-plasma = { ... }: {
      imports = [ ./module.nix ];
    };
  };
}