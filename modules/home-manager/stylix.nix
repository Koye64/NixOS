{ inputs, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = inputs.wallpaper;
    targets = {
      bat.enable = false;
      btop.enable = false;
      kitty.enable = false;
      swaylock.enable = false;
    };
  };
}
