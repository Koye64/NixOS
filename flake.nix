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
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    nixpkgs,
    nur,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    catppuccin.flavor = "mocha";
    catppuccin.accent = "blue";

    customNeovim = nvf.lib.neovimConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit catppuccin;};
      modules = [./modules/nvf];
    };
  in {
    packages.${system}.my-neovim = customNeovim.neovim;

    nixosConfigurations.bunnybuck = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit catppuccin;
      };
      modules = [
        ./hosts/bunnybuck/configuration.nix
        ./modules/nixos
        home-manager.nixosModules.default
        nur.modules.nixos.default
        {environment.systemPackages = [customNeovim.neovim];}
      ];
    };

    nixosConfigurations.virtual-pen = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit catppuccin;
      };
      modules = [
        ./hosts/virtual-pen/configuration.nix
        ./modules/nixos
        home-manager.nixosModules.default
        nur.modules.nixos.default
        {environment.systemPackages = [customNeovim.neovim];}
      ];
    };
  };
}
