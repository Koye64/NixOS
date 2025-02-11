{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    brightnessctl
    wlr-randr
  ];
  programs.rofi = {
    enable = true;
  };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      clock = true;
      effect-blur = "16x4";
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 16;
      screenshots = true;
      timestr = "%I:%M %p";
    };
  };

  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 60;
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];
  };

  services.udiskie = {
    enable = true;
    tray = "never";
  };

  services.dunst = {
    enable = true;
    iconTheme = config.gtk.iconTheme;
    settings = {
      global = {
        offset = "4x4";
        frame_width = 2;
        corner_radius = 5;
        progress_bar_corner_radius = 2;
        icon_corner_radius = 5;
        icon_corners = "all";
        follow = "mouse";
      };
    };
  };

  services.swayosd = {
    enable = true;
  };
}
