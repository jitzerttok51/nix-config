{
  description = "Home Manager configuration of vmtest";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, nix-vscode-extensions, plasma-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."vmtest" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./users/vmtest/home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      homeConfigurations."nprodanov" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        extraSpecialArgs = { 
          nix-vscode-extensions = nix-vscode-extensions; 
          plasma-manager = plasma-manager;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          plasma-manager.homeManagerModules.plasma-manager
          ./users/nprodanov/home.nix 
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
