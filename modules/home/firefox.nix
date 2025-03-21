{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          catppuccin-gh-file-explorer
          ublock-origin
          darkreader
          firefox-color
          stylus
          enhancer-for-youtube
          return-youtube-dislikes
          sponsorblock
        ];
        settings = {
          "middlemouse.paste" = false;
          "general.autoScroll" = true;
        };
      };
    };
  };
}
