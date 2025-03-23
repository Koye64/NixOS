{
  pkgs,
  lib,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      twemoji-color-font
    ];
    fontconfig = {
      defaultFonts = {
        emoji = lib.lists.remove "Noto Color Emoji" ["TwitterColorEmojiSVGinOT"];
      };
    };
  };
}
