{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd = { enable = true; };
    settings = {
      bar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" "wlr/workspaces" ];
        modules-center = [ "mpris" ];
        modules-right = [ "pulseaudio" "backlight" "battery" "clock" "tray" "custom/lock" "custom/power" ];
        "" = {};
        "wlr/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "⬤";
          };
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "⬤";
          };
        };
        "mpris" = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          player-icons = {
            default = "▶";
          };
          status-icons = {
            paused = "⏸";
          };
        };
      };
    };
  };
}
