{
  description = "Home Manager configuration of vmtest";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."vmtest" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        inherit home-manager;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./users/vmtest/home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
