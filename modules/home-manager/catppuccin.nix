{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
    firefox.profiles.default.enable = false;
    kvantum.enable = false;
  };
}
