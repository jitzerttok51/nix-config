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
    layan-plasma.url = ./packages/layan-plasma;
    mc-sur-plasma.url = ./packages/layan-plasma;
  };

  outputs = { 
    self, 
    nixpkgs,
    hyprland, 
    home-manager,
    nix-vscode-extensions,
    plasma-manager,
    layan-plasma,
    mc-sur-plasma,
    ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit home-manager; };
      modules = [
        ./hosts/nix/configuration.nix
      ];
    };

    nixosConfigurations.nix-test-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit home-manager; };
      modules = [
        ./hosts/nix-test-vm/configuration.nix
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
          layan-plasma = layan-plasma.packages."x86_64-linux".layan-plasma;
          mc-sur-plasma = layan-plasma.packages."x86_64-linux".layan-plasma;
      };

      modules = [
        mc-sur-plasma.homeManagerModules.mc-sur-plasma
        layan-plasma.homeManagerModules.layan-plasma
        plasma-manager.homeManagerModules.plasma-manager
        ./home-config/users/nprodanov/home.nix 
      ];
    };
  };
}