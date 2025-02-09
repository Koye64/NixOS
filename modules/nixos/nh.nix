{inputs, ...}: {
  programs.nh = {
    enable = true;
    clean.enable = true;
  };
  environment.sessionVariables."FLAKE" = "/home/${inputs.user}/nix/nixos";
}
