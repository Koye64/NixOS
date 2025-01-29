{ inputs, ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
  };
  home.sessionVariables."FLAKE" = "/home/${inputs.user}/.config/nixos";
}
