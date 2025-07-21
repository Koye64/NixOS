{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ../nixvim
  ];

  programs.nixvim.enable = true;
  programs.nixvim.vimdiffAlias = true;
}
