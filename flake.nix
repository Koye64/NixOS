{
  description = "My NixOS configuration flake";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";
    stylix.url = "github:danth/stylix";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, catppuccin, home-manager, nixpkgs, stylix, ... }@inputs:
  let
    inputs.user = "koye";
    inputs.wallpaper = ./assets/img/wall.png;

    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        
	modules = [
	  { nixpkgs.pkgs = pkgs; }
	  ./hosts/default/configuration.nix
	  ./modules/nixos
	  catppuccin.nixosModules.catppuccin
	  stylix.nixosModules.stylix
	];
      };
    };
    homeConfigurations = {
      "koye@desktop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs system; };

        modules = [
          ./hosts/default/home.nix
          ./modules/home-manager
          catppuccin.homeManagerModules.catppuccin
	  stylix.homeManagerModules.stylix
	];
      };
    };
  };
}
