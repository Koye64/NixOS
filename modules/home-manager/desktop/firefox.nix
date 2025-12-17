{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.firefox;
in {
  options.firefox = {
    enable = lib.mkEnableOption "enable Firefox config";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      policies = {};
      profiles.default = {
        id = 0;
        name = "Koye";
        isDefault = true;
        settings = {
          "extensions.autoDisableScopes" = 0;
          "browser.startup.page" = 3;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
        };
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            firefox-color
            return-youtube-dislikes
          ];
        };
      };
    };
  };
}
