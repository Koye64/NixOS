{ pkgs, ... }:

{
  home.packages = with pkgs; [ twemoji-color-font ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "TwitterColorEmojiSVGinOT" ];
    };
  };
}
