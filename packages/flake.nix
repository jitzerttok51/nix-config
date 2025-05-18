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
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system} = {
        layan-plasma = pkgs.callPackage ./layan-plasma { };
        mc-mojave-plasma = pkgs.callPackage ./mc-mojave-plasma { };
        mc-sur-plasma = pkgs.callPackage ./mc-sur-plasma { };
      };
      homeManagerModules = {
        layan-plasma = { ... }: { imports = [ ./layan-plasma/module.nix ]; };
        mc-mojave-plasma = { ... }: { imports = [ ./mc-mojave-plasma/module.nix ]; };
        mc-sur-plasma = { ... }: { imports = [ ./mc-sur-plasma/module.nix ]; };
      };
    };
}
