{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
	  catppuccin-gh-file-explorer
	  ublock-origin
	  darkreader
	  firefox-color
	  stylus
	  enhancer-for-youtube
	  return-youtube-dislikes
	];
	settings = {
	  "middlemouse.paste" = false;
	  "general.autoScroll" = true;
	};
      };
    };
  };
}
