{
  description = "A basic nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nix/configuration.nix
      ];
    };

    nixosConfigurations.nix-test-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nix-test-vm/configuration.nix
      ];
    };

    nixosConfigurations.nprodanov-pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nprodanov-pc/configuration.nix
      ];
    };
  };
}