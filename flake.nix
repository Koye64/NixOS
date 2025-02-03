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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, catppuccin, home-manager, nixpkgs, nixvim, nur, stylix, ... }@inputs:
  let
    inputs.user = "koye";
    inputs.wallpaper = ./assets/img/nix-wallpaper-nineish-catppuccin-mocha-alt.png;

    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ nur.overlays.default ];
    };
  in
  {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };

	modules = [
	  ./hosts/default/configuration.nix
	  ./modules/nixos
	  catppuccin.nixosModules.catppuccin
	  nur.modules.nixos.default
	  stylix.nixosModules.stylix
	];
      };
      "laptop" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        
	modules = [
	  ./hosts/laptop/configuration.nix
	  ./modules/nixos
	  catppuccin.nixosModules.catppuccin
	  nur.modules.nixos.default
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
	  nixvim.homeManagerModules.nixvim
	  stylix.homeManagerModules.stylix
	];
      };
      "koye@laptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs system; };

        modules = [
          ./hosts/laptop/home.nix
          ./modules/home-manager
          catppuccin.homeManagerModules.catppuccin
	  nixvim.homeManagerModules.nixvim
	  stylix.homeManagerModules.stylix
	];
      };
    };
  };
}
