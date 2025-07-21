{ inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ../nixvim
  ];

  programs.nixvim.enable = true;
}
