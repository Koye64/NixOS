{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, catppuccin, nixpkgs, ... }@inputs: {
    # use "nixos", or your hostname as the name of the configuration
    nixosConfigurations.bunnybuck = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/bunnybuck/configuration.nix
        ./modules/nixos
        inputs.home-manager.nixosModules.default
      ];
    };
    nixosConfigurations.virtual-pen = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/virtual-pen/configuration.nix
        ./modules/nixos
        inputs.home-manager.nixosModules.default
      ];
    };
    homeManagerModules.default = ./modules/home-manager;
  };
}
