{
  description = "A basic nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
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
    custom-packages.url = ./packages;
  };

  outputs = { 
    self, 
    nixpkgs,
    hyprland, 
    home-manager,
    nix-vscode-extensions,
    plasma-manager,
    custom-packages,
    ... }@inputs: let 
      system = "x86_64-linux";
    in {

    nixosConfigurations.nix-test-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit home-manager; };
      modules = [
        ./hosts/nix-test-vm/configuration.nix
      ];
    };

    nixosConfigurations.sum-test-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit home-manager; };
      modules = [
        ./hosts/sum-test-vm/configuration.nix
      ];
    };

    nixosConfigurations.nprodanov-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit home-manager hyprland; };
      modules = [
        ./hosts/nprodanov-pc/configuration.nix
      ];
    };

    homeConfigurations."nprodanov" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
        
      extraSpecialArgs = { 
        inherit 
          nix-vscode-extensions 
          home-manager 
          hyprland
          plasma-manager;
          custom-packages = custom-packages.packages.${system};
          layan-plasma = custom-packages.packages.${system}.layan-plasma;
          mc-sur-plasma = custom-packages.packages.${system}.mc-sur-plasma;
          mc-mojave-plasma = custom-packages.packages.${system}.mc-mojave-plasma;
      };

      modules = [
        custom-packages.homeManagerModules.mc-mojave-plasma
        custom-packages.homeManagerModules.mc-sur-plasma
        custom-packages.homeManagerModules.layan-plasma
        plasma-manager.homeManagerModules.plasma-manager
        ./home-config/users/nprodanov/home.nix 
      ];
    };
  };
}