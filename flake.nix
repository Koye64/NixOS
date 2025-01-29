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
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system; };
        
	modules = [
	  ./hosts/default/configuration.nix
	  catppuccin.nixosModules.catppuccin
	  stylix.nixosModules.stylix
	  ./modules/nixos
	  home-manager.nixosModules.home-manager
	  {
	    nixpkgs.pkgs = pkgs;
	    home-manager = {
	      extraSpecialArgs = { inherit inputs system; };
	      useGlobalPkgs = true;
	      useUserPackages = true;
	      users.${inputs.user}.imports = [ 
	         ./hosts/default/home.nix
		 catppuccin.homeManagerModules.catppuccin
		 ./modules/home-manager
	      ];
	    };
	  }
	];
      };
    };
  };
}
