{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.font;
in {
  options.font = {
    enable = lib.mkEnableOption "enable user module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
    ];

    fonts.fontconfig = {
      enable = true;
      hinting = "slight";
      subpixelRendering = "none";
      defaultFonts = {
        emoji = ["Noto Color Emoji" "Noto Emoji"];
        monospace = ["JetbrainsMono Nerd Font"];
        sansSerif = ["Noto Sans"];
        serif = ["Noto Serif"];
      };
    };
  };
}
