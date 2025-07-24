{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      numlock_by_default = true;
      resolve_binds_by_sym = false;
      repeat_rate = 25;
      repeat_delay = 600;
      sensitivity = 0;
      accel_profile = "flat";
      force_no_accel = false;
      left_handed = false;
      scroll_button = 0;
      scroll_button_lock = 0;
      scroll_factor = 1;
      natural_scroll = false;
      follow_mouse = 1;
      follow_mouse_threshold = 0;
      focus_on_close = 0;
      mouse_refocus = false;
      float_switch_override_focus = 1;
      special_fallthrough = false;
      off_window_axis_events = 1;
      emulate_discrete_scroll = 1;
      touchpad = {
        disable_while_typing = false;
        natural_scroll = true;
        scroll_factor = 1;
        middle_button_emulation = false;
        clickfinger_behavior = false;
        tap-to-click = true;
        drag_lock = true;
        tap-and-drag = true;
        flip_x = false;
        flip_y = false;
      };
    };
  };
}
