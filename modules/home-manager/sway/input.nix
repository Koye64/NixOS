{ ... }:
{
  wayland.windowManager.sway.config = {
    input = {
      "type:keyboard" = {
        xkb_numlock = "enabled";
      };
      "type:pointer" = {
        accel_profile = "flat";
      };
      "type:touchpad" = {
        accel_profile = "adaptive";
        natural_scroll = "enabled";
        scroll_method = "two_finger";
        tap = "enabled";
      };
    };
  };
}
