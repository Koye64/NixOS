{ config, pkgs, ... }:
{
  programs.texlive = {
    enable = true;
    packageSet = pkgs.texlive;
  };
  programs.nixvim.plugins.vimtex.package = config.programs.texlive.package;
}
