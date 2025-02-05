{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    betterdiscordctl
    cinny-desktop
  ];

  nixpkgs.config = {
    permittedInsecurePackages = [
      "cinny-unwrapped-4.2.3"
      "cinny-4.2.3"
      "cinny-desktop-4.2.3"
    ];
  };
}
