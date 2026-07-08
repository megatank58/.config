{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs : {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs;  };
        modules = [
          ./configuration.nix
        ];
      };
    };
}
