{
  description = "Koye's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    catppuccin.url = "github:catppuccin/nix";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      qemu = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/nixos
          ./hosts/qemu/configuration.nix
          { home-manager.users.koye = ./hosts/qemu/home.nix; }
        ];
      };
      headroom = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/nixos
          ./hosts/headroom/configuration.nix
          { home-manager.users.koye = ./hosts/headroom/home.nix; }
        ];
      };
      "koye64.com" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/koye64.com/configuration.nix
          { home-manager.users.koye = ./hosts/koye64.com/home.nix; }
        ];
      };
    };
  };
}
