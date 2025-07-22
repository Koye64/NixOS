{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config = { allowBroken = false; allowUnfree = true; };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5";
  };
}
