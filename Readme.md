
```
sudo nixos-rebuild switch --flake /etc/nixos#nixos
nix profile install 'nixpkgs#nix-tree'
nix-tree  '.#nixosConfigurations.nix-test-vm.config.system.build.toplevel' --derivation --dot > output2.txt
nix build --dry-run '.#nixosConfigurations.nix-test-vm.config.system.build.toplevel'
```