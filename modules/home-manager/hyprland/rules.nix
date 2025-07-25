{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      "immediate, class:.*"
    ];
    workspace = [
      "10, monitor:HDMI-A-1"
      "1, monitor:HDMI-A-2"
    ];
  };
}
