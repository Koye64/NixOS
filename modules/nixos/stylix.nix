{
  inputs,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = inputs.wallpaper;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.noto;
        name = "Noto Sans Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts.noto;
        name = "Noto Serif Nerd Font";
      };
    };

    targets = {
      grub.enable = false;
      plymouth.enable = false;
    };
  };
}
