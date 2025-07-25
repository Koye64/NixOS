{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config = import ./nixpkgs-config.nix;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5";
  };
}
