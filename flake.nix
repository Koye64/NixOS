{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    catppuccin.url = "github:catppuccin/nix";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    catppuccin,
    nixpkgs,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    customNeovim = nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [./modules/nvf];
    };
  in {
    packages.${system}.my-neovim = customNeovim.neovim;

    nixosConfigurations.bunnybuck = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/bunnybuck/configuration.nix
        ./modules/nixos
        inputs.home-manager.nixosModules.default
        {environment.systemPackages = [customNeovim.neovim];}
      ];
    };

    nixosConfigurations.virtual-pen = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/virtual-pen/configuration.nix
        ./modules/nixos
        inputs.home-manager.nixosModules.default
        {environment.systemPackages = [customNeovim.neovim];}
      ];
    };

    homeManagerModules.default = ./modules/home-manager;
  };
}
