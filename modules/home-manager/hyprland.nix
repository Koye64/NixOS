{ inputs, lib, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      ecosystem = {
	no_update_news = true;
        no_donation_nag = true;
      };
      general = {
        gaps_in = 2;
        gaps_out = 8;
        gaps_workspaces = 48;
        border_size = 2;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
        vrr = 0;
        middle_click_paste = false;
      };
      xwayland.force_zero_scaling = true;
      bind = "SUPER, RETURN, exec, ${lib.getExe config.programs.kitty.package}";
    };
  };
  programs = {
    hyprlock = {
      enable = true;
    };
  };
  services = {
    hyprpolkitagent.enable = true;
    hyprpaper.enable = true;
    hypridle.enable = true;
  };
}
