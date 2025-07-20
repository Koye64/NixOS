{ ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5";
  };
}
